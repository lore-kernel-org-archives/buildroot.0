Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AD4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 18:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4873D60C1E;
	Sat, 25 Dec 2021 18:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48OXVLOQ3ee7; Sat, 25 Dec 2021 18:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D54D60C16;
	Sat, 25 Dec 2021 18:35:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE04B1BF313
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 18:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCC5960C16
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 18:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BHYBFS6Y7ABO for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 18:35:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D852760C15
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 18:35:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 k66-20020a1ca145000000b00345fa984108so604183wme.2
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 10:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/Ht4iKi6qFvxoUuy44Zy4r677sieYMIHyFE93H9vjw=;
 b=FmPPtw7hLbVAKyXnJna8JloeyJc7DhSXeu0o4ZiWfJUbhkTUKuc5fveknKJRYUz+D4
 feLnai/DOeIWmeGUjqjScJIRfNWdQVyNzAKRfY/LkjnSdCr+3pE0baMxxF0Imx1+Oqe3
 O1uuhyoju+a31KUOfdqsrpW7J3zNfUzLkV2J6pd4ccEvXwRo1OAxvC2xxqauSekrv/j5
 56CQKNzq+3zn8idpD0Mx58u1K0L/Xz1is+E24QICrOLoJjoFQG946G5RSak4+Qji6uR7
 OUfMitgh7kWNU8HyS/cqjXlkrRjP14Pa7lkpwQzRTshQ271DfakL0ESLaxc88M0O5IsL
 AG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/Ht4iKi6qFvxoUuy44Zy4r677sieYMIHyFE93H9vjw=;
 b=sNVM6jyd0xIJAQPvL1wg+KEaWYO9Nn2eNmNEmQGTtwKslO3y82XJ88vJ/wsufzbbsN
 zHCk/y+BoCd5ff7A7tTq4esmJJ5Sb72NjvHsx20U4f1d+PoBh7anDTeANuKAnzwGea1b
 aO4AX8H8MqRAc6WQ0WOrPT+JLFblHmRLj1X4NKLaIGq1o5IbKjGe9O5jFUnD7VMAwQ6V
 EIXIyK2XEI8YbLwmYdvmwGVOZ5lkjIyQXqYjWvEVLP0Nx9sHwYwIDPQFkFb0bP4ThR3j
 4AbdalElAhELgiemKV53NDfazF79mz/gd/0PcZPxh6pNEeh2H4eLJGOGtSScYsPH0kNW
 cCsA==
X-Gm-Message-State: AOAM533/lvUTI61zP+f1/XTB831nTLQoUKZoxZC/RJ0XVylefaUIbJP2
 mIJaGJW+W21b/MF26AnITCy0JhPErPHwbQ==
X-Google-Smtp-Source: ABdhPJyK0VKVlMpTsPUpwPBbkmRVzcNsszJm3/HbggWhOBtXcnZozqxFIor5x0MQnQD/3ZwfBjUyRg==
X-Received: by 2002:a7b:cb90:: with SMTP id m16mr8106826wmi.183.1640457333862; 
 Sat, 25 Dec 2021 10:35:33 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id p21sm11409305wmq.20.2021.12.25.10.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 10:35:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 19:33:38 +0100
Message-Id: <20211225183338.188793-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lttng-libust: fix legal-info
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

COPYING has been removed since version 2.13.0 and
https://github.com/lttng/lttng-ust/commit/c0c0989ab70574e09b2f7e8b48c2da6af664a849
resulting in the following build failure since bump to version 2.13.1 in
commit 733bf73e3ff86dd80e68e22c0ccc2f43e4a3d475:

ERROR: COPYING has wrong sha256 hash:
ERROR: expected: 74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e
ERROR: got     :

So use the new license files, add BSD-3-Clause (which was added in
version 2.13.0 and
https://github.com/lttng/lttng-ust/commit/d8621b3ea82b7fc1937b0eefb2b1316b2ce361a5)
and don't add BSD-2-Clause and GPL-3.0+ as tests are disabled

Fixes:
 - http://autobuild.buildroot.org/results/470d6401f2a97f4ac91b2d8cfb1af90b638320a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lttng-libust/lttng-libust.hash | 8 ++++++--
 package/lttng-libust/lttng-libust.mk   | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 23839e42cc..42f2b372dc 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,9 @@
 # From https://lttng.org/files/lttng-ust/lttng-ust-2.13.2.tar.bz2.sha256
 sha256  5667bf0269e1e62e2d9cb974c456ff86e0401bd7aa3bfc8d5fdb97233249eddc  lttng-ust-2.13.1.tar.bz2
 
-# Hash for license file
-sha256  74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
+# Hash for license files
+sha256  5b52242fd2045d62dd664c8358137b46c1e08efdba674c91cbfc06585efe1ce7  LICENSE
+sha256  f206ce02ddf94d03120b58381064702729a0e6cbb03cafc84dc0e434ce5689fa  LICENSES/BSD-3-Clause
+sha256  6841c85b94f9dab319356e3aaf9e969fcedad51d3aaadf665bf86f34f4186b62  LICENSES/GPL-2.0
+sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index e3e1cdebf2..690d18fe3d 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -7,8 +7,8 @@
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.13.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
-LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
-LTTNG_LIBUST_LICENSE_FILES = COPYING
+LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond), BSD-3-Clause (snprintf)
+LTTNG_LIBUST_LICENSE_FILES = LICENSE LICENSES/BSD-3-Clause LICENSES/GPL-2.0 LICENSES/LGPL-2.1 LICENSES/MIT
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
