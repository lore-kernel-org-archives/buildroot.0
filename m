Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2335606A9AC
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 11:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Tr2VR2aW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB3654081A;
	Tue, 10 Nov 2026 11:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkn1Kiq-Q9Lw; Tue, 10 Nov 2026 11:54:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C06724082C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794311664;
	b=paYxUQFeROn6R/fB68KcbvWkEVKY7qt7Xxo8pvh5u+OJBnECpGwkTdWdsnSOlnHfgzXX
	 8vWBu1soP7Kyvl1SwQCLZrx6PpZpshVUKOidvx1kTIR/mMlL7mOBip7FAsQq/D/pNq7Lb
	 y090hyOUtr+wnchEhO9yDvLuZP6S0W5k2tc6HB8ZegoldKEiBIHT1mM95c2WH4WPMqc/B
	 F7qsU6su6AguOaEnWHjDGmixfapmcnHFbu2G17n+6LNTp0xdjs+cKZz0CH3w8OWogremX
	 BoElbOLPKrKnP81DOvci1ENLQkdx5XybM+dB/eapa0N9a7bN/s1rWaLWtmLzlk8UuuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794311664;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tI6k8RHRX0pHufYdS1W77x0F5bcDVI3EMzeq6D8ImfI=;
	b=rgEXUSFbdp34VasXFoyS/yH8GXBxlPv6FQhJ1E0yclr4vCDXePZUOwRYZ/FeArvWeqhA
	 Xw8+I48Zf60b7pYZcKS6YRZQeObj+eZBtezkg1dwnLNT4FagM3eSQM1sdVI1DxLqkBw9C
	 zF9rjq+9QwgTAVV1yvz0pfRSQSrMwZyH+A3QnIwRkOuMolGyPtwyy8ge7eJFXRvXCMQTS
	 s1nq/54qVaLYsJP+VMQxesXH59Jy6lPq3pvfLFPFoZq7PRCso+hBzEyHyEL3SbMEpAB+s
	 yukGfY0VU5+w82gKwUebpXHFIMtEzFVWLrcZvj77FfmcBvj0yXfQTy/wVqZsiavQGxw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794311664;
	bh=tI6k8RHRX0pHufYdS1W77x0F5bcDVI3EMzeq6D8ImfI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Tr2VR2aW+ASjJIf5sGIziEan+Y7c4uq3O8jjyCW5tTXyok1w6xbrqR7umjod4oVhq
	 qzKQADOaRLU5am9mXXtmDjCf/27cb7MH7CwZbCDuG36RL/t/d0BAtn9q/vc2FM00p2
	 EJqDr8zBkVRO19F146hbQqMVi2T1TR61+6+WegYY3K2DLe/AFOW5O22l4GHUym+VKc
	 hFUQTocFohIc0kFJK06C0lkwnT4dxLuRmwHlIoDcaYKKDmQJMAuRgp/bJITG21LHMS
	 e2ncWqetPky1RDA+ab5slPJtA6FdSOwMnedCu/Fx5aBrQnY+5d24tzrMQ0WmWs5Vl7
	 1uZX9j/uYfcAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C06724082C;
	Tue, 10 Nov 2026 11:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D41B0AF2
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 11:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA4224008A
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 11:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HqJpV4FdXkh for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 11:54:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9793640176
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9793640176
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 11:54:21 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c411e139259so71697566b.2
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 03:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794311660; x=1794916460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yYUhzpEmpiYD6GhA7cd82rfHDUHvavbl/R9yny0sVOw=;
 b=MldGTgnBfU2l1Gsbbk/1BTwapQ8TgN0rpVyKhGATnSAhg57ct7aCSz60EzB+cyxtYz
 id5POQMJD7S+YGSTgZ0Z91ZX324N+I3pP8NJc1VGLUvaGCUK+kZzffg1jMYexLpRcy4B
 wdMHnAs5kAXqs5iSQtTiW08MozT3HJYlC/g8VZZlPk3eTbsj52v7nJVyzXlDjj8kF9La
 74jj6tueM5fjZLWczmvST03qwn6R781Q3os3M76+r7Ua2R4EAlSjGacNCalcF75cGLaa
 1U3Wu5y04i+OAa4XL76EQvwoKtl8fp+9Nt8IDF7PjvJUOvr9yp+qTvSXWTH3emRbZvd6
 7asQ==
