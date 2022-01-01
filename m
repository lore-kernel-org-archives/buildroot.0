Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C774C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 05:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF6D940227;
	Sat,  1 Jan 2022 05:20:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Ua78gHP-AbK; Sat,  1 Jan 2022 05:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C9E40219;
	Sat,  1 Jan 2022 05:20:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7409C1BF5D7
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 05:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62CC640219
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 05:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eCKrnAH3Aq6s for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 05:20:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CED840205
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 05:20:40 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id h23so24507783iol.11
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 21:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/2fURu0x5AccOMxQ+3QRWWUvoB7T8sWoSR2U5GF8iEY=;
 b=pdfrkQfxPgqKqj4HwzVl03Qj2jO6uBSItbJgo9kN18bZSHy4QsQta37Sf+KvR1voWS
 i8oHzGhMWFNoPqW/l3jDfxPTvPhr/lO1l8mAI4+dvp60cCFaJSd6q0/0XOjR/nsctwPm
 RSp8PNJ+hgQ3B594J/ZJMqxEkjdM0C0vcIIC7236bn69lgNrCsfzbPxn7DHljSc9O6YQ
 SCR2drkA8e9ddOMpjOaKChcRf33xFEthGw6JdmDIjBKW6G+hRQo3JdbKSp0sv55o1fta
 ARfOb70C9AM13pJZ8Z2Xgftp+ZnrNwzOPnjCKxQlE+XT/Fh2VL6tvGFTTVlK+j5hOY+8
 DDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/2fURu0x5AccOMxQ+3QRWWUvoB7T8sWoSR2U5GF8iEY=;
 b=pntW3Mz5bN2HRS/eVIJklz+EEVh1m8bY5LrsbXKJ6TwBUNrUncAEYeXfswxLHXf93y
 sasKJCYCYBgXhg7p+71FUtzpCdb4JoHU1LwFYWFtInkZrgP6v1bv18jk6I7CCmrkkoe3
 MCy4eikjalgOEQNbh+UgZQN6NjApK37C+kRcf7VMlTpNnhQ3VpxqsxAK5jH3Aj6muyQW
 5I0IE17iv1ShHYrHRcXJUGVP46/cdJwj8Sg9xw7S5yxBV2ZUJtTE+rLrRQtuQeE4KLcP
 Q+W+MD0ZcMeJgMbTODqQinFnKY116pxGuZheR99+U91uc6VQ3CVfOIbImQoUyWA9Kt2g
 HZEg==
X-Gm-Message-State: AOAM533g6930SgXo6zfjWwS7dGOrawY1zBo0Cl/eyMMWLjENU3xfJ18C
 vQ6mOeEqBVHBQCJj0aXh2plrRqjF+Fk=
X-Google-Smtp-Source: ABdhPJxbkOnnMjsNw7yMULDRVioG0j2gHtabV6lc9/3oVj0dGAVr453shxizI6dw3AgMp/jw4LmBaQ==
X-Received: by 2002:a05:6602:1695:: with SMTP id
 s21mr17072530iow.149.1641014439467; 
 Fri, 31 Dec 2021 21:20:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id x10sm17234435ilu.73.2021.12.31.21.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 21:20:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 22:20:32 -0700
Message-Id: <20220101052032.1994475-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to version
 1.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
 package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
index bddc846a5b..fad7079789 100644
--- a/package/python-aiorwlock/python-aiorwlock.hash
+++ b/package/python-aiorwlock/python-aiorwlock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
-md5  066260ea2c6798f6e18258d4430031bb  aiorwlock-1.1.0.tar.gz
-sha256  2aaf1d1cc995abfd5b2f07ca0e9b5c23bd369517c75495a347eb5896bc307f29  aiorwlock-1.1.0.tar.gz
+md5  f0fac247fd884f59d53f6deeb866a52d  aiorwlock-1.2.0.tar.gz
+sha256  3626ed72f92a57e71c685d7fc0329578e5d2dee2ab80805beec8b5119053146d  aiorwlock-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index acc6f90158..4ba4965eb5 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIORWLOCK_VERSION = 1.1.0
+PYTHON_AIORWLOCK_VERSION = 1.2.0
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/ca/e5/3221d49edb432024f6b1b7e9e36cad6363601973375667477f2130d5da7d
+PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/22/84/98ef7b69764b0ceee7afe2139f45f9cbba21c849b0bd8a6eeecb11ee650d
 PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
