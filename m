Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B43CDB482
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2680F402D0;
	Sun, 15 Oct 2023 20:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2680F402D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9i2hrwDBnsmy; Sun, 15 Oct 2023 20:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 178F641508;
	Sun, 15 Oct 2023 20:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 178F641508
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31CEF1BF83B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A7B1611A3
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A7B1611A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRjlRnYYqerw for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:14:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D598E60F44
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D598E60F44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5B4B85AAC; Sun, 15 Oct 2023 20:14:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:13:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f86b539d564679b2d8321d5f2f904d0396cb4979
X-Git-Newrev: dc84952eb38bf1ef63fc8718dc2ced200a3e52dd
X-Patchwork-Hint: ignore
Message-Id: <20231015201452.C5B4B85AAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: bump to v2.12.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc84952eb38bf1ef63fc8718dc2ced200a3e52dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New features and DDNS provider support (IPv64.net), but also a lot of
fixes to regressions introduced in v2.11.0, e.g.:

 - dynv6.com not working at all, regression in v2.11.0
 - Regression in DDNS provider names, introduced in v2.11.0:
   - dyndns@3322.org
   - dyndns@he.net
   - default@dynv6.com
   - ipv6tb@he.net

From https://github.com/troglobit/inadyn/releases/tag/v2.12.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 94af9f87b7..eb5249e371 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  9ddac7b6b0a1ed372c6cb5afaec6bea927ab539db02c8536dd10d73bd1d37c95  inadyn-2.11.0.tar.gz
+sha256  38fe00f20b293e64a89efc85f766ff40f0be3bcf9c3ed68b842104540a60806e  inadyn-2.12.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 3e346fd769..fa2eedc1f3 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.11.0
+INADYN_VERSION = 2.12.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
