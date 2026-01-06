Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD16DD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84E5840960;
	Wed,  7 Jan 2026 17:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKMAkLTB7Bt1; Wed,  7 Jan 2026 17:47:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB8474095B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808020;
	bh=hxppYYT+cFvV/U7obMeoDscEtPSAZBoyrPfPDXZnkKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V3ZxuQpaVvO7hInMtmQA5lRedz/mVjna05eyjBxsYl+C95EEQKUkijfRZgUeMNM5e
	 8ndraajrzAYhJQ4WqCuGhRP0SIj5oi7S/P3L8JBsrW4SPHSsXKJGqKSjZ1kgNkgenL
	 5woKFlHfTCOVze3RGTqQh9WaHFdmhf0c2o/+AdjECfNEbDYnrfScy56FnwdNVN87M2
	 ZwbiK8dcdf1dPb8UH44eSLYqyMXArAapf8GuuH+Ihp/Z8Qo+Oiw41Sd97trhNsJK6y
	 ZePCwi2ryXPoVZIWM7QNVHMKUNsdrImEk1yaf/ICXqXUTVi3xQNIsx4FGQRyYmOqn1
	 uxsvCSsULA1lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB8474095B;
	Wed,  7 Jan 2026 17:47:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15927A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D70D580B2B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wB_B7-4zM1O5 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E557D80A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E557D80A99
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E46E488367; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d84ae3b0862be9243b4c27d838d6e7072d79c5ec
X-Git-Newrev: f25febab370fe57d8557530664ff1dc034b3cd2f
X-Patchwork-Hint: ignore
Message-Id: <20260107174640.E46E488367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libxml2: bump
 version to 2.15.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f25febab370fe57d8557530664ff1dc034b3cd2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.1.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a67cff491a173c88187ce76e0d3cdccdb48371fc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 59f1ef2ac0..637ba52bb8 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.sha256sum
-sha256  5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561  libxml2-2.15.0.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.1.sha256sum
+sha256  c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c  libxml2-2.15.1.tar.xz
 # License files, locally calculated
 sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index de0ec42eca..35d373e130 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.15
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).0
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).1
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
