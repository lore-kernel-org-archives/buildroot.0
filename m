Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49758C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 22:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D28D582FAE;
	Sun,  3 Apr 2022 22:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vL68YNaK4Y6x; Sun,  3 Apr 2022 22:21:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B17BD82F4A;
	Sun,  3 Apr 2022 22:21:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02B701BF350
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00AB082F4A
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tPG4sSyyG4iU for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 22:20:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B102882EB5
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 22:20:36 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id 10so6363715qtz.11
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 15:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IFYdMYgIzRRQcknKOmRicbow2ESa5rBn5jyHRT99xbw=;
 b=Y3J9Me/jNiMtcC0rt7WaYNn0+40vfUtA3nwQeea9Yj/wVDhuDRGqmUjhAdyLow0YlH
 FfqpHH11qwQ7EX8UcdfInRdEGd5eRCq2tt07mYHiwNaNWC/O7/9Al+ZT7DiH3S6vd7VE
 WI4gRa4hP0PLIiEzQ41xZyu1A7VAAnxDTBQF9bCxSTXvgUKV6TXtke44oK0Ze5G6QZaW
 CWeY801VhsqFJWQNzYFv1jCkE1lpH0CJyBGKw/++s8o6nVH+3TvQFf8HLBun0yhAAWpH
 OPNUua+A1KKG9bMdGJtCQEFLl6x/2VxJAfCfyh7LG8803tSbUBZJWp6jQgvaNQU4/Yl8
 yqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFYdMYgIzRRQcknKOmRicbow2ESa5rBn5jyHRT99xbw=;
 b=E10T76gHjbEgqINVNeEEUS6mDUNbYotithXQCYeIF4+pcjfM4iAsMHFqfcMHaANpL9
 iSSC228OWKppjMnCqqlGFpVfEQv5sH/3f7fPZuRSSDnZkbSQKfXhgHHKsfIanoiRlSGi
 zlVjPHZjCYPtzHcSJMbfdWplZxyFLIkuP3ywMFjTF65lI6zBy9yRZBK5SP6Y2lXeI19B
 hAc0ZVeMcqQsJsUv2pkwmAPur5fQ8LQuUaGTNsSO9BhhL9cZhWTeVVPSOI2MnZ3MOzYs
 jKYYWFfPauxTWbAOrxz3jca8C5YpRoDJGjDIvsBHkO2Hv9wf2rTQqG/jmxTcFEGme5cN
 JTDg==
X-Gm-Message-State: AOAM533PyRPXOSteOYbRNFSuoAN3BBqjQw/W6m8iIJJtSXaMxy0twWhf
 q2gyhZif5gVB76X1e+ZfYQLIS9YEzTA=
X-Google-Smtp-Source: ABdhPJzVyT6gpL8ww7yiD5Y0/mLOCZfi3GSviSGNqhJVYESG3gcql8r1rMqX/QO8NxIGuE5uwfN0kg==
X-Received: by 2002:a05:622a:92:b0:2e1:c711:7226 with SMTP id
 o18-20020a05622a009200b002e1c7117226mr15597839qtw.60.1649024435168; 
 Sun, 03 Apr 2022 15:20:35 -0700 (PDT)
Received: from localhost.localdomain
 (cpef832e4b04a98-cm589630c62f8f.cpe.net.cable.rogers.com. [174.116.183.78])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a05622a101500b002e07151139fsm7472717qte.17.2022.04.03.15.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 15:20:35 -0700 (PDT)
From: Emile Cormier <emile.cormier.jr@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 19:19:53 -0300
Message-Id: <20220403221953.1158787-6-emile.cormier.jr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/6] package/python-crossbar: fix configuration
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Emile Cormier <emile.cormier.jr@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: ecorm <ecorm@users.noreply.github.com>

Fixes configuration and patches setup requirements so that
python-crossbar can build and run.
See https://github.com/crossbario/crossbar/issues/1936 for discussion
with Crossbar author.
Fixes: #14556
Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
---
 .../0002-Remove-idna-requirement.patch        | 29 ----------
 ...002-Resolve-conflicting-requirements.patch | 57 +++++++++++++++++++
 package/python-crossbar/Config.in             | 21 +++----
 3 files changed, 68 insertions(+), 39 deletions(-)
 delete mode 100644 package/python-crossbar/0002-Remove-idna-requirement.patch
 create mode 100644 package/python-crossbar/0002-Resolve-conflicting-requirements.patch

