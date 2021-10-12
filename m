Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344B8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:39:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA1BA610A2
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA1BA610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9A4607D1;
	Tue, 12 Oct 2021 20:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfTQI8juOCW7; Tue, 12 Oct 2021 20:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0732160BF0;
	Tue, 12 Oct 2021 20:39:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A420D1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D63A60BB1
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LbsgjJSqdLu1 for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6A6E606C0
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3D96F9553C; Tue, 12 Oct 2021 20:34:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:23:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e814dea4cc38d79fb2b15001b4f662c344400ac
X-Git-Newrev: e2001df212861d7ce0cc39f215bf5a4d2931122a
X-Patchwork-Hint: ignore
Message-Id: <20211012203447.3D96F9553C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-humanize: bump to version
 3.11.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2001df212861d7ce0cc39f215bf5a4d2931122a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* The package doesn't support python2 anymore.
* Take also sha256 from pypi.
* License was updated with a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-humanize/Config.in            |  1 +
 package/python-humanize/python-humanize.hash | 10 +++++-----
 package/python-humanize/python-humanize.mk   |  4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-humanize/Config.in b/package/python-humanize/Config.in
index f4f4e67b65..ec63be9b35 100644
--- a/package/python-humanize/Config.in
+++ b/package/python-humanize/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_HUMANIZE
 	bool "python-humanize"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Python humanize package contains various common humanization
 	  utilities, like turning a number into a fuzzy human readable
diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index 47b5f70c9a..9b2559ab11 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/humanize/json
-md5	e8473d9dc1b220911cac2edd53b1d973  humanize-0.5.1.tar.gz
-# Locally computed
-sha256	a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19  humanize-0.5.1.tar.gz
-sha256  2ee89d331213b5886ae5416ead178694ac0eb13bb79c83bf92287f95d3597377  LICENCE
+# md5, sha256 from https://pypi.org/pypi/humanize/json
+md5  04f5b334283e1f7f0dfeccf7d5a4b880  humanize-3.11.0.tar.gz
+sha256  4160cdc63fcd0daac27d2e1e218a31bb396fc3fe5712d153675d89432a03778f  humanize-3.11.0.tar.gz
+# Locally computed sha256 checksums
+sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index 60ec82bd48..ea5454d6cc 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 0.5.1
+PYTHON_HUMANIZE_VERSION = 3.11.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://pypi.python.org/packages/8c/e0/e512e4ac6d091fc990bbe13f9e0378f34cf6eecd1c6c268c9e598dcf5bb9
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/a6/d0/e06993724937f2aab3e7085d137d453968aaac0f74661ef9c90528a79d61
 PYTHON_HUMANIZE_SETUP_TYPE = setuptools
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
