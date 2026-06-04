Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A106CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12D3B60B1E;
	Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Xd05EP3KWvB; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D57560B94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663135;
	bh=Sb1skgDyq1UK7+nPGcMkb2bTpVwGdhKoNR8PSCrDREA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kwXcH8Bt1BJIIlmHwv/OJf6u7Hh+vtA+R41skUv40MBVl5dULhjlBXhFTH7/LWPrB
	 l30ashgGelzdzsX2wHiAouDb2ChZKG1VskFjaCSo+DaF53V8risuvT2Hm45E/6ZsPp
	 BpZtAUbHEpC8FJP51GZEvqLfZSINkdKIf41yXzmKvmV+N0nWM8zBBIg3uztp9Nj6vr
	 ttA1TOTpOlJ9Yc2vGiMQ+XJ4d3P0exhUCdywVDhX+Xx9IPm54q5Bwgie0cwOuYQkuN
	 fDQWWYMeGuIYN3OzCbKsj2kB8Hly1xcG8gqh0uf0LY639Mif5STM0brihIiYu9Dh+o
	 winNngWn5k0Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D57560B94;
	Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02E19F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E15E881EAB
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwYNjabw0iCM for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D6281E5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33D6281E5B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DB4B87B3A; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:35:57 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bf23f3aa8373a026129761463c12e94708f2fc71
X-Git-Newrev: 83b059dba32acc4071472c19ed6537c274adb7d4
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.5DB4B87B3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt6/qt6base: use
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83b059dba32acc4071472c19ed6537c274adb7d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
