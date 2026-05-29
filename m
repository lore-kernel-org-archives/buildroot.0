Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD481CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E904614A1;
	Fri, 29 May 2026 18:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGxbbXvb-mm4; Fri, 29 May 2026 18:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04CCF60DA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078391;
	bh=HvOHY3H1U1YgsGg18v2+TUjWELr4PB75R9h+SuxwbNw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fmSMOWycy/zfUbw8JyrPzRp2/Nyv5BlmeJe0B8wJG5MYS1tlb3W66MlDSANXL7CLg
	 k9SB6VRb8s/FvACxmv7zeYc6BzPmcXa5zNUEn6QcuiL+NX5jJJHRk/ztWQbccKEecR
	 FIazlnW/aVW/f2yJIbRrXL7LygwX7w7lX7nNF16Q5urIxa/1XXbmGOyusnD8a30yud
	 XCg9hDul7QJaNBRinpS7rbsa37jdk53BvOYPk1H4Pqo5B86m2avwnDHHVMxB8V5saf
	 34nhdNK+Oja2UVDG4WBz9b5wGF1cMdzeva7jg0JCEjOO0BYjgHGN+zkXFcJQY/+ppb
	 Rd40v8eTLc/lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04CCF60DA4;
	Fri, 29 May 2026 18:13:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F22D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50C2684532
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOmBZ9bWY4zR for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:13:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7282084531
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7282084531
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:13:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3F1A8735A; Fri, 29 May 2026 18:12:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:12:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ff8b74a0ce71f51579c88710a96390f548b83c9
X-Git-Newrev: 8500fe7ef0999945b44e4f179493f8739be5b8fe
X-Patchwork-Hint: ignore
Message-Id: <20260529181255.D3F1A8735A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: bump version to 3.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8500fe7ef0999945b44e4f179493f8739be5b8fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes of this bugfix release:
https://github.com/gerbera/gerbera/blob/v3.2.1/ReleaseNotes.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gerbera/gerbera.hash | 2 +-
 package/gerbera/gerbera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index a60017e8db..42e2d13951 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c55ec5cddc952e2563586ac76014be072c9dedb5094c6675889afa90b8df23e2  gerbera-3.2.0.tar.gz
+sha256  6b89d0c416b6d98e34634e5b1121f340315d60b088e9e6b2fca423488760030f  gerbera-3.2.1.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 1f7a0d48ff..bb00fc89e9 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 3.2.0
+GERBERA_VERSION = 3.2.1
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
