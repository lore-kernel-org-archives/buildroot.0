Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072DCC61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 10:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECC5880ED6;
	Fri, 28 Aug 2026 10:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIrMRIc2FzTq; Fri, 28 Aug 2026 10:58:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787914706;
	bh=KqSmS4eXY+qZuPA62OP5VzDvW/pcDeCaPUegtvq0ij4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=igO1IYoKxgGJAAVqq704Zo64u98LmfMknbdGjyf2lheCkGpqfkt/QEEXMe2mP0ekr
	 mfMzqmwmbS0EW4yljuTzbheNEfx95VIwM3QU+e0GxovS3YTyMYrMRP4h9kzAvZWEkV
	 m9JVNI7FLSLS4YNtWn3xOMPj0VzKhza/uwuFCAvsYUamBRuzWxP8Mm+MtlDGLiv8xZ
	 ZFozwxu83Kbf0pcOLcU/eQNuFHi+SWH7LHn0bSBNQ96XU+TShX/CexGtoDJJ7ytP3o
	 t0VU1w6y/JWMRxjQ31PnYyE6r2eVSkgel90AR8rSBInf01aPFD7D8cPkUfBk05DuZT
	 9o4avn0ciH5fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16DC580E2E;
	Fri, 28 Aug 2026 10:58:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C251B465
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FBDE40121
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiq-Xc_nVeSI for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 10:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C05E94005A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:58:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 12EA4B0053E;
 Fri, 28 Aug 2026 12:58:16 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Aug 2026 12:58:16 +0200
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 12:58:16 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
References: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <d5fe799474f58a2b498b36dc5a05310c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/3] package/libbpf: update UAPI header
 installation work-around
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

On 27/08/2026 11:55, Thomas Petazzoni via buildroot wrote:
> bpftrace often needs very recent kernel headers, more recent than the
> runtime version actually needed. We already had a workaround in
> libbpf making sure that if the kernel headers are older than 6.1, we
> would install the libbpf provided headers instead.
> 
> As we are about to update bpftrace to a newer version that uses
> BPF_TRACE_KPROBE_SESSION, which was introduced in Linux 6.10, we need
> to update this workaround accordingly and ensure that the libbpf
> header is installed if the kernel headers are older than 6.10.
> 
> This is necessary for the update of bpftrace to 0.26.1.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
