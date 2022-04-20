Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50327C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 012F660EAD;
	Wed, 20 Apr 2022 20:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjcVuJ3pwDW1; Wed, 20 Apr 2022 20:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1065C60B64;
	Wed, 20 Apr 2022 20:56:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECB7F1BF2A5
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DADFF410BC
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IompS4byrDYd for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:55:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1E16410BA
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:55:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id EDD7283F6B; Wed, 20 Apr 2022 20:45:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 22:55:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f1130afcdac3c2fb54b7a3d95ca7b4073b9453b
X-Git-Newrev: db3e2e4da88a10e8125b8e343c0ece106613b5b5
X-Patchwork-Hint: ignore
Message-Id: <20220420204555.EDD7283F6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ragel: new package
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
Content-Type: multipart/mixed; boundary="===============7697633956874990007=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7697633956874990007==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=db3e2e4da88a10e8125b8e343c0ece106613b5b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is an host-only package that does preprocessing to .rl files to
turn them into .c or .cpp files.

Initially added to support package/roc.

See https://www.colm.net/open-source/ragel/ for the project's home page:

Ragel compiles executable finite state machines from regular languages.
Ragel targets C, C++ and ASM. Ragel state machines can not only
recognize byte sequences as regular expression machines do, but can
also execute code at arbitrary points in the recognition of a regular
language. Code embedding is done using inline operators that do not
disrupt the regular language syntax.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
[yann.morin.1998@free.fr: drop empty _DEPENDENCIES]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ragel/ragel.hash |  3 +++
 package/ragel/ragel.mk   | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/ragel/ragel.hash b/package/ragel/ragel.hash
new file mode 100644
index 0000000000..332f587432
--- /dev/null
+++ b/package/ragel/ragel.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  5f156edb65d20b856d638dd9ee2dfb43285914d9aa2b6ec779dac0270cd56c3f  ragel-6.10.tar.gz
+sha256  05a87975accb539399d0c8a4f4402ac27a6762fb1e4f31d04d455a8bee3e3693  COPYING
diff --git a/package/ragel/ragel.mk b/package/ragel/ragel.mk
new file mode 100644
index 0000000000..56afcd7236
--- /dev/null
+++ b/package/ragel/ragel.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# ragel
+#
+################################################################################
+
+RAGEL_VERSION = 6.10
+RAGEL_SITE = https://www.colm.net/files/ragel/
+RAGEL_LICENSE = GPL-2.0
+RAGEL_LICENSE_FILES = COPYING
+RAGEL_CONF_OPTS = \
+	--disable-silent-rules \
+	--disable-manual \
+	--disable-dependency-tracking
+
+$(eval $(host-autotools-package))

--===============7697633956874990007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7697633956874990007==--
