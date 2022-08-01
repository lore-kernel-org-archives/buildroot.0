Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431F2C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E8B60BC1;
	Mon,  1 Aug 2022 17:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9E8B60BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZtmKnUM-wovH; Mon,  1 Aug 2022 17:34:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2AF460B88;
	Mon,  1 Aug 2022 17:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2AF460B88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D17881BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9E3C4087F
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9E3C4087F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XE3mY3Vy3GK2 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:33:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8687B40866
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8687B40866
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 811B186BAC; Mon,  1 Aug 2022 17:19:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 19:16:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8a7b2676d526e8af235dbfd8632811ec3b228ca
X-Git-Newrev: 085eaa9a2ecfba4c77393835ec695f134ff1d694
X-Patchwork-Hint: ignore
Message-Id: <20220801171936.811B186BAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-beniget: new host-only
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=085eaa9a2ecfba4c77393835ec695f134ff1d694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Generated with scanpypi and converted to host.

It is a dependency of python-pythran.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/python-beniget/python-beniget.hash |  5 +++++
 package/python-beniget/python-beniget.mk   | 15 +++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9c5897c208..f32a086daf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1181,6 +1181,7 @@ F:	package/libnids/
 F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
+F:	package/python-beniget/
 F:	package/python-gast/
 F:	package/python-pybind/
 F:	package/reaver/
diff --git a/package/python-beniget/python-beniget.hash b/package/python-beniget/python-beniget.hash
new file mode 100644
index 0000000000..cd4fa7b873
--- /dev/null
+++ b/package/python-beniget/python-beniget.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/beniget/json
+md5  a2bbe7f17f10f9c127d8ef00692ddc55  beniget-0.4.1.tar.gz
+sha256  75554b3b8ad0553ce2f607627dad3d95c60c441189875b98e097528f8e23ac0c  beniget-0.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  64ad3e304e9d2d8731c26ac3e652335a6016e38be2f71fe30350be51c6d500b0  LICENSE
diff --git a/package/python-beniget/python-beniget.mk b/package/python-beniget/python-beniget.mk
new file mode 100644
index 0000000000..9970546b14
--- /dev/null
+++ b/package/python-beniget/python-beniget.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-beniget
+#
+################################################################################
+
+PYTHON_BENIGET_VERSION = 0.4.1
+PYTHON_BENIGET_SOURCE = beniget-$(PYTHON_BENIGET_VERSION).tar.gz
+PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/14/e7/50cbac38f77eca8efd39516be6651fdb9f3c4c0fab8cf2cf05f612578737
+PYTHON_BENIGET_SETUP_TYPE = setuptools
+PYTHON_BENIGET_LICENSE = BSD-3-Clause
+PYTHON_BENIGET_LICENSE_FILES = LICENSE
+HOST_PYTHON_BENIGET_DEPENDENCIES = host-python-gast
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
