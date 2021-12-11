Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6012C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 19:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A25D61345;
	Sat, 11 Dec 2021 19:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycw4NJzgKY2L; Sat, 11 Dec 2021 19:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4ACF6134C;
	Sat, 11 Dec 2021 19:56:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 166E21BF414
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04B2560D71
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QhVRRA_HNggz for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78DF26134C
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 19:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5B8DD827FD; Sat, 11 Dec 2021 19:50:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 20:48:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbd29df2e55354bcd158379b4503965def2713a1
X-Git-Newrev: 8bca032e190f741dccccb2047a28275860c53541
X-Patchwork-Hint: ignore
Message-Id: <20211211195027.5B8DD827FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/lpc32xxcdl: rename patches with the
 proper naming convention
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bca032e190f741dccccb2047a28275860c53541
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make lpc32xxcdl-dirclean lpc32xxcdl-patch | grep 'Patching\|Applying'

Before:
>>> lpc32xxcdl 2.11 Patching
Applying lpc32xxcdl-2.11-compiler_name.patch using patch:
Applying lpc32xxcdl-2.11-delete_redundant_files.patch using patch:
Applying lpc32xxcdl-2.11-libnosys_gnu.patch using patch:
Applying lpc32xxcdl-2.11-slashes.patch using patch:

After:
>>> lpc32xxcdl 2.11 Patching
Applying 0001-compiler_name.patch using patch:
Applying 0002-delete_redundant_files.patch using patch:
Applying 0003-libnosys_gnu.patch using patch:
Applying 0004-slashes.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../{lpc32xxcdl-2.11-compiler_name.patch => 0001-compiler_name.patch}     | 0
 ....11-delete_redundant_files.patch => 0002-delete_redundant_files.patch} | 0
 .../{lpc32xxcdl-2.11-libnosys_gnu.patch => 0003-libnosys_gnu.patch}       | 0
 boot/lpc32xxcdl/{lpc32xxcdl-2.11-slashes.patch => 0004-slashes.patch}     | 0
 4 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/boot/lpc32xxcdl/lpc32xxcdl-2.11-compiler_name.patch b/boot/lpc32xxcdl/0001-compiler_name.patch
similarity index 100%
rename from boot/lpc32xxcdl/lpc32xxcdl-2.11-compiler_name.patch
rename to boot/lpc32xxcdl/0001-compiler_name.patch
diff --git a/boot/lpc32xxcdl/lpc32xxcdl-2.11-delete_redundant_files.patch b/boot/lpc32xxcdl/0002-delete_redundant_files.patch
similarity index 100%
rename from boot/lpc32xxcdl/lpc32xxcdl-2.11-delete_redundant_files.patch
rename to boot/lpc32xxcdl/0002-delete_redundant_files.patch
diff --git a/boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch b/boot/lpc32xxcdl/0003-libnosys_gnu.patch
similarity index 100%
rename from boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch
rename to boot/lpc32xxcdl/0003-libnosys_gnu.patch
diff --git a/boot/lpc32xxcdl/lpc32xxcdl-2.11-slashes.patch b/boot/lpc32xxcdl/0004-slashes.patch
similarity index 100%
rename from boot/lpc32xxcdl/lpc32xxcdl-2.11-slashes.patch
rename to boot/lpc32xxcdl/0004-slashes.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
