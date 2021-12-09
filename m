Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D14C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 22:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F574EEF6;
	Thu,  9 Dec 2021 22:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OX7NsvY2553T; Thu,  9 Dec 2021 22:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED654EEF4;
	Thu,  9 Dec 2021 22:01:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E56F1BF868
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D8EE85EFE
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDDSOpdMdlOY for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 22:01:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 726C185EF5
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 22:01:28 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w1so23912668edc.6
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 14:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aiiX1A/lAX+Mzf4Lg8kGsOcCpyscN33rjFPT+zJbpic=;
 b=nMFGXcPNPd4PI4TbnRr2qisFRVQnThC8dmiYHNeFe9vZaEeEObxs7qCNiF514udVKV
 KIQX33g6/sizuzZ1EBhV8wItUc3Wi7gCHDR1LAFQ8mRgKhZE76virmv6e58Os/eLYnDH
 rlPQXsfAV2/5gmm3FwF878KDb2bpok4UhKlxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aiiX1A/lAX+Mzf4Lg8kGsOcCpyscN33rjFPT+zJbpic=;
 b=fWk2xiorrhe7TkI1lXzyhiPjB37obh1p8LXnL0Wis0UPnHmKCfzSpw0eq+pg1ZTRY/
 2qzgMHx9OcBfv+LuA+V+dJ+k4Bq+xQD+jcWmcooYJNQWdpjvurwBeo0gntv+gntKTckp
 Ua5KC0dGbG13rxo3eS27fghj/6USha58Wdowg1W7EfDsVX8Hth2F0/V/hJQJ1LRsU7Ih
 F1k6jVfhfuJ14+uL2L5hdHAHm3ZS0P0PU90RZWX2kpitNBv6O84VwmmWDWSSYKjVrcjd
 xO+Uf3gU0HcVk/2LDcclk/Tzf/6Vtwkaa5I7Wrhm7cd2nd84ez7n7MvSZRTCWJ/l4+jN
 /Rwg==
X-Gm-Message-State: AOAM533Gx7BzVXjvEscCekUsjUQzsmyGrjmFQoakXRzfUFvQmkD6WwVt
 rsrK0MS1h3glHTUrRtWabRTsdAnHmuSZZA==
X-Google-Smtp-Source: ABdhPJz1VwFBXBV6wngWkuXTYnY6UruyY0CE/hjraJUsWz/+InOKulKzAVNWVZw5cR0s8zEE4EgwVQ==
X-Received: by 2002:a17:907:6e9e:: with SMTP id
 sh30mr18587677ejc.156.1639087286667; 
 Thu, 09 Dec 2021 14:01:26 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id kx3sm493974ejc.112.2021.12.09.14.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 14:01:26 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 23:01:23 +0100
Message-Id: <20211209220123.482608-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 8.4.0
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 3b5bdf2535..d14cb5cff6 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a7fc550b80819eab11e01cc097913700  Pillow-8.3.2.tar.gz
-sha256  dde3f3ed8d00c72631bc19cbfff8ad3b6215062a5eed402381ad365f82f0c18c  Pillow-8.3.2.tar.gz
+md5  7a1eb5a250c7ccbd549a89e16404f09f  Pillow-8.4.0.tar.gz
+sha256  b8e2f83c56e141920c39464b852de3719dfbfb6e3c99a2d8da0edf4fb33176ed  Pillow-8.4.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  5bb11d96b393a698df70018069a986248021f286344c437a13f299c3daf1dfd4  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 168c9d632c..5ed57c55cb 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 8.3.2
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/90/d4/a7c9b6c5d176654aa3dbccbfd0be4fd3a263355dc24122a5f1937bdc2689
+PYTHON_PILLOW_VERSION = 8.4.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/7d/2a/2fc11b54e2742db06297f7fa7f420a0e3069fdcf0e4b57dfec33f0b08622
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
