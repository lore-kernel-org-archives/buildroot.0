Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986FBC433FE
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F88408CD;
	Tue, 14 Dec 2021 19:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8C3hFK6i8myF; Tue, 14 Dec 2021 19:55:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C74EE408F9;
	Tue, 14 Dec 2021 19:55:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F2721BF5DD
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A65060BBA
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9QKRi6PyJsa for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2E8F60BF3
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:53:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D4AA281E7F; Tue, 14 Dec 2021 19:48:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:21:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88281a5c4efbc637f0a6d1ac6e92f68ba2050c1a
X-Git-Newrev: 7b5a30f7aab6bc0b0554b3bc1c2dd8cf09132155
X-Patchwork-Hint: ignore
Message-Id: <20211214194841.D4AA281E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b5a30f7aab6bc0b0554b3bc1c2dd8cf09132155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for gnupg is added by the apps/gpg module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnupg/gnupg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 9729441bd2..68df11a0c3 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -11,6 +11,7 @@ GNUPG_LICENSE = GPL-3.0+
 GNUPG_LICENSE_FILES = COPYING
 GNUPG_DEPENDENCIES = zlib $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CPE_ID_VENDOR = gnupg
+GNUPG_SELINUX_MODULES = gpg
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPTS = \
 	--disable-rpath \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
