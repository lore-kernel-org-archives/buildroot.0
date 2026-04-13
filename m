Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD37F436B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BF0816DA;
	Fri, 17 Apr 2026 15:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-Ti7ppKGJxM; Fri, 17 Apr 2026 15:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 178EF81066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439217;
	bh=o+ZBcu425BkNVMNmK9VDo7FtkEQcCOe6Yog1m2P6i+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gAkmm5zphtGKPlvwB+ARPQAoDdD5Ua6Au1nEea10BBSDvuPNnLICRpdeomQu4FlF7
	 IjkFf9EcW1yiJh9EiBO5p2GIaNAqmUvg9ZRb+zMxdyE1HVl/JoxW/sYE7Nvi36tioC
	 M4BkIZVQ9rqbL2XuE75UZ7u8DKwb0+pjg1mTTkM5HZc2XDMjnigODz5PaL28V5VZcy
	 5KPi46v+fyCQ7+gfNv0sPaRD/RxFnB7A3ZXBcpw9l0kxbTWz3P/6+LLddIuw+dk9lT
	 54ncN37/YzdLVziCBePAur9bsLys6iy3BIitKounIlUaTJU7DRLxsR8qCHpIqRUZ6i
	 aFr66cL1dwvcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178EF81066;
	Fri, 17 Apr 2026 15:20:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A98A6396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EE42405F7
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjXOFBRYe6VV for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44E4F40606
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44E4F40606
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:20:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB059819B4; Fri, 17 Apr 2026 15:20:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 14:22:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 20f7059c1aa30c24f87c0c63d78a3ed05fca9f79
X-Git-Newrev: 7ea47a2ee385512ab67c6d6889316107cbf652b0
X-Patchwork-Hint: ignore
Message-Id: <20260417152007.EB059819B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libspdm: add
 patch to support openssl 3.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ea47a2ee385512ab67c6d6889316107cbf652b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The master branch bumped libspdm in commit [1] that fixes the build
error that appeared with openssl bump [2].
The 2025.02.x branch remained on openssl 3.4 and didn't need a backport.
With the EOL of openssl 3.4 and 2025.02.x is moving to 3.5 this backport
is now necessary to build libspdm.

[1] a01c07f572 package/libspdm: bump version to 3.8.0
[2] 9868ca6ec9 package/libopenssl: bump version to 3.5.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-Backport-API-introduced-in-openssl-3.5.0.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch b/package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch
new file mode 100644
index 0000000000..72ea0ec7e1
--- /dev/null
+++ b/package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch
@@ -0,0 +1,34 @@
+From 88797f83daf6654d6381e3539abe1670763f2ac1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Apr 2025 17:47:05 -0700
+Subject: [PATCH] Backport API introduced in openssl 3.5.0
+
+This commit [1] introduced this new API which is used by pem.h from
+openssl and it should be provided by asn1.h which is vendored here so
+it goes out of sync and causes build errors e.g
+
+In file included from ./os_stub/cryptlib_openssl/pk/x509.c:18:
+/usr/include/openssl/pem.h:399:28: error: unknown type name 'OSSL_i2d_of_void_ctx'
+  399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *vctx,
+
+[1] https://github.com/openssl/openssl/commit/35f6e7ea02b599d5aaf220b4720cbadd946d8023
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: https://github.com/DMTF/libspdm/commit/88797f83daf6654d6381e3539abe1670763f2ac1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ os_stub/openssllib/openssl_gen/openssl/asn1.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/os_stub/openssllib/openssl_gen/openssl/asn1.h b/os_stub/openssllib/openssl_gen/openssl/asn1.h
+index a90152ee0dc..fcfbe42ec0b 100644
+--- a/os_stub/openssllib/openssl_gen/openssl/asn1.h
++++ b/os_stub/openssllib/openssl_gen/openssl/asn1.h
+@@ -368,6 +368,7 @@ typedef struct ASN1_VALUE_st ASN1_VALUE;
+ 
+ typedef void *d2i_of_void(void **, const unsigned char **, long);
+ typedef int i2d_of_void(const void *, unsigned char **);
++typedef int OSSL_i2d_of_void_ctx(const void *, unsigned char **, void *vctx);
+ 
+ /*-
+  * The following macros and typedefs allow an ASN1_ITEM
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
