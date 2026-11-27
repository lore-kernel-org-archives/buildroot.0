Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974A1606A323
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 19:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GM1WmBIr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202611250045 header.b=BAd4I45n
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDBA40AA5;
	Fri, 27 Nov 2026 19:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id viWH2O18IbkP; Fri, 27 Nov 2026 19:00:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6BA4D40ADD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795806041;
	b=jkFvMnKuCb8F2IU1KfhbECw2Nhe5u3DVimkCQaUuDYvWvXaXuu7QiJ824OGbi10+9sUD
	 vGIyaYo9wsVrlMZjPAcnOYcOHo8OZyE4a8G2kPydGCRQgdu70zaNH3nf8zjMKhZyrF/1u
	 Gm3tuwaS0tc29P3/jbr9QlgmXxBmNw4P/YFsbxeCfCJQVoCMhpyPxDlgJdK4hsfSXdsxr
	 poFD0qLxUsigDIOVH3gia7SI5LqHwmXyvzfpolnTEK6oJzKn09+wJ6DwMDTsKUIq+VmNb
	 PYWBIHDgbu5YuI2DN/+DANP6Yd1qzDLSh+epUnMO/HSf8EHj1KyX1BLFApks0h79eYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795806041;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3dzaC2eSXosY4fD1ST3iATPSOpjHUv1X6VyHBVzON+s=;
	b=Hpqm9H5hvUZz8HgVIG/LdSeB60feZ/eTLz2a7/iWXKpbOpYhHyFD34cw8JPQSvP+sjjV
	 aqjCKfcHeb5awqILwWUxFBOCWmZEG7H5lghZEy7QLpNTbHZwI4Rye+tOQTXy4T3zJa2H+
	 SsNhHpWd6DqljMV0SMmsnDlTBVtFdX+rbEZoxo3lkYRl+rw/Gd6mOjGTvzyp5acLqbybV
	 92HgU2z9njfRqP5Fe4veWxyriaQ68m5YfZ0lJtIm8wkC5tk/U0mpz5/AvDVBVuax3ztI1
	 b5+0Lyq+QWJNmKUwFG0dSmscn+5GPFxU5BuBVY3YHyNoxCKnXZRqyouLbHAjYAHMhWQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202611250045 header.b=BAd4I45n;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795806041;
	bh=3dzaC2eSXosY4fD1ST3iATPSOpjHUv1X6VyHBVzON+s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GM1WmBIr21v8sHPqNyKymr4PquT30Tnr5DuzKd40zouMkbVminL6V7R/pFROaVMOg
	 nU04DRmcg2c7xyHYyAopIBWBgITcwAJP9/a8/FGKjbxqSCKmgeAksmmjU+UK05JnGT
	 URaKFmf+w9cRmA6fcTTDn0vbZ82V53rV6fMxPN6RgWsqF4g7Ix9J6mUDL+O69Vdl7Y
	 f21AjW/TVe8qLbZyHd5YG6m0w4G6xuuqtj4qGgoWOvAgr6SAVhEGGoPjhT4g2FxQnI
	 h3dZqEoqSIRc40wAIV4mYGEsBmVVv5ybMJjGtRfguPds8VihPqqo0gwIkCPx+m4DNX
	 mjBT5hNaNiehg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA4D40ADD;
	Fri, 27 Nov 2026 19:00:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A819C2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 19:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E4F940ADD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 19:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lpkf38OAff2Z for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 19:00:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EB72840AA5
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202611250045 header.b=BAd4I45n
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB72840AA5
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 19:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202611250045; t=1795806033;
 bh=TnBl/Fj4NqX7vwqYkY/yNv8lciLFg02sX2bnZmxZoxQ=;
 h=From:To:Subject:Date:From;
 b=BAd4I45nn6ErLAFHg5nlGnvnuCcHyosZ9d9s4tdxqVFg5sNK2Q5uw42rFHf8rxSc6
 eNacmM2gvH/rNZiwPbGNNd8kpFgPpA3KmWDGpUVlhRtGEzfzmsLm0YK9pBBTOP3/w3
 n4eOg1WGKL99hEun0NQfK1sZu27T8LLkvout6JS+ealgZ5FccwZ3LBYnHGwm4yRJCc
 8n2e4mP8tP4iR2JAIOwaN77xMvz9PPPtDD9v/k510nEtzUIbbZ8AW10KnKt/vYwSIM
 80i0tv07126P6ZRObvKYHgk57LTNtw7cILNU/SjrZ9D/k4jxz/9zZDGnwBoFGNSD3O
 TJn5mJojPMS+Q==
