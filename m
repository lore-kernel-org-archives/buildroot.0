Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DF1C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F2A8429DC;
	Fri,  7 Jan 2022 20:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9P0ZgRivHDb7; Fri,  7 Jan 2022 20:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D70AC429BB;
	Fri,  7 Jan 2022 20:50:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA3C1BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A84F8188B
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QkLsT1N6KeNL for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:50:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1679081450
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:50:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 524C082A92; Fri,  7 Jan 2022 20:44:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 21:50:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2249821d3f30202ca2a35ad24918378d9a0a0e8
X-Git-Newrev: c9647e423db4abcba315d37e2fe0caae32238ce2
X-Patchwork-Hint: ignore
Message-Id: <20220107204438.524C082A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mpd2: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9647e423db4abcba315d37e2fe0caae32238ce2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A client interface for the Music Player Daemon.

[Peter: license is LGPL-3.0+, add DEVELOPERS entry]
Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/python-mpd2/Config.in        |  7 +++++++
 package/python-mpd2/python-mpd2.hash |  5 +++++
 package/python-mpd2/python-mpd2.mk   | 13 +++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 47ac7b5de6..d049b99b91 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2801,6 +2801,9 @@ N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
 
+N:	Uladzimir Bely <wiselord1983@gmail.com>
+F:	package/python-mpd2/
+
 N:	Vadim Kochan <vadim4j@gmail.com>
 F:	package/brcm-patchram-plus/
 F:	package/frr/
diff --git a/package/Config.in b/package/Config.in
index 193ccea1f7..3a0cc0c585 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1093,6 +1093,7 @@ menu "External python modules"
 	source "package/python-mistune/Config.in"
 	source "package/python-modbus-tk/Config.in"
 	source "package/python-more-itertools/Config.in"
+	source "package/python-mpd2/Config.in"
 	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
diff --git a/package/python-mpd2/Config.in b/package/python-mpd2/Config.in
new file mode 100644
index 0000000000..823c82e52d
--- /dev/null
+++ b/package/python-mpd2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MPD2
+	bool "python-mpd2"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A Python MPD client library.
+
+	  https://github.com/Mic92/python-mpd2
diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
new file mode 100644
index 0000000000..83487257ee
--- /dev/null
+++ b/package/python-mpd2/python-mpd2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/python-mpd2/json
+md5  e31c6063e9c2e029a26b0815cd08b05e  python-mpd2-3.0.4.tar.gz
+sha256  7a67834e22d97e7cd77f8951c8baf87c149285c67d67d73550ce034302561ae5  python-mpd2-3.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
new file mode 100644
index 0000000000..f357e302fd
--- /dev/null
+++ b/package/python-mpd2/python-mpd2.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-mpd2
+#
+################################################################################
+
+PYTHON_MPD2_VERSION = 3.0.4
+PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ad/92/bec26455a3a6d6146bcf2a974f5c3509d451306413b386fc12b037d9e3b0
+PYTHON_MPD2_SETUP_TYPE = setuptools
+PYTHON_MPD2_LICENSE = LGPL-3.0+
+PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
