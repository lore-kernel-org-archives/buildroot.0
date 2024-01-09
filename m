Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E245C47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B1C41929;
	Tue,  9 Jan 2024 07:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44B1C41929
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GVmF4HUa6WZ3; Tue,  9 Jan 2024 07:37:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859FC4191F;
	Tue,  9 Jan 2024 07:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 859FC4191F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93D5B1BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 791FF60BF2
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 791FF60BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51YQdEC6FmIp for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:37:13 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7604260ACE
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7604260ACE
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7bc32b04d16so121171739f.0
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704785832; x=1705390632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uKITMK6D3HgKuKAla+pqZLOAyHGxNDFQiCn9x2MdSjI=;
 b=nZsesrkVz242do/PHpT0oss08V9Fpl8UzrsjUefAHjQGwgCYKa1dlOAFTbhysWeIoe
 N4a2+pCjg8iORDMZJjZ84yXMIU4PYldtNG6Upotk9bJyv3PE7siyfQvmTmsYrToDhZkK
 Lxf1BjyPU1cf5lfAE6NhUwJyBJl/o2RN/CiBuOTevvcyeYiztHfn4ohDJU9yA8CzvVk2
 HiE3IYnWEShhxohdCsEXmz9Q6XsdAfwNFIhnqu7ZrJziEg1V8SHfUV+Mhfy8/P+b+4NS
 dzsYE/b4hsV4+Q72FTZgqxoBub/xFt109N3KrshSaaztjaqdrNsqIRSgcNU9t7+H8oJu
 vy5w==
X-Gm-Message-State: AOJu0Yxjr2oEGnZv6f2RksUKWoJM1raBTD2v+5Kv+qGkZP1V2eSxnCGW
 Xkeut92Z4Ew9iHpidOeLLFsOWpi/0vclmA==
X-Google-Smtp-Source: AGHT+IG4RyEEDTseMdyXOd8DhDP+hkqbXvYIIj6h/tAz4TCB8P8jCan8ijN/96bbGaDmhactOQUvkw==
X-Received: by 2002:a05:6e02:1c8c:b0:360:41:eeb4 with SMTP id
 w12-20020a056e021c8c00b003600041eeb4mr5884704ill.42.1704785831925; 
 Mon, 08 Jan 2024 23:37:11 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 a21-20020a02ac15000000b0046dfa285b6esm486509jao.88.2024.01.08.23.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:37:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:37:09 -0700
Message-Id: <20240109073709.4042044-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704785832; x=1705390632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uKITMK6D3HgKuKAla+pqZLOAyHGxNDFQiCn9x2MdSjI=;
 b=ZfehLHysHjlOSjClBgEd09Ygeimbx1RRsJOgZh/g3dH4XUqdoz4Yli0Wuow6ARWe2+
 2tAwvLWt+8jb4+twyoqgIFeu/PLQQMhGSQ1IvZZ++MDAvd4MEiSj0jt4kF1KmP3ed8wo
 CLYM1CzmtaB6cn9aN94bmPbs5dWHYMchA+9huTN5yzcnS4FbTHGcW9VSbQ7TDgZjmbLP
 nAfJ/jZw+xFto0i6XDeRMdIYuAHOXF4PjLQBOMPPIEhGWYh6U6VSuFHsPGd7nOr/cyGM
 IU693s/iLAU0NU3vUsRWyATS6RTrjBrCel2RyDkeO/goSKs8OdDrCB+RUJKI46Gc8FGY
 PD6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZfehLHys
Subject: [Buildroot] [PATCH 1/1] package/python-flask-smorest: bump to
 version 0.42.3
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-smorest/python-flask-smorest.hash | 4 ++--
 package/python-flask-smorest/python-flask-smorest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
index baeddb0e6b..b468c48fd8 100644
--- a/package/python-flask-smorest/python-flask-smorest.hash
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-smorest/json
-md5  3d8c01cfe9ec4ba16636d6a3078edc87  flask-smorest-0.42.1.tar.gz
-sha256  7fde3f349d464c408c73b7cbbdb1884c1c36cc8c23b2562aba28d9bdfdd14cdc  flask-smorest-0.42.1.tar.gz
+md5  b10a7a0bdee4505dec3cc7652560bc9e  flask-smorest-0.42.3.tar.gz
+sha256  736ef072bd5522de750a5a9d9f1bfb6d750d05c66e1b3702bc7a20e4277af9bf  flask-smorest-0.42.3.tar.gz
 # Locally computed sha256 checksums
 sha256  40999ea1d9c1b8202fa44f8e6849a557e22df892481e067abf999879064b9521  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
index 8a11e96d01..6eb1abc6fa 100644
--- a/package/python-flask-smorest/python-flask-smorest.mk
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SMOREST_VERSION = 0.42.1
+PYTHON_FLASK_SMOREST_VERSION = 0.42.3
 PYTHON_FLASK_SMOREST_SOURCE = flask-smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
-PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/be/6e/8e3d0287bfa2da6ca7cf94cd9c053ed209764538dd5fb1d96f535e4d43bb
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/25/91/da55ec1288e821069ab61b6db4acfa171fa268c426523bb4f3a8a91210db
 PYTHON_FLASK_SMOREST_SETUP_TYPE = setuptools
 PYTHON_FLASK_SMOREST_LICENSE = MIT
 PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
