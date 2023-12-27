Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79C8C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 19:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3816825C7;
	Wed, 27 Dec 2023 19:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3816825C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxplxhBmKU9k; Wed, 27 Dec 2023 19:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00C781EBA;
	Wed, 27 Dec 2023 19:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00C781EBA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DF9C1BF2E4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 19:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FBEC60ED4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 19:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FBEC60ED4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaNRpNRGHcav for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE4660F0D
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BE4660F0D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27D40836E1; Wed, 27 Dec 2023 19:22:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 20:15:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95a5ed75457f1511777c57075f33d34b3622a3de
X-Git-Newrev: 19f083717451eb22e097d3cdc53785161c2f156a
X-Patchwork-Hint: ignore
Message-Id: <20231227192259.27D40836E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mp4v2: security bump to version
 2.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=19f083717451eb22e097d3cdc53785161c2f156a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2023-1450, CVE-2023-1451 and CVE-2023-29584

https://github.com/enzo1982/mp4v2/releases/tag/v2.1.3
https://github.com/enzo1982/mp4v2/releases/tag/v2.1.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mp4v2/mp4v2.hash | 2 +-
 package/mp4v2/mp4v2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
index d3f0243650..4605ee6b0d 100644
--- a/package/mp4v2/mp4v2.hash
+++ b/package/mp4v2/mp4v2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  29420c62e56a2e527fd8979d59d05ed6d83ebe27e0e2c782c1ec19a3a402eaee  mp4v2-2.1.1.tar.bz2
+sha256  033185c17bf3c5fdd94020c95f8325be2e5356558e3913c3d6547a85dd61f7f1  mp4v2-2.1.3.tar.bz2
 sha256  7187891a4c39ee9e7ec70c71fc7dc8b8ed02c6f56ae1ffc017a34ac66dca5390  COPYING
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 7de837c170..ae777cdc75 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MP4V2_VERSION = 2.1.1
+MP4V2_VERSION = 2.1.3
 MP4V2_SITE = \
 	https://github.com/enzo1982/mp4v2/releases/download/v$(MP4V2_VERSION)
 MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
