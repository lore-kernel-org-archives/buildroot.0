Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C748AC61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 23:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C3B8615C7;
	Fri, 24 Nov 2023 23:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3B8615C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y38SCDRHcYmf; Fri, 24 Nov 2023 23:25:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA05E615A3;
	Fri, 24 Nov 2023 23:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA05E615A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7EBB21BF319
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 23:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 580E080E84
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 23:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 580E080E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMAJfObiwqNz for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 23:25:25 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20DF780E55
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 23:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20DF780E55
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7ad501cb1f9so77698839f.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 15:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700868324; x=1701473124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bZVNwezRTL4vHl9BDRyYi++XFsh6b/IqrU/s8o6wito=;
 b=Wr+uLcgteWCoDdFHFCwgvFBsLwiloFl2khtJC2+4KXaIPHob96N6Z6azob0WoVhfLu
 3YWDxy8SnA+APka3D/GmgmmgTaxkh6ixLjzb3pQdhxiwNKpbav3xtDBbJ6YS+nshT4AR
 U34rcCiVn0fOMv+4n8h3q3j2WH19m/2W2l+9LNABGTDvjA8+91FUYj68y9atNPMFVz4+
 kDbi/uGUHBZCgy+87DhOa2EhZSXFBf6QdaG4uokerbFnZOsah9Y5NdpO3ZCRuMWD487c
 WkUCHPJYqK30CVrQBCXjwrhZ/+dOtFAJE30ld9zJjkDceFAS0X6pPV/PxZ+qI742/wcM
 gstA==
X-Gm-Message-State: AOJu0YyCu15/H+r4b/zBHRY7aNw02xSoej4ESj2AXcPHgWlP8xMVhb6C
 ddWVOVyTzl91hfmzh8Bg3Es2HLkMwVM=
X-Google-Smtp-Source: AGHT+IE+2BjqD/6O64QfDhEbMgTzfxK0Mqn85vaiFar/f/COVDpOoqVw8l/iM5y8z4+58ee50py4nQ==
X-Received: by 2002:a5e:de0b:0:b0:7b3:59e4:8b4e with SMTP id
 e11-20020a5ede0b000000b007b359e48b4emr5086708iok.21.1700868323739; 
 Fri, 24 Nov 2023 15:25:23 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 d9-20020a5d9bc9000000b007b383e7be86sm300946ion.3.2023.11.24.15.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 15:25:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 16:25:19 -0700
Message-Id: <20231124232519.184099-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700868324; x=1701473124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bZVNwezRTL4vHl9BDRyYi++XFsh6b/IqrU/s8o6wito=;
 b=EAFSiyaZg7NuofSq6GCh9fjVUzf1bpnrJ/OgAteSEiPAkKT49ZXXEe4UwnlhO7jTjA
 FH5aB6YgkC5hM+UTLneeNSJdj6U66BKOVznRh4QlE+GLtMZ367+ld2yseiseJj+u/GOI
 M5sFEMHCg5VEZGjoP3bbQYv1HCM9VnjcZ4WiXoItspp/vS7NnaIp3Sc1wujTZriOML+A
 Frb70IQHu/Fz0euRwpiqgkbvjAA6p/FWqJn9T8iH4vHAz3YPFhnsbTNf1yQQjLH+M5Uo
 OXqLzf5gHzn6AdqW8XuR1/rrWfkb/uHk9EUQGY2LRX0UxyL8a/o3ZgkYsQnhv4Ju5zmL
 7jNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EAFSiyaZ
Subject: [Buildroot] [PATCH 1/1] package/python-orjson: bump to version
 3.9.10
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
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 773fb14568..0e9b93f311 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  048938fd9153f37eaf7a08b748de94ff87b2488dd3bd9f96c3ae784527a961b3  orjson-3.9.2.tar.gz
+sha256  245a1ad9a8f926273787e91f7d7e14b4b357e263a215d8c96dd2039b3cddc238  orjson-3.9.10.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index cf05b26262..a2e8a50468 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.9.2
+PYTHON_ORJSON_VERSION = 3.9.10
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/30/a4/96bcb52da0de9ccfcd99a60719b995c9b9c3aaa3a70701f0790ce856c10d
+PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/72/75/642688bf5d99131fe8cf603f4ef9f26e4b1c6ed8f7f5c7e6fb31def54fb7
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
