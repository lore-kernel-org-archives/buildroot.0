Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596D2C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BBA281454;
	Mon,  6 Feb 2023 11:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BBA281454
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhUDujPhF8ZZ; Mon,  6 Feb 2023 11:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 907E081450;
	Mon,  6 Feb 2023 11:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 907E081450
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B24F61BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D00C402F8
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D00C402F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgr35AYHjQfH for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:01:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F906402EA
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F906402EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8ABC883A90; Mon,  6 Feb 2023 11:01:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 12:00:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87af250c0e136bf8751e1fc8a6196f9b25a0b64e
X-Git-Newrev: c96b2b21f7aedd78094fd009f03d8f82361e5105
X-Patchwork-Hint: ignore
Message-Id: <20230206110133.8ABC883A90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crudini: add host-crudini
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

commit: https://git.buildroot.net/buildroot/commit/?id=c96b2b21f7aedd78094fd009f03d8f82361e5105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the host variant of crudini package. This can be useful in
post-{build,image} scripts.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998@free.fr: select python3, don't depend on it]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in.host         | 1 +
 package/crudini/Config.in.host | 9 +++++++++
 package/crudini/crudini.mk     | 1 +
 3 files changed, 11 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 0f612d7872..8d28f426d1 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -14,6 +14,7 @@ menu "Host utilities"
 	source "package/checksec/Config.in.host"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
+	source "package/crudini/Config.in.host"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
 	source "package/delve/Config.in.host"
diff --git a/package/crudini/Config.in.host b/package/crudini/Config.in.host
new file mode 100644
index 0000000000..4e77095627
--- /dev/null
+++ b/package/crudini/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_CRUDINI
+	bool "host crudini"
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON_INIPARSE # runtime
+	help
+	  A utility for handling ini files from the command line and
+	  shell scripts
+
+	  https://pypi.python.org/pypi/crudini
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 7141e2b2a0..c376c5f777 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -11,3 +11,4 @@ CRUDINI_LICENSE = GPL-2.0
 CRUDINI_LICENSE_FILES = COPYING
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
