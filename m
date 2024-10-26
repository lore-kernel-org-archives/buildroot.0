Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5884D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A408580CC1;
	Sat, 26 Oct 2024 16:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91NWVYVbscoh; Sat, 26 Oct 2024 16:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B4E80CFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3B4E80CFE;
	Sat, 26 Oct 2024 16:36:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67C8F5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9915740362
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUepwwqiL0CJ for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BE844039D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BE844039D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:36:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 742B083F7F; Sat, 26 Oct 2024 16:36:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 18:29:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5d64511562fa90b2e481abce4ee950d3e42871e
X-Git-Newrev: b8735ae228c4e796c7a44b3897cad51fd8ce2a61
X-Patchwork-Hint: ignore
Message-Id: <20241026163643.742B083F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-poetry-dynamic-versioning:
 new host package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b8735ae228c4e796c7a44b3897cad51fd8ce2a61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build dependency of aiomqtt (Python package).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 .../python-poetry-dynamic-versioning.hash              |  5 +++++
 .../python-poetry-dynamic-versioning.mk                | 18 ++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b4ae68ebf..2f86bcfab5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1099,6 +1099,7 @@ F:	package/python-pymodbus/
 
 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/python-dunamai/
+F:	package/python-poetry-dynamic-versioning/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
new file mode 100644
index 0000000000..abe063096d
--- /dev/null
+++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-dynamic-versioning/json
+md5  91032d27f9da010d8a9b7e76bfd09d24  poetry_dynamic_versioning-1.4.1.tar.gz
+sha256  21584d21ca405aa7d83d23d38372e3c11da664a8742995bdd517577e8676d0e1  poetry_dynamic_versioning-1.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
new file mode 100644
index 0000000000..31567380ef
--- /dev/null
+++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-poetry-dynamic-versioning
+#
+################################################################################
+
+PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.4.1
+PYTHON_POETRY_DYNAMIC_VERSIONING_SOURCE = poetry_dynamic_versioning-$(PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION).tar.gz
+PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/dd/70/1138211a6e5051d28596922ed39acf20b42819db5ae1f93e465b9a903c28
+PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = pep517
+PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE = MIT
+PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
+HOST_PYTHON_POETRY_DYNAMIC_VERSIONING_DEPENDENCIES = host-python-poetry-core \
+	host-python-dunamai \
+	host-python-jinja2 \
+	host-python-tomlkit
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
