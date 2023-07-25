Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B006C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 14:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB2781771;
	Tue, 25 Jul 2023 14:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB2781771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tU7MrkZcr1Hm; Tue, 25 Jul 2023 14:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AD7681746;
	Tue, 25 Jul 2023 14:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AD7681746
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74A281BF588
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D25B40108
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D25B40108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9EcTX1vDOpeK for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 14:13:05 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 047484003A
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 14:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 047484003A
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-78847bb8940so286621939f.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 07:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690294383; x=1690899183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ynr+o023OgpHOM9muOe0qHUTjETZT03JWQ7dh92qc2k=;
 b=gIIvRD1DkTDPmrktBvtHvy1TWA3KphVkI4+RfW0yDMyUUGA/cqMUFwcVK++o/D7nWy
 EyT2vTW+u9UiohyqlRHwptIE+N3bRKnvUMxdZvgJXINcPdzs2HDIA+/9E+XLXNNcHhyi
 qgdBUF7F1BAILMmp4/XU9OHMi1OizhBOjixZZkpD70WoHXmYCTF7vM+CEreMVGiPVdgc
 mZk11qSxMyl+fWGUgSGuO/DARfYoB1M3MsyGjiDVmKCpbFVzVmkSgXbVCmU41r3hqtZQ
 A6WgR3WrPuOEnttbmjDvSZbSAghTOyCF/18RTcI2NDERUMTVt4UFzj8QlDw6hHVMBsEf
 J2aA==
X-Gm-Message-State: ABy/qLZBCu++0xWuSFx1iKGAJlK8TaKNTotV8nyWj5K5VtHz4bn5zGOi
 mn5eZB4qi9akBJMvtvbrCFZ5vQ8GM3A=
X-Google-Smtp-Source: APBJJlF2LTbIDJmyXJVk1Oi5jgMf+nt/4abu5v9s5GXf/BRgZHybiVxZld81IkOSnNHDrDt8DLSqvw==
X-Received: by 2002:a5e:aa18:0:b0:780:ce72:ac55 with SMTP id
 s24-20020a5eaa18000000b00780ce72ac55mr3273524ioe.10.1690294383577; 
 Tue, 25 Jul 2023 07:13:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 e18-20020a056638021200b0042bae96eba7sm3614478jaq.7.2023.07.25.07.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 07:13:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 08:13:01 -0600
Message-Id: <20230725141301.313135-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690294383; x=1690899183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ynr+o023OgpHOM9muOe0qHUTjETZT03JWQ7dh92qc2k=;
 b=EQ3d5i7PBF+5Ljy+vrGtRlmWJhmE3yKqa3LIQl/vnJ5DQJ36tJDa+CpTIyiM9M8NeS
 nPCU9JE5XUwBo3gXeX8vTOQZUQb+b4IE1QFrwthxOHnwjcdyql/V8MNEkaWDrAKsneL7
 T3mxvlBIDmGCnnGce5USGzF//Iz6YvzMj8IW/ti7QknEv0WDv2x0mvP1mJm6wtDLa6I+
 L3lnaKgPdA4OPRURsuxX4CscWIcwtk12gBKBq6Ft75plYE6uCm+12tWwim1weY2Bzd8i
 3kqL9oHt8Zezk2ugvRsbUQ9r3ogr5nZnKQp7LIokrCvPPEwaHms7jwBhQD7MhVyMBrxJ
 QMsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=EQ3d5i7P
Subject: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump to
 version 4.7.1
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index f9d1de5e28..fedb9e0446 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing_extensions/json
-md5  111a7d37292a241811502bd1b64032be  typing_extensions-4.6.3.tar.gz
-sha256  d91d5919357fe7f681a9f2b5b4cb2a5f1ef0a1e9f59c4d8ff0d3491e05c0ffd5  typing_extensions-4.6.3.tar.gz
+md5  06e7fff4b1d51f8dc6f49b16e71de54e  typing_extensions-4.7.1.tar.gz
+sha256  b75ddc264f0ba5615db7ba217daeb99701ad295353c45f9e95963337ceeeffb2  typing_extensions-4.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 2c07846154..9d41b0a6a5 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.6.3
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.7.1
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/42/56/cfaa7a5281734dadc842f3a22e50447c675a1c5a5b9f6ad8a07b467bffe7
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/3c/8b/0111dd7d6c1478bf83baa1cab85c686426c7a6274119aceb2bd9d35395ad
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
