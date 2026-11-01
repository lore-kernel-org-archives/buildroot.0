Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44FE606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VhGx9l6x;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=uUkEzMV8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8FA66070A;
	Sun,  1 Nov 2026 08:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geXMhmCfYthb; Sun,  1 Nov 2026 08:25:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 23685606A6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793521522;
	b=diO57qwskZneBlWiKuf0sMvkFQZerS2I30a6b6jbcvvnUm8RIVh6d2tFi6ZJo4R+jZEx
	 l4tEDxBluolVBsVg8TjEK2BLfUE6ZiBn8ocDFTv5SnDn1Z++Zs4WG+aiNm/hwqnmgpUkz
	 1YIloig+EQRoCvuXpnaiBOPpBz5beORsxzilW7zFF/dLH/0kdHahg6Ipeu0sr6KRYPFqL
	 MQLzyRQ6kAN2zTouc4rZCB17xcXKy1R6WQgJRCUzTCXKZI/yPj3RBDTQetY0j4ob3o1tQ
	 ZzMBwtu4QhsP4Ei5S4HKF7xd3re8AFKZ+jUuJrqGmO5e4L4Jxle+ZfCQcKbgWgwkw1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793521522;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FblhG04b6ot8u6cCklO5c0wGx0sl41txrnPF+/79EcQ=;
	b=CMZ2WIgB8VyQs8/0cqHi1Kjf/FUJDnxidc5R3rflFdzY1mKx92WsJb21FrxJmnUw1Jx4
	 2lnfOOBksS61qolUf9JWwK/4Xmje19rXkkkgtNXniDP1aJII9t62Da6t5WJ7tRvOYEVFj
	 V6GmBocavvWyANN6rUXl/5J0hLdpyxOEKHn05poXU8GWlGJcW4VPkEU6gqXvPYW0QjEFr
	 KdB8khvsrD+3snThkFsgmqehZsnxQVKb51JuBHpp0zS3rLr5MjJtN7yy2RZ19tui2Rocy
	 w3jlcJ281J+4VmnWo1ISLyuaqIZxomaOxKyWRRpRCbhMo3dhEV/7Cxm3I94GoOJMZ+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793521522;
	bh=FblhG04b6ot8u6cCklO5c0wGx0sl41txrnPF+/79EcQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VhGx9l6xmygf7P0ooKD0HUiuLRuPDcI+MOiQgeq3GNkY7kWPL/T2tKim/4tofOLXL
	 xfgfWThhVxcd1qe1A4tTgCdvi6trujrRdcb4lImwtJgNaBezSyXpPGBAReP/ndzptR
	 vz/P3xBmjaNy8sf/SN/foCI0ZxhtS2IyljpMnS8J8FDzpjuD5GOsi4L0qpXHq4ETU8
	 5BySLGyxt3PP/m9s/cEJl952p76UFouw58DPpn8SaPNZIfqU+I47TY5vooA20QzGap
	 nXfWVIj4yEIc0Vmwavc2dT3KJeZkDLVjVFB/WuEqMvcZelg279qJrJl7404fS6rkZ0
	 99GKgQJAxdWeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23685606A6;
	Sun,  1 Nov 2026 08:25:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6E5156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 08:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8348B4051F
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 08:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7sy_NvfduUL for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 08:25:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2A3B5404EC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793521520;
 b=RRjspVRoGzvJ0PP7He+ii0Mw3gg/wvq6yBfAQj5ai5IxSjIRE0ILoJRs2UpmqhQGsZC9
 H+hPPNe24i8kl/kbvQttUdR6bJnZBttnAcP99g0rewJL1mVQiT8gugfyAiidTZbcD2kdN
 /Pvl/riuRBDrI0FAMFUubGPnxFbck5qgkSisO5U0MR3hiGq0F+eVuw3RA5EbrjXeHU6wV
 GyzI+UnkzQFLecpJU3CLpsfXGsX61vVIxztF4qRR0Phz7MQNHbQ/UJsbB5khwQzwlffvj
 d988IJiHb5P/IWC6MVUITPnrM2jAeXEoMIWJ3++K/KldJI0LE9iPvyCfCFjw9nt1vKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793521520;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=gIWnPL9UrOo7G6MvmCvfDPyPEmzF5iv3inBIN4qNiW0=;
 b=pxiLhdw7NP2WPAt0flCIM5Anju9Z1u5/nscH90iWkdNl8simKj5AFdR4jWRlzR1yxyI5
 n4kplX3A8ZNWf4BqO79qAxuIBa3WIZljRWjG4nGCmo8dzshir9SeXQqWDj/RA/ouHRf/v
 UIKz9Oj7IfsgD0Q00wKCkJ3KUrYG7XskIZGpWVbAZmO4O6p2kTmtdX8V+5XRwo05En1B3
 v8cl1KrkGeYKNsJ8n5tCm0h96d9eaXLwA42kA1gKncBcN2a0XWEBZZfnpTnUV5ieUdBCV
 86pm8fOTddanxXzlR5qysgv7vPTGFMVJd+GJGMVSAvBJwylG9xltE0EQ8/ackDLbguw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uUkEzMV8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uUkEzMV8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A3B5404EC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793521514;
 bh=gIWnPL9UrOo7G6MvmCvfDPyPEmzF5iv3inBIN4qNiW0=;
 h=From:To:Subject:Date:From;
 b=uUkEzMV8B9UdQcbRj8a9ChnaIomXRzxFTSZYHG3d6cUfVgvhhuJz1yGnlIH+EU5SC
 FnINMvNerHLs0gzbyDLDSPiGoNYANsCLCtV7Czv/WuLQBpBKp60DdrhdodkmnaeomP
 gIrFFbVY3cSJiez+HWdJPFxee/AN5OZkOqVNnPAlY4fNjqTwQtxhhBfE/f7mRDz73Q
 ZpFAY/5so9BXj5eZkYnnfV0Oe0Ygq7sjpbCjpWkhP1xRNGRm63XwRZ+BwHC9y0vddM
 QzYQ6mGHmGXdrq5rzGoA16cLhlIpAIiixSokGQq4ofes8uxyhOosdwdn5pCHXNc0U2
 XewuytGd1Mitw==
