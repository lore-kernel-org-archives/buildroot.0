Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF24CEE32A
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C8A440DC8;
	Wed,  9 Oct 2024 16:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRLBBizaoFyh; Wed,  9 Oct 2024 16:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27FEC40DBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27FEC40DBF;
	Wed,  9 Oct 2024 16:08:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDB031BF3F6
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBB3240DBF
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPhLCFuW-u3v for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:08:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9EE6F40DC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EE6F40DC8
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EE6F40DC8
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:08:08 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a39cabb9faso59875ab.3
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728490087; x=1729094887;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DAkaagm1l9hx7+Tt9c4WMUmHucaXLmt73wgWlAsBeH0=;
 b=scEoVUdhG8gmcDj4uSXZIxxjFawKAHReszfVYP1d8Ph+BtFRmKA8s4q0Lq9eUOGX5i
 82kgGNylzItjtOSAWfwuyRvy6UM25WGSGISur2A+NbXZD3CQhCN49tWIcG+XpIsVAJwN
 STkF+sDEPr6bqbvGSA3WbX3xckcqCl6QH+7FSXw2oNrU67q0+rfD/WxZoFbjWydWYY1N
 /jYZw9I2NRJRPLjJCAN5rIPX/4kpO2IWFU4zlNynBkrH62SVUnX//NQPXB99Klj7Turk
 gi5r+iBik/WWSBQ0RDKfc72L2IvDd3uPL52tBCZGOiPXFvd3pyKJo4yVFXDC9VH/MYbR
 3fJA==
X-Gm-Message-State: AOJu0YxL8ZHu1SUQrTi+GnZhEKHHhhIP0dHjD6T5wB/vIVMljx2xXcyV
 8VizjQG1t+KPiRy+XmbbYsNBO3LE35HAnG9WCaKmxqy4jzrbZCv9NV55D/l8
X-Google-Smtp-Source: AGHT+IFngH6miFtDrhFwooC8cx8hXlkjgnbmlCAOVRspGMKJ2XttdOvXP1XdnnmwZ9+h4LiJwv+U6A==
X-Received: by 2002:a05:6e02:1945:b0:3a0:4d1f:519c with SMTP id
 e9e14a558f8ab-3a397cec532mr33996195ab.3.1728490087212; 
 Wed, 09 Oct 2024 09:08:07 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a37a7fd654sm24247215ab.28.2024.10.09.09.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:08:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:08:04 -0600
Message-Id: <20241009160804.3807932-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728490087; x=1729094887; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DAkaagm1l9hx7+Tt9c4WMUmHucaXLmt73wgWlAsBeH0=;
 b=cPkL9ZdRVHCUrckBWIFmYp40p504Wucl6itzyxig7dQCmcsDz8dEnxSjjsC0Rri7HM
 zrwYuFJye3anFRP96WlPKM86+rfpWpa3FdGRiwYCwxKS82+44K6wo4QImrskHoC8q/Dm
 oq7onIVculVdsBC9MfTK/vWK2XZOFf6emmjFYE5L5fybCbbCPYThMxtkz7MUXLjnhuXg
 Wz11PjqrHdq4Jpjc1/mddFHylCsDDTaQB51vO9ZFGv9HtGWgPZMxPlzMDAMeHgYJld9P
 Qvjf76y00BN4rU5oVKoIV3+vmnvrMqc83zLBbGsFMOuBriCi20sVeYhP0KvrH9Z44Yvr
 Lvcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cPkL9ZdR
Subject: [Buildroot] [PATCH 1/1] package/python-esptool: bump to version
 4.8.1
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-esptool/python-esptool.hash | 4 ++--
 package/python-esptool/python-esptool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
index 0a60fd7235..6eab790901 100644
--- a/package/python-esptool/python-esptool.hash
+++ b/package/python-esptool/python-esptool.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/esptool/json
-md5  4bcb7f6f3d2c9b4edb4caa09912f1dfe  esptool-4.8.0.tar.gz
-sha256  f933150b5753e7501024e4d237fe078a77913a0cb7e2f08197ef8d70306b1b53  esptool-4.8.0.tar.gz
+md5  c7d41d4c89ffa0fa0a9d490439358b27  esptool-4.8.1.tar.gz
+sha256  dc4ef26b659e1a8dcb019147c0ea6d94980b34de99fbe09121c7941c8b254531  esptool-4.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index df19daf61e..a4922c1e5b 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ESPTOOL_VERSION = 4.8.0
+PYTHON_ESPTOOL_VERSION = 4.8.1
 PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
-PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/d4/c7/b7e4b96a0e7d9b94fe953e1b55b3573bec498bac05f72e61e5a0e979e2c7
+PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/5c/6b/3ce9bb7f36bdef3d6ae71646a1d3b7d59826a478f3ed8a783a93a2f8f537
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
