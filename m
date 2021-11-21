Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16615C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B756680F3C;
	Sun, 21 Nov 2021 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMfIGKlGQe8g; Sun, 21 Nov 2021 20:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D6380F39;
	Sun, 21 Nov 2021 20:50:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E3FB1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D75540473
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9n1PQIgYo94o for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:50:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7835C4046C
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:50:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 544478DCD2; Sun, 21 Nov 2021 20:46:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:50:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9f33c5528f57100c673aa597a210ec69c1e09300
X-Git-Newrev: d55b228cb39b34164de8026da0642f2c7079cb82
X-Patchwork-Hint: ignore
Message-Id: <20211121204602.544478DCD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/smcroute: bump to
 version 2.5.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=d55b228cb39b34164de8026da0642f2c7079cb82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes parse error when calling 'smcrouted -N' with a config file that
has 'mrdisc' disabled for one or more interfaces.  Multicast router
discovery (mrdisc) is enabled by default in Buildroot.

See the ChangeLog, or release notes at GitHub, for more information:
https://github.com/troglobit/smcroute/releases/tag/2.5.5

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/smcroute/smcroute.hash | 2 +-
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index ddc38eddd2..ea4c449c42 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256	96b890fd6fbf8553010f62beda991742f7b4e7e8aea3e75335fb6048b15869da  smcroute-2.5.4.tar.gz
+sha256	2569cd97fa2047df14203a7144be53a1b32928cb460421a302bbcce381b42bc3  smcroute-2.5.5.tar.gz
 
 # Locally generated
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 81f540088a..1626c80a7c 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.4
+SMCROUTE_VERSION = 2.5.5
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
