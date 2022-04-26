Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C364AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 22:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 670BC61128;
	Tue, 26 Apr 2022 22:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8k7ciyXa162f; Tue, 26 Apr 2022 22:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F7E661130;
	Tue, 26 Apr 2022 22:35:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 647591BF951
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 607BD61124
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 22:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yuPyH_dr57mI for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 22:35:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A71D6111D
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 22:35:29 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id f2so220944ioh.7
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 15:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AKo+pn3wUZOMDn/+JssKCCxJgGWs8G+blozSgqrSt3c=;
 b=acjUGbSaLU4Inhz8fYuiY748+VnsJTqU0ZJarsXUu2AxYwBPLVsQ41FdQS+32RU80q
 1boJq0/50TK34AjWqm2jaylpSGospPeEbcbFQjylq3QhWvOb2/Fhd/dlWUafg8Hxh142
 jydAaOQ5AbQ7vi/W1xACOAPWO9Qrf0RgmNA5mIbFF4uF6+inSF7DoUAjZqmeBxY0T/jN
 0e/0DWjonKybAiSrh2PZOXbFWOJ7Y8UmBQzxprBchj5oCAvnlFg29xS1r4medBFP6mjc
 bgH4/dfBEWOjoHX3eBwd64kalvhSQxccFDJ1s8IrIeqIJKvKSmOuD0oMqBIrKH2fG5A5
 1iEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AKo+pn3wUZOMDn/+JssKCCxJgGWs8G+blozSgqrSt3c=;
 b=z91sST6PmMYcx8iEez9iZqLbiKcSX7Qe7bnoBagrQNvCUzkpkmY4v52JOku9Y4xlxG
 t7D4HpJYcvKE7nJiBTXnCZxJSzgiFYm6ZATxlbl3SRhc5yM6OHu1ANLLWvt87Xa0zCEx
 K41x6Xetv8kiiEeu4D43x04f4CKsCVz5l4dtu1jlExqwteofnfVX+HcwVR5RBG449Dx8
 40p9aaw059tOFTtt5vuvneauFh34iL6p0zP9+ADShckUoWvlJYM+ozjafK4SOnHn7wT5
 BszSF5AiT+ai2oFgp/u9SDsDW61ptQaVYt/zfe8ehd1Gwg6KRdSPrQfRDZrUig820HnK
 mHsA==
X-Gm-Message-State: AOAM530t7JQNc07qPZ+5HXYvNJDvc42FzvsbA+SUbmepbPZlMahDnB/K
 xp93YoM+HrHn384fGrj/bvBoUxKWQEc=
X-Google-Smtp-Source: ABdhPJwVknlm3Fp2gA7YPSVzP6NpxoMKCo63wF6SyJwvToUeByrzHubU4urtRLohdD8hDT8rkzA2gw==
X-Received: by 2002:a05:6638:24d0:b0:32a:f30f:ef52 with SMTP id
 y16-20020a05663824d000b0032af30fef52mr5247029jat.80.1651012528107; 
 Tue, 26 Apr 2022 15:35:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 b24-20020a5d8d98000000b006409ad493fbsm10211058ioj.21.2022.04.26.15.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 15:35:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 16:35:17 -0600
Message-Id: <20220426223517.997019-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wayland: don't rely on implicit GNU
 extensions
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch so that we don't rely on implicit GNU extensions.

Fixes:
 - http://autobuild.buildroot.net/results/c22/c227166c2825ae4e884936fbe627f3997e0e19b7

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...on-t-rely-on-implicit-GNU-extensions.patch | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch

diff --git a/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch b/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
new file mode 100644
index 0000000000..fcafa98f46
--- /dev/null
+++ b/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
@@ -0,0 +1,108 @@
+From 0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9 Mon Sep 17 00:00:00 2001
+From: Simon Ser <contact@emersion.fr>
+Date: Mon, 10 Jan 2022 14:51:55 +0100
+Subject: [PATCH] build: don't rely on implicit GNU extensions
+
+Currently libwayland assumes GNU extensions will be available, but
+doesn't define the C standard to use. Instead, let's unconditionally
+enable POSIX extensions, and enable GNU extensions on a case-by-case
+basis as needed.
+
+Signed-off-by: Simon Ser <contact@emersion.fr>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9]
+---
+ cursor/xcursor.c        |  1 +
+ meson.build             | 10 ++++++++--
+ tests/display-test.c    |  1 +
+ tests/event-loop-test.c |  1 +
+ tests/fixed-test.c      |  1 +
+ 5 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/cursor/xcursor.c b/cursor/xcursor.c
+index 0506680..188be7c 100644
+--- a/cursor/xcursor.c
++++ b/cursor/xcursor.c
+@@ -23,6 +23,7 @@
+  * SOFTWARE.
+  */
+ 
++#define _GNU_SOURCE
+ #include "xcursor.h"
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/meson.build b/meson.build
+index 07bbd29..cab267e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -14,6 +14,12 @@ config_h = configuration_data()
+ config_h.set_quoted('PACKAGE', meson.project_name())
+ config_h.set_quoted('PACKAGE_VERSION', meson.project_version())
+ 
++cc_args = []
++if host_machine.system() != 'freebsd'
++	cc_args += ['-D_POSIX_C_SOURCE=200809L']
++endif
++add_project_arguments(cc_args, language: 'c')
++
+ compiler_flags = [
+ 	'-Wno-unused-parameter',
+ 	'-Wstrict-prototypes',
+@@ -79,7 +85,7 @@ if get_option('libraries')
+ 	]
+ 
+ 	foreach d: decls
+-		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep)
++		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep, args: cc_args)
+ 			error('@0@ is needed to compile Wayland libraries'.format(d['symbol']))
+ 		endif
+ 	endforeach
+@@ -87,7 +93,7 @@ if get_option('libraries')
+ 	rt_dep = []
+ 	if not cc.has_function('clock_gettime', prefix: '#include <time.h>')
+ 		rt_dep = cc.find_library('rt')
+-		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep)
++		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep, args: cc_args)
+ 			error('clock_gettime not found')
+ 		endif
+ 	endif
+diff --git a/tests/display-test.c b/tests/display-test.c
+index 763adc9..a6f410d 100644
+--- a/tests/display-test.c
++++ b/tests/display-test.c
+@@ -24,6 +24,7 @@
+  * SOFTWARE.
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/tests/event-loop-test.c b/tests/event-loop-test.c
+index 9d43c91..a51ba8f 100644
+--- a/tests/event-loop-test.c
++++ b/tests/event-loop-test.c
+@@ -24,6 +24,7 @@
+  * SOFTWARE.
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdlib.h>
+ #include <stdint.h>
+ #include <assert.h>
+diff --git a/tests/fixed-test.c b/tests/fixed-test.c
+index 47a4dae..0b58797 100644
+--- a/tests/fixed-test.c
++++ b/tests/fixed-test.c
+@@ -23,6 +23,7 @@
+  * SOFTWARE.
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <assert.h>
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
