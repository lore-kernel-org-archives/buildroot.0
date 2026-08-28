Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FA0C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 11:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D68040789;
	Fri, 28 Aug 2026 11:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ivz3RqLFSuhj; Fri, 28 Aug 2026 11:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787917364;
	bh=Kb7ycqClFkqu85MFER9vEGd1Vh5bhdbIbxaXvetTyRw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WA9HkaN73cBGAabSVTofqsdzGVxhyqeE5JQulPfcTRHvF/XRF6DReISkJNM5syEnv
	 9RQXaDcY+/uK/lekAieC5NE697fka0dx4W2IVsHI9QKBe9dghZfY0XG0rYE3mCpksh
	 Zivwc/dQFNdtGb23RWMHvUOSOD6v7m5+Bq03Gcw5gmfaxVz41iaGcMCiNPD5lca2ty
	 RdYH4orfP6otgHafKMipSO5M+NqQIYRRn5SxJfqGfvBLy7u5uYwScO/NdFMG6K3Qmo
	 +GuFM2gyfsU0pp/yQx67MkIQDMYN4vQ11IbFCKSXco/Mrebhvf8gddJUc6SoQ370w9
	 UOIk9A3+epYAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF3840825;
	Fri, 28 Aug 2026 11:42:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CED878B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7377560663
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2aKiE2t0oW4 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 11:42:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 873D160648
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:42:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7FEE7780331;
 Fri, 28 Aug 2026 13:42:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Aug 2026 13:42:36 +0200
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 13:42:36 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260827200814.1801974-1-thomas.petazzoni@bootlin.com>
References: <20260827200814.1801974-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <ddc91179e94584026e68412462afed31@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/collectd: fix build of virt plugin
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

On 27/08/2026 22:08, Thomas Petazzoni via buildroot wrote:
> Since the bump of libxml2 from 2.13.8 to 2.15.0 in Buildroot commit
> d81922c1ef8825f10b802984d9721412a1a1a377, the "virt" plugin of
> collectd no longer builds:
> 
> src/virt.c:2208:49: error: expected ';', ',' or ')' before 
> 'ATTRIBUTE_UNUSED'
>  2208 | static void virt_eventloop_timeout_cb(int timer 
> ATTRIBUTE_UNUSED,
>       |                                                 
> ^~~~~~~~~~~~~~~~
> src/virt.c: In function 'register_event_impl':
> src/virt.c:2221:26: error: 'virt_eventloop_timeout_cb' undeclared 
> (first use in this function)
>  2221 |                          virt_eventloop_timeout_cb, NULL, NULL) 
> < 0) {
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
> src/virt.c:2221:26: note: each undeclared identifier is reported only 
> once for each function it appears in
> 
> This is due to the fact that the virt plugin code was incorrectly
> using the ATTRIBUTE_UNUSED define, which was supposed to be an
> internal define of libxml2. But it turns out that up to libxml2 2.14.0
> and its commit 208f27f9641a59863ce1f7d4992df77f7eb0ea9d, this define
> had been made publicly available. It could therefore mistakenly be
> used by collectd's virt plugin... until libxml2 was upgraded.
> 
> We backport an upstream patch from collectd that fixes the issue.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/4c8463f0372560f4c3a20b0f67854460f0d1c400/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