X-Gm-Message-State: APuU4Z+D4D3I8uFz4yr+fWO9TK1STrQqukf2YkNXz2RXMNE+kOBvwjFs
 h6zfNrtoabT4KI06UY1MG+D+ACLOcBxJLjfb7HjHUt54s6MIKJXadDbv7pYSkA==
X-Gm-Gg: AYBFou1tHrlP79IhZnFIWz9h/u7PAHvNKYvf0k5Qg5PEpBut7Wl/E3Q8vZEiEu8Kf17
 J30zsRiaGAx8uNjYBsGhZtD266OrwLuXibR4OAE65QLNVG35uvRj9dB7QzLTdck9cFw2gXVT/fd
 EESYoCgB3MSO2/Y2kGep309EYSC+NzFv60IcxVlmSZecu0wuNzqiWpYNPgVvOgmgmevOJomEMfU
 p8uTlLRmuutXuXoIF4mY1WZRJBMI2KZZgOAPJaXGrsUgO3Rtz5oisw5/G5pLWVGyItcEInysHyN
 H7cnjj/7uGFUjpocWR8dAeHt2v4bLYBNYXpoc/DyVL808EjkWmSW82vFk/t2wkmqeVMF/y2z7D1
 8Syub88j+fIRXqs2WlvhnheV1x4FwSZr/8KkQrL0Sp3DmEFVLCkuate6xhT4qtE1xwFA85PYb+U
 vUZFYVMVe7l+F6HJdWVQ05QBoakKGgJG7OG4suTACpp/th7zMFtqlzEtODQl7OHq3/EZqLqJ3eX
 0vFZTrL/vhmfiQR+ztTJCKmO/RxbCAzlgJt2HRsqmwGcg1XZ+I80bD+LmDVFm1VhcN+VK30XHC+
 f0KI0hOBmq4FZ5IUs/bqJbsQPP8ks4PTDlwb75L3afN+yKOltzoT83As7jM7vQVJj4npR1hWT37
 hiqodSYxe
X-Received: by 2002:a17:906:9fc8:b0:c41:26b8:c49c with SMTP id
 a640c23a62f3a-c504958293fmr179598166b.10.1794311659562; 
 Tue, 10 Nov 2026 03:54:19 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a3a6bc5sm103357566b.3.2026.11.10.03.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 03:54:15 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 10 Nov 2026 12:54:14 +0100
Message-Id: <20261110115414.2461707-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106083235.883772-1-yegorslists@googlemail.com>
References: <20261106083235.883772-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libwebsockets: fix build without
 threads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

libwebsockets 5.x enables LWS_WITH_CACHE_BLOB by default, which pulls
in lib/misc/diskcache.c. That file unconditionally includes
<pthread.h>, although it doesn't use any pthread API, so the build
fails on toolchains without thread support:

  lib/misc/diskcache.c:28:10: fatal error: pthread.h: No such file or directory
     28 | #include <pthread.h>
        |          ^~~~~~~~~~~

Backport the upstream fix dropping the unused include.

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
Changes v1 -> v2:
  - replace the patch with the upstream commit, merged as is by Andy Green

 ...he-drop-the-unused-pthread.h-include.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/libwebsockets/0001-diskcache-drop-the-unused-pthread.h-include.patch

diff --git a/package/libwebsockets/0001-diskcache-drop-the-unused-pthread.h-include.patch b/package/libwebsockets/0001-diskcache-drop-the-unused-pthread.h-include.patch
new file mode 100644
index 0000000000..36f38076d6
--- /dev/null
+++ b/package/libwebsockets/0001-diskcache-drop-the-unused-pthread.h-include.patch
@@ -0,0 +1,40 @@
+From 89b3a2cc1795028183846ee07b86b019acfa3969 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 6 Nov 2026 09:36:47 +0100
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
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://github.com/warmcat/libwebsockets/commit/89b3a2cc1795028183846ee07b86b019acfa3969
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ lib/misc/diskcache.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/misc/diskcache.c b/lib/misc/diskcache.c
+index 4ea24b6266..ee999923f4 100644
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
