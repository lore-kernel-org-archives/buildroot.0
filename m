Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE6EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 09:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9A540260;
	Sun, 21 Nov 2021 09:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bL3FqFXrdhE6; Sun, 21 Nov 2021 09:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E980D40214;
	Sun, 21 Nov 2021 09:01:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD63E1BF2F8
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 09:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC3BA40214
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 09:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lA5t66MeDpql for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 09:01:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5F5740202
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:01:43 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b1so65064753lfs.13
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 01:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2M+UKd02hiWNWWrQj9nry9pyVhF+pMr3w6azf00dHHg=;
 b=kZ4AM56u/PoFa74CTSpnQvaD8Rlk3g26E4lH1Au+J3BUuOxqbfstbpWsMBsNGysAeO
 Ri29ThlsqJsFk9QdpRgTntyb8g335pOxFM0sVCIvuRnOCoYZ5nizBnHEBPkiMKv93mQh
 cpfe5BF23b+saMkZ+AY0Q1BV/jp5HaOYvqV0aGWUuVatrZym4l43T8cPY+d6nNlyMeht
 U1y5BypAcqxBo37WNfsAdJXq0W7TQ2A5jvwM+xBNnKCU0pConFY8XlTBmuTE1dCDLFrs
 Jt9uCIrmC+58Pa2pb+NlhzUg4hOxSRPniq5t3YCvNQAmhs/DY1JAaiZ5xVVuBpYjbiW0
 +n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2M+UKd02hiWNWWrQj9nry9pyVhF+pMr3w6azf00dHHg=;
 b=EOfazziB31uLZfeWNgZARV3lVWtT73UMeOrTpnBoz5+B4btWF+mVKbD2FzCIDQP25z
 H3VJqdTzg1MEOYxjW4jMmei4XbyNUDZuzcLyRgYjrMTmLUOHYSw1kPnQQjw3kVe6Tr3t
 FEAWrNxOOA1isQkfFz50DevcfbPcdD9ifKiZRzh03eD6xcY6NQZUHTQ45X/eXuim1CGr
 82D6YnGwnSEgHr7fpEqmvhwKVwYlCWt8zOP64UrXXBQS6P2ZyubuWwzy5YWahog0BJ7M
 fzwJSKHr01t9a9kxdrKCPDDtb4Ex3FkayTU92sLx1RFdp21Expv8bfMCc5PGmnj2n12L
 KYQw==
X-Gm-Message-State: AOAM5300iSZv5zcNFRm2GP6OrEoB2Lq/0Np6D9CLQyGYX8cPofuMFuWy
 8FawKyUnVgG0kyGQhaxvNs8ZXJVbIec=
X-Google-Smtp-Source: ABdhPJwbB6aga8iP1hZeDUa9b2I+lx1FrAYnAMMbtNxyaLgBwprYj3eKe8991WSizhWXxYxshdL4Gw==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr48982624lfr.283.1637485301401; 
 Sun, 21 Nov 2021 01:01:41 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id g4sm580658lfv.288.2021.11.21.01.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 01:01:40 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 10:01:35 +0100
Message-Id: <20211121090135.3050610-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/smcroute: bump to version 2.5.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes parse error when calling 'smcrouted -N' with a config file that
has 'mrdisc' disabled for one or more interfaces.  Multicast router
discovery (mrdisc) is enabled by default in Buildroot.

See the ChangeLog, or release notes at GitHub, for more information:
https://github.com/troglobit/smcroute/releases/tag/2.5.5

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/smcroute/smcroute.hash | 2 +-
 package/smcroute/smcroute.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index ddc38eddd2..ea4c449c42 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256	96b890fd6fbf8553010f62beda991742f7b4e7e8aea3e75335fb6048b15869da  smcroute-2.5.4.tar.gz
+sha256	2569cd97fa2047df14203a7144be53a1b32928cb460421a302bbcce381b42bc3  smcroute-2.5.5.tar.gz
 
 # Locally generated
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 81f540088a..1626c80a7c 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.5.4
+SMCROUTE_VERSION = 2.5.5
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
