Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE29FC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 23:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47D7C60D7B;
	Sat,  4 Nov 2023 23:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47D7C60D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fllksKWxSOyL; Sat,  4 Nov 2023 23:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71F7360C17;
	Sat,  4 Nov 2023 23:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F7360C17
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4C111BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E43E60C17
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 23:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E43E60C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJDuRqe3wjlk for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 23:19:05 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FF0E60B89
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 23:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FF0E60B89
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3575287211bso12181645ab.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 16:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699139943; x=1699744743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0MC9TUsCxL3HOX1cmMPMSWrDiFnOKBuWudtVMvPKGgQ=;
 b=Qc4bkrB2XK6z64To+eI+qJWaOT/wUfBQGhsmDVu+ov4z5oTj5KBqKvZLZMOvhN+oF/
 5tUtfygNHoRDoVO4OL51Gv/cEFpNai/AXLWxjQnQdazuPsewdhz9ZJKlGBi1cM/SJ+KA
 OB6FwMY9We6OdYiP4NmzsJ5VYw58kbWU3rFyn2N802/7R9Z1K3hwGlOFBsGeTid8bSZs
 UgFeCS4rppA/rTfraQFBgBrw+hzNZK08VQkDPgu6hXHdt81LvJ8MwTWZcLCWlkPwDb2d
 Vae/+3YUsrGoHVRyT5NCmCoyWGdShuq6j6Th3rnXUh4dhcBoZTaBrtvv0IfKYZZCA2qE
 wsiw==
X-Gm-Message-State: AOJu0YymKiZD+Y4U0xKhMeIPhjmBMwn6+ydR7sXzuO4/++X9YhGu1rAT
 xxE9CZYkFvS/1Hn35TRVdwOoQJ3JMFE=
X-Google-Smtp-Source: AGHT+IEIb8/3sXsBf/BXuEg7l/5cBVmgmGxN19pyNuXe6QwFn2XyrjGsRsODllC4RmguePLahDOtFw==
X-Received: by 2002:a05:6e02:1524:b0:359:8072:3dea with SMTP id
 i4-20020a056e02152400b0035980723deamr4279238ilu.11.1699139943608; 
 Sat, 04 Nov 2023 16:19:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 b9-20020a92c849000000b0034cabf65f2dsm1524563ilq.64.2023.11.04.16.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 16:19:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 17:18:51 -0600
Message-Id: <20231104231851.2671316-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699139943; x=1699744743; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0MC9TUsCxL3HOX1cmMPMSWrDiFnOKBuWudtVMvPKGgQ=;
 b=Nf7kLEFWx8/nf9oUZk1ZoFJJxlbUnee+6KGnVYdu6pbXPLGyS5ytAe9jOqVsXav8DP
 wVf23zqcbTjQGwfKr2pcWSiVp3r9RTEwowetSTNUi8eSfBLNcumkbIM1XHKmqEoZjx0W
 8a2kQBHMrPUialEuATrfZQ3yLCgw0ZwS2QkS5YrWi1uwseAKBNYIAoxaMjk6HKknbJKW
 gMkm5fsi9QRz0QJMNKl8o3qnaj/zDOqeBnHh6uXfRjXXn+JghMo01XUaEEZLXR8eptqo
 WUwgDNXBFlkTDf2Y59yAFmC3jxAflQdFtc/q7nXjM4+9MozJT5fCrXFvOx3epizumUsP
 MFlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nf7kLEFW
Subject: [Buildroot] [PATCH 1/1] package/python-aiodns: bump to version 3.1.1
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
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index 2cdedc6f95..bf65691b89 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  181e11935c78965de2b2b7b0e5efba8d  aiodns-3.0.0.tar.gz
-sha256  946bdfabe743fceeeb093c8a010f5d1645f708a241be849e17edfb0e49e08cd6  aiodns-3.0.0.tar.gz
+md5  13fdfc38f30c9498e3e23c6f372e40ba  aiodns-3.1.1.tar.gz
+sha256  1073eac48185f7a4150cad7f96a5192d6911f12b4fb894de80a088508c9b3a99  aiodns-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb0455d35129425ed399883cd710923de3e246a510e2eb84d9f00032d0bbec97  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 2318dcab3a..f5cbb65334 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.0.0
+PYTHON_AIODNS_VERSION = 3.1.1
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/27/79/df72e25df0fdd9bf5a5ab068539731d27c5f2ae5654621ae0c92ceca94cf
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/fa/10/4de99e6e67703d8f6b10ea92a4d2a6c5b96a9c0708b75389a00203387925
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
