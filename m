Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902D9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 11:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AF8E6072C;
	Sat, 20 Nov 2021 11:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZstfKtbIY88W; Sat, 20 Nov 2021 11:32:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AACB6070A;
	Sat, 20 Nov 2021 11:32:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1E151BF28D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD0458261C
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQ_js2aI5NyD for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 11:32:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04DFE825FE
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:32:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w29so22819611wra.12
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 03:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G8E4QtG1jO7svqgaeR1eEVReMjy4ql2pp/BWZmuIt/8=;
 b=EEY6VMYq+qFE5ASxOYjTmPMP90gCsAdN9a0H1Tz1VKnFuD7il+TAIwWer5HWWAmpLl
 0vO5R1YvDObTz0mvH9AWeTiBRL1wOMMVWKs7Ya/Mjc3yoqYT6n1twWZuzxO+d4rXNTAz
 yYzvC8D+On5jhiGN82NgnEueJd7xiB+LVuszhZJbba2xrI1Zoo2zgCWjcEXvxxuv35KQ
 d0NZis54gicZIbeGnziIzOsTAURZ249BH9mgTx3vYHgPBbWKLFfPI7YR3uHDLtrWjU46
 10TxYonC4N/p3IxGOFNCwqULbDYKhOUuZXZVZJz9kyOefPSyrf8Dy09oghx7VeZphr7n
 Fn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G8E4QtG1jO7svqgaeR1eEVReMjy4ql2pp/BWZmuIt/8=;
 b=gCcMpQtwZzfq+ZWzWliNO8dHgrzLjWKIzNjfGFZfBdtf5GP5p7kATq3fEYZ95rtO38
 SWUF2X1BCAYVZk2I6OGkupnSyUWu7PQTEQPshoLJ9VAHZSfUTw0410qmb57yRa8Jlz1O
 IIcpSl/fKILIBw7ds95kupAQHiBAhtPpnWOBIyoEDte5SRE1JhhwWJk14xBXe6uzV6Bj
 7Qu+waCAD/J4YMZtzLLJH5YirQxOVVOqUUkWPXm8DBQZe0vycCEruui2Mn+IDdc6MJw5
 QPnrn/Yvmv2ldutLZDMOJTjtPj46UpaXMbinLR4MllVd4Eo4JZLzcInr/PiTqA588xyy
 FOKg==
X-Gm-Message-State: AOAM531HKSDsUQPs3C6yG1rT+SJ+owv1ng6ARYMzF3tS3+eX2JF0Eh3W
 3ivXCg6gvFUYWiJnCK+jDy1Uov4yEcE=
X-Google-Smtp-Source: ABdhPJyRWoaOj8lHWg/2dzSZ1uYOyfwJaQKdvtzuJECKgTvTtOLUQSbzL/YK8nG2anpPMzL8hSu5QA==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr17754071wrc.204.1637407962982; 
 Sat, 20 Nov 2021 03:32:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o12sm3370238wrc.85.2021.11.20.03.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 03:32:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 12:30:28 +0100
Message-Id: <20211120113028.2886374-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/hackrf: replace BSD-3c by
 BSD-3-Clause
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hackrf/hackrf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index b83f6518e8..391bddcdb0 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -7,7 +7,7 @@
 HACKRF_VERSION = 2018.01.1
 HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
-HACKRF_LICENSE = GPL-2.0+ BSD-3c
+HACKRF_LICENSE = GPL-2.0+ BSD-3-Clause
 HACKRF_LICENSE_FILES = COPYING
 HACKRF_DEPENDENCIES = fftw-single libusb
 HACKRF_SUBDIR = host
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
