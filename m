Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFC6D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 16:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BA0360807;
	Sun, 14 Dec 2025 16:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id igncyYmNDS1a; Sun, 14 Dec 2025 16:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D05E60D84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765730330;
	bh=zFA9YFzFJlP4f3oPBxhtJehGCIQKdDwBuDZZT38bqXA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QPWQN68TIMw6wAM33e5MN8FBO1TVKYGR50kGMJ4n5m1lj0ZsGwetW+bCin7168U0y
	 4Sv0+cvErqLiobJqx/hB72Jw/0aFTdAg0J6usHXQXwK4tDx9GcCHd6gBaqmrbVuzVS
	 o0xESGvpuQh9X4oyDRh3qbMMoEWcQmcYproHbfQEu0f3JCHkUp2+bSS4oGrY4ZTRUC
	 /ccr/JfpP7qekZE+zvRQaUQtw03XPytSZf17TkJciVNWfCHo+vSXs4NImUolUBcgEh
	 LSC6rZ8Zt1dp6gpHmLpMRzpcBv1pNRGgvsQfVde7RUP6TeAvpcRU+ZuZPf2CixDLZ0
	 9x1RlYV/XCkcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D05E60D84;
	Sun, 14 Dec 2025 16:38:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86DA52C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69A13400D1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXJbKZpazCkW for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 16:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A41B34005F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A41B34005F
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:38:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93DE786E66; Sun, 14 Dec 2025 16:38:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 17:38:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d75b8c5b7501c4b9a4b85df531d6e19c159a7934
X-Git-Newrev: 2a67cf2bcaaa98a3648d3ba4a773443a9ef6be34
X-Patchwork-Hint: ignore
Message-Id: <20251214163848.93DE786E66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva: bump version to 2.23.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2a67cf2bcaaa98a3648d3ba4a773443a9ef6be34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/intel/libva/blob/2.23.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index b1358b99a7..2d7e8b7ee8 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  467c418c2640a178c6baad5be2e00d569842123763b80507721ab87eb7af8735  libva-2.22.0.tar.gz
+sha256  b10aceb30e93ddf13b2030eb70079574ba437be9b3b76065caf28a72c07e23e7  libva-2.23.0.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 46f42afba8..f41a0c00ff 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.22.0
+LIBVA_VERSION = 2.23.0
 LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
