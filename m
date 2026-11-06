Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578B0606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lixrL+hA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=KvuKkZRG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19724607B2;
	Fri,  6 Nov 2026 09:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfswSuHw1DKW; Fri,  6 Nov 2026 09:04:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2612A60617
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793955852;
	b=ROqBlJHsn8ayYuarTKTHVw/tANLop8YYjZFsRSngPDO+UPZtfdaZv7Oz4IsqHnzVTiAi
	 5Es5zgFxXEplndmHI94p9XpOXgmZOT9+a9Hut0pRg9HHacEBe1EqcB41gVlTmYAS+1QCB
	 yOg/PYirwxijZ/63A6wq77Vac8IU9FGgjKEXZwwbvjGNVn+yBb8c/hWSyxK2BrwQ25nxP
	 fUJOgw0nqqSdIAh+QNRxCOGrTQpKexJomW7P92ElFZdumhNs92k+Y3kampUaMV58/QXhs
	 68AWErU6Joc+v6HlhmDVuMTeAUi45PCkVfqJLPphBMwEkos6w9u23EeouGZTGemEA0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793955852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wg5JjMPXzIW85eUk2up+neVH2AJB99IJvFfUaulNuWw=;
	b=qC7pCkAN0h0AC3cJlhkiJzntOKXEV78EfF8S2jEh8NhMQtm8QZFlXUv/D/0BREZGLoQD
	 nGkjGausTYfI7smmK0uoCkew0B8P/j7aGwA3wmBAgFIwPzv1YpXcD/Gq8/X32tI0WYZp1
	 xTZ+ciV0Jilvj1398f7aZV/MGT3r/rC679/LuOiUa1FRhsmFcFEhXaqoR8DkPvKHp5zVA
	 vo9cc+mwlQIAgfycxvud4S5jDJCwWCM6yu6k5qW08C/5rxC5aCjPJ6tWRJm00cC2NhZgG
	 NLde0pV5Aec4axmQKdB4Y5CSD3nTRtah3d80hBfxIFokkCixPKRFYJgoFyFmhxWvf+Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793955852;
	bh=Wg5JjMPXzIW85eUk2up+neVH2AJB99IJvFfUaulNuWw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lixrL+hAVgBZLbnnikpLxsnZEKPpfEPJRbY9/TdncsM3e/Yrc7yqxHIzBQZPcx5ej
	 fdGIzRN0facLr0OIZBhD00/vRlMng/dOw8ruBDFJUD9jZufPW6wraZS+7JFrDkLS08
	 RJ3/C53WWkmJsU1Lbq/mHIkwiek8JsDOgNiVYu8n8S1x8+Hck9WD3fcvHUxsOkkXBs
	 EhqYH3j+TiveFJLIm1Zmg2j5vy4P+6x3YckZow42eY/PSmpwFGt3aTbnq8vY4UvRiY
	 BJdvshNGDWZ4DIkYz94O174uqgl5j9l7aObpv+6FGWv+SwuNa5su7V/kTujp+Oas+9
	 Ki7klPotweGcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2612A60617;
	Fri,  6 Nov 2026 09:04:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E32362
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 09:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03705403A6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 09:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OYWCBD7b8gX for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 09:04:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B0AF9400D5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=KvuKkZRG
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0AF9400D5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 09:04:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b429f71dbeso360462a12.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 01:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793955844; x=1794560644; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IFSjRFtOWQdXlYFZy3I/OTKmhe0nNWXDaflacde6s+k=;
 b=KvuKkZRGgm8p4/KzXgigFd0smX2k2qXUSXChB9ZsBfPewMS8lCk9YZL6XpmZO8XT9P
 yIYc3xEK+ebjHmeILvXKAwNXz98yJuPdkOG6M0BLNt/R8WHwHu/bM3gy03LOxtacEj7G
 2JcNq61oOB5Pv6Ghi4HOhWFZFpFq+fDhb2pG13QgNc6cB3K5DnY2rbNvWfvsQMZWaaKq
 q453vnkiGfcXNwkaYXLxmA4k22vQKLRAIOJ9w1qqbaDAe9obUTSS9ShUvWYlNmXycjHJ
 TiEuLDAj4Qa4RYER25HbJhUUDmaa3HgByb8igr0l8GgJGuHYuu3M+fjT7FcIPE1ql23S
 QFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793955844; x=1794560644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IFSjRFtOWQdXlYFZy3I/OTKmhe0nNWXDaflacde6s+k=;
 b=lMoRlIcWCYWSQJNlLD4sPxLDwij8/WSTDBxNbXuWUXCyrDvYo7oY52c/a+tCYLodTU
 KIQgxwFs/WnU1h6Lba2PZLrLT5AVziRE3AU80ilHkoef0PQUeNZJeN+uzHU5ZGVWCfvJ
 8ZRvrdheKg7UAe9OBROoZAsO8nxf8Jc1I6cW16UfDp/rG+kqVlqdsCDqPOYJ4tIgQgFL
 jhRGUVjmwhgPHrFtebGG1DmfHRc9xm+ZrKRd9BlLL5qW8OsBiDytihOg4M48XUWtYaLc
 9ubQXbPV6zOmr1Rd/75syrFbzaDPjBvj+Bs3CoDOgzTbd9k1Bd8RINlQBuNZyGzwZk4H
 RzKA==
