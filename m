Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE451C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA69E4FAC2;
	Fri, 28 Feb 2025 16:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fJeQlIKqgSlN; Fri, 28 Feb 2025 16:44:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 662D84FAB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662D84FAB9;
	Fri, 28 Feb 2025 16:44:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E018711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E83E419E1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5SRkSH6o_tB for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA60342532
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA60342532
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E10AD86A4B; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 14:03:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c008a22ab4381a3d25c025db92684e56c5d562f4
X-Git-Newrev: 5d44798a49c6513366b47fb7863dad0386cb4a83
X-Patchwork-Hint: ignore
Message-Id: <20250228162946.E10AD86A4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-aiomonitor:
 bump to version 0.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d44798a49c6513366b47fb7863dad0386cb4a83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add new python-telnetlib3 runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiomonitor/Config.in              | 1 +
 package/python-aiomonitor/python-aiomonitor.hash | 4 ++--
 package/python-aiomonitor/python-aiomonitor.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-aiomonitor/Config.in b/package/python-aiomonitor/Config.in
index 9f3787f9b3..dbe0f133dc 100644
--- a/package/python-aiomonitor/Config.in
+++ b/package/python-aiomonitor/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_AIOMONITOR
 	select BR2_PACKAGE_PYTHON_JANUS # runtime
 	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_TELNETLIB3 # runtime
 	select BR2_PACKAGE_PYTHON_TERMINALTABLES # runtime
 	select BR2_PACKAGE_PYTHON_TRAFARET # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
index f1c0e37667..fb8300fd0d 100644
--- a/package/python-aiomonitor/python-aiomonitor.hash
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
-md5  75fc8f84c0ff385931d76c46265cfc0d  aiomonitor-0.7.0.tar.gz
-sha256  109b9ad309a44c0c5db1219d106f4062615151ad3f0e288a0c104fbb004d0398  aiomonitor-0.7.0.tar.gz
+md5  e5b17b3baccb6e2b709bd85ab3faee32  aiomonitor-0.7.1.tar.gz
+sha256  beb1f14429bc4a3135bbac32381d242fe2019d74fcf9c86d3f4bd7405dc562e4  aiomonitor-0.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
index 8eaddcbfa6..824208ac79 100644
--- a/package/python-aiomonitor/python-aiomonitor.mk
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOMONITOR_VERSION = 0.7.0
+PYTHON_AIOMONITOR_VERSION = 0.7.1
 PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
-PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/50/30/1d903b716489c2b5d0a92baccf172f972e97c2de94d4ea41c154287e9b60
+PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/28/0a/805797608db4e30ab588b283137b5b2a735655c20df72f2f9bac41da789e
 PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
 PYTHON_AIOMONITOR_LICENSE = Apache-2.0
 PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
