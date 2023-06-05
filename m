Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE5FC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8FBC41805;
	Mon,  5 Jun 2023 07:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8FBC41805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUDoxSx7PFKd; Mon,  5 Jun 2023 07:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93707416AE;
	Mon,  5 Jun 2023 07:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93707416AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FE511BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16C7F4051F
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16C7F4051F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0cNaa-2y5B3 for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:25:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D7EC40472
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D7EC40472
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:25:31 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-77807e43b7cso5885639f.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685949930; x=1688541930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1RF6l0ex6QxtyUZxgu7AzBLo6Ep5JYMp3veN6ykNeuI=;
 b=R0JMTGTqDWeJqMYINyGIscsmBLc4C+ZR5oRAS+eC+8bKewKLQvjJzt/jCkkOjatedN
 O2kZAx6WZmpmtcMfkuUjZP4Qd2NYlNNPSf1UZp7l7CLjD3gLIVYs4igy+bDttll+E499
 aCEbJbaduBEaE761SQQ8qKqCFc5VgbWPglrg4ePUqf47W77FQmVdRsk2OZXlOF9nqhPN
 7I3vjlBbhk9PkfyLv62lBZT+8Pxk5QMEOtrgaMk/uev9v4Y/gf68UtU6h/XiUk8pq4TK
 NxyqKdmMtGzJ54sIFD66E/eevA+gwtZYMJbkNkpW1QFXxMM/Tm5STZ2bm3tgzO9l+wiY
 EK9A==
X-Gm-Message-State: AC+VfDyBzhnjvNXgVvfP5paeiikuMJdPQrxWwCI8Xaokk7jJOiUk9heL
 6LScntWusN/G8Gz+SpM5mH031/KzyV0ynQ==
X-Google-Smtp-Source: ACHHUZ7SzbnZ+QgNPZL7mjtd99PwPOkRCgKHZZRm9wyVFrJhguNXCCY/BYnmBb4Ru8vVRnvilxjJHA==
X-Received: by 2002:a6b:6408:0:b0:777:a581:e0b4 with SMTP id
 t8-20020a6b6408000000b00777a581e0b4mr6427576iog.14.1685949929953; 
 Mon, 05 Jun 2023 00:25:29 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056638120400b0041f67b5be0fsm98611jas.169.2023.06.05.00.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:25:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:24:54 -0600
Message-Id: <20230605072454.1883633-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685949930; x=1688541930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1RF6l0ex6QxtyUZxgu7AzBLo6Ep5JYMp3veN6ykNeuI=;
 b=YYZ0cWlWpVH/0ESgwdfqIVTHHHrqxnUOB95XfoLk25Lo3XpgpKXHcCokZNfziiVrkw
 pCMbY4fkBd+l0J3tiPdk25nccagc+ZI9JyVFw7J5MD8AHApSVHDknNZHsL4Vn8PkjO34
 5xEl4ahOeXtQD2WgzXW7ChZYgNrhPfFCIeIuiyd3+SFTdpiQ+fw+xTiQX33clKSJK8Kq
 n02MzBvV6Xk8I3NN2zB/+ut8SLRjOQJQVTdPrZ/hTZzw31KPfmUaFxMcln9Z+vXa76uo
 c5oHv0FHzX77VD7RjxJfSWdjD/cQC6iUhP2TRI8NCecUHfDrRV9UH5je+8BIbovLqUvt
 xbUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YYZ0cWlW
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.9.2
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

License hash changed due to syntax update:
https://github.com/aio-libs/yarl/commit/cc4a11e961fb24b5658df1c5125b26cb44c0b875

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yarl/python-yarl.hash | 6 +++---
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 9725e0058b..624297aeba 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  57c82725b9f4895eecee45faf5e61a54  yarl-1.8.2.tar.gz
-sha256  49d43402c6e3013ad0978602bf6bf5328535c48d192304b91b97a3c6790b1562  yarl-1.8.2.tar.gz
+md5  4e46a0c7078d34d9734a7c5d182dee92  yarl-1.9.2.tar.gz
+sha256  04ab9d4b9f587c06d801c2abfe9317b77cdf996c65a90d5e84ecc45010823571  yarl-1.9.2.tar.gz
 # Locally computed sha256 checksums
-sha256  56d6ac6c8105c0a51304c21db060e361af9a8ea0af9a75c239c28b5d13693838  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 77e0c91383..e4424ff577 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.8.2
+PYTHON_YARL_VERSION = 1.9.2
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/c4/1e/1b204050c601d5cd82b45d5c8f439cb6f744a2ce0c0a6f83be0ddf0dc7b2
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/5f/3f/04b3c5e57844fb9c034b09c5cb6d2b43de5d64a093c30529fd233e16cf09
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
