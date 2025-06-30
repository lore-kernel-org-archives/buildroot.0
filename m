Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC145C83029
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 19:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 698FA847AE;
	Mon, 30 Jun 2025 19:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nOeWU7Zi4CZ; Mon, 30 Jun 2025 19:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AA8284788
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AA8284788;
	Mon, 30 Jun 2025 19:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC0A21C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D946840797
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dyfz0X-SCNN for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 19:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0170C4073C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0170C4073C
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 19:35:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2D7684CA0; Mon, 30 Jun 2025 19:35:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jun 2025 21:32:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0365d4e45b424e0f53bc14b439dfc587146022de
X-Git-Newrev: fc1387b4a5c4eb88dccac4a3b639462366f2b65f
X-Patchwork-Hint: ignore
Message-Id: <20250630193539.E2D7684CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/gstreamer1/gstreamer1-editing-services: fix COPYING hash
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc1387b4a5c4eb88dccac4a3b639462366f2b65f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the version bump to v1.24.11 (see [1]) the license hash changed for
the gstreamer1-editing-services package (see [2]).

This patch update the hash accordingly.

Fixes: https://autobuild.buildroot.org/results/9e1/9e1807cf5ac7bb69ae9bbe7a6a71411eb500188c/build-end.log

[1] fd00502ee0 package/gstreamer1/gstreamer1-editing-services: bump version to 1.24.11
[2] https://salsa.debian.org/gstreamer-team/gstreamer-editing-services1.0/-/commit/2a56edb6af3409ebdca39a96f310b43e0d780be0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../gstreamer1-editing-services/gstreamer1-editing-services.hash      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 584d235451..501ea22144 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -2,5 +2,5 @@
 sha256  85fd74dab259e137a95ab4427e009dd853f4ca82874500cb5493c33bcef1ef08  gst-editing-services-1.24.11.tar.xz
 
 # Hashes for license files:
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
-sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
+sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
