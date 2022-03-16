Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323EFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 20:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF46460BC6;
	Wed, 16 Mar 2022 20:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XP0pZ6DusNQc; Wed, 16 Mar 2022 20:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C96FD6124F;
	Wed, 16 Mar 2022 20:39:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA3861BF38A
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C70A460ACA
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 20:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eBTM7phnNx8P for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 20:39:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9A8C61241
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 20:39:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso2748971wms.1
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 13:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aWEl9KlZDY7wewf/AhyJRdE+0E/0lTMhZiUoYdWwcGU=;
 b=nI+yRTbRNb5Kpv/uRaw+wnxoZFRWqRxU4rDkoCoKsSTpp4Jcjm5aVg9ZcDOsfWJr/X
 Lsbbj8jnoe9O5PEG9jEgzKhDwgB98I8iJhN6wb+hnd717fGAYwtQv6mY4tvste5nrEaf
 LrsdIyiIysY42O6wHRCXyK1PaQgvswd3Hdi2FNwZy8/JHO2WzUWit0fROy+2iD4rHppW
 RjUSvEQOQLirB2p3O0bOQ0tg6qNixmd3R+flwOoXYPl+XakFYrJ+IyJeoB4tQTYiZak4
 AiOsOQCwKZ4ssUWXl3zLX5sJfRQfkaap6ngDdP+D2BtF4+lu6qnipJAGmfzg2OhBqDpg
 79qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aWEl9KlZDY7wewf/AhyJRdE+0E/0lTMhZiUoYdWwcGU=;
 b=JcReuq5HfA0cnjLtOEW9eaw6GwDU1UF308ZfcwSsSFGIZ6g/9/jleF004Tt4AOyiGH
 WpDeclloZ/u5Ib4/9S+XSX7wJO7Oxq3bd1r0XA+S1EAFagFEGt9pj6zSkSU0BAc7LhbX
 Is/Z/2hfPkryJCEvNI7uSIUnhHTOfbhwgHOa1BlF9C3XVnH+IHr2jFIuhKFCwB3NRHv+
 hNnScewO3OnwNx3oAQkktv/S+ocaQz9LjQhCfPE2mE0KM1GgyJ9FyvsZzWwSb5hjCa89
 l2wL2u+KvVfAUXXkg3FaaZCGdBv3Udi9T3+zTbgwy5+aaLNfK1tawYLVKVyCRX0/StMS
 gaLQ==
X-Gm-Message-State: AOAM5334hd0uTdrnJ4RzJ1t2fqP642ya9V6TkXBbP0QemQE2JAp6vDkB
 S1uJfd/uGW+PICcEO77AYLc5pQhUHCo=
X-Google-Smtp-Source: ABdhPJzVVqliHu4HGkXLkrWSkusNqWV4WeybX7oznRrvR5Y/ZVJCohjijaGG73tEoqqgpn7Bi349Xg==
X-Received: by 2002:a7b:c1cf:0:b0:38c:75c7:b0db with SMTP id
 a15-20020a7bc1cf000000b0038c75c7b0dbmr1129035wmj.134.1647463144319; 
 Wed, 16 Mar 2022 13:39:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056000170200b001f1e16f3c53sm2450642wrc.51.2022.03.16.13.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 13:39:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 21:37:34 +0100
Message-Id: <20220316203734.3081600-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since bump to version 1.10.0
in commit d96b9ed0738bae270c479bdaf21eebd4c1f9930d:

In file included from ./jitterentropy.h:98,
                 from ./jitterentropy-base.c:32,
                 from ./rndjent.c:88:
./jitterentropy-base-user.h: In function 'jent_get_cachesize':
./jitterentropy-base-user.h:191:8: warning: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
  191 |   fd = open(file, O_RDONLY);
      |        ^~~~
      |        popen
./jitterentropy-base-user.h:191:19: error: 'O_RDONLY' undeclared (first use in this function)
  191 |   fd = open(file, O_RDONLY);
      |                   ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f6182fca6a4e2ba29a89f770f17df691d7861f8d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...entropy-Include-fcntl-h-and-limits-h.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch

diff --git a/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch b/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
new file mode 100644
index 0000000000..8f76f24c64
--- /dev/null
+++ b/package/libgcrypt/0002-jitterentropy-Include-fcntl-h-and-limits-h.patch
@@ -0,0 +1,38 @@
+From ffaef0be613121d3ee37867d82932a7a30c2bc6d Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Thu, 3 Feb 2022 22:46:41 +0000
+Subject: [PATCH] jitterentropy: Include <fcntl.h> and <limits.h>
+
+* random/jitterentropy-base-user.h: Include <fcntl.h> for O_RDONLY
+* random/jitterentropy-base-user.h: Include <limits.h> for LONG_MAX
+
+--
+
+Fixes the build with musl libc.
+
+Signed-off-by: Heiko Becker <heirecka@exherbo.org>
+
+[Retrieved from:
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=ffaef0be613121d3ee37867d82932a7a30c2bc6d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ random/jitterentropy-base-user.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/random/jitterentropy-base-user.h b/random/jitterentropy-base-user.h
+index 326dfbed..389106ff 100644
+--- a/random/jitterentropy-base-user.h
++++ b/random/jitterentropy-base-user.h
+@@ -39,6 +39,9 @@
+  * DAMAGE.
+  */
+ 
++#include <fcntl.h>
++#include <limits.h>
++
+ #ifndef GCRYPT_JITTERENTROPY_BASE_USER_H
+ #define GCRYPT_JITTERENTROPY_BASE_USER_H
+ 
+-- 
+2.11.0
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
