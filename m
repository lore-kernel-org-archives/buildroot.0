Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4F8C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 15:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A6EA415EF;
	Tue, 14 Feb 2023 15:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A6EA415EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kEj3axmiD-0u; Tue, 14 Feb 2023 15:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FBBE40922;
	Tue, 14 Feb 2023 15:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FBBE40922
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2055C1BF94D
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 15:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC28E40BB0
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 15:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC28E40BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSnslUeJmFZr for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 15:33:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AC1740B79
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 15:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AC1740B79
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BAEC85D7B; Tue, 14 Feb 2023 15:33:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 16:31:43 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 594acef246416a0b95452db393765ff60e37d662
X-Git-Newrev: 01e97d849ead68fbc8521e84499f21b4154681de
X-Patchwork-Hint: ignore
Message-Id: <20230214153307.6BAEC85D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/c-ares: security
 bump to version 1.19.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=01e97d849ead68fbc8521e84499f21b4154681de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Low. Stack overflow in ares_set_sortlist() which is used during c-ares
initialization and typically provided by an administrator and not an end
user.

https://c-ares.org/changelog.html#1_19_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 121a9d3649498c5f6f3a5ae8a37d6befe2cc8ef8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index af1f076aab..edf891674b 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  1a7d52a8a84a9fbffb1be9133c0f6e17217d91ea5a6fa61f6b4729cda78ebbcf  c-ares-1.18.1.tar.gz
+sha256  bfceba37e23fd531293829002cac0401ef49a6dc55923f7f92236585b7ad1dd3  c-ares-1.19.0.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 0152759ebc..4332fc6919 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.18.1
+C_ARES_VERSION = 1.19.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
