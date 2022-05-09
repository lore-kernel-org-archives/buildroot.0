Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD7CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 01:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC85240915;
	Mon,  9 May 2022 01:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fz63bPkmXxeO; Mon,  9 May 2022 01:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5043403C7;
	Mon,  9 May 2022 01:19:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BB2B1BF387
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36E8E814A9
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 01:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOolnSwttoUf for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 01:19:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 636D68149D
 for <buildroot@buildroot.org>; Mon,  9 May 2022 01:19:32 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id o190so13806164iof.10
 for <buildroot@buildroot.org>; Sun, 08 May 2022 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IlRgNtLkynyzn02lXVL+6QA9z2ifsUhVVycG4TmBqcM=;
 b=FRChGt1Pl6IAlEBss5G9oV0oKPyalpjn9hNsftxOBZtofbf3IiIIWtoi3hh31Crlz9
 lj6XWu6pBDn/X/wFOIE121ehG21a80SBKlMfS/XNVNZ3q28ZwRQwjUIS/MArWbFY9GfZ
 oDTg0Vth+c+CmlNNDNHTxGBsL4s6v/GbIOIGU8eV0y3Cjd8Y99jODjEevY24fakzM7Jc
 YHrHzDBPYi2cdvLXuVAvrcUu60xn9lLfKuOUpSxAcrLMLD0BlYTy/IqVoWuTU2Lu5T9n
 XZmYNri4GNERj9SFPJ/1994HC1Ptdda7gbd4BP5hC9RoklArPc3JzaOx/bhyu+fhKE5m
 oEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IlRgNtLkynyzn02lXVL+6QA9z2ifsUhVVycG4TmBqcM=;
 b=yN4TeI2cZ7kRyFLc9S8har3EBMjlHuHTAXpGlZ6R3U9rB20MP6X6YsdYZrS0y8h8M1
 bp34n/NH2Osfa7aoJT+cNo3oCKXPq9dhycSCktGfhrdLC8PvPFs+WU7IxICpcuLnPKDv
 OErz7jRt6eE5/RHa9OMwxWx3k9J2XL8oUcanm6HMI4Se3MNG65FenqaZXQcvf0XqN0rL
 brS4CLNEbsWl0TaCTbi1lZU3fNe88HbusBWMnC/1PSkw+OLQppHa6e/i4iMDDk8zitHg
 xeIdJAgtCVqU6gZ1E7Yjnr/y4OOTLnayHPKQsqUtyWpgpx60Wi/L5OcVgeevrgT4ipEr
 ewRA==
X-Gm-Message-State: AOAM532U97wvLEvp7DyWSLeM3T9iC7q0mjwyWk0upNbnLSHJ5cqc9+pZ
 lNfX4LYQb8iJLwiTKa9dUiQ3OWXpITc=
X-Google-Smtp-Source: ABdhPJw/7eVcXdbzJcW1Ycc42OZ/rfhvuoeWoEyXeQ688khsIE+NkRD7a2Ab3JQBVUw58fcerXTmTA==
X-Received: by 2002:a05:6602:2f06:b0:65a:cfe5:1778 with SMTP id
 q6-20020a0566022f0600b0065acfe51778mr3249778iow.192.1652059171285; 
 Sun, 08 May 2022 18:19:31 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 r9-20020a92c5a9000000b002cde6e352c6sm2881585ilt.16.2022.05.08.18.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 18:19:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 19:19:29 -0600
Message-Id: <20220509011929.1488087-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.33.3
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 077b60a8bd..ef75a54ae3 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  be2db6ae923a9b369a3739ed5bdf0fcf  fonttools-4.32.0.zip
-sha256  59a90de72149893167e3d552ae2402c6874e006b9adc3feaf5f6d706fe20d392  fonttools-4.32.0.zip
+md5  02a4c1216de481ca881f92afba1c80db  fonttools-4.33.3.zip
+sha256  c0fdcfa8ceebd7c1b2021240bd46ef77aa8e7408cf10434be55df52384865f8e  fonttools-4.33.3.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 28d4f4b52f..5ee159d551 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.32.0
+PYTHON_FONTTOOLS_VERSION = 4.33.3
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/88/27/418ac6f1b85856608df81fe6e72fbb85929d7b904540056f3061e27bba04
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/de/54/14376a4e5c1e7d2105a5be33ad5584b56e36753dc615506728a1489071cd
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
