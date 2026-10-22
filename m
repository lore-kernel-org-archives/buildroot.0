Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11259606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nW6qsHKJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=gNXDHnFT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0CC7812E9;
	Thu, 22 Oct 2026 20:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BREr1Wy9CZl; Thu, 22 Oct 2026 20:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C231D812EF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792702772;
	b=tcPza2zRHRxrjxFxe6CJQA9SsvsNrmEduxCHypCvm6Sc/tsD94Wu66Mme0wHSPZSms6e
	 bMG+wTLIS00+PmdSQYt8XUoVfb5Js+iTFJ3LlzgfOPqb4FVcTnIdR2JVwttfVOvuwyuwu
	 jPUgcphSXVYTOj+//Mg7ZjJWo8s8yAwG3QPPUYhkCpQF24eLmtOQk2OhSQFsGQzjYDSIU
	 jqeOd1S7oWk2cO7i4OHrR20k9sMFTrr+p32t9Fnp9teTgYN8q0t238mdeuumtp4qMxghz
	 gxitjMGHH9IIo+VKzzGZpTzN91vFYF5KpI7+OgfBBuq93m7FLovIZaHp2zHRfCHqn8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792702772;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hNl6sSI6BUHlCBaL5/AKXvm8ljx1UNC/E0HghVMuGSs=;
	b=p0DVHhSUwteDASYByYuOUzn0wR/8vjmqno9qmSv5MiP/Ul+np5ohwN/y7USmrdkwyv28
	 tHxpRzM0bZp0a8r96XhaypjqM0hQwLXc/y+b6uHus1rUy6ccRb5Oihsq5M4ddo1twQx5O
	 vyywvA7m7i9KqWzzW9OkUOUN0BcvnLMq/6BbKvGdyKTpZu4biTuYV8WJ6ESJ3pUZu44e4
	 E0sJpTZmpAsV1i3GRZQCuLVsn8L8OsC09x5wcOacADu7Je6k2wRtafBi/ihYFHNsm/1Y+
	 X1ulWvvp20V1GV9auf9C6UVTt7CmMZXRPFGEJPzJ6Y5F/hNQw2OmwphDHjfDxP8+bcg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792702772;
	bh=hNl6sSI6BUHlCBaL5/AKXvm8ljx1UNC/E0HghVMuGSs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nW6qsHKJ3igww5tllGnTJbvJKH493xmX5LO9azbpGNF/ZLtRMm6D8748PWa+26L2M
	 +9lt7wXdp6lQysTyroYzdVJcBl/wXSx7j8PGfcdNbKO4TnE2nUkhcR2ooOZpSNNtz2
	 jFWsXTNDxNbgnHvNq/K19HwFHuYWXe89IImASOWOkdkOT6ZTjDOwxJwun/Ybk4mNzq
	 8/tV9xS2uP7/XMGwEiFDeUYEOP2ciCzoFWU5Z8QjFJzqKYxca43WQIdYDdOiDAQIOz
	 aJZFU9zdjLTukecOimoDv/TVsDxqH1Hrvd8EuTxEcNaNNyc1dOb8bxPBbCr985nKY6
	 2qZlP2w3JZBYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C231D812EF;
	Thu, 22 Oct 2026 20:59:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE225499
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBBB1409C8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nz-dR7hX6ees for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 20:59:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8A4E3409C7
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792702769;
 b=JXk6EwKnO1b98rCWVUkf3BBvu2pCdbhqt4qFLzSLxCl3IsPuh+6QsE4AjA3vx8ds7vrx
 WUcamFf1HRxHnCwQM37vAY3945u9CiY5cMSb4vY+DO1GdkUEl/cU6xJRnF++kWrlsU7K7
 TkD0FxLqIL57zue0CUUW/XzWiC6vrO85bRSus2ltJzDlcV1ikBIOd73OFivA2nRpa6Vtz
 Ail64yZmSnhmCPhxHb9pGA1szYbeeqj6TkEkeXa/Schx1IhFHsSA3KRreLW7Q47lWAcrS
 SZ8YIRIwfjpEmYhMOhwwMuxCXs5YIDjwEMdc4SHPud59DIZgorQIcKebSPgEtG/G0hA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792702769;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=B2GTx23I2yUJPVQB4m1ZSiM5gEy4h/mlH1HO8BsNTac=;
 b=kC8WqJr3yftaeT2d+kKjJ5haCtDI+Tv3QRJg0wPsPTiNKUryvEmqXOncZnIC04ajXDrw
 hJlamTUHBIexGBcOoCkGBk28BFeHT0J5Fse6R/BE86G2rHE6DZiimnFHWQidgff/648+r
 aXGgRXigL9Kd+FVIXgzXxRSQcDLDJOZWq+0QSywnXXrY8RPNKEcDKKl6tu10rfy3Q2AzR
 +EoDQfkhl9Gi61yX8kw1/m1xaY17uxU9+EX8652Ent2pOnILagXsca6aSS85Lbij7dysV
 zVIvQmGetM1Co0TmKrTvEyp4CieyM8ERMdfbVjHfTKssKrsiHNP05W5EBoWr0WJG04w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=gNXDHnFT; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gNXDHnFT
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A4E3409C7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:59:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b1a86c0316so258110a12.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 13:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792702767; x=1793307567; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=B2GTx23I2yUJPVQB4m1ZSiM5gEy4h/mlH1HO8BsNTac=;
 b=gNXDHnFTCzF7Cs1s4kz+1FaCxWD3dcg/WgY8FH9rUclRujzTTz7zcqzUf1hi+4m6rA
 Tm4lcdKhPpkcmSoDnv8O63dbSv5T7M1sdNh5iRMq2u03B0avb93hZAoQkL9PHbjeKF6r
 Xoy8OXPJY6sDkkX0IzHJZVPYpF02Y/geIninjW1xMlU5akZpC1B/WS+5UmQH1ExjHien
 TgUztzpPmIYB0aGatBZRLTQ+bfFZjk/xzoBE2r92vDSZdH7dth+wgOHBeXEGaxpCbViT
 f7EuB11o9kSrdneIYbr2mk0KOKd0L9HEAafmY8Ie9M5TYXxuRDW/2f8x9kk/h0Diy6pa
 b7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792702767; x=1793307567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B2GTx23I2yUJPVQB4m1ZSiM5gEy4h/mlH1HO8BsNTac=;
 b=1+ledHO2lpXkIawsHVxUMsWraNugP12OqNjLonQA8tjOmKEXb6DmuYZQoNfdNwMyP/
 UudqR+QDGDGQBpcIjn7Nlud7BfBBXqSUx+iUhi1Gq2Kf1BBJ9kXynbZ0tyxsdfy8yIzi
 H/YLV1nXa/743HD048i7rWNQaUVxau2NLnaW/GRTztqTerRI5ChTT3dzsmtYcp28VzL2
 8a+Q6F8yYGdsuYolgKC7yfcTuo57KaGCr3IXgq5ZWHh8Wf5sqU0ZS52J4X66AHjQcZ+6
 tPeXS8kjcjl5+H0IonB62C53xPG1KnU12XlRrBIk8iXb9Qmv94+/Zc33TPMs82AiIcs3
 uh9g==
