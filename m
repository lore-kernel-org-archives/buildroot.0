Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D1BEF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 030C384591;
	Fri, 13 Feb 2026 19:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfiXs1rJQmcI; Fri, 13 Feb 2026 19:36:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C9FE84646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011390;
	bh=ShuHaicHjjgYxAovnJtX+vEnoM4egRv54J+msAEZzRg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rnK47akKCeFPps60De+HRkbTjRZXNYh9Hk7EUhSgHKb2FQtET9hB56gQNzEEbeWVo
	 fXxdXEkSGWuyPcOcd533wG6QUEdmU/ZXwKH3fSNL7wh9pgjg6q6/REizD5eGUK9kLz
	 wGeapyOulikZOOW14Ip2PN8b1YSWWQZXrJuOZxwSYHB0aGraFw73BkTduJOh3Drr6W
	 gQavNfjJ3wdiy5yUELl4wMeJS30J7pGoT6tR+Dv+PbqFPU3hEJtqfwLK43gIQL9qTT
	 hwrklXpZg/2Lz10kRSWbUqilg8fu38fhdJDaqqLJptmO8/vhH48yALYYrINqS74Utz
	 v4PfMDiw8XqcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C9FE84646;
	Fri, 13 Feb 2026 19:36:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F3F169
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC01941E43
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJxEvtNLiPgr for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B915541E4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B915541E4E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE7C584924; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:05 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 07b60c2d54ebacfdf27a9340bd50d739241575b4
X-Git-Newrev: 81d1880f0456383610bbe73406ef7e4769740d82
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.AE7C584924@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: also
 install utils to STAGING_DIR
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81d1880f0456383610bbe73406ef7e4769740d82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

When BR2_UCLIBC_INSTALL_UTILS is enabled, utils such as getconf, ldd,
locale get installed to TARGET_DIR. However, they do not get installed
to STAGING_DIR, which is annoying as it means that they are not part
of external toolchains built by Buildroot.

This commit adjusts the uclibc package to make sure those tools also
get installed to STAGING_DIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 272d281ba9a06cfdb802ff13d5ca32ef06166cce)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/uclibc/uclibc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index dea5445b16..69eb73510e 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -449,6 +449,14 @@ define UCLIBC_INSTALL_UTILS_TARGET
 		PREFIX=$(TARGET_DIR) \
 		utils install_utils
 endef
+
+define UCLIBC_INSTALL_UTILS_STAGING
+	$(MAKE1) -C $(@D) \
+		CC="$(TARGET_CC)" CPP="$(TARGET_CPP)" LD="$(TARGET_LD)" \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
+		PREFIX=$(STAGING_DIR) \
+		utils install_utils
+endef
 endif
 
 define UCLIBC_INSTALL_TARGET_CMDS
@@ -479,6 +487,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime install_dev
 	$(UCLIBC_INSTALL_HOST_UTILS)
+	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
 # Checks to give errors that the user can understand
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