X-Gm-Message-State: APuU4Z+cp8yuXeAK24eceeAIvFg2dGgwcpF0p0hMtJchglEkHRD9YP/O
 ubK+fG0PX5cF0ZY8QuoK0ezalLVw7lYdiLyRkD5+TL+wCye6ftsDjpIBFJFFIQ==
X-Gm-Gg: AYBFou1w0stEOR/K5dZlzMzAXwRZmjXMAf7HI4RG3jIBwx6CcIGZtTbixdE3gnekmHJ
 ep1YmkCMMR7cAw309H7iPLo7CvkzUYE9h4VEDfL4+TMYcmUnMjd/oVjqNMBo/pxYPfWu4NCW0mT
 EFVX5O94RkZ1yljnzdrIBSNUhnXIaYb20/aiyEceBTodvJ87z1UjDZ6zVG9NNBpThtevTKlDTGU
 2lUgaLrOOkxV9HahfuDq+Eg5tYVV2SfojUyL3KjlfVyWGgSMNcvG3qLjgR27QDDTmG8Be7HxK6T
 IgyFGGkSqqu7FkYjMSBbdX8K5xevq5iVFjm7x2Ez2a3ktPRSSzhJal40uuX8lboekWhgZFxC0PM
 rZknM16wwRcWn65NMO8Kf35wCvyXdTpMnm4hdoTHTBArPnUgj0unI6bqiItThPL+RM8CLYRUWG9
 MRHEqJFhcoH2PR5ekQ3nQ+qMc/ktfPrr5HsN67o3USZs2TSfPmT+Dy0Pde+l3W3JLZScniQKayE
 5U4v18/4vTNkPfv01QrRe3rEmvoCfpAoEzJk4zb+Z5F+BFDPpOQdueoxmUb5V9nVMRuDVAyJLJx
 R4G3P9JsIuyYgGhRoM4kRsieLGJqQalut4sYX8ub+eKMDSq0TNPc4+F2U8CYOLej6BMj5u10HYo
 8TpSpB86A
X-Received: by 2002:a17:907:968f:b0:c2d:d408:5d9c with SMTP id
 a640c23a62f3a-c4d34cbdc2bmr150551466b.48.1793955844036; 
 Fri, 06 Nov 2026 01:04:04 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d3569f525sm60356166b.55.2026.11.06.01.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 01:04:03 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 10:04:03 +0100
Message-Id: <20261106090403.1169596-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lcdproc: fix build with GCC 15 and musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

lcdproc includes its bundled shared/getopt.h, which only prototypes
getopt() for the GNU C library and otherwise declares it without a
parameter list. Since C23, which GCC 15 uses by default, "()" means "no
parameters", so the build fails with musl, which declares getopt() in
<unistd.h>:

  ../../shared/getopt.h:136:12: error: conflicting types for 'getopt'; have 'int(void)'
    136 | extern int getopt ();
        |            ^~~~~~
  lcdexec.c:226:21: error: too many arguments to function 'getopt'; expected 0, have 3

glibc and uClibc-ng define __GNU_LIBRARY__ and get the full prototype,
so only musl is affected.

