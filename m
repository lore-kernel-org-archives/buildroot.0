Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA0FF9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BAC06F4A5;
	Tue, 14 Apr 2026 15:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Cw9G9JyT_ki; Tue, 14 Apr 2026 15:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6FA6F499
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181375;
	bh=QdWiK/J0wuIrysfi2v8m9aWiM85naSAHjIEyUkxOdmA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RpDN1yoBdNnMDVBKLbHepquTtjz22u4p13qecAG574VxN+3Ml2KoT+BJ/xEL8h0Yc
	 dyQ+acLILTrYCJ/S06Ub6Ad9fSy9wzNLM568HHMscdC0EUmp4cUDoAzh+ig6nidkmn
	 gnAB49lU4LzD7Vr8N0OvwekOOsf5ARQZk7CrJJ3uZXO7PcezkIrm6cdDUPRooSv+VD
	 YWKXk+UhgcAvW8v+UYNAIktVpQ9uKswNd4npXWvLqClg7Ic1gNZ0SmKv6T5eyhXGWD
	 b0MLRz1j97yJTTzgiuoR5o0lQevOio/VDt3GV4ls3aIlm7jBBal0lsJAliEgeyzXhZ
	 6sNPx0W5a8s2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA6FA6F499;
	Tue, 14 Apr 2026 15:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99247237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3131984D42
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0uJKQBrL4dH for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B48A84D43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B48A84D43
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B4E0814A8; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 12:20:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7e9471e5caf1fa6480abf1a02cf1bd5c3a3aa40b
X-Git-Newrev: a063cf3843dca506d611e1a818a086fb0af36357
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.3B4E0814A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] system: fix typo in
 comment
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a063cf3843dca506d611e1a818a086fb0af36357
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fix "TARTGET_DIR" -> "TARGET_DIR" typo.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 20080af519f9712687d2ccfe81c7e3c4929d800f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 system/system.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/system.mk b/system/system.mk
index 8fe2c138b0..ed482806ac 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -48,7 +48,7 @@ endef
 endif
 
 # This function rsyncs the skeleton directory in $(1) to the destination
-# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
+# in $(2), which should be either $(TARGET_DIR) or $(STAGING_DIR)
 define SYSTEM_RSYNC
 	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
