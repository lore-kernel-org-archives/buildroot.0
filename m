Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B35C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 11:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE4F640734;
	Mon, 24 Jan 2022 11:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTW1huM-wI34; Mon, 24 Jan 2022 11:20:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9A86404C4;
	Mon, 24 Jan 2022 11:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 862561BF215
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72635817A5
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cvV6NvGoSrG8 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 11:20:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C08281493
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 11:20:00 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id d188so4692986iof.7
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 03:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNP7sIgirFeWNeG4luhSmECWlfP+NBdbx0T6Xm5xebo=;
 b=KP0YWiReVp1OfAAWX2RQiv/MchR7UrtboDkja5CeDIAj+PSRQwnRsN3CnB4r5UDpWA
 XIqp5fLvC68jU6yhkzH9JzZQNZ05Bcn/8UCMM+i4licCqsSNThwGwH8/vUnDwTuzzI+O
 OFyMj46RY7MfyGcvVFjg9leceIhJcn0pkPppUM3IUPQW9Skds7+9rV6CjRNNQm7YhODf
 D3R9i6ZShiDam/7OBSJ32+U3UOVZqWrRinP33MmGmnN5e/nIgSCNqLQGO5VJU6hocWMx
 gEw/MpV2YFJqUmyCYeRTZgDT9wEZfTL8Ehzrqul9nc8P9/n7N1VBgD5kvkqzok5hb5YG
 T9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNP7sIgirFeWNeG4luhSmECWlfP+NBdbx0T6Xm5xebo=;
 b=PTvnPaRi6/Grwx/YVdcu1oSqk97lj2CuSHE9VnUltZVoNfZQU3P8mFUF7ZBIREL5iq
 Np1V0DkkwhpMk0cTzTTtGaRqjHF+7wDOp2o/dmz6RJal4J0Z7iMfULiBIPbJkyQLV4JZ
 rxw6FEXVZEF6n0MBD8KgoD4SaLA/NwOe/Fp43ZztZ/5fQHBXl5TGBHBGGmtr2OMdx9iJ
 RX8deE1h9alEpEZA8r5NlYv6UQJvg6N14wvDGd39x8GiErtH+An3vTsMOtgzOfCplgt6
 m2aEIi195aGMlccJkStn/Yl4u7+87jZqxKjSr1us8zmE8enR454xUT0ck77cOhaloryU
 igQg==
X-Gm-Message-State: AOAM530gQh64QSBY2i916W6IXh7HOb/bj6e1R0aCIDzihC3D1l6ewwOT
 QszWt+dCmIPDowX1mL2dhIjExWgvxjs=
X-Google-Smtp-Source: ABdhPJzaj+6vX9aVIuWcML3fgcahzO6jMjMIf44LoDnCAPSVHrNF2wDi4gSuNWHNo05AGVrQSsKZoQ==
X-Received: by 2002:a02:6f5d:: with SMTP id b29mr2170047jae.193.1643023199515; 
 Mon, 24 Jan 2022 03:19:59 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id j7sm7117790ilq.55.2022.01.24.03.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 03:19:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 04:19:58 -0700
Message-Id: <20220124111958.545565-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-requests: bump to version
 2.27.1
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
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 53503a3668..1e4cbaff7b 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  8c745949ad3e9ae83d9927fed213db8a  requests-2.26.0.tar.gz
-sha256  b8aa58f8cf793ffd8782d3d8cb19e66ef36f7aba4353eec859e74678b01b07a7  requests-2.26.0.tar.gz
+md5  bcc01b73974a305cc7c5b092e7d07004  requests-2.27.1.tar.gz
+sha256  68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61  requests-2.27.1.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 74cc91ef01..962646516e 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.26.0
+PYTHON_REQUESTS_VERSION = 2.27.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/e7/01/3569e0b535fb2e4a6c384bdbed00c55b9d78b5084e0fb7f4d0bf523d7670
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/60/f3/26ff3767f099b73e0efa138a9998da67890793bfa475d8278f84a30fec77
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
