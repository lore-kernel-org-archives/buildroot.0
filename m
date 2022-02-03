Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE769C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 18:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79B4184090;
	Thu,  3 Feb 2022 18:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iIlWuu9jNmu; Thu,  3 Feb 2022 18:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA178408C;
	Thu,  3 Feb 2022 18:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EFED1BF3AA
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 18:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F3738408C
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 18:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdIhub9jc5VJ for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 18:47:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31A9C83F4E
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 18:47:21 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id i1so2909884ils.5
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 10:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6HqJayn2W0kM3R3P3ocVtXjW8fW4j4u+gVURBcLLMg=;
 b=oaqPsxhWh/31OD1v6idZSITwzTHZi8y83ZsojFXpAZyKvhRd6Nv3/iKo/3AOsZQOIi
 3701HJebEyx0ZqS40Bpq1avaGSJdnC7Vm1WH9F9Sr21xFv5EH9ZgIEQUXLC50kiP9TOf
 2k+3KBSMajWp6LssEdKwnZ73on+Ck2Zv4Rvi/dv3rChynqmy4pAmGjBVXXctn4MagoKQ
 4rlu1YiXnzK7bHsoww86Tlkn2jmB/6ZWOfB8Vl/RUZZrwFidrJBAGhq7Rn92AfzrvnIL
 +KK2T6ScPT7nuS/CFY4oOLw3kiUCUgjd3/z7gATFUcN+0Iz4fMGVEL78ZWKKc6JXN8vw
 E5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6HqJayn2W0kM3R3P3ocVtXjW8fW4j4u+gVURBcLLMg=;
 b=CwISZnK5qNxin10eBy+wZR0mXrZj+EfUOUJhGy86erYNT4J9GDncUe61/e8NZAHwx5
 XsfQUAuR+A2r1jnYj/IYFX4A8UV8cX2KRMjPZn1+1tfX9SMsWcEDvoNVTFxhpJuI/xoh
 9mdFjcwtX8CUq5aEgBhLPC6tzkRubhIiHzi8Mr8E7IO4EgcKGbyOlMQ8bkOMttUpIiMq
 pdhFbtNLrWxJBgtcWKebAS2wk6U5XTtgJellVqSmcECo/lREwqcCnXrinDPrZe/UZmAn
 XAx8rJJ3EvK0WrsbmA+iLyHtcvSViD6ot9t2lGjFszFSWEGY3cuZe6CgTJ9gO0+yRUcV
 JeOg==
X-Gm-Message-State: AOAM5303P/2SBWl9p3MJCQSI+IZSiWxn40CqFOTekP2jhTNkacJ2Yqrp
 srQlnD7doCK0PsB6dpdIKRaTGVRuVE8=
X-Google-Smtp-Source: ABdhPJxA1QjBNCfqsKES09hsGcsCqreQoGnHetAoWDVKsZL+7s7kPZ1b4jtv3+zYpypAYA9RiizLDA==
X-Received: by 2002:a05:6e02:184f:: with SMTP id
 b15mr8282089ilv.288.1643914040508; 
 Thu, 03 Feb 2022 10:47:20 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id r64sm20353280iod.25.2022.02.03.10.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 10:47:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Feb 2022 11:47:18 -0700
Message-Id: <20220203184718.3173767-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bat: bump to version 0.19.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 David Pierret <david.pierret@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bat/bat.hash | 2 +-
 package/bat/bat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index aa6c8d743d..f4d3e32c34 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  9c345788eb916777a60e7ff32031f1c92edc5565031e0c057bce860982768744  bat-0.18.3.tar.gz
+sha256  7940641baaa61cd3bcd1c3db4804d179609d6ccd955868928a129bf3f853e0b2  bat-0.19.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  64de710b6309a7db5e44ad0af382300c7fb6f6d116d8ae32f0164e05db033068  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index 9b619af172..dc29a85429 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.18.3
+BAT_VERSION = 0.19.0
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