X-Gm-Message-State: AFq9FYLUa8txMhUV0F+++2tSFbU6eudS1uPC7q/AKlzQFvqZH0sjH2A/
 4vtwSosafbylm8cthJoUFJmcnSCuSq0iVjZ5ALlOkrK31lcVT20/IiXTsaVgBg==
X-Gm-Gg: AYBFou3dd2PNQxXc4TBwy8ZUgPoXi1DAAVs7eWJFnWu2/7o4U4LST6L0Xtpbo/fJpsm
 x/guI2owhQl9FckGJ2oLavq88/+Nb3XVXW6UdiiaYIy5j+tQg657jHveTD8XhAtgKFXq0FutJY/
 17CzLRKra8luAR9K6gu1hyBn5KTd71ljY5kCgLh4u1BhvD9pmV+Rcdj4viFtrKDZMKiRziFnrf9
 HsWpZy8Kxp751IVhFrx/eQxTUZlrqm4C8grxztIcTepMq2O1EBAIIyf+KLa359K0L5v28zb63Gn
 7LJ3jbUPwhRD7KP266NlOsjT4xhL6fhNiaHJnSLIaTIxMDTcKoBKGXErn0TFzJpHXdlgdl9xaRq
 YYrvfs2V62+GUXS7AtGhTdu6odmG52Oa8e+6fxM4aYu66fNF2EX1MTCnc8H8GIUiEqcY2Nmb7wh
 z0c9JKvCIuje+L2u9JPrMIuIp3f7snjOMnmTDXLRuzTMN7J0/tsfPmf3BYYm3FdNBhiH+5F6cLD
 DC8mT6N8HaF7Pdn0DSdNht/G9BlZF8mcZ3P3Ca+TJTyExPAt+REH7/CMVuSaGMbB3vsQ5JCbYXj
 AobeHEJ4q0JHo8xrC0o3lgx2CFWA8ZHOSaA=
X-Received: by 2002:a17:907:3e9c:b0:c41:960c:8c62 with SMTP id
 a640c23a62f3a-c46a92d589amr51519066b.30.1792702767005; 
 Thu, 22 Oct 2026 13:59:27 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46a5ce5834sm27966466b.66.2026.10.22.13.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 13:59:26 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 22:59:26 +0200
