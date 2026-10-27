Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ECC606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e4BdGDDK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=C6iA9eWH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F36880CEC;
	Tue, 27 Oct 2026 08:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QD_uaCb0e991; Tue, 27 Oct 2026 08:17:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1ABB780B7D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793089026;
	b=ozkWT2DVBfRXjRQPKg7hrBKeVa/3x/64/ptM80UqDn8zCuI/nFFSPQPoI4HEOCIVcRtE
	 U1yVV2FdF0FXdV/nl2yJJC8ZICawcQe7w72Ko4gct3I//51fSF9I/hMkJ7/iEGaJxtvlC
	 2aKCApwVN7BhszN2AxMUAZnXg+UzJaFrIPRkvPYAtIOBgU8dRzWT3J9sYNL6KAZdpfKLr
	 UxUEW/EgiyjMomjdXhdvwcH5xoFhZuZKrkVG/jZRUwIEZFVdr5dbbQ/jWsDPwOd8jqKG5
	 Kj8VGzaPCkT8leHZ2KyoWnDZMhNVrToqA5eTaPDL+wnc8D47ugLzpI5t4Xbn9t1v4UQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793089026;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=s6wQUQBx4VT/Ub1LnyyWn1NKGdi9GDRdUx0oTwA+sEY=;
	b=erhvPdvS1BwB1L6oQAUSxpo4nJuV7OTU2QX/O+B2cOykydrX1CKuEI3MTyv+qZRrtWWK
	 qWLg8xU4ydw1EJIVMSRoQ2KKKBxAEm+M/DGg/IAm0/7R7ryTSmW2So/Qi/KPBgZDNE5zw
	 m4nBWFJNwjnNZcLpQOBXo6mRGIxwIzL9aXwC+njuv8XstR+TtBAwkhREBz4H6R5uiuoy3
	 6waPZ6gQHnGpEJTZAsF53bdxqxq1+Yy9g30PpwgR3+Ho0PBla8FQqssThKJgBs5cTlkQm
	 u5nnbEu6Q5NkJRtsEj7s7pPAxNjwQOfmJeE7PDDGsJqqGBe2mjNnGMTfI8RLifS43IA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=C6iA9eWH;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793089026;
	bh=s6wQUQBx4VT/Ub1LnyyWn1NKGdi9GDRdUx0oTwA+sEY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=e4BdGDDKs7Jy5gqffqfC0oJGqrb8MJAkRM0C42/WqNhOIOAbrIgy6/aESVBwKx6JU
	 8UkQo6QsKa7DBdL+AnLennYnarlRCn+i/1lAlKpIBVtAQAuypeCqzwLA8J9OH5R5qd
	 JQ0A98u9B2IGxNBjV7mMNFeeP2tSMKvSMNAdYHt4AQS+IcXQFGP/BpXnD48/yyN1Ls
	 Il3o1dYCvP/GqL22bek2qYplRoV3+35gp9PTCk3Yv3i4VBhVkkoq2rhMqJfiKcVzR0
	 ppRV5YYz3aQOoJ3nwa/sEUjh/84hwaVFNqwzta2LvwO5xRbg0R7vjm5IM7EGJUVBHj
	 ImC6jOYQI4Dug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ABB780B7D;
	Tue, 27 Oct 2026 08:17:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02BA2120
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0047180B7D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1VswgTXhNHo for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 08:17:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CF63C8087B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793089023;
 b=StqRBhUISt7lYdyzrv/ZyIl7Hqhn60kGDXdP18jqBFY94n01J+EOHA74bNvXLvI0sM2B
 p07xcGhRFPFwn+WkY6qksR3yFwF4R9B4OQHJT1tQjDeQA+7BIwyUWaVYwo9yiXuzFxqaE
 gL7x5gZqdC4dExrvE542hj5lJgsq7EVHA2LlZ1uzk5r84L4KQ3WAh8MnpIrIy77FQAAWk
 qIEkW6tIwym/59EQRB9vumU7vOG9IKRbb2J4i2wORWYAbgGjWQ6dUEcbdlgAQHGhUcBub
 FkoMEx4S4MnC0kxtU07sYrjM8n86kD7KvptZbtZwh6lW3i3FQA8505DFkscchYfCZcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793089023;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=cFQ3fFMMpsQFrts/gAMsRsJFq8l+1gOh9YWWKrJtwDE=;
 b=PKHp8qOIsjXwiVZ3dSamjdAAPsH6OJcmYhPRSEDJIavo4qd3KmvHBOz7PamU6Pm6GrVR
 i/pVSK3fN75PJY7hNiTmJ8vRw0+bpM7Fm2KSP40mUTQtSkbbrELcTBNDSJIUXxi0/6YmX
 VzjaD62jUql7USqxJTLtLg2TtG2m5C59y1BlJYKh6X6RAautB+Pkiiu10q8p0F0Sp6sc6
 +2hIxstF6n+ddNH6xLEkml1Ga8eufoqeht3b82v/iGsWO/wBBHYIFSC8557xU1PK4JnU5
 QC1xTXY9AAM+Nr2t53nZ6L2r//lsG5JsoLhf5tJYfqRNXTGqhLRaRFN0TbXg8o/bh6w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=C6iA9eWH; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=C6iA9eWH
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF63C8087B
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:17:02 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c40e02b2ebaso594523566b.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 01:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1793089020; x=1793693820; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cFQ3fFMMpsQFrts/gAMsRsJFq8l+1gOh9YWWKrJtwDE=;
 b=C6iA9eWHkAO7N7AIn6Cwv69yeWcGcVG7LAPlFS5PHaf1iySTqYXkYqbcxLZPjPHFEf
 JYyiBsh+Rjawjv/i3vIZKKdbthR6tXyW8DAlgJWGsYRNWM/D4PiK2IsJ6Yw7SFmoTuFs
 9jk9HIbO5LKBjl22bD0GycNrsgHSeELUyythKzB9vUFtFLKf+US9h1Rq0NSPFc5PejR0
 YPKTEGdwAMAyWI+EXK+qikFGpxpkXK5x5AVxTarGVLMjAgNMbx4tJgYFeCTZNvzTjDOK
 0EioY6+wJhQLW/egw7Mh0LuqU5HMUA2aS/YuAj+PuWNnJ0E+TrY/tgMqbkPyzMCCXr6A
 JN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793089020; x=1793693820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cFQ3fFMMpsQFrts/gAMsRsJFq8l+1gOh9YWWKrJtwDE=;
 b=l20R2cehh9MBDlsreZGpzEClefiGSUq5pRqKvfuVRYZq+NAyth1+uPGkfnCKLPsZq2
 yxkeqPUYCje+SYKM4Zt6YXFJD8IEIc0jwssAyOTGoPlFjRV+KjuALj3mSMY1w/cNT/7M
 PxIE2yTZDAv8QRDU6u17AkXNoy6C2X28YOiOfB+CM1vjh3s8MpDYaHa5RIgEeLMKQvqj
 o49EPdNvbIImfmUFdTyUxyq2Fqh1GWzcjEVX48UBzl/uzoUyFcZyjYwUNI098ZgDUMUS
 MQZwo5Kx9NGCuSzs5k+XEjW2XKJWJD4pVqI462svOvWPX9btdR/6Ux46jbw2Ct8HHJZ1
 k3JA==
