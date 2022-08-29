Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0200ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 948A180DE9;
	Mon, 29 Aug 2022 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 948A180DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5zEbQ7bkY2V; Mon, 29 Aug 2022 20:52:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B21A981465;
	Mon, 29 Aug 2022 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B21A981465
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FFAC1BF228
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 724DE4088D
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:51:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 724DE4088D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kl9N-8uMWrCl for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:51:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C00740895
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C00740895
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 822CD87FE5; Mon, 29 Aug 2022 20:36:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 22:17:30 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 131cb373bc28af8175df5bec8435afea1271b290
X-Git-Newrev: 2186b88dd756096ff7f04deeae0473b4ef87b625
X-Patchwork-Hint: ignore
Message-Id: <20220829203619.822CD87FE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/gcc: switch to
 https urls for archives hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=2186b88dd756096ff7f04deeae0473b4ef87b625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

FTP urls doesn't work anymore with Firefox [1] and Google Chrome [2],
switch to https urls.

[1] https://blog.mozilla.org/addons/2020/04/13/what-to-expect-for-the-upcoming-deprecation-of-ftp-in-firefox/
[2] https://chromestatus.com/feature/6246151319715840

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dc000bd1a64ab03c79725b12a261b3e89469f732)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.hash | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index ad8bae4a99..e364be0a06 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,10 +1,10 @@
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-#  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.4.0/sha512.sum
+#  From https://gcc.gnu.org/pub/gcc/releases/gcc-9.4.0/sha512.sum
 sha512  dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b797b6af8ca9b2eeb746b3b115d9c3698381b989546e9151b4496415624  gcc-9.4.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-10.3.0/sha512.sum
 sha512  2b2dd7453d48a398c29eaebd1422b70341001b8c90a62aee51e83344e7fdd8a8e45f82a4a9165bd7edc76dada912c932f4b6632c5636760fec4c5d7e402b3f86  gcc-10.3.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
 sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
