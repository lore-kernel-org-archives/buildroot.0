Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9550CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE9140322;
	Wed,  9 Feb 2022 21:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pcd_3PA2fKu; Wed,  9 Feb 2022 21:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5362240334;
	Wed,  9 Feb 2022 21:39:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 130F31BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0C464151B
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8pPBIgd0NZb for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4355740194
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4A76581335; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:12:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55df30f8b1fb2fff0dd4dce1cab83d6bf55b9527
X-Git-Newrev: 2743ce00ca61fde1537b64a165a69d497052be58
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.4A76581335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python: drop host package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2743ce00ca61fde1537b64a165a69d497052be58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: drop from DEVELOPERS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |   1 -
 ...up.py-do-not-add-invalid-header-locations.patch |  42 ---
 ...-Fix-get_python_inc-for-cross-compilation.patch |  48 ----
 ...the-install-location-of-_sysconfigdata.py.patch |  88 ------
 ...-compilation-of-.pyc-and-.pyo-conditional.patch |  78 ------
 ...st-getaddrinfo-test-for-cross-compilation.patch |  31 ---
 ...-infrastructure-to-be-able-to-disable-ext.patch |  81 ------
 ...ibrary-header-paths-for-cross-compilation.patch |  64 -----
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  31 ---
 .../0009-Fix-python-config-for-cross-builds.patch  | 229 ----------------
 ...0-Remove-the-python-symlink-install-rules.patch |  43 ---
 .../python/0011-Don-t-add-multiarch-paths.patch    |  36 ---
 .../python/0012-Abort-on-failed-module-build.patch |  30 --
 ...-build-when-threads-are-not-used-availabl.patch |  58 ----
 package/python/0014-Serial-ioctl-workaround.patch  |  33 ---
 ...st-the-shebang-of-Python-scripts-for-cros.patch |  35 ---
 ...on-to-disable-installation-of-test-module.patch | 105 -------
 .../0017-Add-an-option-to-disable-pydoc.patch      |  89 ------
 .../0018-Add-an-option-to-disable-lib2to3.patch    |  92 -------
 ...-Add-option-to-disable-the-sqlite3-module.patch |  69 -----
 ...20-Add-an-option-to-disable-the-tk-module.patch |  73 -----
 ...dd-an-option-to-disable-the-curses-module.patch |  61 -----
 .../0022-Add-an-option-to-disable-expat.patch      |  92 -------
 .../0023-Add-an-option-to-disable-CJK-codecs.patch |  32 ---
 .../python/0024-Add-an-option-to-disable-NIS.patch |  35 ---
 ...0025-Add-an-option-to-disable-unicodedata.patch |  32 ---
 .../0026-Add-an-option-to-disable-bsddb.patch      |  87 ------
 ...7-Add-an-option-to-disable-the-ssl-module.patch |  32 ---
 ...8-Add-an-option-to-disable-the-bz2-module.patch |  32 ---
 ...-Add-an-option-to-disable-the-zlib-module.patch |  32 ---
 .../0030-Do-not-install-the-idle-editor.patch      |  55 ----
 ...-option-to-disable-the-ossaudiodev-module.patch |  32 ---
 ...-Add-option-to-disable-the-hashlib-module.patch |  32 ---
 ...-Add-an-option-to-disable-readline-module.patch |  32 ---
 ...stem-locale-and-set-to-default-when-addin.patch |  37 ---
 package/python/Config.in.host                      |  16 --
 package/python/python.hash                         |   5 -
 package/python/python.mk                           | 302 ---------------------
 38 files changed, 2302 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
