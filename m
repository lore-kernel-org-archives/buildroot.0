Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6823C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 18:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 900DF418F0;
	Wed, 20 Apr 2022 18:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y38qiEST6bqW; Wed, 20 Apr 2022 18:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35624408F2;
	Wed, 20 Apr 2022 18:30:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA85B1BF3B0
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D793D408F2
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 18:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wl-BUPs8ykd for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 18:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B082D408DE
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 18:30:18 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id n134so2786461iod.5
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q/s3BeLVxhoqcD8bww9RG8vDeRwY5ZL54iErXIzzyec=;
 b=SIBEwbtQrxvCz3StjKsENwEgt5TSvT/KQ9Ub3HMoUhiwEyGhWTU+2ZzLPGFynSdB7M
 EIpU9y0NSwS59aiWrrXHU5TkAcrLBja+XHMVlsO9pSe/WYfDEclqrTZe0kWVKZLMHsjt
 6sfmzMbVRlTFvU/JZDX8gnyKkE9i94jdlv13Olo7N226SgWL9Qf7hjUuoGcKoLNVsggx
 leITQe7+kkZsQVZ0k83YGaDliCoclZ0nemphqzxGqGWQZD4mfCaBirThTsdmhGhJMezw
 rDqw17bNwfiWdoFTku1qmC89mpCxsvC2FmIKx1aukJt7Lgg2/rLp8bfwNaZESthvVma1
 p9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q/s3BeLVxhoqcD8bww9RG8vDeRwY5ZL54iErXIzzyec=;
 b=u1IcX5Wa4f4gvI7YzVWVNAAXCsGbtl7BYSHRBgP2qaaXI7Eu1I19+HGcsR6wh/VvTu
 bDSR1tndOwl0CEa2H80H07PhFC05XK7XI6pe2A39uxjH8FTTU6j5OGTQ1J9vaQgvRTZ0
 EXVJuI21fEPU+HLIp2zYwNSeNTSiO8fNTdLielbDlRrMkoD7T7qkzIaqUEsKFhD4+gDB
 krSf3JxBO8uxJ3JPwLmYY/09ZYgErnIECe+e933MZ1nYc4IoS05qCyEx0Nd3N/tSEnso
 3A65vdbK1LDBaWQtsRV8ZkhOaWeg7MyfvD1zVXYh3j57nF8yj/b25Fr1ixtX+xZ3mamX
 +XZw==
X-Gm-Message-State: AOAM531SjtvodT0OetEPUPe2/VAx1ZMHXNjOksEkmfu3qJmX+Gqq1jxt
 dl+hp6tEevFOLXEEaLjHQF3Cu750C8QJdg==
X-Google-Smtp-Source: ABdhPJwDoFvGCV+FZc4+wFWo9yZPIG2ThsbVwcuiSuXhDe3m3KQuPyz6Z1UmeGLNwIWvmuf1D4ghog==
X-Received: by 2002:a05:6638:2055:b0:32a:8521:20f7 with SMTP id
 t21-20020a056638205500b0032a852120f7mr3170503jaj.280.1650479417371; 
 Wed, 20 Apr 2022 11:30:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 x186-20020a6bc7c3000000b00648deae6630sm12623608iof.54.2022.04.20.11.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:30:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 12:30:09 -0600
Message-Id: <20220420183009.771346-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.32.0
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
index df0bdf980d..077b60a8bd 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  7fc490291991da874911fed1e743362d  fonttools-4.29.1.zip
-sha256  2b18a172120e32128a80efee04cff487d5d140fe7d817deb648b2eee023a40e4  fonttools-4.29.1.zip
+md5  be2db6ae923a9b369a3739ed5bdf0fcf  fonttools-4.32.0.zip
+sha256  59a90de72149893167e3d552ae2402c6874e006b9adc3feaf5f6d706fe20d392  fonttools-4.32.0.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index c07011daa0..28d4f4b52f 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.29.1
+PYTHON_FONTTOOLS_VERSION = 4.32.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/2d/4c/49ba863863502bb9fea19d8bd04a527da336b4a2698c8a0c7129e9cc2716
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/88/27/418ac6f1b85856608df81fe6e72fbb85929d7b904540056f3061e27bba04
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