Add a patch, submitted upstream, dropping the include of the bundled
header so that the system declaration from <unistd.h> is used.

This issue has been present since commit 75891397abe6 ("package/gcc:
add support for GCC 15.x"), which made GCC 15 available for internal
toolchains. It therefore affects 2025.08 and later, i.e. all
maintenance branches except 2025.02.x.

Fixes:
https://autobuild.buildroot.org/results/756efe176812427091958621d0bf7db381d443b0

Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...04-Use-the-system-getopt-declaration.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/lcdproc/0004-Use-the-system-getopt-declaration.patch

diff --git a/package/lcdproc/0004-Use-the-system-getopt-declaration.patch b/package/lcdproc/0004-Use-the-system-getopt-declaration.patch
new file mode 100644
index 0000000000..21b7f6d73a
--- /dev/null
+++ b/package/lcdproc/0004-Use-the-system-getopt-declaration.patch
@@ -0,0 +1,85 @@
+From 8eb8518f93121895b3460d1879d711c743af8c67 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 6 Nov 2026 09:49:44 +0100
+Subject: [PATCH] Use the system getopt() declaration
+
+LCDd and the lcdproc, lcdexec and lcdvc clients include the bundled
+shared/getopt.h, which only prototypes getopt() for the GNU C library
+and otherwise declares it without a parameter list:
+
+  extern int getopt ();
+
+Since C23, which GCC 15 uses by default, "()" means "no parameters",
+so the build fails with a C library like musl that declares getopt()
+in <unistd.h>:
+
+  ../../shared/getopt.h:136:12: error: conflicting types for 'getopt'; have 'int(void)'
+    136 | extern int getopt ();
+        |            ^~~~~~
+  lcdexec.c:226:21: error: too many arguments to function 'getopt'; expected 0, have 3
+
+These programs only use getopt(), optarg and optind, which POSIX
+declares in <unistd.h>, already included by all of them. So drop the
+include of the bundled header and use the system declaration.
+
+Upstream: https://github.com/lcdproc/lcdproc/pull/236
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ clients/lcdexec/lcdexec.c | 2 --
+ clients/lcdproc/main.c    | 1 -
+ clients/lcdvc/lcdvc.c     | 2 --
+ server/main.c             | 2 --
+ 4 files changed, 7 deletions(-)
+
+diff --git a/clients/lcdexec/lcdexec.c b/clients/lcdexec/lcdexec.c
+index c461b6e..2f2dead 100644
+--- a/clients/lcdexec/lcdexec.c
++++ b/clients/lcdexec/lcdexec.c
+@@ -22,8 +22,6 @@
+ #include <sys/wait.h>
+ #include <stdlib.h>
+ 
+-#include "getopt.h"
+-
+ #include "shared/str.h"
+ #include "shared/report.h"
+ #include "shared/configfile.h"
+diff --git a/clients/lcdproc/main.c b/clients/lcdproc/main.c
+index b8c570b..fc7a991 100644
+--- a/clients/lcdproc/main.c
++++ b/clients/lcdproc/main.c
+@@ -37,7 +37,6 @@
+ #include "shared/sockets.h"
+ #include "shared/report.h"
+ #include "shared/configfile.h"
+-#include "getopt.h"		/* This is our local getopt.h! */
+ 
+ /* Import screens */
+ #include "batt.h"
+diff --git a/clients/lcdvc/lcdvc.c b/clients/lcdvc/lcdvc.c
+index 2ae2875..2cd1fbc 100644
+--- a/clients/lcdvc/lcdvc.c
++++ b/clients/lcdvc/lcdvc.c
+@@ -22,8 +22,6 @@
+ #include <errno.h>
+ #include <stdlib.h>
+ 
+-#include "getopt.h"
+-
+ #include "shared/report.h"
+ #include "shared/configfile.h"
+ #include "shared/sockets.h"
+diff --git a/server/main.c b/server/main.c
+index c80aef4..8f58658 100644
+--- a/server/main.c
++++ b/server/main.c
+@@ -44,8 +44,6 @@
+ #include <sys/types.h>
+ #include <limits.h>
+ 
+-#include "getopt.h"
+-
+ #ifdef HAVE_SYS_TIME_H
+ # include <sys/time.h>
+ #endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