diff --git a/package/python-crossbar/0002-Remove-idna-requirement.patch b/package/python-crossbar/0002-Remove-idna-requirement.patch
deleted file mode 100644
index 5e19a467c2..0000000000
--- a/package/python-crossbar/0002-Remove-idna-requirement.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9164d21cc66c1f78de37c9383528c5d528cbdbeb Mon Sep 17 00:00:00 2001
-From: Asaf Kahlon <asafka7@gmail.com>
-Date: Wed, 26 Sep 2018 15:33:43 +0300
-Subject: [PATCH] Remove idna requirement.
-
-The latest version of idna is 2.7, but it seems like idna is not a direct
-dependency anymore (a short "git grep" shows it's only written in requirement
-and readme files).
-
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
----
- requirements-min.txt | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/requirements-min.txt b/requirements-min.txt
-index 92fb0f8f..13cdac87 100644
---- a/requirements-min.txt
-+++ b/requirements-min.txt
-@@ -8,7 +8,6 @@ click>=6.7
- constantly>=15.1.0
- cryptography>=2.6.1
- h2>=3.2.0
--idna<2.6,>=2.5
- importlib-resources>=4.1.1
- incremental>=17.5.0
- jinja2>=2.10.1
--- 
-2.17.1
-
diff --git a/package/python-crossbar/0002-Resolve-conflicting-requirements.patch b/package/python-crossbar/0002-Resolve-conflicting-requirements.patch
new file mode 100644
index 0000000000..afb182cab1
--- /dev/null
+++ b/package/python-crossbar/0002-Resolve-conflicting-requirements.patch
@@ -0,0 +1,57 @@
+Remove the upper limit for idna, which is an indirect dependency via
+twisted[tls] and treq->requests. This upper limit conflicts with the
+python-idna v3.3 package bundled with buildroot. The idna requirement for
+twisted v20.3.0 is idna>=0.6,!=2.3 , and for requests it's
+idna>=2.5,<4;python_version>="3" .
+
+Remove the upper limit for urllib3, which is an indirect dependency via
+treq->requests. This upper limit conflicts with the python-urllib3 v1.26.8
+package bundled with buildroot. The urllib3 requirements for requests v2.27.1
+is urllib3>=1.21.1,<1.27 .
+
+Set the lower limit for urllib3 to >1.24.2 to satisfy the comment regarding
+CVE-2019-11324.
+
+Remove the importlib-resources>=4.1.1 requirement. The features of
+importlib-resources v5.0 (and thus v4.1.1) have been merged into the
+CPython 3.10 bundled with buildroot.
+
+Remove the u-msgpack-python requirement, which is an indirect dependency via
+autobahn[serialization] that is not needed due to the python-msgpack package
+being chosen instead on CPython.
+
+Remove the netaddr requirement, which is an indirect dependency via
+autobahn[xbr]->web3. buildroot's python-autobahn package currently does not
+support the autobahn[xbr] extras.
+
+Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
+
+--- a/requirements-min.txt
++++ b/requirements-min.txt
+@@ -8,13 +8,11 @@ colorama>=0.4.4
+ constantly>=15.1.0
+ cryptography>=2.6.1
+ h2>=3.2.0
+-idna<2.6,>=2.5
+-importlib-resources>=4.1.1
++idna>=2.5
+ incremental>=17.5.0
+ jinja2>=2.10.1
+ lmdb>=0.92
+ mistune>=0.7.4
+-netaddr>=0.7.19
+ passlib>=1.7.1
+ priority>=1.3.0
+ psutil>=5.2.2
+@@ -37,10 +35,9 @@ twisted[tls,conch,http2,osx_platform]>=2
+ twisted[tls,conch,http2,windows_platform]>=20.3.0; sys_platform == 'win32'
+ txaio>=21.2.1
+ txtorcon>=20.0.0
+-u-msgpack-python>=2.4.1
+ # urllib3 is an indirect dependency, but we force a recent version because of https://nvd.nist.gov/vuln/detail/CVE-2019-11324
+ # workaround for version conflict in requests vs sth else:
+-urllib3<1.25,>=1.21.1
++urllib3>1.24.2
+ vmprof>=0.4.12; platform_machine=='x86_64' or platform_machine=='i386' or platform_machine=='arm'
+ watchdog>=0.8.3
+ werkzeug>=0.14.1
diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 9625d9ce8e..ef02dd54f9 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -2,21 +2,21 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	bool "python-crossbar"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	# All the following dependencies are runtime dependencies
-	select BR2_PACKAGE_PYTHON_ATTRS
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_ACCELERATE
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_COMPRESS
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_ENCRYPTION
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_SCRAM
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_SERIALIZATION
+	select BR2_PACKAGE_PYTHON_AUTOBAHN_TWISTED
 	select BR2_PACKAGE_PYTHON_BITSTRING
 	select BR2_PACKAGE_PYTHON_CBOR
-	select BR2_PACKAGE_PYTHON_CBOR2
 	select BR2_PACKAGE_PYTHON_CLICK
-	select BR2_PACKAGE_PYTHON_CONSTANTLY
+	select BR2_PACKAGE_PYTHON_COLORAMA
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
-	select BR2_PACKAGE_PYTHON_H2
-	select BR2_PACKAGE_PYTHON_IDNA
-	select BR2_PACKAGE_PYTHON_INCREMENTAL
 	select BR2_PACKAGE_PYTHON_JINJA2
 	select BR2_PACKAGE_PYTHON_LMDB
 	select BR2_PACKAGE_PYTHON_MISTUNE
-	select BR2_PACKAGE_PYTHON_NETADDR
 	select BR2_PACKAGE_PYTHON_PASSLIB
 	select BR2_PACKAGE_PYTHON_PRIORITY
 	select BR2_PACKAGE_PYTHON_PSUTIL
@@ -29,17 +29,18 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	select BR2_PACKAGE_PYTHON_PYTRIE
 	select BR2_PACKAGE_PYTHON_PYYAML
 	select BR2_PACKAGE_PYTHON_SDNOTIFY
-	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_SETPROCTITLE
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_PYTHON_TREQ
 	select BR2_PACKAGE_PYTHON_TWISTED
+	select BR2_PACKAGE_PYTHON_TWISTED_CONCH
+	select BR2_PACKAGE_PYTHON_TWISTED_HTTP2
+	select BR2_PACKAGE_PYTHON_TWISTED_TLS
 	select BR2_PACKAGE_PYTHON_TXAIO
 	select BR2_PACKAGE_PYTHON_TXTORCON
-	select BR2_PACKAGE_PYTHON_U_MSGPACK
-	select BR2_PACKAGE_PYTHON_UBJSON
 	select BR2_PACKAGE_PYTHON_WATCHDOG
 	select BR2_PACKAGE_PYTHON_WERKZEUG
+	select BR2_PACKAGE_PYTHON_ZLMDB
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
 	help
 	  Crossbar.io is an open-source WAMP application router that
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
