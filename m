Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EF0C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD082608F3;
	Mon,  8 Jul 2024 20:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1PNqY4cDXOq; Mon,  8 Jul 2024 20:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D91260826
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D91260826;
	Mon,  8 Jul 2024 20:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE50B1BF97C
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC071608F3
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5lge1t_GbSY for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD74560826
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD74560826
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D983F7FCE7; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18b1197e9165ac537b19d990091ff85bb22124ad
X-Git-Newrev: b8fa6769ab16ae421be3c0137edff587668a8101
X-Patchwork-Hint: ignore
Message-Id: <20240708202012.D983F7FCE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nushell: update the patches to be
 applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b8fa6769ab16ae421be3c0137edff587668a8101
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, nushell fails to build with output:

    Applying 0001-uucore-add-support-for-sparc64.patch using patch:
    patching file VENDOR/uucore/src/lib/features/fs.rs
    Hunk #1 FAILED at 121.
    Hunk #2 FAILED at 137.
    2 out of 2 hunks FAILED -- saving rejects to file VENDOR/uucore/src/lib/features/fs.rs.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nushell/0001-uucore-add-support-for-sparc64.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/nushell/0001-uucore-add-support-for-sparc64.patch b/package/nushell/0001-uucore-add-support-for-sparc64.patch
index 2cc05c172e..ad7e70a56d 100644
--- a/package/nushell/0001-uucore-add-support-for-sparc64.patch
+++ b/package/nushell/0001-uucore-add-support-for-sparc64.patch
@@ -28,6 +28,8 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://github.com/uutils/coreutils/commit/d158f1a396d19cc2aed68131b80ec3b7325d108e
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/uucore/src/lib/features/fs.rs | 2 ++
  1 file changed, 2 insertions(+)
@@ -36,16 +38,16 @@ diff --git a/VENDOR/uucore/src/lib/features/fs.rs b/VENDOR/uucore/src/lib/featur
 index 20cc9e13d..3b9170bc3 100644
 --- a/VENDOR/uucore/src/lib/features/fs.rs
 +++ b/VENDOR/uucore/src/lib/features/fs.rs
-@@ -121,6 +121,7 @@ impl FileInformation {
-             not(target_os = "solaris"),
+@@ -116,6 +116,7 @@
+             not(target_os = "freebsd"),
              not(target_arch = "aarch64"),
              not(target_arch = "riscv64"),
 +            not(target_arch = "sparc64"),
              target_pointer_width = "64"
          ))]
          return self.0.st_nlink;
-@@ -137,6 +138,7 @@ impl FileInformation {
-                 target_os = "solaris",
+@@ -127,6 +128,7 @@
+                 target_os = "freebsd",
                  target_arch = "aarch64",
                  target_arch = "riscv64",
 +                target_arch = "sparc64",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
