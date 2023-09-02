Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79F1EC873D
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EC4B83ECA;
	Thu,  7 Sep 2023 15:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EC4B83ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1XznUQvCJIB; Thu,  7 Sep 2023 15:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADC248340C;
	Thu,  7 Sep 2023 15:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADC248340C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11DA21BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB5D741DC9
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB5D741DC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YpWRDL_nfLJg for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 275E741E6A
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 275E741E6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17FF786A1E; Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 17:57:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a51213b2702853e7897aa1f8be3a679280ab5e24
X-Git-Newrev: 925b09f7edf97b2f57b9269c1fd73e2e6f5a9f13
X-Patchwork-Hint: ignore
Message-Id: <20230907145135.17FF786A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-distlib: new host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=925b09f7edf97b2f57b9269c1fd73e2e6f5a9f13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/python-distlib/python-distlib.hash |  5 +++++
 package/python-distlib/python-distlib.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index eba7c4aa34..3af43d2d27 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1431,6 +1431,7 @@ F:	package/python-cbor2/
 F:	package/python-cchardet/
 F:	package/python-charset-normalizer/
 F:	package/python-cssselect2/
+F:	package/python-distlib/
 F:	package/python-editables/
 F:	package/python-flatbuffers/
 F:	package/python-fonttools/
diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
new file mode 100644
index 0000000000..506d10824c
--- /dev/null
+++ b/package/python-distlib/python-distlib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/distlib/json
+md5  44e4357e35bbd77fdf1b81e174e34f20  distlib-0.3.7.tar.gz
+sha256  9dafe54b34a028eafd95039d5e5d4851a13734540f1331060d31c9916e7147a8  distlib-0.3.7.tar.gz
+# Locally computed sha256 checksums
+sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
new file mode 100644
index 0000000000..cae025dbdb
--- /dev/null
+++ b/package/python-distlib/python-distlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-distlib
+#
+################################################################################
+
+PYTHON_DISTLIB_VERSION = 0.3.7
+PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/29/34/63be59bdf57b3a8a8dcc252ef45c40f3c018777dc8843d45dd9b869868f0
+PYTHON_DISTLIB_SETUP_TYPE = setuptools
+PYTHON_DISTLIB_LICENSE = PSF-2.0
+PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
