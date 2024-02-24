Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D59C5478C
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 13:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F91404E2;
	Sat, 24 Feb 2024 13:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tI5NtxcywYAU; Sat, 24 Feb 2024 13:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41D1A404B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41D1A404B1;
	Sat, 24 Feb 2024 13:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 241871BF27C
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 13:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 110A34079B
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 13:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKFiaJcaN_u2 for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 13:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5776740796
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5776740796
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 13:58:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C97387A06; Sat, 24 Feb 2024 13:58:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 11:34:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bae4ea6eebda089eb0f7dc4a5a6dfefcea25573
X-Git-Newrev: fb6274f5defc1acacd906ee6cd0b12684a866b92
X-Patchwork-Hint: ignore
Message-Id: <20240224135841.4C97387A06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/python3: bump version to
 3.12.1"
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb6274f5defc1acacd906ee6cd0b12684a866b92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 36e635d2d5c0166476858aa239ccbe78e8f2af14.

Python 3.12 is still causing too many build failures, so revert for 2024.02.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  44 ++++++---
 ...1-Make-the-build-of-pyc-files-conditional.patch |  32 +++---
 ...gy_getaddrinfo-configure-test-when-cross-.patch |   8 +-
 ...ructure-to-disable-the-build-of-certain-e.patch | 108 +++++++++++++++++++++
 ...brary-header-paths-for-cross-compilation.patch} |  37 ++++---
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  31 ++++++
 .../0006-Add-an-option-to-disable-pydoc.patch      |  84 ----------------
 .../python3/0006-Don-t-add-multiarch-paths.patch   |  37 +++++++
 .../0007-Abort-on-failed-module-build.patch        |  30 ++++++
 ...nd.patch => 0008-Serial-ioctl-workaround.patch} |   6 +-
 ...st-the-shebang-of-Python-scripts-for-cros.patch |  35 +++++++
 ...config.sh.in-ensure-sed-invocations-only.patch} |   6 +-
 ...e.ac-move-PY_STDLIB_MOD_SET_NA-further-up.patch |  44 ---------
 .../0011-Add-an-option-to-disable-pydoc.patch      | 100 +++++++++++++++++++
 ...=> 0012-Add-an-option-to-disable-lib2to3.patch} |  94 ++++++++++--------
 ...12-Add-an-option-to-disable-the-tk-module.patch |  79 ---------------
 ...Add-option-to-disable-the-sqlite3-module.patch} |  35 +++----
 ...14-Add-an-option-to-disable-the-tk-module.patch |  77 +++++++++++++++
 ...d-an-option-to-disable-the-curses-module.patch} |  39 ++++----
 ...h => 0016-Add-an-option-to-disable-expat.patch} |  59 ++++++-----
 .../0017-Add-an-option-to-disable-CJK-codecs.patch |  30 ++++++
 .../0018-Add-an-option-to-disable-NIS.patch        |  33 +++++++
 ...0019-Add-an-option-to-disable-unicodedata.patch |  30 ++++++
 ...ch => 0020-Add-an-option-to-disable-IDLE.patch} |  63 ++++++------
 .../0021-Add-an-option-to-disable-decimal.patch    |  54 +++++++++++
 ...-option-to-disable-the-ossaudiodev-module.patch |  30 ++++++
 ...-Add-an-option-to-disable-openssl-support.patch |  30 ++++++
 ...-an-option-to-disable-the-readline-module.patch |  30 ++++++
 ...ions-to-disable-zlib-bzip2-and-xz-modules.patch |  42 ++++++++
 ...6-python-config.sh-don-t-reassign-prefix.patch} |   6 +-
 ...0027-Add-an-option-to-disable-uuid-module.patch |  33 +++++++
 ...0028-fix-building-on-older-distributions.patch} |  16 ++-
 ...-fixup-CC-print-multiarch-output-for-mus.patch} |   8 +-
 ...n-option-to-disable-the-berkeleydb-module.patch |  30 ++++++
 ...libc-ng-doesn-t-set-errno-when-encryptio.patch} |   6 +-
 package/python3/python3.hash                       |   6 +-
 package/python3/python3.mk                         |  62 +++++-------
 37 files changed, 1038 insertions(+), 456 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
