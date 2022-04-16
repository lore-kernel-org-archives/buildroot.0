Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E704C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 15:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F5883F62;
	Sat, 16 Apr 2022 15:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0auP7hLej-V; Sat, 16 Apr 2022 15:28:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6850E83E90;
	Sat, 16 Apr 2022 15:28:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89EC61BF57F
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 15:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 744C5409E3
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 15:28:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5AwHDIDP2vyh for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 15:28:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 640B9400B8
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 15:28:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i20so13760733wrb.13
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ZKgd2Aeyyotspf19b3hs8DgaecKlItZEwZu5P/Jv0E=;
 b=nlFRdOf12huhsbNIdF/UKJVVxwBNceu29/q0axbzUSo+pzUKOTk727ePzF/T/52tCG
 L5d64tq2IVWCgyNkyLPlc6fcOiVBpZAjhI+QTzGEa7cx2KyI/HNlPOOhWt+IQ1Cw4F2/
 BGo8bWFSaK8m8zwUt3ZoYsMz3obK7fluZDBBTkh7JJ8cZXdb0jl0TalcqUSFfrbtMbmB
 NT04TxTOA15IlrEUuP2WuDHmB6VjnjodNHobOWpFzQx9GKgXWyEcZSYqePCdxuUIgxyx
 rig7PUUQXVXIddxr3HSeAn0l68pytyPZuL4HpjH9SYSQEhC0UDIBo154DNqtkRZMRVS1
 Hupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ZKgd2Aeyyotspf19b3hs8DgaecKlItZEwZu5P/Jv0E=;
 b=8QBnx7F8tDqV/rApZ2rVkOBnEPtmWYIjxdRjuiMgRgFMYpfHq6WFtYSioYUqKJ0v91
 OWuabU9/hC1b6UkYK4pLXDO9WPAq24n8xJIf6St8CvoxJdTkCa/vsNy0fQINA3w5P9vz
 1lhM2d/pbGKs085YtkerMgPNfUmpPEd1s9+cH3puWD8oVjn7ngBRR6thdyvZJ9bCwO85
 6S2vf9HQOH0wZC4KYD0fkAZHwxp8pIVaMb/HrrW+5UJnuVKdK3Oc6nrG0Xtdyd06H8Hm
 vNrUH/ibA5nz3RAczUR/TKljE9WLVDlKe2IcOBIk0CZFm/GhgA4zNL4xF6ND3YdpTkQR
 qPlw==
X-Gm-Message-State: AOAM531oLQmD95V5hAKAZX2NkJNvaCwvlM9n27TsGd+i7VUHCNONmbdc
 z2G+5t06U3Z8mNly36e3qt9pXu0GMFs=
X-Google-Smtp-Source: ABdhPJz9nxv6dhZb3j6NtlCa3oeG6Ce/HR4reALlF9MAz33ZS0DmN0I0R/XJ8jKI6WH236CpLEJzRg==
X-Received: by 2002:a05:6000:2c7:b0:205:cb41:2a82 with SMTP id
 o7-20020a05600002c700b00205cb412a82mr2701546wry.395.1650122917206; 
 Sat, 16 Apr 2022 08:28:37 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c3b1500b003928f20b7besm657281wms.42.2022.04.16.08.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 08:28:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 17:26:32 +0200
Message-Id: <20220416152632.2220173-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mc: fix build with gcc 4.8
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 4.8.26 in commit e648dfa6f7078a6fbbc5feb83292c6a98300fe8f and
https://github.com/MidnightCommander/mc/commit/8b4386df83ab5a525f0568113fe1e53d362f433e:

tty-ncurses.c: In function 'tty_colorize_area':
tty-ncurses.c:575:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int row = 0; row < rows; row++)
     ^

Fixes:
 - http://autobuild.buildroot.org/results/d9f0a11bde42fe6ae2e9449d3365609d59a6545d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mc/mc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index ac12c2173a..3858d62886 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -10,7 +10,9 @@ MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-MC_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+MC_CONF_ENV = \
+	CFLAGS="$(TARGET_CFLAGS) -std=c99" \
+	LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_GPM),y)
 MC_CONF_OPTS += --with-gpm-mouse
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
