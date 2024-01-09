Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4FBC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4227400A2;
	Tue,  9 Jan 2024 08:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4227400A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfmZkTab-mPa; Tue,  9 Jan 2024 08:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8E5F4192F;
	Tue,  9 Jan 2024 08:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8E5F4192F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 006261BF59C
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB85D40446
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB85D40446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZAkPTe68S93 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:02:42 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BF11403C0
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF11403C0
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3606ef221dbso16172895ab.2
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704787361; x=1705392161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ObW+T7q56Hqmx7lXZc5S2L4NHKdsdCjhvoN+a0O0N2o=;
 b=hlmpnuNJLpHHWkiHL4vSLccpHTBEb/s94dUW1azrXazMakvle6jYly7NtBf8lObNIn
 nTPzVquhmcCEQg8mnJ+Dt0H/dDvKYDvtDgLFjJksUPg0Oc1kiT4p5L11z7ik1tvXiPR1
 q+WRSDjLV8hSOD8S++mdOhlRVxALNezvOXkBXgHduvNZRBgzYbfsyKvjBmmc6tQ700DH
 ufFKVPQEOmI/YdcPhREnk/GGq3RprS98jNb3g7zPEQSqnIfK1chvHtINFxNBRaJ72qck
 /sbROLnlb3Kv2UAjHHhoVTSPqKj/LErf8s6OroFxVdajEKh5akDXtnoIQNUn3jb39MYS
 JWXw==
X-Gm-Message-State: AOJu0Yw+k8qTG1k+Q0SzvnJmkYYbs7EwoRV8itY7E/GfEQS9u10ZoKy1
 R0q4nCCowZ/c93WMQCuDN7FLqFFuvrzbMA==
X-Google-Smtp-Source: AGHT+IGxFJne8ry4F4wRWf2E/WUTHY9JiNznOevf268HUyJ0xrXB3iHfrjk9IUohIbuGfWZRLrc6PQ==
X-Received: by 2002:a05:6602:3b88:b0:7be:e5b7:8ecc with SMTP id
 dm8-20020a0566023b8800b007bee5b78eccmr178499iob.0.1704787361290; 
 Tue, 09 Jan 2024 00:02:41 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cx24-20020a056638491800b0046ce54fea8bsm492391jab.131.2024.01.09.00.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:02:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:02:39 -0700
Message-Id: <20240109080239.4060095-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704787361; x=1705392161; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ObW+T7q56Hqmx7lXZc5S2L4NHKdsdCjhvoN+a0O0N2o=;
 b=UrVcZB1BJHVf7H7Obevp+CVEiLITn+Xj5dVdwAPOnBoqHsCkPYhsHseeTibka6+SM7
 dq3Kv28fZ8kzMVKqfYlgTga83EU8JvS7usOsBzMIPs9NJo8gFsfJm2alDgq7CmqnNj++
 HnrXjwqz63eow57qCpgArk9JmPUfd+e7qjmIY3cHFshb7xihBrL1++EWaSH4tVmRxy8+
 qj+jOxp4o1poFMs5oEiulO+I23SzUAitn/8FPe9w1hJ6GEEYOy2sjDCH1KZu7AXn3jae
 U3EHRCiBF4JKIDK3fec70ch0pRFO0DoFEVe5JfocIPehH/TxWW1XmaOP/bod1SJmtYd8
 K+/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UrVcZB1B
Subject: [Buildroot] [PATCH 1/1] package/python-hatch-vcs: bump to version
 0.4.0
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
 package/python-hatch-vcs/python-hatch-vcs.hash | 4 ++--
 package/python-hatch-vcs/python-hatch-vcs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatch-vcs/python-hatch-vcs.hash b/package/python-hatch-vcs/python-hatch-vcs.hash
index 6e5fe1de13..55cd3b3e5a 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.hash
+++ b/package/python-hatch-vcs/python-hatch-vcs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatch_vcs/json
-md5  c2f2cbe6851b7b2969cb4aa24c4b9b2f  hatch_vcs-0.3.0.tar.gz
-sha256  cec5107cfce482c67f8bc96f18bbc320c9aa0d068180e14ad317bbee5a153fee  hatch_vcs-0.3.0.tar.gz
+md5  d801fe7c3e5955307748f2790bbb3488  hatch_vcs-0.4.0.tar.gz
+sha256  093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7  hatch_vcs-0.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  117aa5006d8475562f04442ab06dd2a4c501af3a77255eae0deef1f0c2499a1a  LICENSE.txt
diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
index ef5f6541cd..46e59f8aa0 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.mk
+++ b/package/python-hatch-vcs/python-hatch-vcs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_VCS_VERSION = 0.3.0
+PYTHON_HATCH_VCS_VERSION = 0.4.0
 PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
-PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/04/33/b68d68e532392d938472d16a03e4ce0ccd749ea31b42d18f8baa6547cbfd
+PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/f5/c9/54bb4fa27b4e4a014ef3bb17710cdf692b3aa2cbc7953da885f1bf7e06ea
 PYTHON_HATCH_VCS_LICENSE = MIT
 PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_VCS_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
