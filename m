Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7FDCD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2EB18214C;
	Fri,  5 Jun 2026 12:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uo55xIbX11f; Fri,  5 Jun 2026 12:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D04282251
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663244;
	bh=YA/nvRfwDhh8T3fmTyJRaj9qeQhRZcDURRPWLG6mDQM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YnWc6t41W8vz3DMWV4W+fS9/zYYoY52GgKmYf2Z2Jq8/M1okL8WBf9AQXrb84aPhA
	 lfLBatD5Cgqpufki1lkCZY0ZjZAZmiPOK0q8t/mTJunDoatKZHdUgo2Q1foBR2x7Zz
	 /PPE2QwsqGxT/SActu8H+UeIuiyIsoogHrQ8y/CSIyvpWr78OwZ7UgXcGZ0hsBKTag
	 BRxmJlZJqc/t86baPVK8UxTEt3phvQhiP3g1DRHKxIfB8A9vLXWckcH75A0SwDefzR
	 ZU2T6RNM19a47lLjj9/aakeTcNAOCFWYas9NBC9H8dEnDnX7RMRYbTwp8S1HUIrLy8
	 uijfJawePuCXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D04282251;
	Fri,  5 Jun 2026 12:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1049DF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8C2A40FFB
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAvzTCjBswcg for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC6AB41062
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC6AB41062
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6B4F87B3C; Fri,  5 Jun 2026 12:38:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:26:02 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4da098bc7df12a408a14299f0241b857f0c0ddc6
X-Git-Newrev: 7e305108826680fd776e4b77c5d5f11881b17c7b
X-Patchwork-Hint: ignore
Message-Id: <20260605123839.D6B4F87B3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/qt6/qt6base: use
 regular $(RM) to remove directory
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e305108826680fd776e4b77c5d5f11881b17c7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Using '$(Q)rm -rf' is not the typical thing we do in Buildroot, we
more commonly use '$(RM) -rf'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 45789c73b138c3a3b2212d1a1da314630d42b8a6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt6/qt6base/qt6base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 3bf4a1221b..5c939568ae 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -427,7 +427,7 @@ QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
 endif
 
 define QT6BASE_RM_USR_MKSPECS
-	$(Q)rm -rf $(TARGET_DIR)/usr/mkspecs
+	$(RM) -rf $(TARGET_DIR)/usr/mkspecs
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
