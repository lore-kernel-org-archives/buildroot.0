Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809E4C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:38:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 297F660EE4
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 21:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 297F660EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E304380F08;
	Fri, 13 Aug 2021 21:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1KHqV_VH4nB; Fri, 13 Aug 2021 21:38:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF7C80F0B;
	Fri, 13 Aug 2021 21:38:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B56B1BF40F
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A4BD400FF
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 21:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAHaBQ1kmImV for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 21:37:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2206C40162
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 21:37:50 +0000 (UTC)
Received: from ubuntu.localdomain ([89.164.42.73])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ees6mj8VpZx06Ees9mjClD; Fri, 13 Aug 2021 23:37:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628890669; bh=i+mps+A0XXtQ6AvSTKr3tWP9By1LYmDbcICHmacb5iI=;
 h=From:To:Subject:Date:MIME-Version;
 b=H+PrVqBNi5AAtOf63m7d0y1iPtAb+7ab+Ff6WtOjYkKDfcD3Qi5jMi2nXKUyYGHK0
 NfQLKk5JLYEJCO70H+wM3h4Yktw+l/om/MTqaGixCJjf8Txu4q5LwM3dpJQP2CDrIe
 m9SVLiDx673p+bWOza5iboslK9/Eik4wtKIifPygiq19xZX3svDd91I5u9HqEGk1l4
 8TmMd1pVYFSeoZcoEN+ZsPRJHWK4p1216zKpBGOw+iMJo+OoWXGO4O4Fq5jRvEQNIC
 IYYXYmt0LMmY3x8uketFVc/LyWDCHzy5jQbw9F8l8RVjEw2WDcH+hqNMlp/vfqHnkg
 iVOtpW/fddrAw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 23:37:45 +0200
Message-Id: <20210813213745.1555522-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813213745.1555522-1-giulio.benetti@benettiengineering.com>
References: <20210813213745.1555522-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLHcS3IcagRK0g0+6uxR3GXQpvJPdjV0bE/VIv5MVZwMJ3An2HQYObCB7hEWvEF6ku85sI4JnJQnwian+KhSdpS4mEkvKW9QtPmDhZ0MLcdtmAMmmVrU
 zVpuNO6lT5pU53fODuExy6zwszXRKOkdZ9n+Wp0hIfEN2Vt+cPENmy0GUSfPwPmXwWnTgeLii0lfMDTqgOpRBD27/Kf3RpyLTX9iTDAyfwpGkO062/lxbed9
 nHcjlrPWC6E3+OgrSuJBil1OGO/ZBowxTQU28v+Fjo97PGMLe1MHW8BMXPLsMxkyHja8iQbqECpLuafGnyqRNiAOJd9Ro1Q+oA54Wo3qe1aLuJ3lBA47ZBse
 UpIic5swJtWZJllak/sF4A0UiGetEQ==
Subject: [Buildroot] [PATCH 3/3] package/lmbench: fix build failure due to
 gcc bug 97208
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

The lmbench package exhibits gcc bug 97208 when built for the Microblaze
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_97208=y..

Fixes:
http://autobuild.buildroot.net/results/ae1/ae1e4d61ed367c6cb64442c60d98882cc7985346/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/lmbench/lmbench.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 2f3b19b5f8..8e16c7112f 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -18,6 +18,10 @@ LMBENCH_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 LMBENCH_LDLIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_97208),y)
+LMBENCH_CFLAGS += -O0
+endif
+
 LMBENCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 define LMBENCH_CONFIGURE_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
