Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EAFD1D48A
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 19:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC9CC60E08;
	Thu,  8 Jan 2026 19:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCgBbHDakbt6; Thu,  8 Jan 2026 19:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53D3560E00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767902295;
	bh=AjNGM843HntO/6flZPP6E6nfdeTyIrPO7ngjIGylok4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hO8ZsFySIsKPc8w76g0UMUlukQkNVvNZWoEUyzHXwgodeRJOEO04MQtMp+KfpB1cW
	 3GrbhKVbxgcUyXYVxaFqTb+GibZNd1PpwXm00kmnhWQ9gDKWFndbGF7hdx2LVywUWA
	 F9c1uHcN3SUIBsh6BUNeZzVmQ2k/FN87RO2pCvGS51g/nzy5zA2bya73HY+1bd+qok
	 QzFYCREgkIc3XycIYM4tjwgEDgOxJPCMisuaqZdujIGtONEDwXqYAMG7FXmJpH/NIX
	 yMlL6i1+7o5fPdgD9AJQU4+bP+DKrjTr/q5gtXSP/irgZmfcsy9k28L7dHGNKsPned
	 /dOpEvxp/Nllg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D3560E00;
	Thu,  8 Jan 2026 19:58:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BEB3308
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0232D826B7
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9G2RwEzUmDzG for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 19:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E427826AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E427826AA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E427826AA
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:58:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B8F5AB0054E;
 Thu,  8 Jan 2026 20:58:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 Jan 2026 20:58:05 +0100
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 20:58:05 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20260107194230.1842866-1-dario.binacchi@amarulasolutions.com>
References: <20260107194230.1842866-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <5ce13183c05ba3540752dcbd445cbe41@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767902291;
 bh=d4C5AJWBvUXtDXg2/BEkrYUQtMo2an0IYsDrifNOE6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=icvxZSfXPp4ntsgGJamdIxJNxCOqgX3oUp+Z4jRqJtU7A488vTe1pEl0XLOx9Xx3S
 N+G3/9jtwhSGOp51Xi8dtz3/IcAyXSk2/dHoelAyOyUjMrzaORV4c5OQTAgQe0THwE
 niuNnF36WXeMjLFpuFOpCMhhIZixiVPiGDoJU+1E4OAaNLeW1MkTorQo8719zz/Leu
 OGekbuu6Ft8jTfcE/4Pea2w2Nl/ttaxpTbQL+i21Iu5E00i4z6zAljkvmvg9Aqvy6h
 D86G+JUxv+M3b93eq6OvpXq0vbFxQINmfnZx1cEK8YO0NSN1+gbtgx1TC6PssDPs+v
 p6oUmSlUCvnOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=icvxZSfX
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump U-Boot and
 Linux versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/01/2026 20:42, Dario Binacchi wrote:
> This patch bumps:
> 
> - U-Boot to version v2026.01
> - Linux kernel to version 6.12.63 (LTS)
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
