Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79886C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C05F403C4;
	Wed, 16 Feb 2022 21:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YVylBP-MqOr5; Wed, 16 Feb 2022 21:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1487740164;
	Wed, 16 Feb 2022 21:50:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0A851BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7C1A404A6
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQ_DIFPQ_w-r for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BD66405C8
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 69B4683777; Wed, 16 Feb 2022 21:41:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:38:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63f40a109b8281283c66870f623382268130953a
X-Git-Newrev: a8379379733ddeb02ec0b42ee68f8f5182bcb3e4
X-Patchwork-Hint: ignore
Message-Id: <20220216214135.69B4683777@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: security bump to
 version 5.9.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8379379733ddeb02ec0b42ee68f8f5182bcb3e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed a vulnerability in the EAP client implementation that was caused
by incorrectly handling early EAP-Success messages. It may allow to
bypass the client and in some scenarios even the server authentication,
or could lead to a denial-of-service attack. This vulnerability has been
registered as CVE-2021-45079:
https://www.strongswan.org/blog/2022/01/24/strongswan-vulnerability-(cve-2021-45079).html

https://github.com/strongswan/strongswan/releases/tag/5.9.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 69b3547f91..aca7ddf5cd 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.4.tar.bz2.md5
-md5  9c387eb77f0159fdefbcf7e81c905c35  strongswan-5.9.4.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.5.tar.bz2.md5
+md5  53005324e3cba8592f1fb958b1c2d0e5  strongswan-5.9.5.tar.bz2
 # Calculated based on the hash above
-sha256  45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518  strongswan-5.9.4.tar.bz2
+sha256  983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd  strongswan-5.9.5.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 2891e5aa5e..95079aceb3 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.4
+STRONGSWAN_VERSION = 5.9.5
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
