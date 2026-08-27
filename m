Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F7EC61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 19:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC28D40641;
	Thu, 27 Aug 2026 19:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ejpi3XgTJCbd; Thu, 27 Aug 2026 19:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787858802;
	bh=K63h6o6Ww0qkQtHqfgbXo0Rp7//7ZncF6sbfU5zg+UE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f9eRA1ZmhWmrEuBKgw2UwQxoynis1xM/67pFM8rOB4Zl1L39PreStOZliKSvOTjgA
	 sb3jETMZQD1nAo9PPR/CUsii9QEOkssIiZmIHxjxfTDcXGX6cGfKG99pqJJwHcPfUe
	 Q6f0mlHuXUZJxp2qNiH5DpB++piYXfxVcJ6ggtkNTdQ91qIj4fwd3dY6pc9OVIxQ3y
	 /E326KMSqD30VJg2A7aEmAYfvGHNzeHZK+j47RuLqpm67L2D/vp+2srlWc6vGJoE2/
	 msOEz8kYdJLmvSDf48S/XEqWMlEAwPtINUCblHIlpJ4f338ReTTvznfg/CYptltzD1
	 YSYvVqtHvztew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1441407F3;
	Thu, 27 Aug 2026 19:26:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49C41466
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 309B940362
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K89ztdzk8uMl for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 19:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A42740361
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 19:26:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D51699202A; Thu, 27 Aug 2026 19:25:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 19:55:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29add676660b62124c876dbb82f7fd73ad2ff47f
X-Git-Newrev: 50a1dd2676bb5a346a8f62cc00842a7e3c016174
X-Patchwork-Hint: ignore
Message-Id: <20260827192541.D51699202A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6declarative: fix select of
 host-qt6base network
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50a1dd2676bb5a346a8f62cc00842a7e3c016174
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The BR2_PACKAGE_QT6DECLARATIVE_QUICK option has some logic to select
network support in host-qt6base if network support is enabled in
qt6base. However, it turns out that this is actually required at the
top level BR2_PACKAGE_QT6DECLARATIVE option: as soon as network
support is available in qt6base, the qt6declarative build will assume
that qmlprofiler is available... but that requires network support in
host-qt6base.

This fixes the following build failure:

CMake Error at /home/thomas/autobuild/instance-2/output-1/build/qt6base-6.9.1/cmake/QtToolHelpers.cmake:784 (message):
  Failed to find the host tool "Qt6::qmlprofiler".  It is part of the
  Qt6QmlTools package, but the package did not contain the tool.  Make sure
  that the host module Qml was built with all features enabled (no explicitly
  disabled tools).
Call Stack (most recent call first):
  /home/thomas/autobuild/instance-2/output-1/build/qt6base-6.9.1/cmake/QtToolHelpers.cmake:83 (qt_internal_find_tool)
  tools/qmlprofiler/CMakeLists.txt:11 (qt_internal_add_tool)

Fixes:

  https://autobuild.buildroot.net/results/72c956fdf982382d2981c649c456d1edc2c9d6b2/

We did not trace back exactly since when the problem exists, but we
verified that the problem exists in 2025.02.x. It can be reproduced
with the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_NETWORK=y
BR2_PACKAGE_QT6DECLARATIVE=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt6/qt6declarative/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
index a57b203071..e24133c3e5 100644
--- a/package/qt6/qt6declarative/Config.in
+++ b/package/qt6/qt6declarative/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_QT6DECLARATIVE
 	bool "qt6declarative"
+	# When target qt6base has network support, qt6declarative
+	# assumes that qmlprofiler is available, but that requires
+	# network support in host-qt6base.
+	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
@@ -14,7 +18,6 @@ config BR2_PACKAGE_QT6DECLARATIVE_QUICK
 	bool "quick module"
 	# Enable host test module to ensure that qmltestrunner is built
 	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST # qmltestrunner
-	select BR2_PACKAGE_HOST_QT6BASE_NETWORK if BR2_PACKAGE_QT6BASE_NETWORK # qmlprofiler
 	select BR2_PACKAGE_QT6BASE_GUI
 	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6_GL_SUPPORTS
 	select BR2_PACKAGE_QT6SHADERTOOLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
