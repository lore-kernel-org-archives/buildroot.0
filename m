Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C4DC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D7C74037A;
	Wed, 10 Jan 2024 04:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D7C74037A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oKte8xbC1Rak; Wed, 10 Jan 2024 04:32:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 784E740302;
	Wed, 10 Jan 2024 04:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 784E740302
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 517F41BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22FE840301
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:32:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22FE840301
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wlQSvaH1F1RU for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:32:53 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48C4D402B8
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:32:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C4D402B8
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7bb0af58134so180037839f.3
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704861172; x=1705465972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zl4FsFIkuECZMhuto7Jj9nRr3BfsjGGp+25A2jULYbY=;
 b=Sb71LxjxT6tkPGwG9tQ6Zk32KWv40fxrl4nJd57z3D7cxnhTGg69BM0B1SRbltYgPM
 RL9twoCjTi3ZJiYgXr68AEe3p/pv0hMvRpmjWVAslgumkBja7BJKVpndrnbXlNziUuNi
 ZnIuTGpWgS3foYk1VKFbIRj+2Egzm3G2TudiKLtDCAsmJufq+LQa7/1vgJoYFeh2oazi
 qs8wqx4wf+t0NpBlPbI8ddEh6Whki1gb2qpoqk1SGYP7mB6J7vtiCZU5O4CuJB3GiQ3B
 Nq7F+dy8HPgZpt5kuz7vujg/oUJvp/XVQo5w1ThCcpIjPoPVYhOD572Jj4tPd1bzQHB3
 7TQA==
X-Gm-Message-State: AOJu0Yy0Srdytfcb6tQqx+gpm3trvE8OL1ZeauqawxCITD0NQh4IkA8r
 /EIWPPiiw7Dc8PazL8iiCTwbt7h9wzJf3Q==
X-Google-Smtp-Source: AGHT+IEUgJU6S7nBjOW/ln9WUAAJgNgoAZntyXGyEQ1IZndFxRW6/0+Ouf+dRz4PhLKRbrjj4Vk0RQ==
X-Received: by 2002:a5d:9f59:0:b0:7bc:2af6:a6d9 with SMTP id
 u25-20020a5d9f59000000b007bc2af6a6d9mr154733iot.41.1704861171773; 
 Tue, 09 Jan 2024 20:32:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 c18-20020a02c9d2000000b0046cd8bac20dsm1059997jap.12.2024.01.09.20.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:32:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:32:49 -0700
Message-Id: <20240110043249.1070442-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704861172; x=1705465972; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zl4FsFIkuECZMhuto7Jj9nRr3BfsjGGp+25A2jULYbY=;
 b=K6E8/cAGUVtwhErq2ldwyS0tj5joh5kZQTGx0/XaQ1pCUe7afTeaIN4Lo+cOalxSg+
 CJ4qv1rhJ0IDW9zk8wuSY8FDp384qs9dPxtp7pxpA4DwpqE/MbS7mh+Jx6ap0HHdXkRK
 1Uj49BRtaXSsaONmaHn4/sKdgMsRPti2/LdHyZrdBsehjkWbv/GwYNXWbePxjHAL+SQu
 J4QffiWX8gdFTBbewkVz13RKpMT8Xo0l7L+JztnOzBdePbbgo9FoveAul48uqL6GjGil
 Zl7WOkM334AUUOrfk1gjzT7aP3dQsWrnZRmgqbvTitmGLP2922yxBzn6xx4Kt5SBnmSJ
 aU2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K6E8/cAG
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 10.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/python-pillow/Pillow/commit/ee6e12a8032a8255b2f7a60a40c50377c17a03fe

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 6 +++---
 package/python-pillow/python-pillow.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 92258a6712..001fb62676 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a55618c5d2fd64048dd3ea41bc39f7cd  Pillow-10.1.0.tar.gz
-sha256  e6bf8de6c36ed96c86ea3b6e1d5273c53f46ef518a062464cd7ef5dd2cf92e38  Pillow-10.1.0.tar.gz
+md5  13de96f9f98bc1c26439d64576a48ac6  pillow-10.2.0.tar.gz
+sha256  e87f0b2c78157e12d7686b27d63c070fd65d994e8ddae6f328e0dcf4a0cd007e  pillow-10.2.0.tar.gz
 
 # Locally computed sha256 checksums
-sha256  0fdb68ffb39062553be40be4e6eaea9700b4f5e870a720ae86b8925d67613ddd  LICENSE
+sha256  e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index bc94062da8..10939d8467 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 10.1.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/80/d7/c4b258c9098b469c4a4e77b0a99b5f4fd21e359c2e486c977d231f52fc71
-PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
+PYTHON_PILLOW_VERSION = 10.2.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f8/3e/32cbd0129a28686621434cbf17bb64bf1458bfb838f1f668262fefce145c
+PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
 PYTHON_PILLOW_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
