Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A046C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 18:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E911E414C9;
	Mon, 31 Jan 2022 18:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8U6I2xBfhVL; Mon, 31 Jan 2022 18:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F336414C2;
	Mon, 31 Jan 2022 18:31:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEBC01BF2B7
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD46B83EA5
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 18:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwhGp7c7AR_m for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 18:31:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E090083E78
 for <buildroot@busybox.net>; Mon, 31 Jan 2022 18:31:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id r7so10906085wmq.5
 for <buildroot@busybox.net>; Mon, 31 Jan 2022 10:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wx5tW2wDpnEfT6UQTCDIjDxbXrnSHTTpdS9pK8tQA0=;
 b=QNK2BKEfdfrViES8bdNBOfn0LK7XOnBtb4PaJz9xpq1lny/ZF9unHatVrXcvzZ05ke
 65QQ6ulDgM2dkh5uzwFdW2TE/bdJtmqoUlAF4ptFJTJmaEuqKZd0KZSCwE54HN1HJgc7
 mO8lc5G9LDg6dndTtYSHUKBECK08Jt9Na1zRSjtw1mKXcZZ+fnZtfgw1bUXGFA1YZEMh
 kobIRqdLqPm5YpljBXC3SISUt45ciCSNvEw0q2uBb8kw0Aw++VYJxA3wyfD2YeVbZ1lb
 uEkr0pziYV4HAq/gcPZyvokvm6rykoaR+kWCReV3hW5TXtgpqAEXX3wrogJ/BAYflI0E
 5g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wx5tW2wDpnEfT6UQTCDIjDxbXrnSHTTpdS9pK8tQA0=;
 b=bo1zaHpI+VewV+HW0vPGlyy62U9owQpAgf0cHmOaCx2gswf+oOyP9AtjjlaN11vQFo
 975plXpXKnsLOctjGO4ATvQ2y6Pj9ZVSiePz4x6N4CDvLNGbbhu7D8ZC2gF9afxMQSY1
 qmRngoWx5CRiDc/tOardXDnnya6I2m7g9AzJkSTq9Qh8a/+FWMGQCOGNlXxLKP8pyM35
 6MRMtRocBaI8cE32WgqE1MmIVUeOPElKP+TC15ai9d2VCgp/ULDocmZ4KqpNBtkhJcMs
 BcDikIeVayijIeGN+Je+WrU2/aq2A8gQs84mhs1fRCkCiJ9wU1FzlHsmdk9xeDBbo6R/
 5CDg==
X-Gm-Message-State: AOAM531A99MvqLGrp6Y07Rt4MRMkEl8mnYQHFDZhV/CkKimjUzuiIbzM
 BNobCdWp4O2eJ6Wc+M1+C+Cb1lfAc68=
X-Google-Smtp-Source: ABdhPJweHn6XEpkmF+hbW2wjoSsHEccr+rUUPqFOKQsmBGLU3xGSNhg0flm3CTMVX6zd/o+s4iKSCw==
X-Received: by 2002:a7b:c018:: with SMTP id c24mr26981377wmb.49.1643653883098; 
 Mon, 31 Jan 2022 10:31:23 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id m64sm84659wmm.31.2022.01.31.10.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:31:22 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 31 Jan 2022 15:58:25 +0100
Message-Id: <20220131145825.1206899-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/expat: security bump to 2.4.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fix CVE-2022-23852, CVE-2022-23990

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/expat/expat.hash | 6 +++---
 package/expat/expat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 0853c3c76..312980166 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.3/
-md5  b1137f030590b3f0c41c69c6cd68fa90  expat-2.4.3.tar.xz
-sha1  cfaacc4f929b34cfbde2b8f33b74ec84c0cbb329  expat-2.4.3.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.4/
+md5  a712d23b7afb32e7527cf0b3fd8f12ac  expat-2.4.4.tar.xz
+sha1  6028b04d3505fc519c4c7c6bd67e1ad1a08cd7b6  expat-2.4.4.tar.xz
 
 # Locally calculated
 sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.3.tar.xz
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a7ace6609..250600c25 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.3
+EXPAT_VERSION = 2.4.4
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
