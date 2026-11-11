Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767B7606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TKed/BsC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A90F81213;
	Wed, 11 Nov 2026 08:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIkR1JkmUhG7; Wed, 11 Nov 2026 08:19:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 53A098123F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794385192;
	b=V06Na85fPJJ2B+VzDhSGse5T4F/M07yllCrT8mCTJWj+wVD1jfudOkvcuRagOBuKHIBB
	 6R2dfu/AYMIHURCVrJSHtaEW5Vwr9N/se40svnzevP7vrFhOHjua/wEGLMBu575ab9a+E
	 ITgqIors1PBEk3l3p7MwjRDY7K6LwxW5mXnY746a2wc2KL7ZtDpxlkWtCGAUAznOYQ9Xl
	 BcxAwIBCHWngABt93IhM2JKCLROFGdPLwTEggn407JLs/DC/IErI92mwLI2ZdihFCv6K7
	 qddCrQUetpAX3LJbQloK6HgYi/7g9nxmoY6AG7enKw/y5HOx7SBp36z8EbeXaPDWdAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794385192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TxYx9GLD4KqXnzDgsaD0BakZwRK4y6+jVSFRawhMzHg=;
	b=cFxdBIu47X8TLcG+H5yzr4+TXgcdIAjoAIlwu8jso78XJ+arhuOt4vumJ5Q6vcV9ywEa
	 NDzUJWE+d87qzvLBw3fGSEFyg5Szuhmf9a56QA4M8JeaV7wIm+un602amOSPqUZ7tJoAp
	 sfYLeCHsTAsOV33noOpeu0MLzRGLLDy3QfMU38tLgq2baUbEXyskC0cHTcTv37R3rrryV
	 M6/WfJwjMc6EFOQYlfSggDHIT+8EsXRT/k6aiiWkeeb2l5+Q493KMlM7hXwp8Dxp/cSUX
	 djDbcO6o9OYg+RrwgUUeDS7N2RXO/DvIicZ0EeEn77IrfoITLyK9bvx/RlKYSwYQ17g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794385192;
	bh=TxYx9GLD4KqXnzDgsaD0BakZwRK4y6+jVSFRawhMzHg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TKed/BsCIrXXCKi/F5JlsPD8qLgrje05LM9Ljbv5M0O8KMM6DRcvK2UCoRcmrftyc
	 0luUzZhCjroDD2rNwZpj+zAK948gfIxczcZFv2Ies+oYx7jaLQumOijjYgY2ACdSYB
	 wj4RsWLaflaxN2kVF53CsofSgNzL+2mEHf4vs7XrOmFsQbXh/kIVyj6YDOO7tdREFV
	 ahTrhgripWbwsHd7Doj/AHWJsbi4icYqhswZg5Ewnm0hmjxwDrE6QfjsoyGa8Fegtg
	 fyqUOgfzVd5wTlif/3xWXIigP+WMLSaH3ayDRDr9jM6H0TVe5IV4WOjfASL0d4fpDW
	 5F8g8SpHF/EIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A098123F;
	Wed, 11 Nov 2026 08:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7FCC1A6
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 08:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9DEE4009D
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 08:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGG3apodCrjD for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 08:19:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9E12C40070
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E12C40070
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 08:19:49 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c505b2e1cb9so188463266b.2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 00:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794385187; x=1794989987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cnYM2OvPi62D0bsRzCYNtsXLuLcdEvX5iYhBsLlduKg=;
 b=rw+Gry/SU+sdRCwdTxsjfqWNpXjoq1hufe7OtvWq9xJqNNsmK5OLEHMgrvu+eoBNh5
 MvnVW1qNhWvcgMATS+jC9ESckrynmJunAd0xgbE+E3i7FJe1OpnPumxKP0N4Yxo1srBz
 qNs/LVo6FmbvMOZRUHd1BxmFTMx+SKPYFKHz6/0N/ZmTd29qr7NeEActsuxpSDcogISb
 tXWQDFSGZ/hXLhMIMPa7N/9VHP7SOTzZQ4YEBR/pVnEKlLiB/itio3p+KJ/yAR/kwVhl
 JNWj7mH9NFnu9gYr41lpVi90UirbkLkqbT3va/cLOs0PSli+KVM9B/De7sBmSy9HXvmg
 ahGQ==
X-Gm-Message-State: APuU4Z82zJf3j4l1GdU3Ru9b/s249akEo1xyQ9Z3HsRhs6LwTil2cLGS
 L60Gyv0VdCmTDF1Bn2g4KWVZF7BBixS+b5zZcI2j4DoBZrlHxIDZS4y12kjBaw==
