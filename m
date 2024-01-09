Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1251C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79BAF4194F;
	Tue,  9 Jan 2024 08:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79BAF4194F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrDBrqKRDego; Tue,  9 Jan 2024 08:39:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B891F417FB;
	Tue,  9 Jan 2024 08:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B891F417FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 476BE1BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FAF240A68
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FAF240A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3krngh3O6Cks for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:39:27 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE8D541A03
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE8D541A03
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7b7f9fdc14dso130077039f.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704789565; x=1705394365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iNs+iB6+DqSUigDihuphg2mCKhzMT3J3s/xwTt+2wjk=;
 b=qPmgjMJEFT1f3nAUcVrnD19ZyjLwIfE7fPscBm6ypPPNAx45RlgvzRqIiOf5WJQnu0
 OndGfF3GQew83rIwkIuRt7NKGbbSQie0puDtTBlubrakxgyls7+BELEdIa4uoYmRbLtY
 apyH8OLjl/Lw284rC96rcArEpSG6l2uRVSLLhoQHX9dn8pHhE6dBYSuezvm0zRpCEHyd
 9MJc4S6YkMcqvbPGpQWqlvmJLgyAQI5lD2ZzOgQgAoTv0azhZQ35uL3b6kXLJnA/ulaa
 3sMDFQXqDptETKD6pEIhpeYRuOe6fDL17acHlGVR57e4q0zXIpDxBTU/vY3y1Q6MB1XD
 a2bA==
X-Gm-Message-State: AOJu0Yz6wcc7ul2ogfjbcfbtPJbN9m9DIe8Zw+gbninz4iYHpZNGWWDs
 U0QbsOksVFu8tDkemRVlXiQGh4Ar9ZNhcg==
X-Google-Smtp-Source: AGHT+IHNrlXCvdwsF+SC7LOrVOtY+pYajbuRPqm6OpV/HlKkxYLMMPx9MwdsoKeeFwNVk/0rb54a1A==
X-Received: by 2002:a5d:961a:0:b0:7be:d865:36f5 with SMTP id
 w26-20020a5d961a000000b007bed86536f5mr793853iol.1.1704789565368; 
 Tue, 09 Jan 2024 00:39:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 r26-20020a6b441a000000b007bc4a820644sm399817ioa.34.2024.01.09.00.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:39:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:39:22 -0700
Message-Id: <20240109083922.4085395-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704789565; x=1705394365; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iNs+iB6+DqSUigDihuphg2mCKhzMT3J3s/xwTt+2wjk=;
 b=lCMkyZNOhh3A7cc9xt/ldZsXAQa+uNxV9TKkYiqxjNSyAbK/QoNWTSBNO+WiSj/0vD
 E0YFaE78ZiM0EBAsYtJoAIFSE/z0vxkpFIOs6vD+d5bDDa1qu6AGuVhsiQxYoJ95/wh4
 BAz7JTRmJvPSqreziJwRuvnrr+isRTkyn/+LYLbZY2v74egtqca9nGc65T8DSoZz53Yg
 Ehuw08jpXLCZIqowTMzNI1xh8uJJHfnLhwfadSOYMxU/ivq61hQSN+GM8yY2xv4wSMZX
 7UhKZG0bcyxwgl0XVpdjvtMcHbGQ6RZDSUDwIjaRVH4isuAz6TD5fTHV5I4hVC8eGxBm
 RhKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lCMkyZNO
Subject: [Buildroot] [PATCH 1/1] package/python-jsonschema-specifications:
 bump to version 2023.12.1
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
 .../python-jsonschema-specifications.hash                     | 4 ++--
 .../python-jsonschema-specifications.mk                       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
index 5aaba45210..aa919681ac 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema-specifications/json
-md5  d37762167688d8a05024b92dc8a1e20f  jsonschema_specifications-2023.7.1.tar.gz
-sha256  c91a50404e88a1f6ba40636778e2ee08f6e24c5613fe4c53ac24578a5a7f72bb  jsonschema_specifications-2023.7.1.tar.gz
+md5  de730f6937d1e3660a2d835c4f93f31b  jsonschema_specifications-2023.12.1.tar.gz
+sha256  48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc  jsonschema_specifications-2023.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 7a19eee423..40879898c9 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2023.7.1
+PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2023.12.1
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/12/ce/eb5396b34c28cbac19a6a8632f0e03d309135d77285536258b82120198d8
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/f8/b9/cc0cc592e7c195fb8a650c1d5990b10175cf13b4c97465c72ec841de9e4b
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE = MIT
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
