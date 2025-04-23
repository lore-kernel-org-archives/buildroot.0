Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797C6C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F80C610F8;
	Wed, 23 Apr 2025 19:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFVmdiWWZVEG; Wed, 23 Apr 2025 19:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1741360617
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1741360617;
	Wed, 23 Apr 2025 19:27:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D5219F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABEDB41945
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRp0oY1YmPCk for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5745403F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5745403F1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:27:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0CA18623D; Wed, 23 Apr 2025 19:27:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 21:25:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dc1a05d945de53e59dde6dd8e651ca82c0bfc1a
X-Git-Newrev: 3abc3b97bad9b4bbd436015cce029f25ee627f6a
X-Patchwork-Hint: ignore
Message-Id: <20250423192753.D0CA18623D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dust: bump to version 1.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=3abc3b97bad9b4bbd436015cce029f25ee627f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release:
https://github.com/bootandy/dust/releases/tag/v1.1.2

Note: version 0.9.0 of dust fails to build when running
the runtime test on the armv7 architecture due to an
unconditional import of Atomicu64.

	error:

Compiling config-file v0.2.3
error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
 --> src/progress.rs:6:18
  |
6 |         atomic::{AtomicU64, AtomicU8, AtomicUsize, Ordering},
  |                  ^^^^^^^^^
  |                  |
  |                  no `AtomicU64` in `sync::atomic`
  |                  help: a similar name exists in the module: `AtomicU32`

For more information about this error, try `rustc --explain E0432`.
error: could not compile `du-dust` (bin "dust") due to 1 previous error

This issue was discovered while writing a runtime test
for dust. upgrading to version 1.1.2 resolves the issue.

More details available in the following issue:
https://github.com/bootandy/dust/issues/423

For now, we bump to the latest compatible version
which builds and runs correctly. We can't bump to the latest
version 1.2.0 since it requires a cargo version newer than
1.82.0.

	error:
--  The package requires the Cargo feature called `edition2024`, but that feature is not stabilized in this version of Cargo (1.82.0 (8f40fc59f 2024-08-21)).
  Consider trying a newer version of Cargo (this may require the nightly release).

The upgrade to 1.2.0 will be considered once the patch for
Rust 1.86.0 is accepted.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dust/dust.hash | 2 +-
 package/dust/dust.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index 975ec9664d..be80a84166 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ace29e85647e7079f9eaa066da9b1368c7200233eb0814442499948b5adeb028  dust-0.9.0-cargo2.tar.gz
+sha256  01f4796a27e916e7fab77fbf12685da9fb1422dd3dcfdf736a146ad05ebc3c39  dust-1.1.2-cargo2.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/dust/dust.mk b/package/dust/dust.mk
index c566723c1c..a6b6f43c40 100644
--- a/package/dust/dust.mk
+++ b/package/dust/dust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUST_VERSION = 0.9.0
+DUST_VERSION = 1.1.2
 DUST_SITE = $(call github,bootandy,dust,v$(DUST_VERSION))
 DUST_LICENSE = APACHE-2.0
 DUST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
