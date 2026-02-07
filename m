Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF376EE0AE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 21:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7415660781;
	Sat,  7 Feb 2026 21:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jn5kShEzFFrg; Sat,  7 Feb 2026 21:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D91F66068A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770499714;
	bh=CP03+f9fjE/H1xpFcxcwW8ItTCkIlbBgqy5045bLiMo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QuUxRbiuVvTLNDUAA7W6/kPQl3CbNMq67MVO1nHDp3V/LW7Ve3WE4RiTRv0xj1Ba1
	 oTWRs3kCeCWhxPgLcXvQiuyJw2IqYIH+q7VSNP9p26evG+beRvgpkrNm0nKEn2hBwJ
	 7aHr7xA5DYbTsMl13iXEkcOOPUXdhRSpXWgbpyr+poXUMXs9opBE2qPvQ8fNFn0bdL
	 NiMo40h9Wjy+EKjpJCbsM2ZYxwQiyWTqFIOFXJcNlkEloERRMvkIKTihVg57U5TncU
	 d+E5UKRtPqdlymABe81n0dWNODYTBYit0msuyXjkp3sgTdqTg53Q99Qk4dYIsLfX34
	 pBKVGEX9QWAFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D91F66068A;
	Sat,  7 Feb 2026 21:28:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71DB3173
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56FD382FDE
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYLtpcySqKog for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 21:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FD4C82444
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FD4C82444
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 21:28:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7256A86A4D; Sat,  7 Feb 2026 21:28:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Feb 2026 22:19:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 807b0bab37ad2d0d11b7f0a54e5859ff1ae9867d
X-Git-Newrev: 39e618441981da3da173c9f717c7dc5977760c95
X-Patchwork-Hint: ignore
Message-Id: <20260207212832.7256A86A4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: default to
 BR2_TARGET_GENERIC_PASSWD_ algo
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/39e618441981da3da173c9f717c7dc5977760c95
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Make shadow follow the the BR2_TARGET_GENERIC_PASSWD_* system configuration
option when changing password rather than DES.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/issues/134

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/shadow/shadow.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 2ba7a0e03e..cf05fc1bdc 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -140,4 +140,19 @@ define SHADOW_PERMISSIONS
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
