Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4D5C77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 08:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD77881FAC;
	Mon,  5 Jun 2023 08:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD77881FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUi5RaBMnA8I; Mon,  5 Jun 2023 08:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DEB81F39;
	Mon,  5 Jun 2023 08:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DEB81F39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89C3E1BF4E7
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EBE8417BA
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 08:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EBE8417BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q65xrUzK-Y_E for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 08:14:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C56041762
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C56041762
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 08:14:26 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-33aa60f4094so13985285ab.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 01:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685952865; x=1688544865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r14hBj598pxiRgaXNfOnK14NMCKaYnM4SGOUMQlGdd0=;
 b=Q8efkbe8co4CKomOf/fdnDaZhL3LpTjq1mBJwtt7jdmQvS42vsrws1hURI5lQ/fvKg
 f6Vys2gUIYluz4PAvbBaQeVyZSYBMSxwktPxzcUnbjSSTBhg3HzPadHNZxOglcVFL+c5
 XUniC6wR7BiBsLNILAMex6I/w0nMMXvyoP0Ek15RtZk9NA0vXvz1sBOWn0IwMO4feVvz
 Tv1G9XlSJAZJoGFuaCKQ8G9Gxy5RJI5oEKu9hXIf3oTl9av+JNQYUJEn0xPGF1bs8P1l
 cfcpZUcTaxAKf04Cf7+Z2++w1Sjxu/oQt6l4Yhz+Yu15kHNhXgaGWzT47bE76LkeXNUJ
 hf5Q==
X-Gm-Message-State: AC+VfDzBUfcK+x7CdnkdQOUsyj6/NAEr9CEPFuz84qn2ZD6JBIqLIBU0
 evFotz8OOj6j8fdGq1egqAI11UWyDoA+mw==
X-Google-Smtp-Source: ACHHUZ6Xk9feOsFmWSkEw8RD5/I6sTE/A1vHnF3t6mLZ7NNx1tio7PajeKmO6PEmcFZZ6nWUPkfUiQ==
X-Received: by 2002:a92:511:0:b0:33a:fcd5:a124 with SMTP id
 q17-20020a920511000000b0033afcd5a124mr10179207ile.4.1685952864993; 
 Mon, 05 Jun 2023 01:14:24 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 g6-20020a0566380c4600b0040f7db6a264sm1929126jal.114.2023.06.05.01.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 01:14:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 02:14:23 -0600
Message-Id: <20230605081423.2041317-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685952865; x=1688544865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r14hBj598pxiRgaXNfOnK14NMCKaYnM4SGOUMQlGdd0=;
 b=WfFrBCweRG5VS9QR3k9vIeH9KKG9Wy6BvqWZvnP+Q7ANIEX+zCwS3bMBky3wi16bDj
 LrcpZKjm1DnYz9nePJdQuOCm9YrIKp34oywlqpq0VVNGpKNT4f/pZ63I82w9VLpLxNOb
 zrms29Axk1sBix9y0qs/JNWCalwhSv1tnjzFiFf+VjEUbqzg8THAxng4jmzaDyOPgJ8e
 BCv+taCEJjx1gUeipkELEzf/hKzaPS2wvD6N4wvrVCLwgC3Ik+SiRl4pIl5nmn0twNeO
 Nzyyfk7kU2658b8WHEREj5jGcsCJvHGIge6AT+aIX9yMFtzsrMhBIFs6/FRL3C0+ZTQ2
 xvKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WfFrBCwe
Subject: [Buildroot] [PATCH 1/1] package/python-flit-core: bump to version
 3.9.0
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
 package/python-flit-core/python-flit-core.hash | 4 ++--
 package/python-flit-core/python-flit-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index f63a64ed1b..4d4907f5dc 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  7c41da13273f7787709a24f74e0f5a99  flit_core-3.8.0.tar.gz
-sha256  b305b30c99526df5e63d6022dd2310a0a941a187bd3884f4c8ef0418df6c39f3  flit_core-3.8.0.tar.gz
+md5  3bc52f1952b9a78361114147da63c35b  flit_core-3.9.0.tar.gz
+sha256  72ad266176c4a3fcfab5f2930d76896059851240570ce9a98733b658cb786eba  flit_core-3.9.0.tar.gz
 # Locally computed
 sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index f96191ade6..ea887a0258 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.8.0
+PYTHON_FLIT_CORE_VERSION = 3.9.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/10/e5/be08751d07b30889af130cec20955c987a74380a10058e6e8856e4010afc
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/c4/e6/c1ac50fe3eebb38a155155711e6e864e254ce4b6e17fe2429b4c4d5b9e80
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
