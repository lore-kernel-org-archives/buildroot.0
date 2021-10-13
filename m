Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD72DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7414161165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7414161165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A7C740834;
	Wed, 13 Oct 2021 20:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmwtyhYMEWLI; Wed, 13 Oct 2021 20:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97EAD4081B;
	Wed, 13 Oct 2021 20:00:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 176FE1BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10A9A60605
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dtx5pT6u5eFj for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4164060B20
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8E40395BC8; Wed, 13 Oct 2021 19:57:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 21:54:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74523a644b2482808b69ac4c9e71484549c0c89b
X-Git-Newrev: 3c926c65aad73004fc2244e8ecee8ce03aa3c8e6
X-Patchwork-Hint: ignore
Message-Id: <20211013195727.8E40395BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bidict: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c926c65aad73004fc2244e8ecee8ce03aa3c8e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-bidict/Config.in          |  7 +++++++
 package/python-bidict/python-bidict.hash |  5 +++++
 package/python-bidict/python-bidict.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d5929685ab..b1439391ca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1249,6 +1249,7 @@ F:	package/python-aiozipkin/
 F:	package/python-argon2-cffi/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
+F:	package/python-bidict/
 F:	package/python-brotli/
 F:	package/python-cbor2/
 F:	package/python-cchardet/
diff --git a/package/Config.in b/package/Config.in
index b391177785..7971726875 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -927,6 +927,7 @@ menu "External python modules"
 	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
+	source "package/python-bidict/Config.in"
 	source "package/python-bitstring/Config.in"
 	source "package/python-bleak/Config.in"
 	source "package/python-bluezero/Config.in"
diff --git a/package/python-bidict/Config.in b/package/python-bidict/Config.in
new file mode 100644
index 0000000000..adbfda69b8
--- /dev/null
+++ b/package/python-bidict/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BIDICT
+	bool "python-bidict"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  The bidirectional mapping library for Python.
+
+	  https://bidict.readthedocs.io
diff --git a/package/python-bidict/python-bidict.hash b/package/python-bidict/python-bidict.hash
new file mode 100644
index 0000000000..59229f96d9
--- /dev/null
+++ b/package/python-bidict/python-bidict.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/bidict/json
+md5  d9342771969dd0d42092a669ed6f3241  bidict-0.21.3.tar.gz
+sha256  d50bd81fae75e34198ffc94979a0eb0939ff9adb3ef32bcc93a913d8b3e3ed1d  bidict-0.21.3.tar.gz
+# Locally computed sha256 checksums
+sha256  1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5  LICENSE
diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
new file mode 100644
index 0000000000..c6b7b862ea
--- /dev/null
+++ b/package/python-bidict/python-bidict.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-bidict
+#
+################################################################################
+
+PYTHON_BIDICT_VERSION = 0.21.3
+PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
+PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/3f/81/7221b28d692af5c5fc180c4850b8e4a48c7db92b3d529b430488f67db74f
+PYTHON_BIDICT_SETUP_TYPE = setuptools
+PYTHON_BIDICT_LICENSE = MPL-2.0
+PYTHON_BIDICT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
