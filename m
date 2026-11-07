Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97107606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rkgjdcl+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48DD9405DF;
	Sat,  7 Nov 2026 22:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T29Dta5QhaGA; Sat,  7 Nov 2026 22:52:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 63F4B405BB
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794091963;
	b=Wuco1u20ky8BSFJhLGOGZOrPpdNBLvYpe4GKn594SIG6brHpothnFCWpp9ztfdEEUvpL
	 Jj1coN3sKeZetW4kZ4elR/dGqxwpOuONjOngeibv5QRUEMRvUr1WDHcot2IOYHTvt7oJ2
	 pFbZuZZs/k+WPktQAlBzLzvuzo7JJmHMr1tUjQb+e4vASJLmMVOkYqvH0rwv6wT04gJ2W
	 aC7/z0wbQD7st7WZhwaqwV+/FyzFRg3YB3l3hrgxXnZQqzAz7dLhxo3c7aZmVZBcvJ8CO
	 8Iu0thRqu/e41r/f7lWa4DwOsAyAF+LYK6ijW+IIpWjy3oXDX3ZUEEJF6hXftmEA/HA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794091963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tEwTgtLzHdsCLZnIHweiqvR0rK8yj7X3ChCpgpEjg6Y=;
	b=jylv1j6wKWOgW045qx6qHFqhoJDpfmoQn3w+9K4ReYfUnpHoMzccYqghfPllmeKURFaT
	 Qe9XYARLQVVuGS99Az+BCeRb0csPpXIbFVyKuxhO7PuqzQT7W1HPTtT/9rZ963dzWG+wD
	 NCyNeXxPDKyqJxQ1cGs+NFsZa4QaGJ4BXxpykrfRtA/uI5eEQlce2XtE6uqjtwzJzvnmw
	 QXuYlc4GgYSzXSH6y9UdFKps23oilhBgjcf8c0ScELQJznm6KrFkHKNkgQmnlC+pRY8L4
	 9j3MonIHlVjPDt87kh2wvDZJrmEm1p2r7iY/Zl4sJZedWvagQETvhbl08j1YL7aZgSw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794091963;
	bh=tEwTgtLzHdsCLZnIHweiqvR0rK8yj7X3ChCpgpEjg6Y=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=rkgjdcl+cBYLqGuQRQOdGb/tmeyat78ixbRe3qsG7OXC1TDoyu4v3CVfRl3Ch/suc
	 jcNyTchc1Qv301FjsOmAEvUIBtXCGMeDXGnjlBXDp2FjQOjAdr9IyPB5z3uNLHvVVF
	 84Fh2bVVKJA1AjIy78k5jMGwkibSKOv2XH6x6RLhZYF3r6FG7G1TVvbylUHWFF8OMD
	 qkcqWB0odXDvFW/LqOzlDaiF/AQuAEAtC6jRs0albTZTdwOCHdGUVKemkekqafydp9
	 C2aYEOyyPDfCRCRC13YjLzTlM1IUAKQjZ8BaPmuRXRyNaBkt8OItF8zBA9kZEkApGl
	 F2CKNyxZrszlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F4B405BB;
	Sat,  7 Nov 2026 22:52:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3967C1E3
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 22:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36E5840437
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 22:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6rT3dPVmT1L for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 22:52:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E3499405B8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3499405B8
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 22:52:40 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c4d5b2db4bbso15607166b.0
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 14:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794091958; x=1794696758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=X6mXjj0Algq+K5P7+aeDOcontiuzvjOy8zkbQCMShjI=;
 b=VTigj25/OKqtVNGwQ6iiKurFm1qkSE+UQLSyLtoHjSAb/gziPcLai8oouGICXdMJ83
 NoSOMZjrT7TRAQc/kdM+NpFhnIcj5Rs25WkSbF+Xt9qbsQgb9nWY77dl3KFK7rwFdNHZ
 7DhLn5bwuUdXRGkwp/98yHfr6wsJSED/Ebdp+iKmAjlCO5eny5B5ZS/0ssbWOb85SE1b
 ox+IpT4Bbmj5u/Xv4x8BwARergjMNe0EJa6ZaIo8Tyo3/NHowmx98AUD29+OvInDA8AS
 w5XpvUpGf/TqaA13Np5YqXFSs5XqlU91WOxVetBvaokrBQ9bGDD707MaSPp4CfrbCc42
 JGaw==
X-Gm-Message-State: APuU4Z8upAombMbJ9MYi826I/MzsVINyzAp83D1/rCoBkDcI68Xb+cXM
 ZpJ7jK8j6kqrWyGovW7JoTVxvWEv6sDtX/q1VRLtPYZYwLrwPd8TBikXwRsz/A==
