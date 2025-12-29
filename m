Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760AEE9273E
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 16:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A6ED8067F;
	Mon, 29 Dec 2025 16:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHGaFXs7prYo; Mon, 29 Dec 2025 16:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B58F813AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767027345;
	bh=0hC/wyTypIyLaJyUgzzHWxEu1+XY9T/4WcPP4UWhUek=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KUi15r9le8F/6pdXZn76WX0NqEG4iN83bTLSjYdLc7IlggxWSwiiot27tNb98xgdO
	 oURTThFev47fV9GyDYN3cMWyd5bkBluMjpwtavMWBwEmGPYuLIir5iA4Y3BBPiARBq
	 cQ+2ISfrHhEDq6nHIohP/VGjjOW4pEMPoSj8bBiVeMMQud8WZRN/HKtDtWxE5cLcdc
	 U0EWOt42f7URbSAK5ZGymSQOV0DBzPzGMGDnxmSmW6k/U3B9XrpOwBNvv3hKkg+4Iz
	 LBbXgg/mMHOGAYkJLQd9efBDgQEKBGJHD6t+BWXjqtOAPavGeLJCrMNCarVmYnmh39
	 v2Lbo3HcxO+qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B58F813AC;
	Mon, 29 Dec 2025 16:55:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE6B6B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B980E403D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6eqHsl109r4 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 16:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB78A4036E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB78A4036E
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:55:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB06D838F5; Mon, 29 Dec 2025 16:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 17:55:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff0bd00468fe9f935d9385c084ff05539ea68c7e
X-Git-Newrev: 9824b964a7db1a69885ddbfefc40663d591dc653
X-Patchwork-Hint: ignore
Message-Id: <20251229165542.BB06D838F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/embiggen-disk: fix
 EMBIGGEN_DISK_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=9824b964a7db1a69885ddbfefc40663d591dc653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make EMBIGGEN_DISK_VERSION compliant with release-monitoring.org.

Fixes: 4ae18c511a2a7e8b0b6cd7a2961ba4c0e395fe2a
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/embiggen-disk/embiggen-disk.hash | 2 +-
 package/embiggen-disk/embiggen-disk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
index 02c99add6a..1a327dce2a 100644
--- a/package/embiggen-disk/embiggen-disk.hash
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  25e536bd58969077554927a456cd3cb79e21f126e47545ba511abe64a0f3ba5e  embiggen-disk-v20240521-go2.tar.gz
+sha256  67ab51d13c85c5e3f1805f1e7b1e2db92edf8472007cd859c5919692eb0c0cbc  embiggen-disk-20240521-go2.tar.gz
 sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
index 47b86c072b..a981cdf87f 100644
--- a/package/embiggen-disk/embiggen-disk.mk
+++ b/package/embiggen-disk/embiggen-disk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EMBIGGEN_DISK_VERSION = v20240521
-EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
+EMBIGGEN_DISK_VERSION = 20240521
+EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,v$(EMBIGGEN_DISK_VERSION))
 EMBIGGEN_DISK_LICENSE = Apache-2.0
 EMBIGGEN_DISK_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
