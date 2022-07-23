Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6954C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 417354245D;
	Sat, 23 Jul 2022 19:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 417354245D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXGaFwBgVJMH; Sat, 23 Jul 2022 19:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F5B642464;
	Sat, 23 Jul 2022 19:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F5B642464
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9720F1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3C4A42458
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3C4A42458
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vyszm2xjsnFt for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C1204245C
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C1204245C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2B0A08438D; Sat, 23 Jul 2022 18:56:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:08:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a1603d4d4d0565d7b1a6a498d9efa13523e071a
X-Git-Newrev: e55c3a917bd31e2d53e6a91d0b8e6861d0870b49
X-Patchwork-Hint: ignore
Message-Id: <20220723185616.2B0A08438D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-inspect: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e55c3a917bd31e2d53e6a91d0b8e6861d0870b49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-typing-inspect/Config.in                  |  7 +++++++
 package/python-typing-inspect/python-typing-inspect.hash |  5 +++++
 package/python-typing-inspect/python-typing-inspect.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65fc880623..ee836266be 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1361,6 +1361,7 @@ F:	package/python-terminaltables/
 F:	package/python-tinycss2/
 F:	package/python-tomli/
 F:	package/python-typeguard/
+F:	package/python-typing-inspect/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
diff --git a/package/Config.in b/package/Config.in
index 9f9d8124a6..fb11482f5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1273,6 +1273,7 @@ menu "External python modules"
 	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-typing-extensions/Config.in"
+	source "package/python-typing-inspect/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-ujson/Config.in"
diff --git a/package/python-typing-inspect/Config.in b/package/python-typing-inspect/Config.in
new file mode 100644
index 0000000000..dda057a19c
--- /dev/null
+++ b/package/python-typing-inspect/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TYPING_INSPECT
+	bool "python-typing-inspect"
+	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
+	help
+	  Runtime inspection utilities for typing module.
+
+	  https://github.com/ilevkivskyi/typing_inspect
diff --git a/package/python-typing-inspect/python-typing-inspect.hash b/package/python-typing-inspect/python-typing-inspect.hash
new file mode 100644
index 0000000000..f3ff6b642b
--- /dev/null
+++ b/package/python-typing-inspect/python-typing-inspect.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typing-inspect/json
+md5  1444feceb8213bd94cfece3c6d4ffc5c  typing_inspect-0.7.1.tar.gz
+sha256  047d4097d9b17f46531bf6f014356111a1b6fb821a24fe7ac909853ca2a782aa  typing_inspect-0.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  f9d3567d00ca2337f769fb28c553cc590213ecefed4ed599110c10ded2ea0117  LICENSE
diff --git a/package/python-typing-inspect/python-typing-inspect.mk b/package/python-typing-inspect/python-typing-inspect.mk
new file mode 100644
index 0000000000..eef1f0b586
--- /dev/null
+++ b/package/python-typing-inspect/python-typing-inspect.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-typing-inspect
+#
+################################################################################
+
+PYTHON_TYPING_INSPECT_VERSION = 0.7.1
+PYTHON_TYPING_INSPECT_SOURCE = typing_inspect-$(PYTHON_TYPING_INSPECT_VERSION).tar.gz
+PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/c3/da/864ce66818e308b38209d4b1ef0585921d28eb07621ba7d905a0e96bcc80
+PYTHON_TYPING_INSPECT_SETUP_TYPE = setuptools
+PYTHON_TYPING_INSPECT_LICENSE = MIT
+PYTHON_TYPING_INSPECT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
