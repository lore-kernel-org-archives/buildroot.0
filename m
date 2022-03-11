Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA69C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 21:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B63BE416C0;
	Fri, 11 Mar 2022 21:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpijAjwgTrkG; Fri, 11 Mar 2022 21:49:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDACE415C8;
	Fri, 11 Mar 2022 21:49:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F02C1BF38E
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 21:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EB46415C8
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 21:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGog5DxawqE8 for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 21:49:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E01424087E
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 21:49:53 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id n7so10843657oif.5
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 13:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urcGs9Vg0SjN1Elc8KOtYvhxoM4VVGWzw4aO2Ns9dUM=;
 b=KXeFZfbdClvnslFFrC5oJv8FBcVAvDBO8G1R4rP54X8KiNj26uN8blCsc/uIzqmgNn
 aqGhCGofY+418j5KEc4r6xrKILuXDJrIZsKhIrErWnBrTokUSFcnmWgg7ktF2RnRW3jF
 oGWzYBG9QnTnV3a+qn/gGdYAZnCOEpks9A+AaKrMvUnxs3RBYXTrRJMkr+jSQggUVEgQ
 Z5KSr4SoQzvWvSqvoy9rqnIE3JU8Xah/I50zbxMbM74FDrk6/RIppcYzMhkciqM9QE2v
 NxstLJY8k9mJfrybzh+HjSAJm1mM+evlmH44oePeXqtjdb1r0ppUHHMDLOd32FtZvRyw
 dyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urcGs9Vg0SjN1Elc8KOtYvhxoM4VVGWzw4aO2Ns9dUM=;
 b=Aqn1LtqwHNKgjRxNjLfh/aA7p2jo10QrAGHDlBhR3mQYpulrRhdJS5eY/jUrxpSR1c
 4BKQUSUaNGoAghI0Yo03usdyiv4Bmt+MaGv7i0Pct5g+cZ3Je1vpHaUrytzmErp41kIS
 gmaUDHjR8RipoYBirYzVYhPgdNVE6edKpqZ12Ded+9Sg+NX6YYZ49o1x5PKk3K2spSVk
 FsQ1GCv/q/WvGzvqqIpalwgSyicHzYD0e/Ddz67r55EAbR1Z1onNuWdO6yoIBBJS/6BM
 jYWd5Uyhj/yKQm5Rs0oxYCwuJN0aGbFEWcNARVo1n/VAcIKeX5rh9k7eS0gs3rkW3a7Z
 7w/A==
X-Gm-Message-State: AOAM532JSw22mfuAkFIYhMPlc/A14vdlLfeBZvowuXjDhikKemkqAiYc
 K6S36JJ18C/aUnunBocIvuYVAAysIqg=
X-Google-Smtp-Source: ABdhPJyRotewH6GJ3LMJw6Mi3jUiOWdnkWasTUultfp54d5YzTpFQ41cESa05feVbiNt7Z2CCc/bDA==
X-Received: by 2002:a54:4482:0:b0:2da:4ebd:9ac8 with SMTP id
 v2-20020a544482000000b002da4ebd9ac8mr8504573oiv.22.1647035392786; 
 Fri, 11 Mar 2022 13:49:52 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 w1-20020a056871060100b000d9a1c283e8sm3912725oan.37.2022.03.11.13.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 13:49:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 14:49:50 -0700
Message-Id: <20220311214950.3965757-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 60.9.3
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index e04235e041..1a378d1b76 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  f47a5750f6084cce3418f213a9d97785  setuptools-60.8.2.tar.gz
-sha256  66b8598da112b8dc8cd941d54cf63ef91d3b50657b374457eda5851f3ff6a899  setuptools-60.8.2.tar.gz
+md5  6c6a97cf68e1db789a2e5c054f067278  setuptools-60.9.3.tar.gz
+sha256  2347b2b432c891a863acadca2da9ac101eae6169b1d3dfee2ec605ecd50dbfe5  setuptools-60.9.3.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 8653c42259..3309cd9df4 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 60.8.2
+PYTHON_SETUPTOOLS_VERSION = 60.9.3
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ae/0b/e458b0d07dced3d7fa2d21d828e708f374ef82040f2012c05d35f47f9af3
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/14/74/54890935244ce053abcc4fa01ef4982a84743a8d128d4cf5eae56e2d156c
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
