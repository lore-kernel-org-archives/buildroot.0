Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA68BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6404E6059E;
	Mon,  2 May 2022 22:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fXLnOa8qBbD; Mon,  2 May 2022 22:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6706560EA9;
	Mon,  2 May 2022 22:16:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5E871BF33A
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B46534051E
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 22:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmcLKv7DLLYe for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 22:16:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75C8A404E9
 for <buildroot@buildroot.org>; Mon,  2 May 2022 22:16:35 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id e3so13630527ios.6
 for <buildroot@buildroot.org>; Mon, 02 May 2022 15:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N1cAdNfStLB1otgi5l6HEOzV7dNidqzCFy3+Iz3qQak=;
 b=T9ManBdhI9q/Dbsohm1Igb1GacfNou6/44GeCZRFUQPDhE5WDsjT9k8ZPSxotxKlq6
 Li4GP/LFxU5KSdi4TPsI+StJeLpmMxUSn735L7FDZnozgNgVi8FbF6n2zuDmjQfKMZ31
 zz+QB6yfJQscfX7xQr9j6u/TxP7O+j3NA+gAHsCgjFOXIMVzrF0gnsGVrLjuIVA//ZTA
 mldXPxd5v09I+S8NL7yvde5iaBAAIYwAte/Wdd+pXQQ1HBDhuBgBL07wQ9VJuShiGwdq
 uHPiqMhee3+OVitZ2OzKao6MzfMlnmNlN4SBatBSS5B77UFaB6g7FynaxDnwegoCC1tZ
 u2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N1cAdNfStLB1otgi5l6HEOzV7dNidqzCFy3+Iz3qQak=;
 b=2NxW/44MW4E/pxdjHUjHXFIvzHUO49KWCE0XSkMyE9d+CsiSbMfUVAdzhxBBrfLG1X
 S4Do6bW4hlIk416HVncFAL8eu98n0FMNf6kXNykPzQVfizuyCt0UgVUcjEuKdJppP3kK
 qJTTdG07GjFdvgW12Wf1xLvZpXxmzOXhiXfzt/bwtR07NacY2SBporcLIAayu6GvUwZm
 1tkOXnSrPihM6fhdEVD9sfedbInG6x+hmgmY6mZOJAmXnBvIi/XfSg5+mKMXWVfDYg8u
 FqWFfQDbNUJVWkZ1pKWIp0FoSQYJqr65BbM04HlhtAj6E0NnSPrnpc4C3yLTEkFiyo/z
 hjjw==
X-Gm-Message-State: AOAM532uMOZJ8cMXpcV3/OK5PPHWfIFl6XWfrnoRo9EydT2ax1DJyNi6
 027+Ek/hBo2MBpnXSnTo5NxUEN5H01M=
X-Google-Smtp-Source: ABdhPJyQlTPlCYZzfajsIpTVDTkpQtVzQTlIYGEKJd0H7BR4+qB23lCuWvsu00d8TqW42jYt/AT5Iw==
X-Received: by 2002:a05:6638:2b1:b0:32b:70bd:4072 with SMTP id
 d17-20020a05663802b100b0032b70bd4072mr1982680jaq.138.1651529794423; 
 Mon, 02 May 2022 15:16:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 c63-20020a029645000000b0032b3a781773sm3381451jai.55.2022.05.02.15.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 15:16:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 16:16:31 -0600
Message-Id: <20220502221631.2347844-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version 9.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 88a5d7cada..2e259c1caf 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  8deffccb4f402df154fd2fd504d8487c  Pillow-9.0.1.tar.gz
-sha256  6c8bc8238a7dfdaf7a75f5ec5a663f4173f8c367e5a39f87e720495e1eed75fa  Pillow-9.0.1.tar.gz
+md5  a9ebd39b3482993474872757d317e26f  Pillow-9.1.0.tar.gz
+sha256  f401ed2bbb155e1ade150ccc63db1a4f6c1909d3d378f7d1235a44e90d75fb97  Pillow-9.1.0.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 901876e0ee..4249a44776 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.0.1
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/03/a3/f61a9a7ff7969cdef2a6e0383a346eb327495d20d25a2de5a088dbb543a6
+PYTHON_PILLOW_VERSION = 9.1.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/4b/83/090146d7871d90a2643d469c319c1d014e41b315ab5cf0f8b4b6a764ef31
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
