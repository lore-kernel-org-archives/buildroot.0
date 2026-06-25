Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AD1C43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A328582234;
	Fri, 26 Jun 2026 14:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esV-7psOJIwF; Fri, 26 Jun 2026 14:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B593582239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485421;
	bh=Gqhe2cGaBi/vLH1+rWc+QHnj3vNweb/SLMJ9mmY+x7U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DJptMAF8QCp+bHlQjD/snCzr5o9Y9rNeouVfAzWz2NXvJn9hDLuTslFrLtRuBP18a
	 7DjNgmRNAJ3Zzg3gaigtZnHRwydf0ia7yYplryARi/il9OMO2h0zfmlMUjueZV8tWr
	 wE5grWoONNfOka+2GfOwAODi5bxek6bS+oq+22OIVgXiphVAHAqPorm7VqG01Ul8eJ
	 +TZXgawL32hdiyK6H3GTaCivs1/Mla7xjQQ6im518wx/oASteSr8H7tzMhgHoMqQSn
	 Jea6g1JzSrjTzPDAkZsUNB6IMVCImNGyvVUBGEKosEmTRyCzg4qpjamUBjykxpDwwI
	 2SQlW6beYJrRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B593582239;
	Fri, 26 Jun 2026 14:50:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32FA214A4
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2557981FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynjH3TaPwA9P for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C29D82229
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C29D82229
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D668863C5; Fri, 26 Jun 2026 14:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:41:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3077be13c58c4d731f67ba244df3d42dc027b0eb
X-Git-Newrev: 1126cf4624bd3de756b2ebadd3d7ec635e1af071
X-Patchwork-Hint: ignore
Message-Id: <20260626144921.7D668863C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgsasl: bump to
 version 2.2.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1126cf4624bd3de756b2ebadd3d7ec635e1af071
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update COPYING.LESSER license hash due to postal address fix and
README to year update.

Release notes:
https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5cbd7c1b2952a11691bebcf41fcfd7d589940bba)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgsasl/libgsasl.hash | 10 +++++-----
 package/libgsasl/libgsasl.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libgsasl/libgsasl.hash b/package/libgsasl/libgsasl.hash
index 81907f8875..de24d73c2d 100644
--- a/package/libgsasl/libgsasl.hash
+++ b/package/libgsasl/libgsasl.hash
@@ -1,11 +1,11 @@
-# From https://lists.gnu.org/archive/html/help-gsasl/2024-01/msg00003.html
-sha1  c238b3af05af3804808cbf734f049a06840d787c  gsasl-2.2.1.tar.gz
+# From https://lists.gnu.org/archive/html/help-gsasl/2025-03/msg00000.html
+sha1  8a845b7ec78e5f27bf69438074ad23867c00d4fe  gsasl-2.2.2.tar.gz
 sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
 
 # Locally calculated after checking pgp signature
-sha256  d45b562e13bd13b9fc20b372f4b53269740cf6279f836f09ce11b9d32bcee075  gsasl-2.2.1.tar.gz
+sha256  41e8e442648eccaf6459d9ad93d4b18530b96c8eaf50e3f342532ef275eff3ba  gsasl-2.2.2.tar.gz
 
 # Hash for license files:
-sha256  8908e3d66e17102a3b921e1f7f80be5dc9c905ad15561579d46a7074387e311b  README
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
+sha256  e3d1b8a82b97dc6083b2600a6beb0396bbefbe384fc1cd39d0e8cb04bbf2bd33  README
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSER
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/libgsasl/libgsasl.mk b/package/libgsasl/libgsasl.mk
index b8570058a4..8670f43b6f 100644
--- a/package/libgsasl/libgsasl.mk
+++ b/package/libgsasl/libgsasl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSASL_VERSION = 2.2.1
+LIBGSASL_VERSION = 2.2.2
 LIBGSASL_SOURCE = gsasl-$(LIBGSASL_VERSION).tar.gz
 LIBGSASL_SITE = $(BR2_GNU_MIRROR)/gsasl
 LIBGSASL_LICENSE = LGPL-2.1+ (library), GPL-3.0+ (programs)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
