Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ADCC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 23:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA8BF40296;
	Wed,  8 Nov 2023 23:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA8BF40296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHmw0Mlp447z; Wed,  8 Nov 2023 23:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C165D402F4;
	Wed,  8 Nov 2023 23:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C165D402F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE7711BF3BA
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D49D360BE4
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 23:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D49D360BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0rleJ3AMmoj for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 23:39:36 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F072160BE1
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 23:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F072160BE1
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7a66b5f7ea7so9415339f.2
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 15:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699486774; x=1700091574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRIpu59QlXpn2ukC5HBJLyZ5F/3OXBTc+0MFewmqvr0=;
 b=iJfdmvdj7rIIZbuGs4BU00dfz+jsl6dtbf6ehqFdJYx30nSDbbzBtnyFqjuUOw9eH/
 Ba/6uXC4nUHJGRSsVl6ZlNfPiby18FePWrlCicg0pFXoJFlL6D903WKZv4Kr0zGh1k/z
 Zk63rTX44m6Ik+wJl7SH9SzRPPdpwLetAFMCsMX75l747iFzZ1EZjg/nB793OpzCYogx
 tGgDQkRvDhM9RHwc/53hD126kwt9rInDOCU3PVSfswgwoFMYLp3nbfytPJG1dxad3ysl
 5tWjS3CZ+KgjZvdeJbYhI4xaMNuoWCmrsq9UUvg2Uo7KI170WCWHTlIIxUFVJb29VgNO
 G0Vg==
X-Gm-Message-State: AOJu0YzgLwdJnBTO7FD/Ux1WX07BzUqA+BI/q/Hrrl/zB01L1sDnUsW7
 CtWPP0EObg/uNd/Yv3eUrBANemNbaNo=
X-Google-Smtp-Source: AGHT+IEJV5Aywptb0rU0pnXluGRWCERX6aK5juBmwROJbJ46RJkOQntPuYmr7m6I+R1aSvdWlReQkA==
X-Received: by 2002:a5d:87d3:0:b0:7a5:a391:73ae with SMTP id
 q19-20020a5d87d3000000b007a5a39173aemr80117ios.17.1699486774381; 
 Wed, 08 Nov 2023 15:39:34 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 z16-20020a6b0a10000000b0078754bed499sm3775007ioi.37.2023.11.08.15.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 15:39:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 16:39:31 -0700
Message-Id: <20231108233931.3651029-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699486774; x=1700091574; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rRIpu59QlXpn2ukC5HBJLyZ5F/3OXBTc+0MFewmqvr0=;
 b=K8Lkr+8i0QKp3HizMbpAbUMEYYVsMy0vnu2vs+uz5re0bkHG5X8GNeqtwOrgzB24jO
 hiPCWIfV1i9Sl8sc9VkmJ2KMUGeHnQlzvwW6YEJRM/kSYm7xC2Azz48RcFohTdlsb3Gh
 sPzwx2oSMtmDct/xHKdFoVHLctP2IS+iMRpVoAFbPiXUO1e/pS9ReqUq4VGkETxJb6tQ
 pXJzGuH9QazAQ6WbmMJNlrJmvSo3W0bj2aVPWv3ABUxk9rl0Dbcx86Nh3vrIUZDPSXt8
 Muffq8lp2Yv13EdscQCHo2OJl1MUxAGRqTm7OeU8flZyoC4UMNIj3uAeJ3oYzdLsbOx3
 BXjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K8Lkr+8i
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to version
 3.20.1
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
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index dc277d16e5..cb60216a26 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  3cf5c42917509a199c3105466435c425  marshmallow-3.19.0.tar.gz
-sha256  90032c0fd650ce94b6ec6dc8dfeb0e3ff50c144586462c389b81a07205bedb78  marshmallow-3.19.0.tar.gz
+md5  c6093f980a650b1088bbc5610055a05c  marshmallow-3.20.1.tar.gz
+sha256  5d2371bbe42000f2b3fb5eaa065224df7d8f8597bc19a1bbfa5bfe7fba8da889  marshmallow-3.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  759dc79c383ad79340c6e41f712e80407fe0d2cb3cbaad1ed98aa9c3e28a602c  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index ba6da6b29c..afd4068f44 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 3.19.0
+PYTHON_MARSHMALLOW_VERSION = 3.20.1
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/5e/59/dd465e5ab0ccb879c410f88c75189a19fd437b12cd9a03b31579aef58709
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/e4/e0/3e49c0f91f3e8954806c1076f4eae2c95a9d3ed2546f267c683b877d327b
 PYTHON_MARSHMALLOW_SETUP_TYPE = setuptools
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
