Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B810E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8518180BF6;
	Fri, 27 Dec 2024 14:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlm-01ycipru; Fri, 27 Dec 2024 14:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4D9C80C93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D9C80C93;
	Fri, 27 Dec 2024 14:31:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 203EBF1D
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13D8A40590
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyXov_bLQzgN for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 103E4400AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 103E4400AB
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F094B8745F; Fri, 27 Dec 2024 14:31:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 14:03:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ddfab3770591ce2435a61d027efd46ad098ea1d
X-Git-Newrev: c008a22ab4381a3d25c025db92684e56c5d562f4
X-Patchwork-Hint: ignore
Message-Id: <20241227143124.F094B8745F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-telnetlib3: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c008a22ab4381a3d25c025db92684e56c5d562f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                |  1 +
 package/python-telnetlib3/Config.in              |  6 ++++++
 package/python-telnetlib3/python-telnetlib3.hash |  5 +++++
 package/python-telnetlib3/python-telnetlib3.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 39a2110b96..2211408c42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1422,6 +1422,7 @@ menu "External python modules"
 	source "package/python-systemd/Config.in"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tcolorpy/Config.in"
+	source "package/python-telnetlib3/Config.in"
 	source "package/python-tempora/Config.in"
 	source "package/python-termcolor/Config.in"
 	source "package/python-terminaltables/Config.in"
diff --git a/package/python-telnetlib3/Config.in b/package/python-telnetlib3/Config.in
new file mode 100644
index 0000000000..487258c272
--- /dev/null
+++ b/package/python-telnetlib3/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TELNETLIB3
+	bool "python-telnetlib3"
+	help
+	  Python 3 asyncio Telnet server and client Protocol library.
+
+	  http://telnetlib3.rtfd.org/
diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
new file mode 100644
index 0000000000..db18889b8f
--- /dev/null
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/telnetlib3/json
+md5  2dfac7e10ed63c408da50ea712415f87  telnetlib3-2.0.4.tar.gz
+sha256  dbcbc16456a0e03a62431be7cfefff00515ab2f4ce2afbaf0d3a0e51a98c948d  telnetlib3-2.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  caaf4ac82c4363d4874a49b50af15797618f6aee5bf42218697cdcb41c391ca5  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
new file mode 100644
index 0000000000..e68533af5c
--- /dev/null
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-telnetlib3
+#
+################################################################################
+
+PYTHON_TELNETLIB3_VERSION = 2.0.4
+PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/ef/af/0fadfddd1764e627f4ba9c7381caaf121795ed459a1cc3d0fbb89a187954
+PYTHON_TELNETLIB3_SETUP_TYPE = setuptools
+PYTHON_TELNETLIB3_LICENSE = ISC
+PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