X-KAS-Sym: v3:f51bdf72230551df:aRfvxIbaCfVQhYTgSd+zQ/wdTgm8fgAOcPUC337xwBPV+
 W/qjCgZad42fO0QawaDmPFhqfaqh3D00vLEZlmC2j3LsxxY01EyqtmU6nU+GNuGJU/NfwXOmqP7
 azKOyaA6WZHN3gJFYQD0tqTpoPUoQrDQyNinMkNCQOi6KJ9yHHb5X3f8feUBi2EPHvR89kzD24v
 334BztlhQZEd1rDyBf89b6nE7t1QQS7sD4IaULuhIlD8MbhnR5qAFd7mmqmyC76aBlG8zZh88Ns
 CGUTV5+2VL9JXBhvDIgkbCWQG7jCkme9J0OF44ynEyEOYRnWfpIQAV2XVPuwvFh6sK5PqFRw==:
 +Xc9Hu1JArMNCGiMBc7iOwPtl385tE+IifyYEHaWv/N1YdBgZ+v0NpqxEB5iDFxwoF4+qe2Jjwa
 /qMi67LvG/URScqVtofuBHFfxoHYXls86G4kflQO3UXZWp5ws0Q/XXJbAKhJzka0fIAIHCqr63+
 95kBKOSAMi73LaEXVhrb+5YtOPxi0qJNCq6QkEZvIuhjzNoDEnyJtt4U+6EsDYm8OCYAS+MJP6C
 n9Wxojrv/fqUGI9/V8f+tlAvHUzu8dox65vhxQSNeoyWPAEpnsUW+TsSPXnbzSS+wwUDuKA7pTA
 xRjrirQ3jd7F4sXKPxxWzeBIXPgfVbTdK70+6LzEjYNoeLwBMYZrGgh0SpudGTFqZMmTOSWKxOm
 4csUFLEJe8KhbkleqRWPwZrgA1PHn/q9idpo+2kpeOyYes/IFLRvf818N0E01Y0jP02ngKiWGtQ
 MKlDhxPqhc+BxNuUY93nwfGnQsrUIfM4b+MBaurbnDljIiP7B1I/IQhZcxoR/1Gq5KBNDXsCZsh
 Lb1SxkEDlXSc3GIPE68gIi17/+y5iTBLwew9W6Q3Odu9O+8ZY+WfdZFET8ZQ0PnEUq7v1I1wov3
 Ps8Nhw==
Received: from fli4l.lan.fli4l (p54a1bf23.dip0.t-ipconnect.de [84.161.191.35])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBA4BA4C0182
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 20:00:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56490)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.2)
 (envelope-from <bernd@kuhls.net>) id 1xX1BQ-0000000085a-20Vv
 for buildroot@buildroot.org; Fri, 27 Nov 2026 19:00:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Nov 2026 20:00:32 +0100
Message-ID: <20261127190032.1405754-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 1/1] package/dovecot: fix build with LibreSSL
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit 894cbeddafddf9322411fcb5257861c1d0df3ea7 bumped the
package from 2.3.21.1 to 2.4.5. This bump includes upstream commit
https://github.com/dovecot/core/commit/0fa4382844bccb599b651aeb36fed6dfe1870568
first released in version 2.4.0 that causes build errors with LibreSSL:

test-crypto.c: In function 'test_sign_verify_ed448':
test-crypto.c:2021:64: error: 'SN_ED448' undeclared (first use in this
 function); did you mean 'SN_Ed448'?

To fix the problem we backport an upstream commit.

Fixes:
https://autobuild.buildroot.net/results/551/55174cea9d743d277d044a8703be5edaf5afa0de/

Fixes: 894cbeddafddf9322411fcb5257861c1d0df3ea7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/0c404b16ef9cb6e0b998ba00511f1f5a0d3bfe25

v2: added upstream commit

 ...the-ed448-sign-and-verify-tests-with.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/dovecot/0002-lib-dcrypt-Skip-the-ed448-sign-and-verify-tests-with.patch

diff --git a/package/dovecot/0002-lib-dcrypt-Skip-the-ed448-sign-and-verify-tests-with.patch b/package/dovecot/0002-lib-dcrypt-Skip-the-ed448-sign-and-verify-tests-with.patch
new file mode 100644
index 0000000000..e34c83b519
--- /dev/null
+++ b/package/dovecot/0002-lib-dcrypt-Skip-the-ed448-sign-and-verify-tests-with.patch
@@ -0,0 +1,60 @@
+From 8ff550f8133205be1cb94546888d845788c97e43 Mon Sep 17 00:00:00 2001
+From: Aki Tuomi <aki.tuomi@open-xchange.com>
+Date: Tue, 24 Nov 2026 09:30:29 +0000
+Subject: [PATCH] lib-dcrypt: Skip the ed448 sign and verify tests without
+ SN_ED448
+
+test_sign_verify_ed448() uses SN_ED448, which LibreSSL does not define,
+so test-crypto.c did not build there. Build and list it only when
+SN_ED448 is defined.
+
+test_static_verify_ed448() builds without SN_ED448, but it loads a
+static Ed448 key and would fail at run time where Ed448 is not
+supported, so skip it under the same condition.
+
+Upstream: https://github.com/dovecot/core/commit/8ff550f8133205be1cb94546888d845788c97e43
+
+Based-on-patch-by: Charlie Li <git@vishwin.info>
+[Bernd: rebased for 2.4.5]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib-dcrypt/test-crypto.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/lib-dcrypt/test-crypto.c b/src/lib-dcrypt/test-crypto.c
+index 9e5f53364f..892ac8409b 100644
+--- a/src/lib-dcrypt/test-crypto.c
++++ b/src/lib-dcrypt/test-crypto.c
+@@ -1969,6 +1969,7 @@ static void test_static_verify_ed25519(void)
+ 	test_end();
+ }
+ 
++#ifdef SN_ED448
+ static void test_static_verify_ed448(void)
+ {
+ 	const char *error = NULL;
+@@ -2033,6 +2034,7 @@ static void test_sign_verify_ed448(void)
+ 
+ 	test_end();
+ }
++#endif
+ 
+ static void test_xd_keypair(struct dcrypt_keypair *pair)
+ {
+@@ -2339,9 +2339,13 @@
+ 		test_static_verify_ecdsa_x962,
+ #ifdef HAVE_X25519
+ 		test_sign_verify_ed25519,
++#ifdef SN_ED448
+ 		test_sign_verify_ed448,
++#endif
+ 		test_static_verify_ed25519,
++#ifdef SN_ED448
+ 		test_static_verify_ed448,
++#endif
+ 		test_xd25519_keypair,
+ 		test_xd448_keypair,
+ #endif
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
