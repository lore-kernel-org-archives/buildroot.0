Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98390C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 03:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0341400A9;
	Sun,  9 Jan 2022 03:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-v_ZNBY2Vc1; Sun,  9 Jan 2022 03:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4402402DC;
	Sun,  9 Jan 2022 03:56:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEB941BF2F2
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3CC68174C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id piUnABShxXSy for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 03:56:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD7E38140D
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 03:56:09 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id v10so8297114ilj.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 19:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hpigwG3K+sAaxswoluVd07XPWWeq4ht2plyumlXBlU=;
 b=orESkkHxmWJzX6FNTc89b2mvIxlGWxiLKllqmBoa5U++azFGaPyR9IZpi6infndAwz
 tfMvsyytZPHqNnRv3QV+Cz7aG0ddrACQ6g8Ro7n9h0eaM+vBQrEBDDLgGC9qVVaeZNDu
 3IjMyfkz5byyggfIHS0iI4e+eMsaWzhzcrN1MnHM8qfWkGUlZy08EGJwmPgJ+/naRTnn
 ixRjOPc54C7hXwbHnoiBbheYAe9HZWhDVB8/Lc4RBPf1IUA9Z+7PsstOq5xsaNu0SsS2
 OnmShvW3tonF1zafOI7/r/Lkk0MUJXi2Vtb88TWriKVVQH1Vk62yhLlVCmaCh/vBSR4c
 hFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hpigwG3K+sAaxswoluVd07XPWWeq4ht2plyumlXBlU=;
 b=PhEkyV7Vuwj8GBAL5SshFXh58lpaERPCPG92YVuygjxzrJH6r+4KMmz53zqoH3iyED
 5NYwl4+FkkoItieOhXwKyaxSYjCmeyObFFF7XcBRd3NXu6pr2CU6wbKSwkBJKf0juLl3
 5jf5UiKqHPnnIi2E3l69Mcft/ae2GmGpfIhXRe5gGk0dYQhTeMz/AaofJ1wd9e5b0Od1
 it/3srA56orL/REeoeJTctFZgS+u2MERQrO3Mr+GgXduNMRomU62UHGxMO9jCFptcr2Q
 NGM/XsxLWz45uD0zRrZjHoBLROSYwr7bcnSrs7QrmthspZlIrH+l8ctCMjYQaAu2S4nH
 2fBw==
X-Gm-Message-State: AOAM533Gi1kUXkZO+XI+Re97lKwSvi+o0vrFJZtO76PcAItNlQ/OmTPI
 6OdSyPtHeXo3n2Ymb2oi6KLfoWbZArc=
X-Google-Smtp-Source: ABdhPJyjd0LIyvFwSNxLL3vUez8a/RJaM1Bkg0TsnfwjwBZ3urdjj14RHAmtw3AMufeTlVf+w/jCAQ==
X-Received: by 2002:a05:6e02:1bc8:: with SMTP id
 x8mr30791800ilv.54.1641700568821; 
 Sat, 08 Jan 2022 19:56:08 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id l11sm1839833ilq.74.2022.01.08.19.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 19:56:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 20:55:59 -0700
Message-Id: <20220109035601.2483360-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109035601.2483360-1-james.hilliard1@gmail.com>
References: <20220109035601.2483360-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3] package/python-pep517: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pep517/python-pep517.hash |  5 +++++
 package/python-pep517/python-pep517.mk   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/python-pep517/python-pep517.hash
 create mode 100644 package/python-pep517/python-pep517.mk

diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
new file mode 100644
index 0000000000..4dd4c47fa0
--- /dev/null
+++ b/package/python-pep517/python-pep517.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pep517/json
+md5  7ed0adb5f737c316e071d48d66329a5d  pep517-0.12.0.tar.gz
+sha256  931378d93d11b298cf511dd634cf5ea4cb249a28ef84160b3247ee9afb4e8ab0  pep517-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
new file mode 100644
index 0000000000..da0431a637
--- /dev/null
+++ b/package/python-pep517/python-pep517.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pep517
+#
+################################################################################
+
+PYTHON_PEP517_VERSION = 0.12.0
+PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
+PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
+PYTHON_PEP517_LICENSE = MIT
+PYTHON_PEP517_LICENSE_FILES = LICENSE
+PYTHON_PEP517_SETUP_TYPE = distutils
+HOST_PYTHON_PEP517_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
