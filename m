Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4A7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 07:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6338F83268;
	Thu, 16 Dec 2021 07:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ETYFv7eS8Ij; Thu, 16 Dec 2021 07:20:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B86A783227;
	Thu, 16 Dec 2021 07:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA5A1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 07:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87BD640AD3
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 07:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5aHphyZ6VLc for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 07:20:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E7F540ABE
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 07:20:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t26so6067613wrb.4
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 23:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E7BTleaSJ4tstQRFyHSHXn39Mb8ai2k6DERZtQow1Qg=;
 b=bSyJjspiKm4+Mr+LI6DMH+/jRgl+qKq5YdbtGsTZ0cSwnrY/oTkNKGb2nWBy1eXbRr
 VP9N7sHv1+XUifcMIfaXHZ9PpFO6reh1nRzXuE4r+RxolGZZyJFTBo0A9PQi+xGybvGL
 PH4+5SOcrnGxr9rQTfhyF82SjrRqT1rDp6PQ7Q8EnXsBFyHzzBlwgfJ1cE1OGCQJsPtP
 EJn+8uwjEphG7RxTtpbIA3M4IcnMmNpA0X2IBzd7ue/i5YdfLJh8DxIVvfrCQsrgBoCH
 lP3MWGieX7mw1mGpt9jcw2/QIRxayzoxWtAcOB7oywiS5YGSRjGo2Jk4BtZKiJY1B76D
 2pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E7BTleaSJ4tstQRFyHSHXn39Mb8ai2k6DERZtQow1Qg=;
 b=HSqfVCEaq1zpJebAM3IVaekiV2KZTjIR7Q9Ul87G58nOQ1sB9qAp3DfiAVGKRAIjHJ
 jObnt4iElu0y5xMMuANklO9iIZWrhmuvXnQAPcXwn+Qew193I19QTm1pE5C1KJommH7P
 9wOM92ktMwKS+Br77vdokaDKpc1RiRZLoZ3XzbAa7tiH332JnkK604fckBIdiFF2SCwf
 q3P5IVI7KgZlrhiRv2xIaMJGBIfib8ZQW43Ddswl7YXEq6W1Mv6CSXiv2CA5192h05n6
 qP91abvJNS0x8KTmJn0AvO30radYML20FfByxHKgWJkfA/Wf3Bv2VREcVzS+zSJiWPOd
 ZMYg==
X-Gm-Message-State: AOAM531GIlRh1zPOv7cFZ45cH7ql81hT7tEJFabzZfoIUguMfyQHbuo3
 dGyDefYH9mlI9A2/mpwO4n33Z1WtySpWsg==
X-Google-Smtp-Source: ABdhPJxRn31Lf+odrwHj3KlPgiFvx/bJWKG7S7RGBwgP7KY7/PKl3U1wLWHYNAlfqnexN091iDPiZg==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr8085237wri.285.1639639221386; 
 Wed, 15 Dec 2021 23:20:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id j17sm5227857wmq.41.2021.12.15.23.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 23:20:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 08:19:59 +0100
Message-Id: <20211216071959.128707-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jansson: bump to version 2.14
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://jansson.readthedocs.io/en/latest/changes.html#version-2-14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jansson/jansson.hash | 2 +-
 package/jansson/jansson.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index 5c19316981..0d9dc7b5a5 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  f4f377da17b10201a60c1108613e78ee15df6b12016b116b6de42209f47a474f  jansson-2.13.1.tar.gz
+sha256  fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9  jansson-2.14.tar.bz2
 sha256  1fff7d37d22157bcd81ab53b6c54da755d7c2f868f15807d9bde920f10730da0  LICENSE
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 2761ce9b16..99e1817eef 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.13.1
-JANSSON_SITE = http://www.digip.org/jansson/releases
+JANSSON_VERSION = 2.14
+JANSSON_SOURCE = jansson-$(JANSSON_VERSION).tar.bz2
+JANSSON_SITE = \
+	https://github.com/akheron/jansson/releases/download/v$(JANSSON_VERSION)
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
 JANSSON_CPE_ID_VENDOR = jansson_project
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
