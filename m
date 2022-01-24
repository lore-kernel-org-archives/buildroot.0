Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FBDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 11:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C8160E4A;
	Mon, 24 Jan 2022 11:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DhUlwmvZJX5y; Mon, 24 Jan 2022 11:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F31460E16;
	Mon, 24 Jan 2022 11:29:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C69471BF215
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3174409E3
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 11:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZUABlcSl2qf for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 11:29:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0E36409DE
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 11:29:14 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id q204so4480688iod.8
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 03:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNsHFaJ6AExFy0CdKS+IjtY2zv/zmGWX6G2PXFjb/Us=;
 b=UGbxfcOcmvbNALuwP/9zKfgKUkL5F1hCgzSlpoV+GpfT7LZTyrDrzxsUh0EyS84NuV
 k6t19qQdc1irqZFwp1GQifI5Ifg9Q35K6t2JJL+DHR0GJ/hk4lEiySvHdCSyGZc/A/b3
 HNey8ib/chKtD7trwuE625jTBD1Ab+rovXfa+d/E6TJW5vgRgyGXjM0ho/2dbq/+XmJj
 taVpXAHVqqXhyCNZGsJVI/MHLn6QM8THxKEzF0GNpQCxTZ7snVaoG6KgO7FYYZcZhQKf
 Y0JN6jNVRIuXBd+DjD0DD3MaYGXKKe5vB/cTUXIjvmRWlN13vHGpf42E4+Ul64Z1pFud
 9g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNsHFaJ6AExFy0CdKS+IjtY2zv/zmGWX6G2PXFjb/Us=;
 b=jIYnCNgmLUPEJmLXvXwZmij6XhIZERf+lPhjmd1d/9JZzonQ0lGTidROrpIGfI7OVm
 Z5dc+UECTwNkNiMWT0mu3JlkZ/nHroxNAaNjCqtTcBbWGIqeNm+y35XT4sYV2egac8D1
 tKBow0mA1jHjxLHQhwnHjXXAlqSHB+DebgjoUI+wujU9lq2nWc76p1nD4tfprgjA4jP5
 Q27o35tw6kHDpPNpSJItJuahMIREo+2e4pudNuUbPx8vvlEuSM8m1kdEy7td400loneP
 jpTaAhgPvqYKYqthGobqubd8nG7eseUUAwvLvyPs56EFbEa73WWmJYFaEwEaf+CjyKiH
 mvUw==
X-Gm-Message-State: AOAM531zkW+PPOgfaZU99QyFxpf6Bf6nu74x4/uICmi4SquztkDGKRrq
 qqS/Jg20UlimSdQgSCrBTv7OkkSjwLk=
X-Google-Smtp-Source: ABdhPJw/Cp0H/sbh+qIv95API1R5IM/NySIZ1O0aF+9JDbHLcIKfRbXX+M/3qu6jxo93USK+rSxnnA==
X-Received: by 2002:a02:cd1c:: with SMTP id g28mr1451367jaq.189.1643023753856; 
 Mon, 24 Jan 2022 03:29:13 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id n7sm6243004iof.5.2022.01.24.03.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 03:29:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 04:29:12 -0700
Message-Id: <20220124112912.547889-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 1.26.8
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
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 066bfb7288..2415f24199 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  e0051a87a956e618a6bb514a07fa7773  urllib3-1.26.7.tar.gz
-sha256  4987c65554f7a2dbf30c18fd48778ef124af6fab771a377103da0585e2336ece  urllib3-1.26.7.tar.gz
+md5  50831ca7b19bbe2781abb0a4c2d51760  urllib3-1.26.8.tar.gz
+sha256  0e7c33d9a63e7ddfcb86780aac87befc2fbddf46c58dbb487e0855f7ceec283c  urllib3-1.26.8.tar.gz
 # Locally computed sha256 checksums
 sha256  c37bf186e27cf9dbe9619e55edfe3cea7b30091ceb3da63c7dacbe0e6d77907b  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 9580d9b6b9..c9c8a912d1 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.26.7
+PYTHON_URLLIB3_VERSION = 1.26.8
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/80/be/3ee43b6c5757cabea19e75b8f46eaf05a2f5144107d7db48c7cf3a864f73
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/b0/b1/7bbf5181f8e3258efae31702f5eab87d8a74a72a0aa78bc8c08c1466e243
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
