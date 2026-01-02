Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41BBFA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 21:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA437811AD;
	Fri,  2 Jan 2026 21:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgsgKLpo17GE; Fri,  2 Jan 2026 21:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 871F181158
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767390390;
	bh=37EtwNIvKpp4rpukcWhy3Um4haeVGsL/UBfNXvZ8wzU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZjnJz+bQlX1BVQMNAplXIGEDES+nybsbUGVVB8uXWmsRmUlrLvoN4jRrpV3fDztK4
	 j81V7in9W3JWBbDUejJNerksmuAE/jIGSnBv3uEV3hCq0/K22TnERopDjor/pzaM2i
	 +FxH66bBhrQ0hvftgNa8ePxLnNh5zLDSTrBsrkCqamHXPtuQMzsdLDV+sli1ADPoOy
	 /oII3Kozl1knSNwt1B2kXctEUDqIGkE1yKqC6vKGO7+zyeGw8uOxipv4g/VguerPrb
	 1Y+/eC1mpYE9MOvBmOHvyXuZZ08vPUed+VPSg0Od9Z+Hmc4ZBYZidrA9akXshW3i2k
	 3iJMXVQNcLnhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 871F181158;
	Fri,  2 Jan 2026 21:46:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA1AB440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9078160A48
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0usFoCTXSa0 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 21:46:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1453608D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1453608D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 21:46:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AA34880A8; Fri,  2 Jan 2026 21:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 22:12:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5333fe8b46794e10738c59e171e7a33f3a3d4d62
X-Git-Newrev: ec45430d19ed1ab1aa39e9bd534f3d3d992888bd
X-Patchwork-Hint: ignore
Message-Id: <20260102214624.9AA34880A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spice: propagate libglib2
 BR2_USE_MMU dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec45430d19ed1ab1aa39e9bd534f3d3d992888bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

spice selects libglib2, but forgot to propagate the BR2_USE_MMU
dependency. There is no practical implication at the moment as spice
is only available for i386 and x86-64, and both always have MMU. But
as we're about to relax this architecture dependency, it makes sense
to fix the propagation of BR2_USE_MMU.

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Thomas: patch extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20241122213809.176709-1-ju.o@free.fr/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spice/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index ca5c562ca1..468097cea1 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -1,11 +1,13 @@
 comment "spice server needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_SPICE
 	bool "spice server"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
