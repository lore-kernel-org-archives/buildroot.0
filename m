Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8E9C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 822BF4174B;
	Mon,  6 Nov 2023 22:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 822BF4174B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYz7WK5dgG3r; Mon,  6 Nov 2023 22:02:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1EBB41579;
	Mon,  6 Nov 2023 22:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1EBB41579
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAA001BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3C5F40015
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C5F40015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wEagikcKdkM for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68C224028D
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68C224028D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52BED86ADA; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:58:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b507f22e409d3a22e6f5b9ba38ce406f3a71598
X-Git-Newrev: 7c4a6503723d37d5475f38b2d3004be243f01534
X-Patchwork-Hint: ignore
Message-Id: <20231106220204.52BED86ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-arrow: bump to version 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c4a6503723d37d5475f38b2d3004be243f01534
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to date update:
https://github.com/arrow-py/arrow/commit/de0aea98051f9d99f237e7edd27ae3e5c6bf1489

Add new types-python-dateutil runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-arrow/Config.in         | 1 +
 package/python-arrow/python-arrow.hash | 6 +++---
 package/python-arrow/python-arrow.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
index 244956879c..4a43ef98a7 100644
--- a/package/python-arrow/Config.in
+++ b/package/python-arrow/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ARROW
 	bool "python-arrow"
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_TYPES_PYTHON_DATEUTIL # runtime
 	help
 	  Better dates and times for Python.
 
diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
index 30fb88e8c0..6120069abf 100644
--- a/package/python-arrow/python-arrow.hash
+++ b/package/python-arrow/python-arrow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/arrow/json
-md5  a964a7574e486b0642f3fbc02ef22773  arrow-1.2.3.tar.gz
-sha256  3934b30ca1b9f292376d9db15b19446088d12ec58629bc3f0da28fd55fb633a1  arrow-1.2.3.tar.gz
+md5  f03ecc3edbe2db99f366142f6e0f6d0b  arrow-1.3.0.tar.gz
+sha256  d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85  arrow-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  40d6e1255d7151f5f041a514725d3c94ffa8c1881e5a0c29b6bea93f03e2e3bb  LICENSE
+sha256  b481f87296cb0abdb13fd8cbb94b14c328be880ec9e68547a61b84dacffd067a  LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index 1e34ef09c8..793cc2640f 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARROW_VERSION = 1.2.3
+PYTHON_ARROW_VERSION = 1.3.0
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/7f/c0/c601ea7811f422700ef809f167683899cdfddec5aa3f83597edf97349962
+PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/2e/00/0f6e8fcdb23ea632c866620cc872729ff43ed91d284c866b515c6342b173
 PYTHON_ARROW_SETUP_TYPE = setuptools
 PYTHON_ARROW_LICENSE = Apache-2.0
 PYTHON_ARROW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
