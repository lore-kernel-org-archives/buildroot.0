Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A4EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 02:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99624404BD;
	Thu,  2 Dec 2021 02:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yOv6028wTdJ; Thu,  2 Dec 2021 02:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D5A4049B;
	Thu,  2 Dec 2021 02:11:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22BF51BF3C1
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 02:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 108884011A
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 02:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPShmpAberPX for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 02:11:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB0F3400DE
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 02:11:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu18so67834239lfb.0
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 18:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2Sg8zr6AfPiyOjTPu8yPnwDlyXM3MBaKfusNBjxivg=;
 b=QNV889ZMEg3wT1HJTXfucd5Hjpg6GxgdBsVbJOPlsstU/9AeXWnxrep+T45f9XhilQ
 J9dGJodO6Tc53nXMM0DlX3E0QN8a1qe+p1M6JiWC9wuE27O5VlaDy4fldnWp9MHXm+TR
 H3hdK/GbbWNI6CgoTzEK2WInnO35OK6DxJDMbwSBDonBICQsD3TXbLCQWO85SyJOGwSD
 8Ax5OZNGGxZIb8jIsyNvGdRROHkaM/o5YVcLG4ltK48Badb/ha0WJ16r5GLh7cgk6AQa
 1H14geb+iLsnEhcEE1nXn5twNRBvt5qsI+o4kiXNGILdiUcdMjF/zOlWMV9EORptly0N
 bSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2Sg8zr6AfPiyOjTPu8yPnwDlyXM3MBaKfusNBjxivg=;
 b=HsN9RceRus/Fs1VLuySzq5FNT5htZzrMH7Y7QLeclWMTkZCheUsmY8ePgfFhzDdRLp
 x7Ysau5nyCscJ6J9A4AFUit62ERx2TqFNYU+8iDnzfrUBo2OmSkZXz4Xpee203X+Kjc5
 LIJnalrSwGFANI7UXxhh3pqzbYSeDqnde8oLg7OoP+sYcSlsnmvXdQFxZxTpPPcFlUQj
 Iq4jFsvq04rXjLPW8y7gLmSCRYTEcdICfwveFk7K5a/uPSh6IU36nL4+O/tWptcycKt4
 Bb1HWgopglj+u7vh/InfBwazlZzwCFIkXDXWYVbxKqhzmbL5B1bEA5273rn4pP/DXCIe
 7NRA==
X-Gm-Message-State: AOAM533QqCGgp4uQxdQ5KZrKYri3EbDXKuvuthOYlW4FO3bz9ybJ5tng
 2nbh319b9ZuoMsr0ULE2rSmJbF5SiEA=
X-Google-Smtp-Source: ABdhPJyp2O+wz5n3m1LC1Ck2t3kxyFttBj12s0MrtCRgHaNKhGSd/GL8fuHwY/XQuGWSpmiC9PbyUA==
X-Received: by 2002:a05:6512:b1d:: with SMTP id
 w29mr9348078lfu.219.1638411079661; 
 Wed, 01 Dec 2021 18:11:19 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id u3sm185197lfu.140.2021.12.01.18.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 18:11:19 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 03:11:17 +0100
Message-Id: <20211202021117.1648295-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.3.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch updates syskogd to v2.3.0 and drops the redundant .md5 hash.
The upstream sha256 should be sufficient.

Major features and fixes relevant to Buildroot include:
 - UNIX 2038 assert fixes for 32-bit time_t systems
 - logger support for logging to kernel ring buffer
 - Persistent DNS lookup failure for remote syslog servers

For details, see the ChangeLog or the GitHub releases page:
https://github.com/troglobit/sysklogd/releases/tag/v2.3.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 5 ++---
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 6d3ba8f960..19405a9877 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,6 +1,5 @@
-# Upstream .md5 and .sha256 from GitHub
-md5 2c6749c49f52b8c5dad18e9a9315e7dd  sysklogd-2.2.3.tar.gz
-sha256 e7ea09c15511a63c430e84f65ce3bf55a0386ee419ab52e9341c4a9fabae59ad  sysklogd-2.2.3.tar.gz
+# Upstream .sha256 from GitHub
+sha256  9a410b484713d9600c820d8113f2d80cb14708328c908b1a28e8b7b31fd54f57  sysklogd-2.3.0.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 7c5de95743..20ce9d60e3 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.2.3
+SYSKLOGD_VERSION = 2.3.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
