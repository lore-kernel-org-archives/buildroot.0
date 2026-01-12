Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B880DCF45B2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E9D60BC9;
	Mon, 12 Jan 2026 17:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5P9wI9CDxhr; Mon, 12 Jan 2026 17:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3119460BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240330;
	bh=Twws0x1jUybXHGnOsU3QiEjCJpHCf1VLxRUko99vFDk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=brNK0Dl5rxgcRXdeD2a9sF/PcELy4WsEgPQuqYUhoqi3M3Ek7cD0scqlFspxxI+Wi
	 anOEOmrUeIlgaWcE+qaHnl1ulQZqzLlE8dSTymeZ0KM9wRgxyQnwjArcdasNZtH7nf
	 dSGcH3xaniEIiJjZySS33EcRpoM5mqGU/CvDp/v+Ng0eY//KqWyBdTV7hfjuZtkypy
	 yz9T3hNpfoIHsja5hRyoNTOa/Vada168q4D83p4xGjmYq/fb8Ve2H44QpiswSz0fC+
	 YD+vYedE4JCmE4Vux/Y0PDhg9tVdesx63XTokqHnAxx2BQV3w6mXjnF8GoFdXoN2y9
	 CAcpE/+IRjZmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3119460BAA;
	Mon, 12 Jan 2026 17:52:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C5AF18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E72B060BAA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eegTWFqZnliQ for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 163B960BA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 163B960BA9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:52:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C9D888511; Mon, 12 Jan 2026 17:52:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 18:51:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92dc57c4604b7fa0893ecf689b5f64f34866bef8
X-Git-Newrev: 17f7cd9c5529e3f7876c16b5abc7b0c07b594daf
X-Patchwork-Hint: ignore
Message-Id: <20260112175208.0C9D888511@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/timescaledb: bump version to 2.24.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=17f7cd9c5529e3f7876c16b5abc7b0c07b594daf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/timescale/timescaledb/blob/2.24.0/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index a2ccc28e29..888b6c2cfa 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  26575fa9e287a6107a6bf162bacab4932b0df19bee38d28c132f9a2d6591d647  timescaledb-2.23.1.tar.gz
+sha256  06a5d38c52bebb364104541002ccfb9ea739f93183c339895f0d1ed90b005e17  timescaledb-2.24.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 80c2b385aa..3ad8bb41fa 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.23.1
+TIMESCALEDB_VERSION = 2.24.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
