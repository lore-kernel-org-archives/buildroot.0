Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D4CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7432660A93;
	Wed,  9 Feb 2022 21:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8VAjPTKLUcX; Wed,  9 Feb 2022 21:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B56860E63;
	Wed,  9 Feb 2022 21:54:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4153C1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E4E160FF5
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ZBWZ2MsQCSO for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58BDB607BC
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5F5EF81335; Wed,  9 Feb 2022 21:26:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:16:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71d5d8c1082bfd94ce066a9d5b03e5d573799e8b
X-Git-Newrev: da9f2a8fda2a746cd7f387d3335f28be6afd6e37
X-Patchwork-Hint: ignore
Message-Id: <20220209212603.5F5EF81335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: drop python2 references
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

commit: https://git.buildroot.net/buildroot/commit/?id=da9f2a8fda2a746cd7f387d3335f28be6afd6e37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-python.txt | 8 --------
 docs/manual/writing-rules.txt          | 8 ++++----
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index 0c100859be..cfd2f88920 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -67,14 +67,6 @@ Python build system, but are not Python modules, can freely choose
 their name (existing examples in Buildroot are +scons+ and
 +supervisor+).
 
-Packages that are only compatible with one version of Python (as in:
-Python 2 or Python 3) should depend on that version explicitely in
-their +Config.in+ file (+BR2_PACKAGE_PYTHON+ for Python 2,
-+BR2_PACKAGE_PYTHON3+ for Python 3).  Packages that are compatible
-with both versions should not explicitely depend on them in their
-+Config.in+ file, since that condition is already expressed for the
-whole "External python modules" menu.
-
 The main macro of the Python package infrastructure is
 +python-package+. It is similar to the +generic-package+ macro. It is
 also possible to create Python host packages with the
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 3eec095d0e..6255a08c1c 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -93,9 +93,9 @@ so _make_ recognizes them as commands.
 YES:
 +
 ---------------------
-ifeq ($(BR2_PACKAGE_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBFOO_CONF_OPTS += --with-python-support
-LIBFOO_DEPENDENCIES += python
+LIBFOO_DEPENDENCIES += python3
 else
 LIBFOO_CONF_OPTS += --without-python-support
 endif
@@ -104,8 +104,8 @@ endif
 NO:
 +
 ---------------------
-LIBFOO_CONF_OPTS += --with$(if $(BR2_PACKAGE_PYTHON),,out)-python-support
-LIBFOO_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,)
+LIBFOO_CONF_OPTS += --with$(if $(BR2_PACKAGE_PYTHON3),,out)-python-support
+LIBFOO_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,)
 ---------------------
 
 ** Keep configure options and dependencies close together.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
