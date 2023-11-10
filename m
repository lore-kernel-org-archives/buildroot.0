Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA35C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B52D42868;
	Fri, 10 Nov 2023 21:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B52D42868
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kQPxteZ-mU9b; Fri, 10 Nov 2023 21:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F9124284E;
	Fri, 10 Nov 2023 21:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F9124284E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21D311BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB0316F6F7
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB0316F6F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mTiwIzsKxCfT for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:11:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8B46F6F3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB8B46F6F3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D597086FE8; Fri, 10 Nov 2023 21:11:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:06:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80adc6bee2269fdbeda3d5c5025383360416588f
X-Git-Newrev: 53931943ebeb60f57736d01f490351ddc971574f
X-Patchwork-Hint: ignore
Message-Id: <20231110211108.D597086FE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-versioneer: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=53931943ebeb60f57736d01f490351ddc971574f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Used with the latest version of python-constantly. It is only needed as a
host package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                                       |  1 +
 package/python-versioneer/python-versioneer.hash |  5 +++++
 package/python-versioneer/python-versioneer.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d80931e84a..359714bdb5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -38,6 +38,7 @@ F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/python-kmod/
+F:	package/python-versioneer/
 F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/python-versioneer/python-versioneer.hash b/package/python-versioneer/python-versioneer.hash
new file mode 100644
index 0000000000..44cbeb1593
--- /dev/null
+++ b/package/python-versioneer/python-versioneer.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/versioneer/json
+md5  1703d6ced3656553066fa71e42c5eee6  versioneer-0.29.tar.gz
+sha256  5ab283b9857211d61b53318b7c792cf68e798e765ee17c27ade9f6c924235731  versioneer-0.29.tar.gz
+# Locally computed sha256 checksums
+sha256  b5065838cbac452dfc855ba6e6e031481ad2c68406f70d21ead9321374653e6c  LICENSE
diff --git a/package/python-versioneer/python-versioneer.mk b/package/python-versioneer/python-versioneer.mk
new file mode 100644
index 0000000000..5dbf0dd1c2
--- /dev/null
+++ b/package/python-versioneer/python-versioneer.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-versioneer
+#
+################################################################################
+
+PYTHON_VERSIONEER_VERSION = 0.29
+PYTHON_VERSIONEER_SOURCE = versioneer-$(PYTHON_VERSIONEER_VERSION).tar.gz
+PYTHON_VERSIONEER_SITE = https://files.pythonhosted.org/packages/32/d7/854e45d2b03e1a8ee2aa6429dd396d002ce71e5d88b77551b2fb249cb382
+PYTHON_VERSIONEER_SETUP_TYPE = setuptools
+PYTHON_VERSIONEER_LICENSE = Unlicense
+PYTHON_VERSIONEER_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
