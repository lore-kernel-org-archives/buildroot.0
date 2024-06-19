Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BC2C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8271F401FE;
	Wed, 19 Jun 2024 20:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4GphCKPP9U9; Wed, 19 Jun 2024 20:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71F26415D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71F26415D5;
	Wed, 19 Jun 2024 20:19:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7A9A1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4669413D4
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNgeg1ukJoui for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:19:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B06BF401FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B06BF401FE
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:19:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C9B388054; Wed, 19 Jun 2024 20:19:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 22:17:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e39f5571304ba92fdfc8286fea6c50824b04e56
X-Git-Newrev: 49bd6bb638ff73eae3b486b207201382d46a6c05
X-Patchwork-Hint: ignore
Message-Id: <20240619201924.9C9B388054@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: bump to version 4.2.8p18
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

commit: https://git.buildroot.net/buildroot/commit/?id=49bd6bb638ff73eae3b486b207201382d46a6c05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
    -* Copyright (c) Network Time Foundation 2011-2023                     *
    +* Copyright (c) Network Time Foundation 2011-2024                     *

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/ntp/ntp.hash | 6 +++---
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 96e21bf2df..44f3486d7a 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,4 +1,4 @@
-# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p17.tar.gz.sha256
-sha256  103dd272e6a66c5b8df07dce5e9a02555fcd6f1397bdfb782237328e89d3a866  ntp-4.2.8p17.tar.gz
+# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2.8p18.tar.gz.sha256
+sha256  cf84c5f3fb1a295284942624d823fffa634144e096cfc4f9969ac98ef5f468e5  ntp-4.2.8p18.tar.gz
 # Locally computed
-sha256  06246b8c15ccc1a1873c78525c810f0802e68f383e79ee041e06d1ab9cbf80a4  COPYRIGHT
+sha256  45b6e5a0a5f0ac4afdd9e23caa2241779e4da463e4dba32a41b4dbd61577b2a3  COPYRIGHT
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index e64f6308ec..1a7c7e7937 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -6,7 +6,7 @@
 
 NTP_VERSION_MAJOR = 4.2
 NTP_VERSION_MINOR = 8
-NTP_VERSION_POINT = 17
+NTP_VERSION_POINT = 18
 NTP_VERSION = $(NTP_VERSION_MAJOR).$(NTP_VERSION_MINOR)p$(NTP_VERSION_POINT)
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