X-KAS-Sym: v3:f51bdf72230551df:TBFA4LYdwmVMJj5YgAT899P3xtgRWhhqejp3HzxMNxt8G
 v6rQaEmrA8Eo8jA+/rd6cRY6ecODcXz3TAdJ1v5+1z/Cit8bi3/5eKJLJjsm2ynaK1EBtTm2qQE
 iDZWJpuXLq4byMLwJHq6/erRbeLDy2xPdaoNkF2+8XmGlUwz8sX28yDmwOjO8JHlvDAWvUl7vlT
 9WaL3bay9RaPQpdVn5zU2FbGqz+QtXa8QUUjU5VtSo7+oZzhcby/7WLevAnOwrzxHByaFaO5Lxf
 rmcXfH/1ljfJ+lgMXLxpOuzeTtBo3Rz/pnZ9L8NTQCVd7y+Kd5NJio9dQn0Qbu5LjTqUcPOQ==:
 jrLrGpkRRr8abTrfJ/pFiUNfqho8cT43tQjH/dJDDQt2ar/txj4ezqYzVR1le3LEAvH8H3n6aph
 s5Qhb7cGn7IpQrFRL9XvcB+DRW186UuVAX17WyYK4t1PNKspODIKzd3wO59paCvA7gM/0o5rpFu
 3IEigFLCOEvvG3+J9f6KBRMHErEbqDDLbULF9ffxK1LNbO9xnOsu0FyjEHxWoDk1ucQMcfOXPfJ
 eH7mAjwHdLmq6Y5Bs9Mx7XeK3KAfwhgZFsoheyB7qyLQWG6kJtK6vh8BaQdONf49er6S9U54qHU
 DuxJ7ydGtfQwuEe7DebFUW7CJGyOnMiMkGnHLt64aCsFq84m1cVp1tctGMeiUREQeB+4vnJeu6H
 Wco1viEqDPPtTFg0QflXXNAA/l1mi3tJxBe+w5f9UpBcpuUxughqTKqPWfM65QeLVctWE66kyUV
 3tir1FqptlyNqA9SC/UXQZmoz9wENDnoxAK39c83Bcg95y2XQdqiiHnXhYuc+zPZeFbWM+uDoFG
 p/d+EgkptSuuMH7OqCF8H4A7RFttQpT93UmWmd5KqTjqH0W3jsBWLzKhpbqVQq/8/XRR06OxmCo
 ErQf+w==
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6BB55A4C244F
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 09:25:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59036)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNQsL-000000004fH-3aLl
 for buildroot@buildroot.org; Sun, 01 Nov 2026 08:25:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Nov 2026 09:25:13 +0100
Message-ID: <20261101082513.1583784-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/dovecot: fix build with LibreSSL
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Buildroot commit 894cbeddafddf9322411fcb5257861c1d0df3ea7 bumped the
package from 2.3.21.1 to 2.4.5. This bump includes upstream commit
https://github.com/dovecot/core/commit/0fa4382844bccb599b651aeb36fed6dfe1870568
first released in version 2.4.0 that causes build errors with LibreSSL:

