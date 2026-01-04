Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346F8C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 13:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B8D5608E2;
	Sun,  4 Jan 2026 13:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhVdkOTdMoMs; Sun,  4 Jan 2026 13:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A9A760903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767532008;
	bh=J8wKy2Fe/1RqhCj6C7cdDMiXDxnAwstVyCl1+8q/qD4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SBnYyXPX1RjayTu9fIQly5NVmUBwDbOmxShD3FNXpGy/UpnLNP8Skc5qPRbTC4+/y
	 J2E9/cnmCarzpjdzOHTI8SogZEP9bhgsqL6QQm8ffTnO/gkWZZRc/LyLKJdueYNL1p
	 eiAFBMkL5iJGoTT9xXUFrm07ZrqYGsN2mrS3/rIP9sUsVMDsoWwcJpeBNm/RZ0L49r
	 3oo6VZkh0FCU1lAM52ADel8UbNSWuhdDLTaiT6A0VslWkPLOmoxqLbIwsWR7czBYjb
	 gGzSFVeLvOvz0nBRVjY/9phNWtE+kfHIw4Ajx+hZP1fwQJf9AdROT5lN1x1Gz/5TKp
	 olB+G3kdWQIJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A9A760903;
	Sun,  4 Jan 2026 13:06:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D7E52DF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89E94404C3
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iI6r8PEzuOc2 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 748B94037F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 748B94037F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 725B080E53; Sun,  4 Jan 2026 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 14:00:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0977e4b818aed8ea2bc3e94c031e98bcd1991a9
X-Git-Newrev: 4adbbbbec3711bdeb868b80888d0b75d8529cbf1
X-Patchwork-Hint: ignore
Message-Id: <20260104130636.725B080E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: propagate
 python-pybind C++ dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4adbbbbec3711bdeb868b80888d0b75d8529cbf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit
5f446a8d6dd8715385d6e2df2714f064bf26243d ("package/python-pillow: bump
to version 12.0.0") added a select BR2_PACKAGE_PYTHON_PYBIND to
python-pillow without propagating the C++ dependency, causing:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PYBIND
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PILLOW [=y] && BR2_PACKAGE_PYTHON3 [=y]

Fix this by propagating the dependency to python-pillow, and in turn
to python-pillow reverse dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pillow/Config.in     | 4 ++++
 package/python-qrcode/Config.in     | 4 ++++
 package/python-weasyprint/Config.in | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
index 51d8db5920..eaf98c85af 100644
--- a/package/python-pillow/Config.in
+++ b/package/python-pillow/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PILLOW
 	bool "python-pillow"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pybind
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -14,3 +15,6 @@ config BR2_PACKAGE_PYTHON_PILLOW
 	  tiff, freetype, webp, and openjpeg (JPEG-2000).
 
 	  https://pypi.python.org/pypi/Pillow/
+
+comment "python-pillow needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-qrcode/Config.in b/package/python-qrcode/Config.in
index 9a17cc1f08..071c867b01 100644
--- a/package/python-qrcode/Config.in
+++ b/package/python-qrcode/Config.in
@@ -13,6 +13,10 @@ config BR2_PACKAGE_PYTHON_QRCODE_SVG
 
 config BR2_PACKAGE_PYTHON_QRCODE_PIL
 	bool "PIL support"
+	depends on BR2_INSTALL_LIBSTDCPP # python-pillow
 	select BR2_PACKAGE_PYTHON_PILLOW
 
+comment "PIL support needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 endif
diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 5ed84e075e..9db2a5afbb 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEASYPRINT
 	bool "python-weasyprint"
-	depends on BR2_INSTALL_LIBSTDCPP # python-zopfli
+	depends on BR2_INSTALL_LIBSTDCPP # python-zopfli, python-pillow
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
