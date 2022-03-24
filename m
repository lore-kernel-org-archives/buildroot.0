Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE30C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 07:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A15B4812BF;
	Thu, 24 Mar 2022 07:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAuG911AUsA4; Thu, 24 Mar 2022 07:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61168415E;
	Thu, 24 Mar 2022 07:18:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B80CA1BF955
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 07:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5F958415E
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 07:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id au3j40jmSLGj for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 07:18:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B70EB83ED3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 07:18:25 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id b16so4435278ioz.3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 00:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBRKFkJFRdh9aUMP6dHjKsMun9+Kmsw/abYVjUzLClA=;
 b=gjCOsAORAU0lU1PGZxtBpQV6xtI6M7ld6NPMsesQQO9dpFn/ACyAV1mfK1BtoHwQlF
 7etnveAEOae+xlCwueAqXH4qp6cqJ874sPI6Vo0ssag1qWSRXZe6tXa0Yn3kXCgAZF5t
 ysiaVc94kJj9OrvUTJsdpYT7ahTX55TCRzD6DgXRgC+I8zJdeYF9xCFVg99ZWsTDpFDk
 60BPctwtDxRLqKaPhiHdTZluNMLDagIbV5IGDu4ZJ5pGkfD5VKFIjS4IS+O2Qj18vLVy
 Bch88b1KHmbsM/54WlZNQEJGm5K0SV7CdU6+yyK0dJDAjH0pheqBMgk2W4uBLK9hOl9c
 GUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBRKFkJFRdh9aUMP6dHjKsMun9+Kmsw/abYVjUzLClA=;
 b=oHdI+VrLci8xndpoH0aqrKYG94AlhTPeI/7sFQ6SuuHlqHt59soBigREgw2Ei+5Z8w
 Lw7eJWFWGBrMEM7ds9ivZyk9Bn3J76OQIY+ZbuLQU0yMpzHB+uYqkBtAAGwBLNeNNoEe
 DfkqmbU6p5hXQhHRND3hYWyKKJNKRYaKQcZsVNuhrOGoSjlMvFsy+B+E8SlIMS951Tpn
 57UGzP4KWOLVkUa7Fo8D44D6CYK7rqk4cSxC5omPkFYn1kO/g6BF0BvUDiwgRaGgah0t
 2Rdr1YrzJzwoxlxaNVqXH5R1X134MlkwVLjzHssqernI+lyWsZP44TQJCCi+VDthS7k9
 1/cw==
X-Gm-Message-State: AOAM5326BBx9Qyf1sfyTcqiFaxHqQp8BxUdnJpWFCA7N5H5gzo1neZZ9
 qLWWnY2YWR/63NNfVKShZB+uB20Q3im1Uw==
X-Google-Smtp-Source: ABdhPJyvt6+EQw3+EJo8FYZQEvz1HzM2NCLKHjxfPUPx57rmgmLbYrIk5TTlNDLXZ3qK0QvB8b9i8Q==
X-Received: by 2002:a05:6602:2f01:b0:5ec:f99a:93a1 with SMTP id
 q1-20020a0566022f0100b005ecf99a93a1mr2075387iow.109.1648106304698; 
 Thu, 24 Mar 2022 00:18:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 y12-20020a056602164c00b00645cdfb42dasm1156301iow.30.2022.03.24.00.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 00:18:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 01:18:17 -0600
Message-Id: <20220324071817.1270488-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-txaio: bump to version 22.2.1
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-txaio/python-txaio.hash | 4 ++--
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 5e05f02d3a..f06c14b21f 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  7e80b80ed7797245a5eef803043bdede  txaio-21.2.1.tar.gz
-sha256  7d6f89745680233f1c4db9ddb748df5e88d2a7a37962be174c0fd04c8dba1dc8  txaio-21.2.1.tar.gz
+md5  9b692af4c4fce73cadd36374c138936b  txaio-22.2.1.tar.gz
+sha256  2e4582b70f04b2345908254684a984206c0d9b50e3074a24a4c55aba21d24d01  txaio-22.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 750d9e3d3d..1a8a888963 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 21.2.1
+PYTHON_TXAIO_VERSION = 22.2.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/c5/39/2e715062283f8443d8ceeea32276db71741664d78d43c3edd3675498e926
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/6d/4b/28313388dfb2bdedb71b35b900459c56ba08ccb7ad2885487df037808c06
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
