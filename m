Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFDFC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 06:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D9640915;
	Tue,  9 Jan 2024 06:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8D9640915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gILa_5Tk2Ow7; Tue,  9 Jan 2024 06:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 320C2408FD;
	Tue,  9 Jan 2024 06:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 320C2408FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C84B01BF363
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 924B782325
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 06:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 924B782325
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1Ax7Y1tIM70 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 06:58:06 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D873822FC
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 06:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D873822FC
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7bed8faf6ebso18756839f.2
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 22:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704783485; x=1705388285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/VoxtxNjqqjBKSxL5vmnAsOs6smNhmE518hxmGi1Q/g=;
 b=M7Ar0FC6MH/7SsNXFkySAYF2PXHDfZicFP9Nwfn8IvWWqeHUlJrc6Erln1dIyKo/Hu
 D51DcXo28QbAtToxhUXvYzJQ8C2Rtd9llV7qR5la/LHFOn5Gd1hjzZ03Bf/Z+nrL/JsN
 r51gpCts5L7mZmBZV2BxhsCb/mLDAy6rWXXfWCL4luPOMD60piuPf83dVsgUD4eyrkYx
 Trc4GZQ2Dc7dB8STbgJrCFI1FzKz+ULjdGhbktz5V7JeVgvyW2XEjv5haDTy68EeHk1g
 aKpCg/ZqW22q8RguXKa0Yrb5OxMQt4UfTioJ6SnKXH4wNWwhQD5QxON/stcJwcxCPy8B
 RmFw==
X-Gm-Message-State: AOJu0YzWZEFtoOLZJv9mPYlTQV6dAzqQbzrVFfflEoUb2BrR4g7OltTT
 guwIpKFl9HRmAxA7Y7XW8rMGfF1uujqfCw==
X-Google-Smtp-Source: AGHT+IFW9L8/hAb8j2nzrB3WiCVpaTb6HnS3BdvsbrrVLBwQ80fnLYoqcqH1pKnawO+EFFO4Ke+spw==
X-Received: by 2002:a05:6e02:370d:b0:360:89cd:ce08 with SMTP id
 ck13-20020a056e02370d00b0036089cdce08mr5921342ilb.51.1704783485188; 
 Mon, 08 Jan 2024 22:58:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cs28-20020a056638471c00b0046e2cb87f6csm474524jab.126.2024.01.08.22.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 22:58:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 23:58:01 -0700
Message-Id: <20240109065801.3999176-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704783485; x=1705388285; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/VoxtxNjqqjBKSxL5vmnAsOs6smNhmE518hxmGi1Q/g=;
 b=nm5zbhN+b1ZQopfpWdTHnl0bSPXSJkNKDX2WdRuhLTsVdUyQA2UwQb2WdNh0td7kTh
 MNy8aAv6HYuy+CtaRpG2hr/IsiYdsjxAQzk88azFLsytEeK4VdsWUQ0k3yfRzW7JTV/n
 v9QKgtxrJGghXr3+OPvge9LXfj22Zz7jlL8sw1clCC9h38omxKaL4FexV/ChgRRQixuS
 YSHHqLuVEf9IDMNtBkZ81oR8XDbQh7hMGlFdKvQg9QrednyH8eTNJu9FU82ZG+aRzr2h
 d5QgxiD5dMTb8UFPAnrIMlQNsjLrSV/JSEsreNgJlZbd9v7GgYtvQirlFHGlawGruFdR
 xnyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nm5zbhN+
Subject: [Buildroot] [PATCH 1/1] package/python-distlib: bump to version
 0.3.8
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
 package/python-distlib/python-distlib.hash | 4 ++--
 package/python-distlib/python-distlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
index 506d10824c..1a14e6ba77 100644
--- a/package/python-distlib/python-distlib.hash
+++ b/package/python-distlib/python-distlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/distlib/json
-md5  44e4357e35bbd77fdf1b81e174e34f20  distlib-0.3.7.tar.gz
-sha256  9dafe54b34a028eafd95039d5e5d4851a13734540f1331060d31c9916e7147a8  distlib-0.3.7.tar.gz
+md5  c4df5794463d3710bae3d162bf953ba6  distlib-0.3.8.tar.gz
+sha256  1530ea13e350031b6312d8580ddb6b27a104275a31106523b8f123787f494f64  distlib-0.3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
index cae025dbdb..2eba3ae64f 100644
--- a/package/python-distlib/python-distlib.mk
+++ b/package/python-distlib/python-distlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DISTLIB_VERSION = 0.3.7
+PYTHON_DISTLIB_VERSION = 0.3.8
 PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
-PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/29/34/63be59bdf57b3a8a8dcc252ef45c40f3c018777dc8843d45dd9b869868f0
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/c4/91/e2df406fb4efacdf46871c25cde65d3c6ee5e173b7e5a4547a47bae91920
 PYTHON_DISTLIB_SETUP_TYPE = setuptools
 PYTHON_DISTLIB_LICENSE = PSF-2.0
 PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
