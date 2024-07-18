Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E636CC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 21:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9589C81EC9;
	Thu, 18 Jul 2024 21:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfwchV3O0mok; Thu, 18 Jul 2024 21:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA2BE81F1A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA2BE81F1A;
	Thu, 18 Jul 2024 21:26:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DDA01BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AE9840535
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umsuam51dYs8 for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 21:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FB9F4020B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FB9F4020B
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:26:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A50768110A; Thu, 18 Jul 2024 21:26:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 23:25:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 490c5570c2cbdac7d70d9537539dd928d883330a
X-Git-Newrev: 4533db8f6460c9b945afeddac864a4f4d6f61a75
X-Patchwork-Hint: ignore
Message-Id: <20240718212641.A50768110A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pkgconfig: new host package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=4533db8f6460c9b945afeddac864a4f4d6f61a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required to build python-tpm2-pytss.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/python-pkgconfig/python-pkgconfig.hash |  5 +++++
 package/python-pkgconfig/python-pkgconfig.mk   | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d6b364e58..ab6482703d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2827,6 +2827,7 @@ F:	package/openpowerlink/
 F:	package/physfs/
 F:	package/piglit/
 F:	package/python-libevdev/
+F:	package/python-pkgconfig/
 F:	package/qemu/
 F:	package/solarus/
 F:	package/stress-ng/
diff --git a/package/python-pkgconfig/python-pkgconfig.hash b/package/python-pkgconfig/python-pkgconfig.hash
new file mode 100644
index 0000000000..2fa57a7be5
--- /dev/null
+++ b/package/python-pkgconfig/python-pkgconfig.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pkgconfig/json
+md5  12523e11b91b050ca49975cc033689a4  pkgconfig-1.5.5.tar.gz
+sha256  deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899  pkgconfig-1.5.5.tar.gz
+# Locally computed sha256 checksums
+sha256  cdfc7f89d8c93b15d447c9ed71d5a533b4e44b82ec86daaefb10f6db37b9e13a  LICENSE
diff --git a/package/python-pkgconfig/python-pkgconfig.mk b/package/python-pkgconfig/python-pkgconfig.mk
new file mode 100644
index 0000000000..239dd90a5d
--- /dev/null
+++ b/package/python-pkgconfig/python-pkgconfig.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pkgconfig
+#
+################################################################################
+
+PYTHON_PKGCONFIG_VERSION = 1.5.5
+PYTHON_PKGCONFIG_SOURCE = pkgconfig-$(PYTHON_PKGCONFIG_VERSION).tar.gz
+PYTHON_PKGCONFIG_SITE = https://files.pythonhosted.org/packages/c4/e0/e05fee8b5425db6f83237128742e7e5ef26219b687ab8f0d41ed0422125e
+PYTHON_PKGCONFIG_SETUP_TYPE = setuptools
+PYTHON_PKGCONFIG_LICENSE = MIT
+PYTHON_PKGCONFIG_LICENSE_FILES = LICENSE
+
+HOST_PYTHON_PKGCONFIG_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