test-crypto.c: In function 'test_sign_verify_ed448':
test-crypto.c:2021:64: error: 'SN_ED448' undeclared (first use in this
 function); did you mean 'SN_Ed448'?

To fix the problem we add patches from an open upstream PR.

Fixes:
https://autobuild.buildroot.net/results/551/55174cea9d743d277d044a8703be5edaf5afa0de/

Fixes: 894cbeddafddf9322411fcb5257861c1d0df3ea7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...de-test_sign_verify_ed448-from-Libre.patch | 46 +++++++++++++++++++
 ...-for-SN_ED448-instead-of-excluding-L.patch | 30 ++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 package/dovecot/0002-lib-dcrypt-exclude-test_sign_verify_ed448-from-Libre.patch
 create mode 100644 package/dovecot/0003-lib-dcrypt-check-for-SN_ED448-instead-of-excluding-L.patch

diff --git a/package/dovecot/0002-lib-dcrypt-exclude-test_sign_verify_ed448-from-Libre.patch b/package/dovecot/0002-lib-dcrypt-exclude-test_sign_verify_ed448-from-Libre.patch
new file mode 100644
index 0000000000..3ae624d56a
--- /dev/null
+++ b/package/dovecot/0002-lib-dcrypt-exclude-test_sign_verify_ed448-from-Libre.patch
@@ -0,0 +1,46 @@
+From 2615be988c3958104e2c86323564acc05f13e616 Mon Sep 17 00:00:00 2001
+From: Charlie Li <git@vishwin.info>
+Date: Fri, 23 Oct 2026 22:34:34 -0400
+Subject: [PATCH] lib-dcrypt: exclude test_sign_verify_ed448 from LibreSSL
+
+Upstream: https://github.com/dovecot/core/pull/340
+
+[Bernd: rebased for 2.4.5]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib-dcrypt/test-crypto.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/lib-dcrypt/test-crypto.c b/src/lib-dcrypt/test-crypto.c
+index 558c9c9724..6ed164c0f0 100644
+--- a/src/lib-dcrypt/test-crypto.c
++++ b/src/lib-dcrypt/test-crypto.c
+@@ -2007,6 +2007,7 @@ static void test_static_verify_ed448(void)
+ 	test_end();
+ }
+ 
++#ifndef LIBRESSL_VERSION_NUMBER
+ static void test_sign_verify_ed448(void)
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
+@@ -2339,7 +2340,9 @@ int main(void)
+ 		test_static_verify_ecdsa_x962,
+ #ifdef HAVE_X25519
+ 		test_sign_verify_ed25519,
++#ifndef LIBRESSL_VERSION_NUMBER
+ 		test_sign_verify_ed448,
++#endif
+ 		test_static_verify_ed25519,
+ 		test_static_verify_ed448,
+ 		test_xd25519_keypair,
+-- 
+2.47.3
+
diff --git a/package/dovecot/0003-lib-dcrypt-check-for-SN_ED448-instead-of-excluding-L.patch b/package/dovecot/0003-lib-dcrypt-check-for-SN_ED448-instead-of-excluding-L.patch
new file mode 100644
index 0000000000..4a5bd76972
--- /dev/null
+++ b/package/dovecot/0003-lib-dcrypt-check-for-SN_ED448-instead-of-excluding-L.patch
@@ -0,0 +1,30 @@
+From 734edcdee13f1ba4cd007cc25059bd49f022ec4b Mon Sep 17 00:00:00 2001
+From: Charlie Li <git@vishwin.info>
+Date: Sun, 25 Oct 2026 10:25:10 -0400
+Subject: [PATCH] lib-dcrypt: check for SN_ED448 instead of excluding LibreSSL
+ entirely
+
+Upstream: https://github.com/dovecot/core/pull/340
+
+[Bernd: rebased for 2.4.5]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib-dcrypt/test-crypto.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib-dcrypt/test-crypto.c b/src/lib-dcrypt/test-crypto.c
+index 6ed164c0f0..20371cefc5 100644
+--- a/src/lib-dcrypt/test-crypto.c
++++ b/src/lib-dcrypt/test-crypto.c
+@@ -2007,7 +2007,7 @@ static void test_static_verify_ed448(void)
+ 	test_end();
+ }
+ 
+-#ifndef LIBRESSL_VERSION_NUMBER
++#ifdef SN_ED448
+ static void test_sign_verify_ed448(void)
+ {
+ 	const char *error = NULL;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
