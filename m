Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D972FC4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 958E160F1A;
	Wed, 13 Dec 2023 16:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 958E160F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuRSuxGvOwiB; Wed, 13 Dec 2023 16:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D609E60ED1;
	Wed, 13 Dec 2023 16:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D609E60ED1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19BFC1BF285
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5C5E408A7
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5C5E408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LG3LOfF8DGRh for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:21 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 613BC400AB
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 613BC400AB
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50d176eb382so7429785e87.2
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485799; x=1703090599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIzn2oBu6AxNeBzZxqMhuHrEIrk01G8p6QJECAPAeVQ=;
 b=Qg8sWiBb8Tx25PyssTGfQFnWmLwntMYgqoG436fU8dW4+G5oEddp/3DTr/vKWw5kRe
 7L+fKpVrF2/VyYaBbxwVVRmOGU9NQhvFvIJ23KGuJ+Nabxy0Oa02ffgnGEeqfJl1Zxj3
 lxyPuY/vDAIe1GTmkUlEBkzZGdc+HhBE4CQbegCxQrN3UwfO/oY7icQnoNiPA1OWPMLb
 i/8R6P1VH2Qpda+F39ltx2C7aSlo0rp3CJTjetN6eibtcuC8l8XyyQKp3liWwl8yBlkJ
 BbClPWaJ/vjEzHe8r9HvtHsx7B+zBHr74n6LfJdjO9YABOG35gy7jeWzXQjNRUNlxgKZ
 dX1Q==
X-Gm-Message-State: AOJu0YzKO6EimeE4IbpQeTayJ+5r4aBytq8A4Oxnp3p7e3MVbT/3C23S
 o3IcumwH+URbaQ19F41rtEes7d0MYDkdBoiAd9wObg==
X-Google-Smtp-Source: AGHT+IGJiiSY3R5X2JAkN4fyMVQs5KE+wfACnkYZpcPV+Tvo6FknwXi20Ni/604o7SZ2doNU0BwqDw==
X-Received: by 2002:a05:6512:2253:b0:50b:f776:1d63 with SMTP id
 i19-20020a056512225300b0050bf7761d63mr5136499lfu.44.1702485798965; 
 Wed, 13 Dec 2023 08:43:18 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:04 +0100
Message-ID: <20231213164311.4180059-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485799; x=1703090599;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIzn2oBu6AxNeBzZxqMhuHrEIrk01G8p6QJECAPAeVQ=;
 b=MjDTvbGh0jYNQXrZh4llqq2BQQkFVwDjde711h2peQr5wmnSotO6qiOkcqWlINjztS
 ZQUrVNGjvpaFmWl0U7EBcF8kADumSmzo8oqqCxKR7YAtnYT9BCwdTof69994Iy2154rj
 BZfRUWlXYoLYb8TScTyidTjxRjdLoOs0J8Ge4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MjDTvbGh
Subject: [Buildroot] [PATCH v2 04/11] package/python-attrs: add host variant
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/Config.in.host               | 1 +
 package/python-attrs/Config.in.host  | 8 ++++++++
 package/python-attrs/python-attrs.mk | 6 ++++++
 3 files changed, 15 insertions(+)
 create mode 100644 package/python-attrs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 5d2121de02a4..5f9dbd3c71be 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -82,6 +82,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python-attrs/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
diff --git a/package/python-attrs/Config.in.host b/package/python-attrs/Config.in.host
new file mode 100644
index 000000000000..d85f57915318
--- /dev/null
+++ b/package/python-attrs/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_ATTRS
+	bool "host python-attrs"
+	help
+	  attrs is the Python package that will bring back the joy of
+	  writing classes by relieving you from the drudgery of
+	  implementing object protocols (aka dunder methods).
+
+	  https://attrs.readthedocs.io/
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 0d704ea11195..96d6b8ad7923 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -15,4 +15,10 @@ PYTHON_ATTRS_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_ATTRS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
