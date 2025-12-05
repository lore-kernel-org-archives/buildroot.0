Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ABED4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EF948413D;
	Fri, 12 Dec 2025 07:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoZ4h1PqX6sC; Fri, 12 Dec 2025 07:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2685983F82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526274;
	bh=0tcVFl/JFDEjJmpMlk5XjuqT/XgQpFw2Y7UO6K7+ylU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GKd65DsIsbTK9gGu66M1NWteShAp+7SHq9JFA3NZbRzNRV1OxC5GZBNqO0PA1JnFh
	 e37ECIWlV3qXIdFhobUr+NonqIwq0ZxcuF2uuimBTGHw/bPUz6gFWaRvBTouQDB2Wq
	 9kreZ6QxPECxdMPac+32BoCPnRzBUeFu3S3ekdbry8FHv7wVkIDQX2SQgLJPfN8Wo2
	 V5nmZ50/1hsX6CMN8T4TXhULu3W0O9ZmS771mnLgjmBLMBOQWfWwpRg5YLAfjwOENs
	 6Klri1dhDL207gONJ+j20EPz8kyzy8yJpHluLQe5263TlTw5YhDDYHXjDfp14CFxs4
	 FbTuwY9mEPDZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2685983F82;
	Fri, 12 Dec 2025 07:57:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 109422C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 550A241071
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhF3SLLXqlE7 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D4BC4115E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D4BC4115E
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C1D581674; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 23:00:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00cce8c05216e86a4ada4b01a0d5dacfca533649
X-Git-Newrev: d1c31dc5e6746be104345eaae93a12017a6447be
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.3C1D581674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-annotated-doc: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d1c31dc5e6746be104345eaae93a12017a6447be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required for fastapi since 0.120.0 [1]

https://github.com/fastapi/fastapi/releases/tag/0.120.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/python-annotated-doc/Config.in                 |  7 +++++++
 package/python-annotated-doc/python-annotated-doc.hash |  5 +++++
 package/python-annotated-doc/python-annotated-doc.mk   | 15 +++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 45229ecf41..7434f41838 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2260,6 +2260,7 @@ N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/nethogs/
 F:	package/pico-sdk/
 F:	package/picotool/
+F:	package/python-annotated-doc/
 F:	package/python-apscheduler/
 F:	package/python-crc/
 F:	package/python-django/
diff --git a/package/Config.in b/package/Config.in
index 53fda7e086..a083f43a64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -992,6 +992,7 @@ menu "External python modules"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-aniso8601/Config.in"
+	source "package/python-annotated-doc/Config.in"
 	source "package/python-annotated-types/Config.in"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-anyio/Config.in"
diff --git a/package/python-annotated-doc/Config.in b/package/python-annotated-doc/Config.in
new file mode 100644
index 0000000000..3bd240f211
--- /dev/null
+++ b/package/python-annotated-doc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ANNOTATED_DOC
+	bool "python-annotated-doc"
+	help
+	  Document parameters, class attributes, return types, and
+	  variables inline, with Annotated.
+
+	  https://github.com/fastapi/annotated-doc
diff --git a/package/python-annotated-doc/python-annotated-doc.hash b/package/python-annotated-doc/python-annotated-doc.hash
new file mode 100644
index 0000000000..8ffdae9b5d
--- /dev/null
+++ b/package/python-annotated-doc/python-annotated-doc.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/annotated-doc/json
+md5  825f2ecff1f182cd942ea09907ebafdb  annotated_doc-0.0.4.tar.gz
+sha256  fbcda96e87e9c92ad167c2e53839e57503ecfda18804ea28102353485033faa4  annotated_doc-0.0.4.tar.gz
+# Locally computed sha256 checksums
+sha256  fff170779a6acbf65abdb405c087f1cee1786691e4a96a4034517e4a504a0cdf  LICENSE
diff --git a/package/python-annotated-doc/python-annotated-doc.mk b/package/python-annotated-doc/python-annotated-doc.mk
new file mode 100644
index 0000000000..2186601a8c
--- /dev/null
+++ b/package/python-annotated-doc/python-annotated-doc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-annotated-doc
+#
+################################################################################
+
+PYTHON_ANNOTATED_DOC_VERSION = 0.0.4
+PYTHON_ANNOTATED_DOC_SOURCE = annotated_doc-$(PYTHON_ANNOTATED_DOC_VERSION).tar.gz
+PYTHON_ANNOTATED_DOC_SITE = https://files.pythonhosted.org/packages/57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c
+PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
+PYTHON_ANNOTATED_DOC_LICENSE = MIT
+PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
+PYTHON_ANNOTATED_DOC_DEPENDENCIES = host-python-pdm-backend
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