X-Gm-Message-State: AFq9FYLcssvbboN7thfC4NFfe7AzIm/w/WqaPvKbodLujNgcJKrL4jN2
 /zl0Nxypt+9lSUQjq8itDWBgscf53324LfcCoER5kHdkzQGvExHla3paYjGE3Q==
X-Gm-Gg: AYBFou0XzCdUWpFivgAxhhR0IDSNpEdWZblnBEKnyqU5LyHgnNq1tyH4PsWwdEO7OPm
 xb9SwNnUBNspunQW5KfRBGkIJfVkDLPIz0xGiX3HS8VkjASc3Gabsvx5+sPET4M7uXMv+hQcIna
 9mdWFtk3xXCDuDtvgSRgkEioH4QZUfZ7PKmQB2Qsr7VDCly+XoliVxKE1ZTo6cInP6bgwSjiBTv
 3PgYSH4NHV3EjuDCZuFgJBFfHo46BnIUl/9470Skc27pXAyETJcdUrmKl+TMrswabpv54JqBzCg
 O5z17xs5zjJ8xLoQAcSF071NotcPKScY+jOu9tHoHDF8Ih52njEziXe0UVhLWB8k9E7li9M8Vgw
 GrbKFCGWH4dOrC9NUM4Pb3yZcMNwgcbjOoZdu/Cv7r4vDd98ZfS2+UlpNwSvLu1FJ3nPy2H0iyy
 KADlFyagajk5Mn462vChAPl/GPySQZSzh+J6OSe7R7DTuggPTs8HUTFJ2wvi2qfqekmE4NBL8gU
 jS0DcSr/B41x5QDltni2CtnVKT+ufPrYeYPUa46wyJg4W2gk83iZWLrniS8UY86Njy88TgreA5j
 ynCOKZsJMQn9oMGOed0jXLaeMbnvdFDVXLA=
