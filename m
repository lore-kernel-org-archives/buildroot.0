Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68301606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fQ+TNq7W;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=WS2FqJSA
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E27460640;
	Fri,  6 Nov 2026 08:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLyGPsVErW1l; Fri,  6 Nov 2026 08:32:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4159060774
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793953962;
	b=YbpDu73Zy1kkNmaZOCYd8x+i+e3+mRQS3M6ftCgbZgtDS08mjN315PCbtzqblw2Xe+cp
	 8rgD8xmrgdgPEoFW48esTKWhreMIvu9kdPW/YMQeKY5KIMb0/NQG56uIdQPIRo6CkgTO9
	 ji4lGOpAilMqBAv58m1lKgsDWGtxeRnLOnRJpBw/MfDQrUwZQ1SiX1ZnSrLpIL4FqxuAa
	 UK2rebWZJud1Y/aZkaDv07d/qWOLmg5xwD+s9JFg9VkmRFFpMpj7pjrdUS9VXtMUcYp+X
	 OQW+ktE2S8elSiZIagbfrxfHO9zDWrGsRyG+gV98j71kk1WEpsLDvL3UoxhwyxGdAdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793953962;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=A9qUNWgzX0x0C4jIsUJiBXoKRqGoslJERF//txX5nqU=;
	b=HjYX4tpgOBbQATdfEmk/th8dYPqmirayBqrt9hrXFW6rTRKRzxECrYuMrQ/0fwkU0Vwk
	 rU+AwAE6chKJro4wXzVkiJo0xgr0vjmDp+7MsLCw9QX5SRQJHhGB47cJhzyqNDLGKSGoA
	 Nca9EGgZ58dw/eSe1PqLXcB03BAY2AJAy4AYrEuejYpTdTeD/3heNbecddXg4u2oJmrnB
	 1KuBY+PLZ7ZXrYcpaTLuJVDWkh45TcXsfP6nCNfPtsUqZSckKKEBHaTmiwRLV+HFcdviP
	 7WEq0iB37hEukTohKO4PN1mNVbeZ6WVjibtwHSw01w628l9sKzq7VbTvc3G99MRJBRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793953962;
	bh=A9qUNWgzX0x0C4jIsUJiBXoKRqGoslJERF//txX5nqU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=fQ+TNq7Wv9Zd83I4FOSkMoPfmbYxmQgTKSP4j9GQGzM3lFDmhEvC5lLQIAJJUQl7E
	 6Wgy8Ko4+92CKDBVFL59dSRwMVz4cH+1PVEJrWQflpTnit1Cukk0JtrNRnwLcxex0u
	 IOJfoZWyQFUdl+GOfKV8atO/yYpxURy5kmDbX5R50LDBRi9mobvV4OD5D0e1LI4fxf
	 XVRGL0dE8I/wzXupx5rF1j3YI+O6tItlv9sK0zDZq0Nqzj+cnYe/et86vyMAHchlsM
	 b6uCQO0r+03JtAZkCdECotTll92Tvo5Y/tqGyKMJ8UbxGde/J5260kwHVXxX87ky4N
	 r3jytce+wxd0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4159060774;
	Fri,  6 Nov 2026 08:32:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C16051E3
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 08:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2C534081B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 08:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XU4NDYPZP1Sq for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 08:32:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9D1CD40806
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=WS2FqJSA
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D1CD40806
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 08:32:38 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6b596569640so558521a12.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 00:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793953957; x=1794558757; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zcxwCOoaoNKg/A6U0Ob+Z3uH1nMQmaxFmk/lSQ2bTdQ=;
 b=WS2FqJSAMnMKhjOP/ss95VshA5wGYL6nnJQxDBFb1B/mrAQ/AhajSEicTHVH3oG3mL
 QaGkLYRufbuG63cWS4dmF+Rz5OE9C0Zitt2P0xicbpzr2EnuVTXEEUCvp91asBLgrLR+
 dkynsL8C4gshnfOQmUCD+ZyJ8DD/kqXECRitX2Ucl31VhLX515MggVc2EaTJu0Be+AOs
 TNKAfv9CwmhKIS40WcGXxU9Yi5cnmUH6JLUio6/n9IdIxcqZWus7hfW/Gk1PHJ/K+tCX
 CJWts6ewVqFJyEUWjocUS+BTsbEW0vLsr602N1QKOODapxR0ep+Zy3G24KQ8sHQK200l
 05gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793953957; x=1794558757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zcxwCOoaoNKg/A6U0Ob+Z3uH1nMQmaxFmk/lSQ2bTdQ=;
 b=kfDlPnbL6WchLrdtQG3/ZxeYeV+53JUXwQV0xLsKSwqXfLvZXb3DJo8wTNwTX0Rcmh
 YVgiXTGpiHA3TyQCSCNMib+AvpKAS/VKqEMXjY7NIrrLLLtmQPW4YDZSkoJGm+Q1+9pA
 9n8/rTHgMr+LErBb8531ZSc/fb6n0tFNuJ+T9iBA4LL6iCT2R0KxgTlqZu+/ZmZjqKq3
 tBSA/CID1ogLj+x1IeB6ZgtOfCWCe+ju2FQdZTP5IbYd4ErarSSjpXAiUAYsdpwzs8Yt
 H1RQlISCyTDs9w8ThdQqylyJr+I38GZYUBDJMPuu5laTT/YlzZTGGHTI9lCcRErZH9c+
 15Fw==
