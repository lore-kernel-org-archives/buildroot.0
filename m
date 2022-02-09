Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC75C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 22:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CB2382EAD;
	Wed,  9 Feb 2022 22:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lGfMXmLGxiFw; Wed,  9 Feb 2022 22:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6450682E5F;
	Wed,  9 Feb 2022 22:36:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C34D91BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF51860B6E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 22:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khkglwBlQoeB for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 22:35:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E93D060B35
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 22:35:55 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id i62so5177800ioa.1
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 14:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N3O96aDQHH/r03k5HqFd02Rtoe0UTDHFIleChVDpnFA=;
 b=GwPgy08Kw+up+2p6C3Xi3gebKqHYZBx8yMNjnUwxLTbIOxjjINBI1nbxSaUtpRoe3n
 jUY1XWC4ZznkmWRnRzUsriUf1iVdP/3J6avSaxSJZdLsnitD3d3PrCbDzB04Sk5adeIP
 XHMXkmY6WmN2Ce0NL44918L68AUujKCNXU9XC7YVmxvnt1WzWuh4XjwaclWQluzTtLJa
 o6kb74wt3MfDdOx8iePUD1sHzbYwzaxirNOB9igTVsE5rtQVu0iy+EJIUs3J0TwDBU4t
 IfC2/idvzPjUxipEVkgENbcZBZLwHa7AU6pbUjpS13CevfROMOmyWLdDVuQ9JAPt5Fvi
 sA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N3O96aDQHH/r03k5HqFd02Rtoe0UTDHFIleChVDpnFA=;
 b=d2HHi+GACzn5cxHfhFVn2uekGJ+IKF6UyPDycRN5h8f5DlEITPJumTLZSTLHX/NAIy
 sMqY3fL22ef6RaRKI4L3f6iL9HGM9agyBvD/6eDk6C3CnKgCH2OfiDQagb0EKg68Ho0X
 tDyiMBRLeb/wGrE3ZlaqvfxPvNiAwnUcfcOtr8nTeaYnKw1tKgJTGN6PRXNiTUfzDNfc
 TNrC7sfLcStEdMHMml94S1f6F0IEY5z17xnIj0UNcIDHfz6TdWn27tamyf57aQcEKVTg
 0IgT5LYlm/XnhoA7m8jJ6chZYD/OJx8QU0pwwwfUJHJSLepF1uispiE7HSDKnwMWE9aM
 Fp6g==
X-Gm-Message-State: AOAM533kgglyCWFB1yHcKarwsMsshqnu5r4SG+ClpcF+qu4siMWNFvv+
 qFqOjkC2nah2G3CWuSQqIxdWnCWnphA=
X-Google-Smtp-Source: ABdhPJx9WrttACUif1tzMtuJf/z1W5BKt6ZieNLhqsPOKQFyhoCkd7Yk06GHdnP3kT4xR1UV+U/8WQ==
X-Received: by 2002:a6b:3b54:: with SMTP id i81mr2283079ioa.75.1644446154760; 
 Wed, 09 Feb 2022 14:35:54 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id r7sm4082301ilm.14.2022.02.09.14.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:35:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 15:35:51 -0700
Message-Id: <20220209223551.772606-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gst1-devtools: drop python2 build
 dependencies
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
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Looks like this was missed in c4bbd6da50488944debba29e195557e5b345f2b1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 66b509ae2c..390b20de16 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -17,11 +17,7 @@ GST1_DEVTOOLS_DEPENDENCIES = \
 	json-glib \
 	$(if $(BR2_PACKAGE_CAIRO),cairo)
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
 GST1_DEVTOOLS_DEPENDENCIES += host-python3 python3
-else
-GST1_DEVTOOLS_DEPENDENCIES += host-python python
-endif
 
 ifeq ($(BR2_PACKAGE_GST1_RTSP_SERVER),y)
 GST1_DEVTOOLS_DEPENDENCIES += gst1-rtsp-server
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
