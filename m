Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9A9E92722
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8CD4607C2;
	Sat, 27 Dec 2025 23:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tzpt5NS6mFCZ; Sat, 27 Dec 2025 23:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEC3C607C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878796;
	bh=gM7HRRZaanRZfbg14Hp4mMtfAldhAjGsYjUbqc7IwlM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s7p9mTOa5GvamVuUtnBAD0l+Gps4D1f+koRr/YMtZdV7t1TMBKAtL+CFVGhW/ugpA
	 dwZnN06ev03+ZlKdZpdhPKxMKfA7LxQUZIb8nCMHkAJXYNHwGlnBxHP/h3RCriNLA9
	 tIO4iEt8NBL989ittjOrVM07ulOE+8W8obzM0yHZikICamK83SQcc1WnVifZzECIbO
	 U9nV6kvrsLxAbyh34/UIQGwsEpCFTHXoOBzsRXCEcOdNL9S5OQ04no0ZwFKbOI6q+x
	 01FBcSpsVF31n6TOLb+fG74zbte/hY/VPpmDzaSWfd1WgMHuhBEvnEHM7QEwCm5OZx
	 AJ+TaY9k9mRpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC3C607C6;
	Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F34D6D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2121406BC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onM7L4Y6ncEb for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29DC640678
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29DC640678
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 217B8878FE; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:15:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 147236691d82b729f21abd7f6372e36736b5c703
X-Git-Newrev: 4b33839f12c4638ea148c4ac7ae2e85adf79f936
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.217B8878FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/matchbox-lib: switch to gz tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b33839f12c4638ea148c4ac7ae2e85adf79f936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.

Fixes:

  https://autobuild.buildroot.net/results/66ac5ae4b1cd053122ccebad9f61af02fa5fe7f6/

Co-developed-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/matchbox-lib/matchbox-lib.hash | 2 +-
 package/matchbox-lib/matchbox-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/matchbox-lib/matchbox-lib.hash b/package/matchbox-lib/matchbox-lib.hash
index 8144c10258..ecd02f7174 100644
--- a/package/matchbox-lib/matchbox-lib.hash
+++ b/package/matchbox-lib/matchbox-lib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c7795e46c24d848a2b960f3b994911165d95e5d5731e39105ee0d808d2373eb  libmatchbox-1.12.tar.bz2
+sha256  648d7e1af82e69b79c0932ff9f85e6781584eada5da8662f70196916dd208f55  libmatchbox-1.12.tar.gz
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index 00ca4a0d15..b6e4584052 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MATCHBOX_LIB_VERSION = 1.12
-MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
+MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.gz
 MATCHBOX_LIB_SITE = http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/snapshot
 MATCHBOX_LIB_LICENSE = LGPL-2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