Message-Id: <20261022205926.3431624-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iozone: fix build without ASYNC_IO with
 GCC >= 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gilles Talis <gilles.talis@gmail.com>
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

With uClibc, iozone is built with the linux-noaio target, where the
async_*() stubs are declared and defined without parameter lists. GCC 15
defaults to C23, where an empty parameter list means the function takes
no arguments, so the build fails:

  iozone.c:8150:32: error: too many arguments to function 'async_write_no_copy'; expected 0, have 7
  iozone.c:9126:31: error: too many arguments to function 'async_read_no_copy'; expected 0, have 8
  iozone.c:20165:1: error: conflicting types for 'async_init'; have 'void(void)'

Add a patch, sent upstream, that gives the stubs full prototypes
matching their ASYNC_IO counterparts. iozone 3.510, the latest release,
still has the same stubs, so a version bump wouldn't help.

This issue has been present since commit 75891397abe6 ("package/gcc:
add support for GCC 15.x"), as GCC 15 is the first version defaulting
to C23. It therefore affects 2025.08 and later, i.e. 2025.11.x,
2026.02.x, 2026.05.x and 2026.08.x when GCC 15 is used. 2025.02.x is
not affected as it doesn't support GCC 15.

Fixes:
https://autobuild.buildroot.org/results/4090fb0d0a3b8bee60707b1672c35dada744bff5

Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...x-build-without-ASYNC_IO-with-GCC-15.patch | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch

diff --git a/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch b/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch
new file mode 100644
index 0000000000..b049ce60ed
--- /dev/null
+++ b/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch
@@ -0,0 +1,96 @@
+From 0cc510655874362bc95c608021ef7921ae389559 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 22 Oct 2026 22:16:32 +0200
+Subject: [PATCH] Fix build without ASYNC_IO with GCC >= 15
+
+Without ASYNC_IO (e.g. the linux-noaio target), the async_*() stubs
+are declared and defined without parameter lists. GCC 15 defaults to
+C23, where an empty parameter list means the function takes no
+arguments, so the build fails:
+
+iozone.c:8150:32: error: too many arguments to function 'async_write_no_copy'; expected 0, have 7
+iozone.c:9126:31: error: too many arguments to function 'async_read_no_copy'; expected 0, have 8
+iozone.c:20165:1: error: conflicting types for 'async_init'; have 'void(void)'
+
+Give the stubs full prototypes matching their ASYNC_IO counterparts,
+with the long long * cache pointer used without ASYNC_IO.
+
+Upstream: sent to capps@iozone.org
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/current/iozone.c | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/src/current/iozone.c b/src/current/iozone.c
+index 8de26cf..5542714 100755
+--- a/src/current/iozone.c
++++ b/src/current/iozone.c
+@@ -1332,11 +1332,11 @@ size_t async_write_no_copy(struct cache *,long long ,char *,long long,long long,
+ #else
+ long long *gc=0;
+ void async_init(long long **,int,int);
+-int async_read();
+-int async_read_no_copy();
+-size_t async_write();
+-size_t async_write_no_copy();
+-void async_release();
++int async_read(long long *, long long , char *, off64_t, long long, long long, off64_t, long long);
++int async_read_no_copy(long long *, long long, char **, off64_t, long long, long long, off64_t, long long);
++size_t async_write(long long *,long long, char *, long long, off64_t, long long);
++size_t async_write_no_copy(long long *,long long ,char *,long long,long long,long long,char *);
++void async_release(long long *);
+ #endif
+ void do_float(int, double, int, int);
+ int create_xls(char *);
+@@ -20144,37 +20144,41 @@ long long length;
+ 
+ #ifndef ASYNC_IO
+ int
+-async_read()
++async_read(long long *gc, long long fd, char *ubuffer, off64_t offset,
++	long long size, long long stride, off64_t max, long long depth)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(169);
+ }
+ size_t
+-async_write_no_copy()
++async_write_no_copy(long long *gc, long long fd, char *buffer, long long size,
++	long long stride, long long depth, char *free_addr)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(170);
+ }
+ size_t
+-async_write()
++async_write(long long *gc, long long fd, char *buffer, long long size,
++	off64_t offset, long long depth)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(171);
+ }
+ void
+-async_init()
++async_init(long long **gc, int fd, int flag)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(172);
+ }
+ int
+-async_read_no_copy()
++async_read_no_copy(long long *gc, long long fd, char **ubuffer, off64_t offset,
++	long long size, long long stride, off64_t max, long long depth)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(172);
+ }
+ void
+-async_release()
++async_release(long long *gc)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(173);
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
