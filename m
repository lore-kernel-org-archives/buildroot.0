Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335AC606A329
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 11:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0447280F75;
	Thu,  5 Nov 2026 11:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzvXubsMLu95; Thu,  5 Nov 2026 11:40:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0B2EF81135
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793878845;
	b=bavIXPU1Y+3w+LwKw6v4GxmrXjO1Hi6aG7t8MfgPZbSNmK5QgQZ9HYSbC5q4t9aml2A6
	 N6Ymeqn3W5UxfxbI4e9R7+kPLnrcqxsT3/b8wX9YDiJTmL7lIZxooMWpr8echoACEZiJ7
	 mgMUKLaqPgx/FSkN/GWhGZp/pwwsZ2s69yV7jBaDN86MjsW/lPGXxEKEWT62sdhvOXjmw
	 M9qeevpybnh4n+6ZuWg2cNBBQGhI2LMlCfVJjL8Ii2FPJ2pR5lgGhPkme0EIabmMYHXKY
	 fgPz+ySBR/Q/OJErIi3glniQp0TDt8S7qPSVyy0CODYTopiRzxAlqrZH9sEefEJewmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793878845;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lePrT8vS8UDBv19OdxNigZqi3HansOedUcslf795Snk=;
	b=DU3kHlK3WS1ADOmId8KpQSshdeviDW40UqZeaWokCsOuDxZ+OrSWYEWd5YuZoslXC4FL
	 qPwGzX8pp7UMlOm91cWY4xKY9crPfiP19rlWO6sr7aMbGhY3LYxXIlrQ2MvZO+3nNGpMR
	 CX3RZ/RCsPGs8mXyUP0Bsfr11M0YG9wNftPAbZLU8ZUoEeuKncEQqx2eLTFxVnOIPq+MU
	 jEQtFSnTWp2bfrdH+K8ELlSmwrjkNKDg0xIzS7rO7icqwxDNIEgWyFQHnAGidGl63fIqP
	 2uTewgLglBUtdduytNabruwxp+oftZftIGXHwc+FIFBLQTXYxcuDfUz2Q010gPwfjJw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793878845;
	bh=lePrT8vS8UDBv19OdxNigZqi3HansOedUcslf795Snk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=IrMkKv8EFg1LuQYzHyIFovYUVBlHM5aWMs3u5AAAGJ73MHAog+5MQktrJ58jv5buL
	 XWbktMHFGR5hNeJ28fNqN4Ykqnh0J2Y4N21i0UiymHdqyUZmByCMhwifA3qnzPGt9s
	 Pp73xmQsheyNB5yH4c0IePz1L5RAQSfzBV1FOhjh3vB3DBmrDPO1ZPYP2rH3lXy3pm
	 BEKlvtPTpVCZqIPcn/IyRg1kalN14IX5bY5w5PsTHMNtCZn0pJ5CmMxq29MyDxl/s3
	 P/LIcBCRhxxXpm7EvDgu3bxDdEjvtLx7DBf3wTWRWlJ0jbaL7g71Jr8qTABu74h6h3
	 rJRiFx/WMkLHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B2EF81135;
	Thu,  5 Nov 2026 11:40:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F286F2AC
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFBE44084B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_94c3sVlvuH for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 11:40:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6299B40862
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6299B40862
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 11:40:41 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6b1dae0febeso2627768a12.2
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 03:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793878840; x=1794483640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BtsualRutj2TW4Wjlix2lb85icZWx2UvzaFGCfarNcI=;
 b=VGbebyrRR6ybRLRALspVr+9WdeogAPfuDnR9Zbe0vcPs40YTBoh5pt1D9QXNrdHLFN
 uc3gd0Ir1itRbMSY0eQ9Vnwb5kCd+kvjKtsPp9OV6qLzAtX4pgspjhk++fCgBQnrytBy
 RWNsHXvlBsRtAE4k2r3qcQooTcWnuenPvAUPKXnMeuY48U5Qtm0uA55QgNP5AdRY4CPf
 6KKZ70S5NY90edjoadGrfeTCgVqSgR0Z3E1EqyNFjC0rxrNaqlLKm+4RuYcBr5d1o72V
 tzqb6UoGSbOym/XkUrZjdYXTUJDclTxjRG1EiUv6/URE5TN5yLWEkzG08IOE5a3rws3T
 +0qQ==
X-Gm-Message-State: APuU4Z/AXydXnxr80eShU+N3Aa7z/xXeec90BbO2IHRzvu7ZWc1/oQ3N
 EAhtwITm778joTUdeutNfXl3tGZjTsga6xQbxpwCHkIBhlo87223Nfu2wIV1lw==
