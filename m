Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8B2C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 22:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97DDE410A7;
	Sun,  6 Aug 2023 22:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97DDE410A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2Ylpfs4QiJl; Sun,  6 Aug 2023 22:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 774AB410AF;
	Sun,  6 Aug 2023 22:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 774AB410AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93DA21BF59D
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 22:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E4E2400FF
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 22:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E4E2400FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugSg_QSIirMZ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 22:54:31 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41E7B404A6
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 22:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41E7B404A6
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-790c6d966e0so197596139f.0
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 15:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691362470; x=1691967270;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZgOXQmW1UwW8Q9EJCtpzTotkyNQboCtm0vGueqr1W6Q=;
 b=HLOYslvjwHmdiBd5ni/RvJXeYtzjjshDVEK56N/90nwBfMeHVt7Gswz64Oz/AlMpQI
 wwUnJz8pkbvrouRHqBqtnV6FxnaRUHiiU4gD9zm+EIhZl5+3tI0PpdK7PThys7eF20Gr
 ExnNk4lsAd3+m11k+eltCd3l/c+ledRnc1FaqUJzo3FcFK8TcKXBcRCDy+SfdKzEMryb
 aXt/zzeRw62A1CsAdGIooo9alFYaa63DqEW2aDbZ/KgSG2/FnwxN111w8y4Cp1n3tG9h
 Vo8skqrUfS1B/PMZln7q2n2m8zFZu2wxSsITBncrNtj1/Znf8BlCFRlymM3eW0AFjobS
 nDYA==
X-Gm-Message-State: AOJu0YxSoLcOk+T0NPYVSephmiIlqT6wUUMn6FvVbmmddgNBbNTUuBBf
 RhvsUkugNeMpTCm8iz7HcEAQ4Ql17mw=
X-Google-Smtp-Source: AGHT+IFsJBD6OCkcggo9xfnJYRzNQpORpT34/5SDZjf1IL2ay9MsOTxMtD10V3jqgL1IcueUuK2BDQ==
X-Received: by 2002:a6b:7b4b:0:b0:787:822:30f1 with SMTP id
 m11-20020a6b7b4b000000b00787082230f1mr9693854iop.1.1691362469911; 
 Sun, 06 Aug 2023 15:54:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 x20-20020a029714000000b004249d9e81besm1994182jai.131.2023.08.06.15.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 15:54:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:53:53 -0600
Message-Id: <20230806225353.4101350-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691362470; x=1691967270;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZgOXQmW1UwW8Q9EJCtpzTotkyNQboCtm0vGueqr1W6Q=;
 b=FBJOYxezEBxniCSULgDjNT8inlm1ZXgwQ5eoaouQ3Iv9m5nt0CCkbfkTxkN1y3pMyf
 9nxhole2S4sQTFGLe6+Qxl2eOJmFJdnrfX0sPqeKzQZul0pM/ARU+uAylaQN1nFGV0ir
 kqyZsTKnS8BSi7KZnRj0jUeKdJG9nuYAe9o06EgPVhKquUjAAvy+0NYhCXBDsojofMWf
 cuEkVefWE4QZlIU46gBiznjYraaBhVXGEsmWqjAgKykrFnuKHVaQ2hIOZAJuBN/2HJjE
 /JHZxmVGCOZKFHPucSHVkeGN53WiuBuoTJ4WgAd12FOjJ+0yhvRF54rjTbXPqp6vhIvn
 Q5Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FBJOYxez
Subject: [Buildroot] [PATCH 1/1] package/python-docker: bump to version 6.1.3
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

Remove no longer required six runtime dependency.

Add new explicit urllib3 runtime dependency.

When we bumped urllib3 in 074bc42971181ee71d8ff5bd57641b7b7eb7580f
we broke compatibility with python-docker.

This compatibility error was fixed upstream in python-docker 6.1.0:
https://github.com/docker/docker-py/commit/3178c8d48b7e7414d1f864ba1fe77139f4e923eb

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/4811724555

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-docker/Config.in          | 2 +-
 package/python-docker/python-docker.hash | 4 ++--
 package/python-docker/python-docker.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
index ae5a7a5181..944992f251 100644
--- a/package/python-docker/Config.in
+++ b/package/python-docker/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_DOCKER
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
 	help
 	  A Python library for the Docker Engine API.
diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
index 3fc3c4f0f4..8e561e93a7 100644
--- a/package/python-docker/python-docker.hash
+++ b/package/python-docker/python-docker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docker/json
-md5  8e85e23ed30a3d07129e197d35e56eb4  docker-6.0.1.tar.gz
-sha256  896c4282e5c7af5c45e8b683b0b0c33932974fe6e50fc6906a0a83616ab3da97  docker-6.0.1.tar.gz
+md5  c319e75054a226776f32797e56ec82da  docker-6.1.3.tar.gz
+sha256  aa6d17830045ba5ef0168d5eaa34d37beeb113948c413affe1d5991fc11f9a20  docker-6.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index 4da972e017..ab03ac6af0 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCKER_VERSION = 6.0.1
+PYTHON_DOCKER_VERSION = 6.1.3
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
-PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/79/26/6609b51ecb418e12d1534d00b888ce7e108f38b47dc6cd589598d5c6aaa2
+PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/f0/73/f7c9a14e88e769f38cb7fb45aa88dfd795faa8e18aea11bababf6e068d5e
 PYTHON_DOCKER_SETUP_TYPE = setuptools
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
