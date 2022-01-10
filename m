Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3238BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 13:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6A66826C0;
	Mon, 10 Jan 2022 13:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysI5jLfAd44l; Mon, 10 Jan 2022 13:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 117808250B;
	Mon, 10 Jan 2022 13:03:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C91171BF275
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 13:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B65BA60DFA
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 13:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AV608omep0aC for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 13:03:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1C7660E0F
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 13:03:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 18-20020a05600c22d200b00347d3a13c7cso4686431wmg.0
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 05:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sEXYovDzB91iEE2YIZzemu+sUigH1masJiOWYE2clkU=;
 b=BYfu/ugawrdxMApv6VCohx5M3IuepS1yUyIEStooMVJqUuC+FIqWWbCgBpyr4a00fG
 KLF7kdTP7hQ8IOUbu7U9enYiBUOfiN7fWDauA2K9Jl+9XgTj2qHqmyoIhgzjv51HZ2TH
 T1e4KjY7qWH5oPjLI71NjDC1YmHqXl8MkqDpXg68ravhuqui9Mgmlh4MbO//+feR3ek9
 nkIxLRCINdtG804GG011fkCn+QcTc025TyT1E4a55Sezn+Ql8xWqhNwkc5b+1oTlKWNN
 5k09kqy4MssV6zTH+GWx+I4eC3MCwWzuZYc7dclavSSxZOTUqrMplK/9HZuiAbGNomYK
 3KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sEXYovDzB91iEE2YIZzemu+sUigH1masJiOWYE2clkU=;
 b=M7SvBjDnGeP3DYBuYfQdU8egCjjNAtrEaUkdDp4u+jP3/NNqgvnTA3HKR3JnK8ClKN
 HHBQ8BDB7AnW/oP/eT85varICEFd1OY+6GnlpsFfyx8cZt/vuMMkfwIvbxlZ89E/b81p
 u25SNmvSfEk7gBit+AYbmWdTbtQrdRsUGm8EW6lclKJP6XOKrgYkNvasQF80bTL4srrz
 fyFnzPwlLS1HNyC09PxEtli9NNia9b1huwJq6UJWFtbBp+RJQl6z5V5DbtnAe6VbvchV
 SRbsqdGM5sl5/74ingnwKswekPiu3hRNnsdX8LJySmzxg7jW7qOnxa4wNQ7gA2FtNoBi
 gIPw==
X-Gm-Message-State: AOAM531ZQ4vLvfz5K+QMk9CrUqqahxBuetsPpeV/t+ygL879OE/uuZsk
 FzPVe4Lzi1CysAoiyXvzB+bx+9jaeRLdtg==
X-Google-Smtp-Source: ABdhPJz16NE8gm/tYfUZ1CveBMMJeGqRBjv4pZMr2X3yfxahhwi5zkiDqNQDIRSVsUtcSstPC8X7SQ==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr21875304wmj.144.1641819785703; 
 Mon, 10 Jan 2022 05:03:05 -0800 (PST)
Received: from camb691.localdomain (ozlabs.org. [203.11.71.1])
 by smtp.gmail.com with ESMTPSA id r1sm7435694wrz.30.2022.01.10.05.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:03:05 -0800 (PST)
Date: Mon, 10 Jan 2022 13:02:49 +0000
From: Cyril Bur <cyrilbur@gmail.com>
To: buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>
Message-ID: <20220110130249.5b897804@camb691.localdomain>
In-Reply-To: <20210623145231.19243-1-cyrilbur@gmail.com>
References: <20210623145231.19243-1-cyrilbur@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/python-greenlet: enable as host
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While currently there is no in-tree Buildroot package which depends on
host-python-lxml, we (Adder Technology) have some proprietary modules
that use it as part of their builds.

I've tested python-greenlet as host package and confirmed that it builds
and works correctly. Someone else might require it, so we are proposing
its inclusion.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
V2: Added Config.in.host and a better commit message

 package/Config.in.host                     | 1 +
 package/python-greenlet/Config.in.host     | 7 +++++++
 package/python-greenlet/python-greenlet.mk | 1 +
 3 files changed, 9 insertions(+)
 create mode 100644 package/python-greenlet/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index b3e00bb482..6e027d96c2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -69,6 +69,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
+	source "package/python-greenlet/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
diff --git a/package/python-greenlet/Config.in.host b/package/python-greenlet/Config.in.host
new file mode 100644
index 0000000000..673fee8cc5
--- /dev/null
+++ b/package/python-greenlet/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_GREENLET
+	bool "host python-greenlet"
+	help
+	  Greenlets are lightweight coroutines for in-process concurrent
+	  programming.
+
+	  https://greenlet.readthedocs.io/
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 7b983ff0ef..3b1ef7e314 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