X-Gm-Gg: AYBFou0zTeIwL1q1SOXie+Yc+JmqEcL+qZBaSDpdvGbgK42IVd8pkIFJtxrgjKKd645
 jB8lAhzQ5OCFGNihoiu6TIJrmBHUlIaASEMo3NW6ZYBK5VBzWceDyvoImeg9RpFxeTvLGxP6k7R
 dsGXsUGHHqrlaNjV1D6nla2NCJFA/wm2pltOVVmXNICX4M9b/gkqZb2zc1JkhFWdfiVvTxdnR5m
 2RakEXsXaFaZxlhVMX7telJB6K9c6snIeSZo1wut7Kai5W3oWE0CpCRLiPzmBwbe3AN+j3Iu84U
 jnRouWy6s7c9bFwhK0wO72dtH9EA6KNIctpxz3Ae2tnzFowHMb7oGnhNYRYFumo18lLlIJgvTkY
 TetmXDDZL+bNvPdzU3czd6HcnmzXAP2kAxK+hy1KbHTKiGbKFygEiO307noyROoXNp0waeqJjIF
 MY4GsntHr3H4JWAUCCuI2ngFB08AWm5S/Tf/gKRnxz6X1qacJIGjJkGG0SgQQSGLyaBOLL5duez
 ovWNEqjjRuKagjW2IrF+Inh6WYKCYeXYhomzROcNMiHOCV4lNzvoRx62aP/HZdnTlcvru7scwP2
 iY9bJTLMTdSfKwQk3l4Lpsj4dJRmUwEm0TuR3l3dKYfdAXgbY4y/npaGWUQ6Vv01/CWITwYpnvK
 EP/1Ntx6n
X-Received: by 2002:a17:907:2d90:b0:c49:8bf8:a7a7 with SMTP id
 a640c23a62f3a-c4d6dad8ea8mr16480366b.7.1794091958406; 
 Sat, 07 Nov 2026 14:52:38 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d69f94805sm15972266b.26.2026.11.07.14.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 14:52:37 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 23:52:37 +0100
Message-Id: <20261107225237.2045107-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105130004.1462915-1-yegorslists@googlemail.com>
References: <20261105130004.1462915-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libcap: fix build with C libraries
 lacking static_assert
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since libcap 2.77, libcap_static_assert() expands to static_assert() in
C11 mode. Before C23, static_assert is a macro that <assert.h> has to
provide, which older C libraries such as uClibc-ng < 1.0.42 lack, so
the build fails, e.g. with the br-arm-full-static toolchain:

  cap_alloc.c:53:25: error: expected declaration specifiers or '...' before '__builtin_offsetof'
     53 | #define CAP_ALLOC_OFF_U offsetof(struct _cap_alloc_s, u)
  libcap.h:342:19: note: in definition of macro 'libcap_static_assert'
    342 |     static_assert(cond, #text)

Backport the upstream fix, which defines static_assert as the
_Static_assert keyword on uClibc-ng < 1.0.42.

This issue has been present since commit 42f2b480a5a8
("package/libcap: bump version to 2.77"), as libcap_static_assert() was
introduced in libcap 2.77. It therefore affects 2025.11 and later; the
2025.02.x LTS branch still has libcap 2.73 and is not affected.

Fixes: 42f2b480a5a81c7443f177bf541632b0fe501720 ("package/libcap: bump version to 2.77")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - replace the local patch with the fix merged upstream as
    7bb5a1d487a9 ("Work around the lack of static_assert() in older
    ulibc-ng headers."), which only defines static_assert on
    uClibc-ng < 1.0.42 (suggested by Andrew G. Morgan)

 ...tic_assert-in-older-ulibc-ng-headers.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/libcap/0001-Work-around-the-lack-of-static_assert-in-older-ulibc-ng-headers.patch

diff --git a/package/libcap/0001-Work-around-the-lack-of-static_assert-in-older-ulibc-ng-headers.patch b/package/libcap/0001-Work-around-the-lack-of-static_assert-in-older-ulibc-ng-headers.patch
new file mode 100644
index 0000000000..032914b18b
--- /dev/null
+++ b/package/libcap/0001-Work-around-the-lack-of-static_assert-in-older-ulibc-ng-headers.patch
@@ -0,0 +1,42 @@
+From 7bb5a1d487a94b708ae34a5da7e71fa1fd5aff8b Mon Sep 17 00:00:00 2001
+From: "Andrew G. Morgan" <morgan@kernel.org>
+Date: Sat, 7 Nov 2026 09:45:18 -0800
+Subject: Work around the lack of static_assert() in older ulibc-ng headers.
+
+Yegor Yefremov reported that builds were failing with an old version
+of ARM ulibc-ng. In particular uClibc-ng < 1.0.42 lack it. Issue
+described more fully here:
+
+https://github.com/AndrewGMorgan/libcap_mirror/issues/17
+
+Upstream: https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=7bb5a1d487a94b708ae34a5da7e71fa1fd5aff8b
+Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
+---
+ libcap/libcap.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libcap/libcap.h b/libcap/libcap.h
+index 829886b..bce3a4d 100644
+--- a/libcap/libcap.h
++++ b/libcap/libcap.h
+@@ -337,6 +337,17 @@ struct cap_launch_s {
+ #define good_cap_iab_t(x)     (CAP_IAB_MAGIC == magic_of(x))
+ #define good_cap_launch_t(x)  (CAP_LAUNCH_MAGIC == magic_of(x))
+ 
++/* Older uClibc-ng environments lack the static_assert macro */
++#if !defined(__cplusplus) && !defined(static_assert)
++    #if defined(__UCLIBC__)
++        /* Check if we are on uClibc-ng < 1.0.42 */
++        #if (__UCLIBC_MAJOR__ < 1) || \
++            (__UCLIBC_MAJOR__ == 1 && __UCLIBC_MINOR__ == 0 && __UCLIBC_SUBLEVEL__ < 42)
++            #define static_assert _Static_assert
++        #endif
++    #endif
++#endif
++
+ #if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L
+ #define libcap_static_assert(cond, text) \
+     static_assert(cond, #text)
+-- 
+cgit 1.3.1-korg
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
