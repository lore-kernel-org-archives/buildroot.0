Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAAAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 643CF60BFA;
	Sat, 15 Jan 2022 11:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ays_BGhBhb0L; Sat, 15 Jan 2022 11:10:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE49A60BE9;
	Sat, 15 Jan 2022 11:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D05D21BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCFF2400A6
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PF0--nUBZyHe for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:10:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D486140004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:10:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E5767825E4; Sat, 15 Jan 2022 11:04:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 12:08:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c817641331431aeb6db7b487173d63dbd9c73295
X-Git-Newrev: 959f3826e827544a15b7f8ef168b1146d5be81d3
X-Patchwork-Hint: ignore
Message-Id: <20220115110425.E5767825E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysftp: fix dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=959f3826e827544a15b7f8ef168b1146d5be81d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of python-cryptography
to version 36.0.1 in commit 01764876e3d4e7ab95c8365f1c83e6c12d49757c:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
  Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n] && BR2_PACKAGE_PYTHON3 [=y]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PYSFTP [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
  Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n] && BR2_PACKAGE_PYTHON3 [=y]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PYSFTP [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=y]

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pysftp/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/python-pysftp/Config.in b/package/python-pysftp/Config.in
index 5d5b731f33..c65369b667 100644
--- a/package/python-pysftp/Config.in
+++ b/package/python-pysftp/Config.in
@@ -1,13 +1,9 @@
 config BR2_PACKAGE_PYTHON_PYSFTP
 	bool "python-pysftp"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko -> python-cryptography
 	depends on BR2_PACKAGE_PYTHON3 # python-paramiko -> python-bcrypt
-	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	help
 	  A friendly face on SFTP.
 
 	  https://bitbucket.org/dundeemt/pysftp
-
-comment "python-pysftp needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON3
-	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
