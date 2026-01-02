Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39437FA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B29380E51;
	Fri,  2 Jan 2026 21:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ff14XAC6XKjz; Fri,  2 Jan 2026 21:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE18480F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767390389;
	bh=R6VmW6DyuWKFH8jCOP0C+Df+AdZBwheWZaT6Vq6M8WQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=guCRUbEaUiVwFYjuA5JFw8iXhbFW9s88XcILTu/a7lBAwGJfIgJM3jWz1rl0QOcv3
	 r55Gow33Dp0GWaoM2Xam5sJgk4jVv/sn5r/ThGRvwzz3EjGZQmSy2WH01tBReT3rJ9
	 7cSzsxetUrxCCP/SD3xwJW/GIaj0P+vSOsAPXCyik8j356xkJ8K0K8FpAFvVqgS/9N
	 WZ2G2+OCCkFKNWcF/Clm51mqWcOuqUwnKxMzwPqrX/V1mailPp8aFdEijC21xONbv9
	 TouQha85jCyHooR+zsHTF/BA+jH7L1259Sf/nIlTxhvl2/izJ6MLw42ki/7O8zdXP6
	 /eR4Kr/8NBL8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE18480F36;
	Fri,  2 Jan 2026 21:46:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F4E9972
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8622A4082F
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7wFeNfA017C for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90CC40825
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C90CC40825
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B83C4880B2; Fri,  2 Jan 2026 21:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 22:16:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e09811f97184a1e1320cfb49970c12858fc8a0f1
X-Git-Newrev: 15764ad78e6495a0c1d940b83aab26c7bcde475f
X-Patchwork-Hint: ignore
Message-Id: <20260102214624.B83C4880B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spice: re-enable on all cpu
 architectures
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=15764ad78e6495a0c1d940b83aab26c7bcde475f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit [1] restricted spice compilation to x86 only.
As the log of this commit mention, this was because at that time,
spice 0.12.0 was generating an error on untested cpu architectures.
See [2] (we can also see that armv6+ platforms was apparently
supported).

Spice commit [3] (first included in spice v0.12.6) relaxed this error
to a warning. The reason was that big endian support was improved,
and also there was an intent to make testing easier.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/4f452a86b8523d90ffa7a94cb1d540e574ceb165
[2] https://gitlab.freedesktop.org/spice/spice/-/blob/v0.12.0/configure.ac#L60
[3] https://gitlab.freedesktop.org/spice/spice/-/commit/f80eef8f9ca04f923752efbda043ab856801be8a

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
[Thomas: reduced commit to just re-enabling on all CPU architectures,
created separate commits for the BR2_USE_MMU and gcc >= 6 fixes]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spice/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 1dc5ae3040..d3ca8b7c2c 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,12 +1,10 @@
 comment "spice server needs a toolchain w/ wchar, threads, C++, gcc >= 6"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
-	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
