Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11B2E77183
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 22:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98499600CD;
	Fri, 13 Dec 2024 22:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hz0W82Bn-d_U; Fri, 13 Dec 2024 22:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D96B605E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D96B605E4;
	Fri, 13 Dec 2024 22:42:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 100C0ECD
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0DEA40490
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogGA-3LXnswM for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 22:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE2D94031D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE2D94031D
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 22:42:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B62FC86E6F; Fri, 13 Dec 2024 22:42:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 23:36:37 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 6fdd6d16f7577b85de9500e3dad067e46b80d193
X-Git-Newrev: b14d727c068d6b4afcbabf0903c2064394c645bb
X-Patchwork-Hint: ignore
Message-Id: <20241213224226.B62FC86E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/bc: update _SITE
 to use BR2_GNU_MIRROR
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

commit: https://git.buildroot.net/buildroot/commit/?id=b14d727c068d6b4afcbabf0903c2064394c645bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

The bc package is distributed on the GNU project servers. See [1]
and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
be used for that purpose. See [3]

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

As a side note, the bc package was introduced long time ago using
BR2_GNU_MIRROR. See [4]. It was then updated to an alpha version
in [5]. When the alpha version was no longer needed, it was switched
to the main GNU download server in [6].

[1] https://www.gnu.org/software/bc/
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/c95dcd464512ede5ffdef5567558611f05e2e52b
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/1faa7c344e10986a4afd1d17bf6d4265b3c821fc
[6] https://gitlab.com/buildroot.org/buildroot/-/commit/ed7572cc7ff69584116c4e763a608afc225bd0c6

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 2956a3921548921adb5472e092901ff9d9861333)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bc/bc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 06b6feae4f..5691ca9e67 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BC_VERSION = 1.07.1
-BC_SITE = http://ftp.gnu.org/gnu/bc
+BC_SITE = $(BR2_GNU_MIRROR)/bc
 BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPL-2.0+, LGPL-2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