X-Gm-Gg: AYBFou2M1SXyK4MXQ7EI5kcuLstCTn5Lc1a6Y/KEionYsGJATk+KnA63ze+6E1UNjLk
 Jk/geqlp+SlaKzzrdzsJIp0WMzP6sjJR28LANiDjTE18HbkeHVTw7c04olgzVAZpza5AUFTn7Xg
 z+/yCUNvYUHIohwlxxmEXkbLmstGDDqpdDsdx0C2HV089eb9pzTh8NNdxrNDwK090RZ44nfqbe0
 ep2PP9eznE0lBFaG9XmMqVmFnqUx0NhAtBcg6i2tHFoXHvzLU0I3JbpOboQSRpEv+8/IilbD+Tq
 aQ7LZkpJi2GAwF7IvB+OVmFUC9k3n+tzXi6p3elOcLxjYBttj+A4C59NNyr7r4kem/yMgxpd9P+
 kP/6UGqAYb3Sn7u9XoEibdmOgaCt+NGHWT6WpDwNZvGFeo3PFjjOYvaJjT7AbmcE23+cVemML/y
 mveJG3nhbLSvs+iiZWLfAb1PexozlaX8uk8gCQPeTuu7+VLLsCRXk2amP2c33yhaso+DXdypjVs
 h0Do1e7DUFsGMf6Uy3/T/XEEECgq8biI50uawCmckrnWt+Nmeex4rRPeCJ1gGc3a1t9CgUEyhmM
 pw3CA5qzQgHKmyADqFWbCU4VV1TJaa+qwfe30L+MgQL0WPdcun7HzG/40emuzGWV35LM4iesVA5
 Ba3jvVgZlkw==
X-Received: by 2002:a17:907:6d08:b0:c35:d50a:1352 with SMTP id
 a640c23a62f3a-c5066a89a24mr109595966b.11.1794385186958; 
 Wed, 11 Nov 2026 00:19:46 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a619790sm209211266b.51.2026.11.11.00.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 00:19:46 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 11 Nov 2026 09:19:46 +0100
Message-Id: <20261111081946.3850218-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/am335x-pru-package: fix host build with
 GCC 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The host pasm assembler fails to build with GCC >= 15 on the host:

  pasm.c: In function 'main':
  pasm.c:437:9: error: too many arguments to function 'ppCleanup'; expected 0, have 1
    437 |         ppCleanup(Pass);
        |         ^~~~~~~~~ ~~~~
  In file included from pasm.c:75:
  pasm.h:576:6: note: declared here
    576 | void ppCleanup();
        |      ^~~~~~~~~

ppCleanup() takes no arguments, but main() passes one. The empty
parameter list in pasm.h hid the mismatch until GCC 15, which defaults
to C23, where "()" means "no parameters".

Add a patch, submitted upstream, that drops the extra argument.

This issue has been present since commit 725efef8313a
("am335x-pru-package: new package"), as the bogus call has been in
pasm since 2012, but it only shows up with a GCC 15 host compiler. It
therefore affects 2014.11 and later, including the 2025.02.x and
2026.02.x LTS branches.

Fixes:
https://autobuild.buildroot.org/results/d6e70d200a3a7003a1d3fb03000fcfbd6b9dcc56

Fixes: 725efef8313ae5591bb497fec3aa7e62717af9a2 ("am335x-pru-package: new package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...Cleanup-call-with-too-many-arguments.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/am335x-pru-package/0002-pasm-fix-ppCleanup-call-with-too-many-arguments.patch

diff --git a/package/am335x-pru-package/0002-pasm-fix-ppCleanup-call-with-too-many-arguments.patch b/package/am335x-pru-package/0002-pasm-fix-ppCleanup-call-with-too-many-arguments.patch
new file mode 100644
index 0000000000..1f0f853882
--- /dev/null
+++ b/package/am335x-pru-package/0002-pasm-fix-ppCleanup-call-with-too-many-arguments.patch
@@ -0,0 +1,41 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 11 Nov 2026 09:13:45 +0100
+Subject: [PATCH] pasm: fix ppCleanup() call with too many arguments
+
+ppCleanup() takes no arguments, but main() calls it as ppCleanup(Pass).
+This went unnoticed because pasm.h declares it with an empty parameter
+list. Since GCC 15 defaults to C23, where "()" means "no parameters",
+the build fails:
+
+  pasm.c:437:9: error: too many arguments to function 'ppCleanup'; expected 0, have 1
+    437 |         ppCleanup(Pass);
+        |         ^~~~~~~~~ ~~~~
+  pasm.h:576:6: note: declared here
+    576 | void ppCleanup();
+
+Drop the extra argument.
+
+Upstream: https://github.com/beagleboard/am335x_pru_package/pull/73
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ pru_sw/utils/pasm_source/pasm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pru_sw/utils/pasm_source/pasm.c b/pru_sw/utils/pasm_source/pasm.c
+index f8051ff..06fa9bc 100644
+--- a/pru_sw/utils/pasm_source/pasm.c
++++ b/pru_sw/utils/pasm_source/pasm.c
+@@ -434,7 +434,7 @@ USAGE:
+         CloseSourceFile( mainsource );
+ 
+         /* Cleanup the PP and DOT modules */
+-        ppCleanup(Pass);
++        ppCleanup();
+         DotCleanup(Pass);
+ 
+         if( Pass==1 )
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
