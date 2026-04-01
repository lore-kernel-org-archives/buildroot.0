Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A89DD35162
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 09:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 247D36102C;
	Wed,  1 Apr 2026 09:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dd_RaN2nEI0Z; Wed,  1 Apr 2026 09:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C2061037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775035679;
	bh=tm65rLt8kbAvVBIWzqHNuFTXW5FT/459IJr4zl0ASjc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WnfTxsRJeNGl0h8fD1YSdTkmDp8sxa2Vp7dlUP9KnL8B+vHmUFPzNpVupyy8cXESg
	 hf7XrBy8hJgrJA8j/xMcIHY+VxIrKREnSbvn7+y49Baej2LBZvr046jI+ZRlu0nVEX
	 XlAw1qL5bb49RqR7BqT5PoftITRfqwdQ+l1AyfQtV2Hfk09bgX3P0MrRMof50CDp2O
	 YAXs0cIYMVC7U81+7bkkjqWvvTOwdBTjW/wfWl+jUGr5vuR+0yd7I358n4VNdQUp0v
	 Sgmb5SWAPxQlVbS4vqYnUg0j4Xp5AF+Wdw+f/XByOmdPykWeI6MqV6KvYgDlEHEm6z
	 Ne+IkljnH8hpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49C2061037;
	Wed,  1 Apr 2026 09:27:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84E66379
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 645198125F
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJmFAe3rQUXb for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 09:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCED581240
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCED581240
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:27:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BB1E7FEBB; Wed,  1 Apr 2026 09:27:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Apr 2026 11:22:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9018402c2c0bd92be0664df82d943e11fe782a6b
X-Git-Newrev: 20080af519f9712687d2ccfe81c7e3c4929d800f
X-Patchwork-Hint: ignore
Message-Id: <20260401092755.2BB1E7FEBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system: fix typo in comment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20080af519f9712687d2ccfe81c7e3c4929d800f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix "TARTGET_DIR" -> "TARGET_DIR" typo.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/system.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/system.mk b/system/system.mk
index 52e810868a..3da9d3b2dd 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -60,7 +60,7 @@ endef
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
