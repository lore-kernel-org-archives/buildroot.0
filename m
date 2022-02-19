Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6123AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 18:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C5640979;
	Sat, 19 Feb 2022 18:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mlqz6F9X4h-l; Sat, 19 Feb 2022 18:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1169940886;
	Sat, 19 Feb 2022 18:22:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 455F21BF311
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 18:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ADB581B0A
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 18:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Re5l84pOn0Z2 for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 18:22:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55E3E81AAD
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 18:22:36 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e3so19960530wra.0
 for <buildroot@busybox.net>; Sat, 19 Feb 2022 10:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dKWenHhfMNiBDyySCuyBvmmVynK8dYe060Aj0dptwQ0=;
 b=POx0E8UV+bg4AsNMGbTIFWb4IU8HfY0J++ChwFb2ImwEtG+l8jRo9Sd8sbf1SGt0Ww
 Lrr47ZxoDSiR7RkHui8qo5zrPwRkOpUna0iswSeFE9db/0adHWg92HnyQHxAbF26hsMn
 M8HrP1sdnh3TC89+sppakMXOUY3EmpBC/kYGfpgcy2N5CA3SaakkOaZnFy3y0X8FKZhk
 GPBaW1Srl/ipQzM+Rmyxs3XPD2I1eC9GMwZ/ksSSxkx6yK36aWeytoIbYDK2BtfLy97n
 UHVdfmWA/wMTBwaBCWwIw8yHXnnqAFjIufGZfS2IFo04/yGad0qJO9xoauu2xxl9cT74
 IQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dKWenHhfMNiBDyySCuyBvmmVynK8dYe060Aj0dptwQ0=;
 b=N+aaU81vtvXBUoARQY5l+xy87WdaPjXSFG1Wj3WPK1r9FUZIAs4TWntJLjQlq8kBTE
 eoik2FEvTSz+juZd+8mmE7EehU9tZuI+fOSb33AaJgtlJgXsTv4hdp4I7iNU9SSFYPiG
 3WRLT6qMEmf04Wm4WgKjmf+7v1Jf3J78lhSmemxYZUjejDkOtEmNj6fVxitHLu8AtEue
 AOD6mqHuCHBVZFvcXoq3WPmc48DvYQYm3OL916r1c1zA8f4w75EPIi58qB5+ElsP8N5R
 w1whVKqOdSPnLxLGGqBbAn2y6H3oPYBsLk44gPB9aTDbmfsVPWMAuFBoLilYNVYR9pq7
 HU5w==
X-Gm-Message-State: AOAM533Y+7bVwX0PzIilNkF+Ti8pZ4JTMU9Prh0FcVxNFVQ74od46LYX
 JfTTXU7G7KilS4JkVTOoIqsOsJE6KddCQw==
X-Google-Smtp-Source: ABdhPJzv1kX3evnVYEhjSDX0sezbJy4PdQAt6TxWIGCjjDniQje3uoI+8xApBQNqgAwExW8goQxsdw==
X-Received: by 2002:adf:f1cd:0:b0:1e7:5b47:52a2 with SMTP id
 z13-20020adff1cd000000b001e75b4752a2mr9847856wro.92.1645294954307; 
 Sat, 19 Feb 2022 10:22:34 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id a8sm5644573wra.0.2022.02.19.10.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 10:22:33 -0800 (PST)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sat, 19 Feb 2022 19:22:24 +0100
Message-Id: <20220219182224.3397-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-threadpoolctl: new host-only
 package
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tool to limit the number of threads used in the threadpool-backed
of common native libraries used for scientific computing (e.g. BLAS and OpenMP).

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

---
host-python-threadpoolctl is a requirement for python-scikitlearn,
which first requires the current python-scipy work to be merged

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                                    |  1 +
 .../python-threadpoolctl.hash                 |  3 +++
 .../python-threadpoolctl.mk                   | 22 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/python-threadpoolctl/python-threadpoolctl.hash
 create mode 100644 package/python-threadpoolctl/python-threadpoolctl.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0f..53ebdbe760 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1149,6 +1149,7 @@ F:	package/libxcrypt/
 F:	package/liquid-dsp/
 F:	package/pixiewps/
 F:	package/python-pybind/
+F:	package/python-threadpoolctl/
 F:	package/reaver/
 F:	support/testing/tests/package/br2-external/python-pybind
 F:	support/testing/tests/package/sample_python_pybind.py
diff --git a/package/python-threadpoolctl/python-threadpoolctl.hash b/package/python-threadpoolctl/python-threadpoolctl.hash
new file mode 100644
index 0000000000..6b6fa72443
--- /dev/null
+++ b/package/python-threadpoolctl/python-threadpoolctl.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  449b806f9147a3cf28ed7ec6389dbff9c450331d695873ab75dea79fe661f1e7  python-threadpoolctl-3.1.0.tar.gz
+sha256  81ac619075248b06e53660b652d10e485f4675f5d0ae0f97ea22370da1f7e23b  LICENSE
diff --git a/package/python-threadpoolctl/python-threadpoolctl.mk b/package/python-threadpoolctl/python-threadpoolctl.mk
new file mode 100644
index 0000000000..fc1305ad86
--- /dev/null
+++ b/package/python-threadpoolctl/python-threadpoolctl.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# python-threadpoolctl
+#
+################################################################################
+
+PYTHON_THREADPOOLCTL_VERSION = 3.1.0
+PYTHON_THREADPOOLCTL_SITE = $(call github,joblib,threadpoolctl,$(PYTHON_THREADPOOLCTL_VERSION),$(PYTHON_THREADPOOLCTL_VERSION).tar.gz)
+PYTHON_THREADPOOLCTL_LICENSE = BSD-3-Clause
+PYTHON_THREADPOOLCTL_LICENSE_FILES = LICENSE
+
+# threadpoolctl is originally built using 'flit' which
+# simply symlinks $(@)/threadpoolctl.py to site-packages
+define PYTHON_THREADPOOLCTL_BUILD_CMDS
+endef
+
+define PYTHON_THREADPOOLCTL_INSTALL_CMDS
+	ln -sf $(@)/threadpoolctl.py \
+		$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/threadpoolctl.py
+endef
+
+$(eval $(host-generic-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
