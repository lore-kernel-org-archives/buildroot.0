Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A779C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:38:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 274A460EE4
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 274A460EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4EC600BA;
	Fri, 13 Aug 2021 21:38:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMvfSOudUucX; Fri, 13 Aug 2021 21:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9B6605BE;
	Fri, 13 Aug 2021 21:38:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 153581BF40F
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E2C540162
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8AQyuyI_X85 for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 21:37:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2345D4017C
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 21:37:50 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.42.73])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ees6mj8VpZx06Ees8mjCl2; Fri, 13 Aug 2021 23:37:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628890669; bh=j2pO9co7nIssjWXnBlN8s/uvkV6JEvduaWTJrQJbHdg=;
 h=From:To:Subject:Date:MIME-Version;
 b=AH+APlIF2srGNZb3xkgP2kqcS2S0Y/Ztbvkaaw7YB4VrS3RxVW2WHco911je3eKXz
 IcIbYsfEa8Chm8adsQUbWeOwQT6mMUCVpjxS+a1Gw6YHr41Hae9HvRnxVfITurMQ/q
 26Ga0IUMqbSC9YkYfjj2xiDrD/wYHrqN+jFltMk9QoD7k03c6lxSH1eDUoEbjcS00D
 PVFjXvQlUqhrX68vsNj2qMbFJb2WAyJdOtRuBeQgxr23EuJ3quSe5YQYxH/IE8GU3V
 UTraO4scenAGbHr21dOiHLach74gw6faPrtMqvyec2n25u4EmRFjk/6C/ue3JDd6KK
 jPCtL2tos1LAw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 23:37:44 +0200
Message-Id: <20210813213745.1555522-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813213745.1555522-1-giulio.benetti@benettiengineering.com>
References: <20210813213745.1555522-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLHcS3IcagRK0g0+6uxR3GXQpvJPdjV0bE/VIv5MVZwMJ3An2HQYObCB7hEWvEF6ku85sI4JnJQnwian+KhSdpS4mEkvKW9QtPmDhZ0MLcdtmAMmmVrU
 zVpuNO6lT5pU53fODuExy6zwszXRKOkdZ9n+Wp0hIfEN2Vt+cPENmy0GUSfPwPmXwWnTgeLii0lfMDTqgOpRBD27/Kf3RpyLTX9iTDAyfwpGkO062/lxbed9
 nHcjlrPWC6E3+OgrSuJBil1OGO/ZBowxTQU28v+Fjo97PGMLe1MHW8BMXPLsMxkyHja8iQbqECpLuafGnyqRNiAOJd9Ro1Q+oA54Wo3qe1aLuJ3lBA47ZBse
 UpIic5swJtWZJllak/sF4A0UiGetEQ==
Subject: [Buildroot] [PATCH 2/3] toolchain/toolchain-wrapper: use Gcc bug
 97208 instead of repeating it
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Now that we have added Gcc bug 97208 we can use it instead of repeating it.
So let's substitute bug condition with bug presence. Also note that gcc bug
97208 is still present in gcc 11.1.0 so better to make comment more generic
and keep a detailed description in toolchain/Config.in

Cc: Roman Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/toolchain-wrapper.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index 8b551e3a18..c56ec7c054 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -33,11 +33,10 @@ TOOLCHAIN_WRAPPER_OPTS += -DBR_NEED_SOURCE_DATE_EPOCH
 endif
 endif
 
-# Disable -ftree-loop-distribute-patterns on microblaze to
-# workaround a compiler bug with gcc 10 and -O2, -Os or -O3.
+# Disable -ftree-loop-distribute-patterns on compiler affected by gcc bug 97208.
 # https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=5879ab5fafedc8f6f9bfe95a4cf8501b0df90edd
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97208
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10)$(BR2_microblaze),yy)
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_97208),y)
 TOOLCHAIN_WRAPPER_OPTS += -fno-tree-loop-distribute-patterns
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
