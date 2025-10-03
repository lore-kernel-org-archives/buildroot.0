Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A08CCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 19:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE9B3411FB;
	Fri,  3 Oct 2025 19:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IUlvdNXyqrR; Fri,  3 Oct 2025 19:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BA5C411F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA5C411F3;
	Fri,  3 Oct 2025 19:48:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96E97909
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 19:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6B7411F1
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 19:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvWFOAsgah88 for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 19:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91DA2411F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DA2411F3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91DA2411F3
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 19:48:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A8B6419F5C6;
 Fri,  3 Oct 2025 21:48:39 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 21:48:39 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 21:48:39 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20251003173312.1404088-1-dario.binacchi@amarulasolutions.com>
References: <20251003173312.1404088-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <00bacaefe31e2bd5f91e8b8b6a136e9d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759520921;
 bh=/xKbv7ZofzTXFOfhSr7VoYtRc2CfXcJpVghlhGGwfiw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ufNPYd1JpKLb/eWbojC+rqkC1pe0XSJd9M09sJpyBo1Szif6m1dTJQ4A+XJIZ/tWT
 /Uf0U3pi9aEB8y7PK8BdAkqtAablH40iyIb9C9hU842FsYIeRfwmgJxeSF9mGgdBK+
 lSQGjvuYyi0vEFvDe769OplfQzB8HYdqNcQLmrRftB3g06Xg0RXKvXDSkTuq2BQrtG
 mfODh+QH/Y67/nc6L7Av19FjF3UhNCkJiQNyYBpvPpr0/0FaXyJp/j1jX5Lfs9q6vE
 wU+VBHe7mxeQh35bZDPWB0G569xJY4KOkIcdkps0QZE2S8h3JHz4fxSjUTnOUvwqar
 6Z+SSoRxRU0Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ufNPYd1J
Subject: Re: [Buildroot] [PATCH v2 1/1] package/fakeroot: bump to version
 1.37.1.2
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

On 03/10/2025 19:33, Dario Binacchi wrote:
> For change log, see:
> https://salsa.debian.org/clint/fakeroot/-/blob/debian/1.37.1.2-1/debian/changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
