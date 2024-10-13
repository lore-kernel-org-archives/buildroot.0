Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B30CF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 19:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 664F680E45;
	Sun, 13 Oct 2024 19:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWiRHTpL8FIl; Sun, 13 Oct 2024 19:10:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7619B80E56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7619B80E56;
	Sun, 13 Oct 2024 19:10:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE2F91BF46A
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADD7C80E56
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXEQDNbQIkRo for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 19:10:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95D0280E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95D0280E5D
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95D0280E5D
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 19:10:25 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-83542d9d7c1so160276839f.2
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 12:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728846623; x=1729451423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ELt2QVVarlolQGHPl2mQQGtjRBgoDf1d4CCLUb3Y72g=;
 b=c6HgAaJCtoIeYZvFjW2GnuyGpBozfPw8x/KLkaTLJ20XhekhpqTTRfLUIHYniDDTG2
 i1kAmrMi/TELgvQ7Gw/t8QUd8qLzltOOLxqGH6uFXMcYP0psPZI9ao4qsSoVO26+LJOb
 QqcwKVEZFrvReOzJOfyJ65nruORd7CrEsIv5ZQOuUEVfegmXWc3P4Cp14FbRmppW0zeW
 wrxgp0A1lS4OD4xRA4ATzO9MHob1Jp/OQduqGkf8fcb2QdwwKbLOgWYAKfZ3sqzZyLUB
 8/Xe4I8xRlGC0flp9b5FnCxmIWW+ALfG1KFnx5PZkzF0MkT3GpgstL+LeU8ltvSb0rv5
 9Adg==
X-Gm-Message-State: AOJu0YxfF2fBbWuBYqiOT2IlCVX6aGdSiwws088kJ/YAq93JHWP9a3iJ
 5/tMq6M76vJPCBogw7BJxX28MwdZNf62+cPyrOLzuO+i2/EThobBsChtSQ==
X-Google-Smtp-Source: AGHT+IGoApBZbD45iLUFCNduGlEb5RzgZ0tQzsqIgd2Pp+1cUFVBuqmLSqydywc//xFnX1X+ZPE0Hg==
X-Received: by 2002:a05:6e02:b2b:b0:3a0:9952:5fcb with SMTP id
 e9e14a558f8ab-3a3b5fb6490mr67333895ab.17.1728846623467; 
 Sun, 13 Oct 2024 12:10:23 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbadad9aecsm1584005173.159.2024.10.13.12.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 12:10:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 13:10:20 -0600
Message-Id: <20241013191020.2799008-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728846623; x=1729451423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ELt2QVVarlolQGHPl2mQQGtjRBgoDf1d4CCLUb3Y72g=;
 b=XhoWsQdSlUO3F6asBzTwlKYy97hGs62FQGQR+/bbytc7PHZBHqsBCSN4bmlSifcVHP
 FeEbwwRPmbaXayxSELaijaHR2C89+esQvfkG9uRtPxp/fJSv779IjRugl0TviUGr/Aql
 pvE5j36v6w5n6U8Z/D9aZp3GHYhe+GdQXmMOMO822ZwOzocspRTpEYBqEwkYOvfbRKE1
 1YwSbVSn+mjGjlRsTUYNM4vDaZ2/hp21gd61NLWMUaZcDBJs/w45gBFQRLt1wKYIC0KL
 qCq+q904lna7EdsugmLQSkIcuA5JbsLmpmc1mkRorIxZ87sY+NAjBMLuOFPuh/SWyJgF
 8Scw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XhoWsQdS
Subject: [Buildroot] [PATCH 1/1] package/python-sh: bump to version 2.1.0
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
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index a674475b86..79a34056dc 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  d6963ecb396045a3ff280baa1fefd79b  sh-2.0.7.tar.gz
-sha256  029d45198902bfb967391eccfd13a88d92f7cebd200411e93f99ebacc6afbb35  sh-2.0.7.tar.gz
+md5  eba6bd8ec843a707bdc481577835980d  sh-2.1.0.tar.gz
+sha256  7e27301c574bec8ca5bf6f211851357526455ee97cd27a7c4c6cc5e2375399cb  sh-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 8f056aaa02..44a19b7baa 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 2.0.7
+PYTHON_SH_VERSION = 2.1.0
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/14/7a/5148402146d360a6d15922814a3b065b52be3a5fe878a8834d3ce4e7d33f
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/52/12/b7965006c5adc57ba5459385358bd27c4983cd490884a75be86eb1d3efeb
 PYTHON_SH_SETUP_TYPE = pep517
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
