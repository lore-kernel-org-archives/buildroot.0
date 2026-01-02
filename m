Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACCFFA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F728810B3;
	Fri,  2 Jan 2026 15:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDPijrp_cl7x; Fri,  2 Jan 2026 15:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D8381087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367541;
	bh=j4PqnjzTVCfhU61S9U2T4aftPEUKGwR9t7//jc8eflU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FD5KEKsCte0oBtSeMP01TZMHMX/ab42dO672aFaIW9Gsj/7ZuT9OQtHzulxUAzzTJ
	 kaSnyf7m0U7a883l/y7vDI8bHNA0BH4BzdzhK6AURYNRik2tL2ATrTVG7G/njd3q5L
	 ecM8wqxGwtmsj0a5pk2Nameo4jfQJFGk4uZVXi61XSLgjlhpkSh6mYVudwa0qoUUYp
	 XXacBPEtmLyTlGcM9yGaij0skn5VaZfmGcLfS9q2vedPqO5Qpc0/BWEVXukiG5O7zf
	 JIxvAR5jbTmqKtqtaB+2RiuDJJxerTibyMijuuNt+yxaAxtOqFn9dkGCpMSjGoMaqO
	 M9tLb2dyRPjRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D8381087;
	Fri,  2 Jan 2026 15:25:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7B1A440
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A4F08102D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LL91TdI__TYw for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B249980F7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B249980F7B
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A086F819EF; Fri,  2 Jan 2026 15:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 16:24:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1817255457486e31f3aa0553ceccc747c2636a0
X-Git-Newrev: a9d9508572f357f186b3d6f3f10c3e2e3202583d
X-Patchwork-Hint: ignore
Message-Id: <20260102152538.A086F819EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dav1d: bump version to 1.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9d9508572f357f186b3d6f3f10c3e2e3202583d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://code.videolan.org/videolan/dav1d/-/blob/1.5.3/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 22dbf7220d..b6bae42e8f 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.5.2/dav1d-1.5.2.tar.xz.sha256
-sha256  cce88ebcffd3f790bde49caa75f97b9cc2dd54ca8f57e38c62707266ec71bc4e  dav1d-1.5.2.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.5.3/dav1d-1.5.3.tar.xz.sha256
+sha256  732010aa5ef461fa93355ed2c6c5fedb48ddc4b74e697eaabe8907eaeb943011  dav1d-1.5.3.tar.xz
 # Locally computed
 sha256  dd92c3c2247c5651606fc23a5e2d6a1ebc5ace9a3e49cbde0e12f05ad1cb1ee5  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index f9cfd171d5..011ab2ddf0 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.5.2
+DAV1D_VERSION = 1.5.3
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