X-Received: by 2002:a17:907:7f9e:b0:c2e:52d6:1fb7 with SMTP id
 a640c23a62f3a-c46bde23187mr946550466b.22.1793089019971; 
 Tue, 27 Oct 2026 01:16:59 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd524266sm425261866b.38.2026.10.27.01.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 01:16:59 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 09:16:59 +0100
Message-Id: <20261027081659.3905442-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libwebsockets: fix OpenSSL detection
 without libatomic
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

Since version 4.5.3, libwebsockets adds -latomic to the libraries used
by its OpenSSL API probes whenever 64-bit atomics don't work out of the
box, without checking that libatomic is available. Buildroot toolchains
without thread support don't provide libatomic, so on a CPU without
native 64-bit atomics (e.g. ARMv5) all probes fail to link:

  ld: cannot find -latomic: No such file or directory

libwebsockets then assumes a pre-1.1 OpenSSL and fails to build:

-- Performing Test HAVE_WORKING_ATOMIC_64 - Failed
[...]
-- Looking for HMAC_CTX_new - not found
[...]
include/libwebsockets/lws-genhash.h:93:18: error: field 'ctx' has incomplete type
   93 |         HMAC_CTX ctx;
      |                  ^~~

Add a patch, sent upstream, to only use libatomic if linking against it
makes the 64-bit atomics test pass.

This issue has been present since commit 20c3eb6eb684
("package/libwebsockets: bump version to 4.5.7"), which bumped
libwebsockets from 4.4.1 to 4.5.7, the atomic check having been added
in 4.5.3. It therefore affects 2026.05 and later.

Fixes:
https://autobuild.buildroot.org/results/863c30265623973e15a25c2d38c0e1631a39b7e8

Fixes: 20c3eb6eb68432c37d5db69963be266b7f2d23f7 ("package/libwebsockets: bump version to 4.5.7")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ly-link-libatomic-if-it-is-available.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch

diff --git a/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch b/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
new file mode 100644
index 0000000000..84724f9c50
--- /dev/null
+++ b/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
@@ -0,0 +1,61 @@
+From e0480a47e95a0d74c826926ae6bfef14fc8d988f Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 27 Oct 2026 08:47:29 +0100
+Subject: [PATCH] cmake: openssl: only link libatomic if it is available
+
+Commit 09aade8c9 ("cmake: openssl: Added check for atomic library")
+adds -latomic to CMAKE_REQUIRED_LIBRARIES whenever 64-bit atomics
+don't work out of the box, without checking that libatomic exists.
+
+Some toolchains don't provide libatomic at all, e.g. GCC toolchains
+built without thread support, as libatomic relies on pthreads. On such
+a toolchain for a CPU without native 64-bit atomics (e.g. ARMv5), every
+OpenSSL API probe then fails to link:
+
+  ld: cannot find -latomic: No such file or directory
+
+so lws believes it deals with a pre-1.1 OpenSSL and the build fails:
+
+  include/libwebsockets/lws-genhash.h:93:18: error: field 'ctx' has incomplete type
+     93 |         HMAC_CTX ctx;
+        |                  ^~~
+
+Only use libatomic if linking against it makes the 64-bit atomics
+test pass.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: sent to Andy Green <andy@warmcat.com> on 2026-10-27
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ lib/tls/CMakeLists.txt | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
+index d91c3dab6..9060d32fe 100644
+--- a/lib/tls/CMakeLists.txt
++++ b/lib/tls/CMakeLists.txt
+@@ -564,10 +564,17 @@ if (DEFINED LIB_LIST)
+ endif()
+ if(UNIX AND (CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID MATCHES "Clang"))
+   check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64)
+-  if(HAVE_WORKING_ATOMIC_64)
+-    set(LWS_ATOMIC_LIB "")
+-  else()
+-    set(LWS_ATOMIC_LIB atomic)
++  set(LWS_ATOMIC_LIB "")
++  if(NOT HAVE_WORKING_ATOMIC_64)
++    # libatomic is not always available (eg, toolchains without threads),
++    # only use it if it actually provides the 64-bit atomics
++    set(CMAKE_REQUIRED_LIBRARIES_SAVE ${CMAKE_REQUIRED_LIBRARIES})
++    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} atomic)
++    check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
++    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES_SAVE})
++    if(HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
++      set(LWS_ATOMIC_LIB atomic)
++    endif()
+   endif()
+ endif()
+ if (UNIX AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
