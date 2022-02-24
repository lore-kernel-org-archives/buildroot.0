Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F8AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 15:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B33BA41711;
	Thu, 24 Feb 2022 15:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6F7bTpO0HJGU; Thu, 24 Feb 2022 15:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3FC441649;
	Thu, 24 Feb 2022 15:41:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54F501BF309
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 433AE611D2
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2S6PVvnsYW1Y for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 15:41:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E688611CF
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 15:41:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso49122wmr.1
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwQG6vrINQmBy/ytejDe8iClVHkAqzelEOWioRN/ZJQ=;
 b=PeOong5aHuJfjrSuox5qy5bXstt3hn+wVPfsz3hdluKAnaq2LJB2opYbZixXx+L4k2
 gj/lvX5uRbBezKCbjUyrATCfExJneFwCZUCqb4qKolgdALQoU598/uaqSSCmJ9o92cWe
 92C3DxvqCl+fhU3fWuRqONHhw5thtK8tMU9ZjkuqjYnvLy3rvA/6fdzfwzONx2WDedqX
 8/WVcFg9A5FDtOiFfZdHGGgAmYFfPifjesIvwdlwsMV5kQkJVUMM41jvNMjPw1gvthH0
 sMklkZbfs+1tQ2hcEEnRzywt3m2vvS7Vsyfxu+j8PzmODEltf7uvSDwMS9cUUOmEdvED
 DDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mwQG6vrINQmBy/ytejDe8iClVHkAqzelEOWioRN/ZJQ=;
 b=68b+xvJzK5Cx0COxB+W/+dGA1u/9wWcaH1DkcDDJenMU62KeFY11PrbcykvM0fGQTS
 MOyyxOX837KFGYbQs2Y/QqR+y5Utnj0o1A73Hei2JGbGJS1UpjjjPYob/s0/j5LQ6l/M
 ruimtHX8A4sX+4K/c8fbBWIZvMev2vOUX/Znyyu25OnaO4Y6WPi7nY5CoLAjSxIVqSii
 U/qeyIfwuIuGtOpmINRwkpzx9QsesJuagM8eNrCKIp+vbvHIQAog5cAhbIZsqBBYaIxB
 Fgnyhw2xxc9EyjSGl6ns7BSiiPhzpPy+osMB5bspaGIqAxAvD9+hiufChhkjCgdTD7wf
 bktw==
X-Gm-Message-State: AOAM531O3JCG5KjHWEvcof/qbA7fXcS+QrYh8C3mK/nXGeqBEic4Z7Jz
 1yv643vg/Nfw5OAwWRwztxnVhQFe+ds=
X-Google-Smtp-Source: ABdhPJxZp8oNoC3i9/i3FnxCdYu89IF4VX2j6bwK/J02YFQivOElcKKE1OrdDhlHmns+f1adpPCvsA==
X-Received: by 2002:a05:600c:19d2:b0:37b:b8cc:5ca5 with SMTP id
 u18-20020a05600c19d200b0037bb8cc5ca5mr2888311wmq.22.1645717282304; 
 Thu, 24 Feb 2022 07:41:22 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id s19sm3321095wrb.25.2022.02.24.07.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:41:21 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 16:41:18 +0100
Message-Id: <20220224154118.220408-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pkg-python: use
 SETUPTOOLS_USE_DISTUTILS=stdlib
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

-sh: ipython: not found

ipython use a wrong shebang on the target:

 # head -n 1 /usr/bin/ipython
 #!/home/kubu/buildroot/testsuite-master/TestIPythonPy3/host/bin/python

The issue come from python3-setuptools 60.0.0 that changed
SETUPTOOLS_USE_DISTUTILS default value from stdlib to local [1] to use
its local copy of distutils. This is actually a "breaking" change [2].

We have to override SETUPTOOLS_USE_DISTUTILS to the previous value
"stdlib" to fixes the issue.

While at it, use distutils from stdlib for the host.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684091

[1] https://github.com/pypa/setuptools/commit/b6fcbbd00cb6d5607c9272dec452a50457bdb292
[2] https://github.com/pypa/setuptools/blob/v60.0.0/CHANGES.rst#breaking-changes

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-python.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b8dc9cd9e5..e81a1a3102 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -40,6 +40,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	LDSHARED="$(TARGET_CROSS)gcc -shared" \
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
 	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
 	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
@@ -62,6 +63,7 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_DISTUTILS_ENV = \
 	PATH=$(BR_PATH) \
 	PYTHONNOUSERSITE=1 \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
 	$(HOST_CONFIGURE_OPTS)
 
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
@@ -76,6 +78,7 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
 	$(TARGET_CONFIGURE_OPTS) \
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	PYTHONNOUSERSITE=1 \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
 	_python_sysroot=$(STAGING_DIR) \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
@@ -96,6 +99,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
 	PATH=$(BR_PATH) \
 	PYTHONNOUSERSITE=1 \
+	SETUPTOOLS_USE_DISTUTILS=stdlib \
 	$(HOST_CONFIGURE_OPTS)
 
 HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