X-Gm-Gg: AYBFou1mqz7CuJwf0CEQYmJlO2iYIRF6xVZgXCqzFrkd6U1ujimw+8LD9DE+uZuvjLF
 4YHJwsdD91Iz8L3oOtL9AvQKcY5qLRAnlrD9YNmN9le7ib6e6mcmd/SXckkaw/IDJNGFKLxiPrJ
 GTxn4eXSz6vnpL2Ti1u95fZ2qp+mp9yEurZPgvj1er2vmL+Rvq1eV0DEotelTl40T4KpOgi3rOT
 nmL5jrUlLKcuzWjPlzTGFl7qBEJ3VglIOD7e8vzB5L7il6ZEkEVNgGwbB+hTZDKAw3LE7SDLkYA
 +1UnKDQc/fNEgbc9nAMFFv7C2KmAXEXpGJ3kPb3gBNoq3vSghItLLcnhcx1NBKRSmWmzQG4E68A
 2NMcD44ucTrjtlbFkiYou+T/E6KFLoiEzCz7GiCEyg4/qSyLr9loueF+jyYjSJ1w0s6QlDaI27j
 VNSyLVXbr9ep25EicZdi/banHe7CnLUgQvx5UcYRGVWuYPCGumfgPlexNYJSGaDzclAfEhzs+xP
 309JNzhjHrwp6G2R0q1r8UvbEUEljmY+wJF/U4w0tznW+8C+PAg8TQLGWq424dXge/qubpKouiN
 zr1h8eygiVub53XbauftZQQ0PpjMfrEbJu+lTks2qlzxPGgPvzkHSqS1nDppJN9RKqxFQILoxSn
 SU3ZYC+OE
X-Received: by 2002:a05:6402:c44:b0:6b5:47d5:b5ba with SMTP id
 4fb4d7f45d1cf-6b547d5b77cmr5604214a12.30.1793878839555; 
 Thu, 05 Nov 2026 03:40:39 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b5864a87c1sm329071a12.2.2026.11.05.03.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 03:40:38 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 12:40:38 +0100
Message-Id: <20261105114038.90685-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104045834.3308280-1-yegorslists@googlemail.com>
References: <20261104045834.3308280-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/uclibc: fix copy_file_range()
 declaration without off_t
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

uClibc-ng 1.0.59 declares copy_file_range() in unistd.h under
"#ifdef _GNU_SOURCE", while off_t is only defined there for
__USE_XOPEN or __USE_XOPEN2K, which <features.h> sets when it is first
included. Sources that include a libc header before defining
_GNU_SOURCE, typically through an autoconf config.h, therefore hit an
undefined type. tpm2-tss does this in its FTDI SPI TCTI, which includes
<stdlib.h>, then config.h and, through ftdi.h and usb.h, unistd.h:

  .../sysroot/usr/include/unistd.h:1166:30: error: unknown type name 'off_t'
   1166 | ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);

Add a patch, submitted upstream, that declares copy_file_range() under
__USE_GNU instead, as glibc does.

This issue has been present since commit b94d3eb72854 ("package/uclibc:
bump to 1.0.59"), as copy_file_range() was added in uClibc-ng 1.0.59.
It therefore affects 2026.08 and later, 2026.05.x since 2026.05.2 and
2025.02.x since 2025.02.17, where the bump was backported.

Fixes:
https://autobuild.buildroot.org/results/1408ad5881aeff754b0493f1a0d0970d1afdaaf6

Fixes: b94d3eb728546aeb196941472b98922843e36279 ("package/uclibc: bump to 1.0.59")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - use the mailing list archive link in the Upstream: tag (suggested
    by Baruch Siach)

 ...lare-copy_file_range-under-__USE_GNU.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch

diff --git a/package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch b/package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch
new file mode 100644
index 0000000000..dd821eedfb
--- /dev/null
+++ b/package/uclibc/0008-unistd.h-declare-copy_file_range-under-__USE_GNU.patch
@@ -0,0 +1,45 @@
+From 9cf18aedf41589b11ce5328a85726441d3b86282 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 3 Nov 2026 23:54:41 +0100
+Subject: [PATCH] unistd.h: declare copy_file_range() under __USE_GNU
+
+copy_file_range() is declared under "#ifdef _GNU_SOURCE", but off_t is
+only defined in unistd.h for __USE_XOPEN or __USE_XOPEN2K, which are
+set by <features.h> when it is first included.
+
+When a source file includes another libc header before defining
+_GNU_SOURCE, for example through an autoconf config.h, _GNU_SOURCE is
+defined by the time unistd.h is read, but __USE_XOPEN* are not, so the
+declaration uses an undefined type. This breaks tpm2-tss, which
+includes <stdlib.h>, then config.h and, through ftdi.h and usb.h,
+unistd.h:
+
+  unistd.h:1166:30: error: unknown type name 'off_t'
+   1166 | ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);
+
+Test __USE_GNU instead, as is done for the other GNU extensions and as
+glibc does.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/UXSNFB2SYQEX2ITN3Y7AEQH5PXVPRN5S/
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ include/unistd.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/unistd.h b/include/unistd.h
+index 1956eee18..fb0ea0ff7 100644
+--- a/include/unistd.h
++++ b/include/unistd.h
+@@ -1263,7 +1263,7 @@ extern int getentropy(void *__buf, size_t __len) __nonnull ((1)) __wur;
+ extern __pid_t gettid(void);
+ #endif
+ 
+-#ifdef _GNU_SOURCE
++#ifdef __USE_GNU
+ ssize_t copy_file_range(int, off_t *, int, off_t *, size_t, unsigned);
+ #endif
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
