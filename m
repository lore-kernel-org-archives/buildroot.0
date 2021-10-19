Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E332C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 21:37:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803B760F57
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 21:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 803B760F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44ACC400BA;
	Tue, 19 Oct 2021 21:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7EyBq0Bwgmwp; Tue, 19 Oct 2021 21:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D07FA4023A;
	Tue, 19 Oct 2021 21:37:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB9A1BF361
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 21:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B14E400BA
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 21:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvTzLbNGH6Ct for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 21:37:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF9B54014E
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 21:37:42 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id v127so14589014wme.5
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 14:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/iGyZgVfrK3jl+B7ChERTG2Hc7DlS6FOGpZltTwUfMs=;
 b=XCJ75bG+4DHb83bBJrbuQV8RTa4PCuhIa37hbBzzxNXbcWWNzpCBPvnxEN7gi1UVgY
 jE5VE+hrp06MJim8+r/6GpZig5v1/YxNZwrZgIeD8pt7/muqc5lUJUdNOj3pbkkbaWoU
 3hOJPyIS/vyGh/BP1NRcw7soqffFRziS39b9FnjTCbj8fojpmwGDMiClLiDca58HUXNj
 PPWVZFrh7w5TEmb2ydeAmOnZBL9U1lJXUGZGkUYKIH+FUyXaYtqJKZj9aDXix+edslk1
 gvwcrHSNy65No+jMXbw3zSCNPQVJeSY9tKY+GuFGl/3xhSzjTm92FrZTqbAaudjUxygQ
 qlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/iGyZgVfrK3jl+B7ChERTG2Hc7DlS6FOGpZltTwUfMs=;
 b=1nkD3bVsWqz8c8PLRgDsGU0bwdeO4swhfmcoWdAsRkO6a7r80Em0ttuu1fV4DLCnwQ
 a+nFrEPYtgksQ+xigmSa+xoOH3K2PseU1LU9iwtMS1SpJpZhKd5EKgZ0LM2YL71wv9BC
 xvbSfoShN+7nNvBvUYiYHsyBlvFbh/Cfkt50w/4mdDBxQtdVzYlvl0JCnSKOvvHSnbcZ
 UjrJdTw8ojHjWZKa97sC8AHzhK6wUyloJ7JlX+0UNur0WyU+AIbIEWpTmZfYz+Q5WGgA
 YAZ0X++W/XzKxSeQiwkVEIyTUzCfxuVpdK0RthYmamnifTh7wAoOLR/yLPuRg8UR3ZFw
 sXIg==
X-Gm-Message-State: AOAM531Uwep6kJEgoui+/hMYQ/RVUfQ3mElgLwvN5tkVTwSv4CmzIiVr
 BMuKardv6XcIfXl8wDRs864sfTXVYXM=
X-Google-Smtp-Source: ABdhPJyg1DShrn0M+oS1x6C6DbhVa0oYXGMCWGmHzObSwmsaZfReWTLWY4zyib0Yf78g7PIb0paOaw==
X-Received: by 2002:adf:a31d:: with SMTP id c29mr45895617wrb.381.1634679460759; 
 Tue, 19 Oct 2021 14:37:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id 3sm276283wms.5.2021.10.19.14.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 14:37:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 23:36:21 +0200
Message-Id: <20211019213621.423111-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/irssi: bump to version 1.2.3
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
Cc: Rodrigo Rebello <rprebello@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://irssi.org/NEWS/#v1-2-3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/irssi/irssi.hash | 4 ++--
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index 6a91e16487..05555250a7 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	414fdee2ffaeb90a55f141b7fb3899608631dc891e2bc1f5e91ca31f1a621101  irssi-1.0.8.tar.xz
+sha256  a647bfefed14d2221fa77b6edac594934dc672c4a560417b1abcbbc6b88d769f  irssi-1.2.3.tar.xz
 # Locally calculated
-sha256	a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
+sha256  a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index c64690c59b..da71622a04 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.0.8
+IRSSI_VERSION = 1.2.3
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
