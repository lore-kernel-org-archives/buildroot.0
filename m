Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B638EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C8136158E;
	Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mavycK98VlXE; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551436149A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011415;
	bh=DBTA9HiqyOCDFKsQEPmvVINwYkIsgq15V0AbC7UE+Us=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z8k6vEPdEAQPBnYDlOl0kohoWkyzSFjbSTcn7JvCzYY/rOxqGtIP9NisBwYXVaNiQ
	 qWQdWqeAqMqtncZQqzUoy2YfsGbPpOrBCPIj/hXcBk6F/F3rOo8KuA1zO/+DW62Mdi
	 Z46no2SAcxzoDVi5HgGIgDXhQw2ZaykgnkTDT+GKTkDJ510xRRTsxLviuFmL9axfVh
	 Kh4nRdnqw9hQOOgIoHXLIlA7LC6OaCTdWA5tdmzyZQ4b+UWs7F1Oe19Xz0RvQpvptU
	 nvoze1HLzt4xe186hGT5sYY5YdkHYUllX8xCsOlyceCX+ltljZFocGcLfap7Z8+f4G
	 yINSNBeQ8i6Xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 551436149A;
	Fri, 13 Feb 2026 19:36:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD97283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE29D84537
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEoN0ZK1Tui7 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 492D18455F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 492D18455F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E88382233; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:24 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8571ada6d74a80f45796170fc092b99d7842d9bc
X-Git-Newrev: 5c76442776f3da587ec2f1467eb8b2efbf7299df
X-Patchwork-Hint: ignore
Message-Id: <20260213193530.3E88382233@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/shadow: default
 to BR2_TARGET_GENERIC_PASSWD_ algo
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c76442776f3da587ec2f1467eb8b2efbf7299df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Make shadow follow the the BR2_TARGET_GENERIC_PASSWD_* system configuration
option when changing password rather than DES.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/issues/134

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 39e618441981da3da173c9f717c7dc5977760c95)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/shadow/shadow.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index f0a2b57b4d..bb61fed82e 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -139,4 +139,19 @@ define SHADOW_PERMISSIONS
 	$(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
 endef
 
+ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256),y)
+SHADOW_ENCRYPT_METHOD = SHA256
+else ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
+SHADOW_ENCRYPT_METHOD = SHA512
+endif
+
+ifneq ($(SHADOW_ENCRYPT_METHOD),)
+define SHADOW_SET_ENCRYPT_METHOD
+	$(SED) 's/^[#]\?ENCRYPT_METHOD .*/ENCRYPT_METHOD $(SHADOW_ENCRYPT_METHOD)/' \
+		$(TARGET_DIR)/etc/login.defs
+endef
+
+SHADOW_POST_INSTALL_TARGET_HOOKS += SHADOW_SET_ENCRYPT_METHOD
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
