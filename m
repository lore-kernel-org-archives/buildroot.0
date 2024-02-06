Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C492C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C808641FD8;
	Tue,  6 Feb 2024 22:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQSNjOUVzFdo; Tue,  6 Feb 2024 22:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D121542093
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D121542093;
	Tue,  6 Feb 2024 22:22:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89C5F1BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76B23833D3
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:22:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2zhidYTaXty for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B849833C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B849833C9
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8950D87481; Tue,  6 Feb 2024 22:22:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 23:21:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09de823cbc7bd50a40e25f4166b4e42be94b0c7b
X-Git-Newrev: 36e635d2d5c0166476858aa239ccbe78e8f2af14
X-Patchwork-Hint: ignore
Message-Id: <20240206222231.8950D87481@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: bump version to 3.12.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=36e635d2d5c0166476858aa239ccbe78e8f2af14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python 3.12.1 has removed distutils support. As such, we remove the distutils
option from pkg-python.mk as well.

Tested on Fedora 39, and Debian 11. All 68 package tests pass.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  44 +++------
 ...1-Make-the-build-of-pyc-files-conditional.patch |  32 +++---
 ...gy_getaddrinfo-configure-test-when-cross-.patch |   8 +-
 ...ructure-to-disable-the-build-of-certain-e.patch | 108 ---------------------
 ...brary-header-paths-for-cross-compilation.patch} |  37 +++----
 ...nd.patch => 0004-Serial-ioctl-workaround.patch} |   6 +-
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  31 ------
 ...config.sh.in-ensure-sed-invocations-only.patch} |   6 +-
 .../0006-Add-an-option-to-disable-pydoc.patch      |  84 ++++++++++++++++
 .../python3/0006-Don-t-add-multiarch-paths.patch   |  37 -------
 .../0007-Abort-on-failed-module-build.patch        |  30 ------
 ...=> 0007-Add-an-option-to-disable-lib2to3.patch} |  94 ++++++++----------
 ...ch => 0008-Add-an-option-to-disable-IDLE.patch} |  63 ++++++------
 ...st-the-shebang-of-Python-scripts-for-cros.patch |  35 -------
 ...9-python-config.sh-don-t-reassign-prefix.patch} |   6 +-
 ...e.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch |  44 +++++++++
 .../0011-Add-an-option-to-disable-pydoc.patch      | 100 -------------------
 ...Add-option-to-disable-the-sqlite3-module.patch} |  35 ++++---
 ...12-Add-an-option-to-disable-the-tk-module.patch |  79 +++++++++++++++
 ...d-an-option-to-disable-the-curses-module.patch} |  39 ++++----
 ...h => 0014-Add-an-option-to-disable-expat.patch} |  59 +++++------
 ...14-Add-an-option-to-disable-the-tk-module.patch |  77 ---------------
 ...0015-fix-building-on-older-distributions.patch} |  16 +--
 ...-fixup-CC-print-multiarch-output-for-mus.patch} |   8 +-
 .../0017-Add-an-option-to-disable-CJK-codecs.patch |  30 ------
 ...libc-ng-doesn-t-set-errno-when-encryptio.patch} |   6 +-
 .../0018-Add-an-option-to-disable-NIS.patch        |  33 -------
 ...0019-Add-an-option-to-disable-unicodedata.patch |  30 ------
 .../0021-Add-an-option-to-disable-decimal.patch    |  54 -----------
 ...-option-to-disable-the-ossaudiodev-module.patch |  30 ------
 ...-Add-an-option-to-disable-openssl-support.patch |  30 ------
 ...-an-option-to-disable-the-readline-module.patch |  30 ------
 ...ions-to-disable-zlib-bzip2-and-xz-modules.patch |  42 --------
 ...0027-Add-an-option-to-disable-uuid-module.patch |  33 -------
 ...n-option-to-disable-the-berkeleydb-module.patch |  30 ------
 package/python3/python3.hash                       |   6 +-
 package/python3/python3.mk                         |  62 +++++++-----
 37 files changed, 456 insertions(+), 1038 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
