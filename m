Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FA9CF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 22:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB7060633;
	Sat, 21 Sep 2024 22:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0CcycIm3sJd; Sat, 21 Sep 2024 22:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6183660656
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6183660656;
	Sat, 21 Sep 2024 22:13:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F4DF1BF47F
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 22:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B579400A4
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 22:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ml1M45VXGO77 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 22:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96C2C4018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96C2C4018A
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96C2C4018A
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:13:43 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82aa8c36eefso175495239f.3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 15:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726956823; x=1727561623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nPhJSZx+A+rrAsSz8zf4OTkwWwWWPmf2xJnaCkJ6ta0=;
 b=XR9syESmReI1PsbD5ZHOKciYaFGe9cmuRcp5YrjFmpoH/1czuxk3t3M/svLvPxtEFV
 32sVdALdcGCBk52hPjX7BLMxchTxzBxsByGCOBxB6FYyIlEg+G7VT6Oa0ouy8dmFN4nY
 hPBfldl7Xg/oG1DxXjACfnG0vaHtXBaSeW2YgSUPXSn7l4OdR0Bgi17L3pD4Xx8ey9eC
 z/wZ5n/chsqmw4w6ByDeZ9pQ4kmlXhto4Tpg8HCz2LqsOJnk6GZ2eoAMkKfLICldxuDD
 0+cEkNbmQQoAMCDF3VvQSBoPewsd8c2DRiLMDOk/Dx8tp1svkXy2ZL9lSICyyfqZSYKq
 jIOw==
X-Gm-Message-State: AOJu0YzC3ulNZ65X8e3Em4oc5MBZKjM6IhL3Z6jIl9aoevsYbSPxVfbH
 AUDdSLFI3vFzjKwIfrNrhe+oqZEH9YRN1EWNdN85O1zPpifvxQ9E1YDDVg==
X-Google-Smtp-Source: AGHT+IGVg6ZwdCnsQg/t2m7kazNLLXg8Qoq5r70sM2RsqoW+hmnRwiHMzYWsdrBl050vsFgKxPzPaQ==
X-Received: by 2002:a05:6602:13ce:b0:82c:ee6d:a7ee with SMTP id
 ca18e2360f4ac-83209cdf027mr635515839f.2.1726956822784; 
 Sat, 21 Sep 2024 15:13:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d4935637dsm460369739f.48.2024.09.21.15.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 15:13:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 16:13:40 -0600
Message-Id: <20240921221340.688164-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726956823; x=1727561623; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nPhJSZx+A+rrAsSz8zf4OTkwWwWWPmf2xJnaCkJ6ta0=;
 b=lxblqv7DF+jTbu9QLqP//t8OwaSidnClX926p0S5ejR3APfsZTc0J8mG1IjcglqAF4
 VFddKjWUypT2Qz1gGMuGqiWUrba4FU311c12rXRpouhLZLpUNhQdFbi0sie5W9KJzXaA
 2wSfOuoAZ/iuoGHoWk9FN7wfJoW9ywQOxe+rgWejET7qPJJVN1AykEwkYzgRTiKfVuYC
 en8RaESaYgjiP8DP7DZMgPYAT+wnoI3hmMoEIZwDv5+lj5SlgF7JwfxMQQu+rQ22Qwv8
 hpiApp9Nx/DGT4IOZvKDA3j9s/7dI56NVbZCorBtz1pzlMXQE7wNUrdDWOkhBpxhiaUA
 iwXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lxblqv7D
Subject: [Buildroot] [PATCH v2 1/1] package/python-netaddr: bump to version
 1.3.0
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
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to formatting changes:
https://github.com/netaddr/netaddr/commit/2a407439ea0c759e7c44d27750e2aa3834915e25

License renamed afterwards:
https://github.com/netaddr/netaddr/commit/e3de33de5335ce8c66cf095f9543961f35f73653

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add license comments
---
 package/python-netaddr/python-netaddr.hash | 6 +++---
 package/python-netaddr/python-netaddr.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-netaddr/python-netaddr.hash b/package/python-netaddr/python-netaddr.hash
index f969aeecfc..1ad35966bb 100644
--- a/package/python-netaddr/python-netaddr.hash
+++ b/package/python-netaddr/python-netaddr.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/netaddr/json
-md5  c0d7b080da18c851ea436389813d7652  netaddr-0.10.1.tar.gz
-sha256  f4da4222ca8c3f43c8e18a8263e5426c750a3a837fdfeccf74c68d0408eaa3bf  netaddr-0.10.1.tar.gz
+md5  b0307617f8f3aa73bbcfadac52d91df7  netaddr-1.3.0.tar.gz
+sha256  5c3c3d9895b551b763779ba7db7a03487dc1f8e3b385af819af341ae9ef6e48a  netaddr-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0e53de62547787462f41eefb5cee31a14f7ea767ba0362c6f9304f1742486d47  LICENSE
+sha256  36dcdc429f76107d1697396ca0d8c43b343808c98beacb3405f472a76b65bffa  LICENSE.rst
diff --git a/package/python-netaddr/python-netaddr.mk b/package/python-netaddr/python-netaddr.mk
index 79e55a739f..7c26b16bb4 100644
--- a/package/python-netaddr/python-netaddr.mk
+++ b/package/python-netaddr/python-netaddr.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_NETADDR_VERSION = 0.10.1
+PYTHON_NETADDR_VERSION = 1.3.0
 PYTHON_NETADDR_SOURCE = netaddr-$(PYTHON_NETADDR_VERSION).tar.gz
-PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/af/96/f4878091248450bbdebfbd01bf1d95821bd47eb38e756815a0431baa6b07
+PYTHON_NETADDR_SITE = https://files.pythonhosted.org/packages/54/90/188b2a69654f27b221fba92fda7217778208532c962509e959a9cee5229d
 PYTHON_NETADDR_LICENSE = BSD-3-Clause
-PYTHON_NETADDR_LICENSE_FILES = LICENSE
+PYTHON_NETADDR_LICENSE_FILES = LICENSE.rst
 PYTHON_NETADDR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
