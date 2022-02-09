Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FF5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 22:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EDBD82E5F;
	Wed,  9 Feb 2022 22:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLnGgsW3Le3p; Wed,  9 Feb 2022 22:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 662D282662;
	Wed,  9 Feb 2022 22:41:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A18AC1BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FADF410E3
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eUzX8ouLyRT0 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 22:41:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05402410D7
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 22:41:08 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id p11so2982751ils.1
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 14:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sY7cLE0HWcTfovfb5n6sF/1Cx0bbbsXV5Q09SSeTEmU=;
 b=S5gSQsyumim1+MmJByTgxvObY3+tyQvEXZ5QCRtMxvGSB3O0dcdU0t3RofE1LK9/y/
 944ipqX1mYEqyg6OkW26GlkAl4mnZ/xZgGl2Q8OXxfOGzDHWXRWo7qA00IuYu9Ya/02S
 3yYbC+yjbo//dTLR9liOnoGDBur7dvseZgdIVx5twr8Kn9t553FCKE/p7m9wacssZ4Rx
 KKO1prYKVW1KWyJcs8Z/hJFxZSMWyFDAzfMt9F+n3by6Aj8heJUmag/HK88+rMaeHHNB
 +xYq3hPFziOV73xhOcYQ7OVRnqRB2KITVjYcIdcki+5Z/6tJZcYU5LMIfkRM32h8zeWV
 smQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sY7cLE0HWcTfovfb5n6sF/1Cx0bbbsXV5Q09SSeTEmU=;
 b=U7cOUXcaku8oDTuFqE787Wz4TXst89YGpb/YOsDXcoTLzNIddWslJA9x7d5obusXwF
 X3eTeRMa3QDrgifMtq0znmgqKBS1NOLqquUC0vjqP5ee5RXG3WCWO/8M7yJKo0dMmqJZ
 BeVFPhlRzHfOHhtv5lkoeR4hCiXhf3Ovuh/t6ExAecZfw0KCM/CAd1IS9nKVN5zbxqu2
 qxgffpyfe6eWOIeIpDfwF+gXcLi2Brt8Jlh/aL/P+PZY0F0Vg+up17IgBnmXMGUSW+81
 bfLheZ6yNXDXhjTYkdz4U4kwAfCnOx5i3cBhErD5MR9cSdmuDafczVasz4x97uDWTLbR
 e8Qw==
X-Gm-Message-State: AOAM531yeBsVmgXQnjQ5Wi+DuODCVJpSyG579u6FyIVZak40vBlzvnm0
 C0p8UVCM997DEpuAZoGRbcQw/ekHbBE=
X-Google-Smtp-Source: ABdhPJzvRPEz34QrD8ROhR6wj7ITSxzc9gNCEHu91xFXq44B8p9Xz02ib9Ca9t871sgSOKmXBIdK8A==
X-Received: by 2002:a05:6e02:1d02:: with SMTP id
 i2mr2342763ila.52.1644446467829; 
 Wed, 09 Feb 2022 14:41:07 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id w4sm132464ilv.13.2022.02.09.14.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:41:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 15:41:05 -0700
Message-Id: <20220209224105.772909-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gtest: drop host python2 support
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
 Stephan Hoffmann <sho@relinux.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gtest/gtest.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 673e626c45..5bad1fb5f7 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -19,13 +19,8 @@ endif
 
 HOST_GTEST_LICENSE = Apache-2.0
 HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
 HOST_GTEST_DEPENDENCIES += host-python3
-else
-HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python
-endif
 
 HOST_GTEST_GMOCK_PYTHONPATH = \
 	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
