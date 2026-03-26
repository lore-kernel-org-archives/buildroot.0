Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BAB10AB822
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 20:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA9060EF8;
	Thu, 26 Mar 2026 20:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4TN9OWEXH23; Thu, 26 Mar 2026 20:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15FEF60E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774556212;
	bh=Rk3eW3r10++aFev2u4PIkaimQq9Y1x8Ttykw+qzjvqM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S34HAbv0UeXSQ+IbDYZL6pUqxBxmv6f4n2LUN6tD5riajSr+nJvaObNu1S0c5KORA
	 KeRvASbKhUcv1y2Y5ogjjRC+sLlvqM0k7mw0Nn65yKAOwvTh+qA5mGThx+ZC5Ow9X5
	 CvcMz+4tfJhinnwK6lxMyEOxLXDWVoq9wN97buqmhSszASsmcFmAf3JA65+hd3AYHU
	 xSjETEt8jyvS4R1iG/zUwebsIvHpZ7UcyZsoB4PHNCRqGvP5L9ERhIzGgR+XbMy1qz
	 Y8nGSZgrutnMHywPcIP1e3nJYGX8ykJtUfSopbms/k0bStw6KPzluM2KYOAP9HaK+T
	 YW7e9oBuHXZig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15FEF60E7C;
	Thu, 26 Mar 2026 20:16:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E5011D3
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B1C181349
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lxa_w89q1ycl for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 20:16:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 883268131C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 883268131C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 883268131C
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 20:16:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DF84FB0056A;
 Thu, 26 Mar 2026 21:16:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 26 Mar 2026 21:16:41 +0100
MIME-Version: 1.0
Date: Thu, 26 Mar 2026 21:16:41 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20260326081422.945900-2-titouan.christophe@mind.be>
References: <20260326081422.945900-1-titouan.christophe@mind.be>
 <20260326081422.945900-2-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <629ce29a9fa3d397caae1e60b84ab375@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774556207;
 bh=hfrcpRIzC3oEk6jkJOvnPUABH0hVaMKaZE5/oF8P34g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nL0MDykMmrkkoLnT09nYJj8Flfku7B2tTG+8rVEqq5iAeEMJCIr6Dizn8WED6er1T
 M7y32Etk1o3/2QlDsYXHnIf5H5cwEFhcHs1S6azh/F43vIbJtVerdsQfbKJj56DGMp
 Wor7vZQaj39ZTqHqj3zPoNULf6S2kLQgu6d/cQsyhhwiuRodPbCNpBovnMrjfHqzwW
 WmeavoMG+Um0mZcSqRdISypRazoMfSrkMYwcbTehdgcaa5+2CavzSfmJJ82kuyNvMA
 +F9f9PpWvuKMfRfcOdzhKXYojXilImfoMHmhPDYjEy0Ii0Yzg15uhoC3AZtAkVicAW
 MlYizQxeTiwmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nL0MDykM
Subject: Re: [Buildroot] [PATCH v2 1/2] docs/website: add security contact
 information on the homepage
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

On 26/03/2026 09:14, Titouan Christophe via buildroot wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
