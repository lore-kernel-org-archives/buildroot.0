Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB8DC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F352A40193;
	Wed,  9 Feb 2022 17:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSGPqbP6bHqN; Wed,  9 Feb 2022 17:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF0D4016E;
	Wed,  9 Feb 2022 17:08:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB8161BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 920B560BAF
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqCbW9V3HB93 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C963660C08
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C5F60E0003;
 Wed,  9 Feb 2022 16:53:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDV-0001Rz-DU; Wed, 09 Feb 2022 17:53:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:52:13 +0100
Message-Id: <20220209165213.4498-108-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 107/107] docs/manual: drop python2 references
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
