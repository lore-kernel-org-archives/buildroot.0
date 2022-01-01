Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD466C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 05:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23F4A80B4D;
	Sat,  1 Jan 2022 05:16:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6QEkbZqtiTS; Sat,  1 Jan 2022 05:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DC5A81296;
	Sat,  1 Jan 2022 05:16:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 948C81BF5D7
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 05:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E514401AD
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 05:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gf8qp8D_z1uf for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 05:16:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C01B400C7
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 05:16:19 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id e8so22202475ilm.13
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 21:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5YkP0Xlw3bhPLjtNBwfGVes182C35xi5xRAtkCom/UA=;
 b=VPhmLMhqeOHVWG6in5mnFYAtDXlQQEFPecHFUBsgtGWwLnEtxKEiLUDykyybB5X2Mc
 Dj6+g94WUu3ICjroYAckl5VbgIXU2mibXjT8sLcVRshlIeVjeVSGxVWr6lECFnSiMzI9
 Of93fEl/6dF0KFgLUKIxfHeN+BIo1kmaXaL0FJlxRFIHZjYGIfVEpjR95sSJAbKUYemt
 qumbZQwNTnsrFMYPSz4qNw2VEr3vuallU+QgKtbZeLGKnKN2Qr8rA/qq9bI8iejYhsTj
 9/Xudc0tJeIHP8wp9EI3cobDzeS2KzbbTG731ORFN9v2H/ouGL9DRVBPYSVzBxWMrXLK
 h3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5YkP0Xlw3bhPLjtNBwfGVes182C35xi5xRAtkCom/UA=;
 b=I1FCo/Ic7/6tMAYYWv5/eTIYtJVDrUgXtvq2+THsHRtaa36DGGPz3OJWyHLUrGAbJO
 +fXtSJ+3EwpWhK9DMsjbqdx7BgX7LVnN8N1iK5i1r8dTkrpUiN43FVZdbwlplPqQ/rQa
 oqYGrsT0nlecds6Xa761XqfVCwoSU775a3hfI+JrPjn2+nE3t9mBddEFLO7iX0gMT5tg
 MEL3iAqdwCGR61POLwbqBc7W7Yq/nijBj1bjqS9whB7372BZTEymW5qnLEy8sDJqAdq/
 tNyMKKZ3mxOAufBjhPX4/eYguVSmckE+blIEe0IGF82kvOR2Bb2pesNn4drNOGPsJKGg
 j93g==
X-Gm-Message-State: AOAM530624HyXnxGMTB7K3KV6N4c7DE0aOJljHIgU6bJq3igOJE5w5ar
 b0xejGm88eJQmAfFWZAojIKUznqmQWY=
X-Google-Smtp-Source: ABdhPJxuhEhCzjK4uIBZaRQxiDi7Prwi7bV9r0noNVg+zmHI/yh/jcbiAA2NhfidwUkDu47BBHrUjQ==
X-Received: by 2002:a05:6e02:1486:: with SMTP id
 n6mr17598717ilk.271.1641014178346; 
 Fri, 31 Dec 2021 21:16:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id s12sm18388411ilv.88.2021.12.31.21.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 21:16:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 22:16:08 -0700
Message-Id: <20220101051608.1993550-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-async-timeout: bump to
 version 4.0.2
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
 package/python-async-timeout/python-async-timeout.hash | 4 ++--
 package/python-async-timeout/python-async-timeout.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index 1a64c3a77d..0ecf1ef5ae 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-timeout/json
-md5  2871f3853060ac7e76e6278b85dfb3c9  async-timeout-4.0.0.tar.gz
-sha256  7d87a4e8adba8ededb52e579ce6bc8276985888913620c935094c2276fd83382  async-timeout-4.0.0.tar.gz
+md5  10571272b2e0fab839ec23f8293bf482  async-timeout-4.0.2.tar.gz
+sha256  2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74a847056bc2976b15  async-timeout-4.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index 1d2c716fa9..b3c5f79e45 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.0
+PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.2
 PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/28/0c/1cd218ea84964f0740a3ab6152dfa99661174abdd8e4053e06c0285ac42a
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/54/6e/9678f7b2993537452710ffb1750c62d2c26df438aa621ad5fa9d1507a43a
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
