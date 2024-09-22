Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3E5CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 08:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F06A402C1;
	Sun, 22 Sep 2024 08:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8UbIq3hGqTh; Sun, 22 Sep 2024 08:47:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A234402D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A234402D1;
	Sun, 22 Sep 2024 08:47:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E17D81BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE11400D8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 08:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dk7HReneE8DN for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 08:47:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACACF40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACACF40022
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACACF40022
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 08:47:34 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82d07f32eeaso174662439f.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726994853; x=1727599653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=spdUIxU02NN9TagqSDhcxqKPm7LHp32XE7OHMIhqP+w=;
 b=NcP1XN5CIW3qBxQFkaAuBC9dGjyYfRwoxfWjScVFfrYzYFNsZKlhJ9+S6Q64R24/f4
 UmLPuqZtgWl5pwSn6vxbHA0Xf/SRP3SlqeD8FJbRi0zZ2ZcD5YnQLwhAkYF2F+JcVh7W
 zucVvAhHgW0HoR2d1QNk8aTRCjlelVRGZCNPOnN/J1S2UYY1lQcznwKiSlHzibOr/U7C
 yxXHkzgVCoqjAdT6LBdNvtQIvmeN0Seu4cg6NlHEvUX0M6fmqEAB71fCy/m3uC4xJs0c
 K8coKW+ZTGNRTsiG0DIYztK4ZXjShvON/EJ9yEh8IBpxMub7WaRNoSZybQrMKCEHfpUZ
 Y5Ng==
X-Gm-Message-State: AOJu0YwPh3MnPcKJtPJj1k5y2OOeLg16vOMrz4nlNQEiel8rWOEB/NjB
 ONpQfOaSw3FmwiLIR1GisfyK3B0h8WkAN6KhaNBYHsrnVlk+FUsIEvqX7Q==
X-Google-Smtp-Source: AGHT+IGmdkNM9pGtg9bETpYPIhzbEd8I9GlrJz/H86ppW4QxBixglWSNu6gBwpfcQ98xG00KlltdRQ==
X-Received: by 2002:a05:6e02:1a69:b0:39d:25d8:43a9 with SMTP id
 e9e14a558f8ab-3a0c8b93ef0mr82880125ab.0.1726994852867; 
 Sun, 22 Sep 2024 01:47:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e72075sm53487805ab.64.2024.09.22.01.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 01:47:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 02:47:31 -0600
Message-Id: <20240922084731.1014907-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726994853; x=1727599653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=spdUIxU02NN9TagqSDhcxqKPm7LHp32XE7OHMIhqP+w=;
 b=esiGSDd/AJek9Ndx55bv79/iSwKBxseStBRbh5a7E6SYBT/dqtulPYA2BWZOv/Rfp7
 qRaYSNnHgGYwbUwCngX5TAruWHksxDMyZHL9UlJAAHyPmTc15fCSnolHrnaTkvhTIe7r
 QQ0tug73mn+7LWxiRyKfPp9m+LR3p87u7pF58OrMFW3/6G0g+7HsCddiKqfMkRsdJamt
 KOw+8RavyoUi+MXwoXAX10uMU2hzlLx0EaGkZCKcukxTSFqHJgdrrduQkB2WfMaX83rn
 9NwHstbEWLHzIm0yEiSyxug3yV+bxx97wT7Nl6xcNieuiE+G5fDjMBxKH1xx48+mPBj7
 EyXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=esiGSDd/
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.115.0
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
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 2bbffbcb84..f752d65dbe 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  99a2b4e24bcdcfeea19c60df2b481482  fastapi-0.114.2.tar.gz
-sha256  0adb148b62edb09e8c6eeefa3ea934e8f276dabc038c5a82989ea6346050c3da  fastapi-0.114.2.tar.gz
+md5  1be069a4db82af6acedf769e61c2aaeb  fastapi-0.115.0.tar.gz
+sha256  f93b4ca3529a8ebc6fc3fcf710e5efa8de3df9b41570958abf1d97d843138004  fastapi-0.115.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 5fc1a4ecb9..3a932ce34d 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.114.2
+PYTHON_FASTAPI_VERSION = 0.115.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/d6/c7/cf41c991257e9babc429ae0c2c48f5315154e8b94c8ba475dc0247718741
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/7b/5e/bf0471f14bf6ebfbee8208148a3396d1a23298531a6cc10776c59f4c0f87
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