X-Gm-Message-State: APuU4Z/FMQ7d/hRBT4IDQYi1SCAV2oflljTGqOytABOYyM+nbmtHFIpz
 19B9Nj2mDw+et2kZhBfb1Kb9gxRb/7PyEU/ubm984f5PT/tlQeSyxrbA6pzqiw==
X-Gm-Gg: AYBFou3YR+Q8W+Ic/suB0WcMMkdHteLgGPB69MKmgC/iJvlU+XRN5JPhactHKKHVuK0
 GWW+VEOQsDL6tZpD17UjYbkhfsQt6FjG5CAs8CsTJ6N9TGrs2ryEAnGGz2MjBmhjwEb/Nx7+J7i
 VKBDU6iu8OsUMqFk9qczb1KSGn9ROwliUJyVH5yiio7oloPAM0tzsxxPrxaKh+Z2f7a3So1QDP2
 CUtjBXwYCYODB9yYY2QoZ1G5OKZZ2RsYW4jRbvv6a7n24SGbMtasJ2QGcE+SnsHuJ7Qufu5phiH
 dQstvfzbceAUTLSsInNkcPdeBIKW5sylKfIHILy0SXAlumUFiEyygs6tfE7oDLW9y5nbDIgMnN0
 2eS4UOCXwZAg4ZAR52qYCqojgN+1OpLc4EUfOcMsV5uxCq+WI0NHNMzuen8f/Z2J+/ULP0DmIRQ
 5XMjZvZVCf0E2UHj+9wlR0jhs7//phAVJYT8ch229+TS/81sV+QksTm9EVUX75Z2ywT2ObTbwbF
 R2eSZFpOv/CJo+3K52cJu3NRWckvIr9QEqO1+6yM5Fe3/xZ6VzM51hY2B3EZ70xb7nSr4QEQMgb
 AbXs5cszR4iukCot6uXQQTyd7AcvTOtk+lgpeRY0Val25MHIsCUSmLaXAPR2V6Sv10JGVSy0lWi
 /gjO3DBd1
X-Received: by 2002:a05:6402:24a5:b0:6b1:a67b:d378 with SMTP id
 4fb4d7f45d1cf-6b59780da7bmr1172705a12.17.1793953956906; 
 Fri, 06 Nov 2026 00:32:36 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b664b165e9sm435896a12.29.2026.11.06.00.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 00:32:36 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 09:32:35 +0100
Message-Id: <20261106083235.883772-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libwebsockets: fix build without threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libwebsockets 5.x enables LWS_WITH_CACHE_BLOB by default, which pulls
in lib/misc/diskcache.c. That file unconditionally includes
<pthread.h>, although it doesn't use any pthread API, so the build
fails on toolchains without thread support:

  lib/misc/diskcache.c:28:10: fatal error: pthread.h: No such file or directory
     28 | #include <pthread.h>
        |          ^~~~~~~~~~~

Add a patch, sent upstream, dropping the unused include.

This issue has been present since commit 0b820f8e22a9
("package/libwebsockets: bump to version 5.1.0"), as 5.1.0 is the first
version building diskcache.c by default. No release is affected yet;
the maintenance branches still use 4.x and are not affected.

Fixes:
https://autobuild.buildroot.org/results/b05ce330be76f6ef1a5e5688c043b031270d13a3

Fixes: 0b820f8e22a936ca80a3c7c8eb862c7476f53a71 ("package/libwebsockets: bump to version 5.1.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...he-drop-the-unused-pthread.h-include.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libwebsockets/0001-diskcache-drop-the-unused-pthread.h-include.patch

diff --git a/package/libwebsockets/0001-diskcache-drop-the-unused-pthread.h-include.patch b/package/libwebsockets/0001-diskcache-drop-the-unused-pthread.h-include.patch
new file mode 100644
index 0000000000..1e6fe18610
--- /dev/null
+++ b/package/libwebsockets/0001-diskcache-drop-the-unused-pthread.h-include.patch
@@ -0,0 +1,40 @@
+From f87eb8f2c398b3bf9aa390460d17c4c336fce0bc Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 6 Nov 2026 09:14:22 +0100
+Subject: [PATCH] diskcache: drop the unused pthread.h include
+
+diskcache.c includes <pthread.h> unconditionally, although it doesn't
+use any pthread API.
+
+Since commit be9221232 ("cache: file-backed blob lws-cache-ttl level
+and lhp document asset cache"), LWS_WITH_CACHE_BLOB is enabled by
+default and pulls in diskcache.c, so the default build now fails on
+toolchains without thread support, e.g. uClibc-ng with
+UCLIBC_HAS_THREADS disabled:
+
+  lib/misc/diskcache.c:28:10: fatal error: pthread.h: No such file or directory
+     28 | #include <pthread.h>
+        |          ^~~~~~~~~~~
+
+Drop the include. Where threads are needed, private-lib-core.h already
+includes <pthread.h> depending on LWS_MAX_SMP / LWS_WITH_SYS_SMD.
+
+Upstream: sent to Andy Green <andy@warmcat.com> on 2026-11-06
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ lib/misc/diskcache.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/misc/diskcache.c b/lib/misc/diskcache.c
+index 4ea24b626..ee999923f 100644
+--- a/lib/misc/diskcache.c
++++ b/lib/misc/diskcache.c
+@@ -25,7 +25,6 @@
+ #if !defined(_GNU_SOURCE)
+ #define _GNU_SOURCE
+ #endif
+-#include <pthread.h>
+ 
+ #include <libwebsockets.h>
+ #include "private-lib-core.h"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
