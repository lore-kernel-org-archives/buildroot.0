Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17E606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K/Qq53MF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBFED60607;
	Sun, 25 Oct 2026 20:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SycgUxpTTvRH; Sun, 25 Oct 2026 20:39:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E1DE6605E5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960781;
	b=Z+L9+WLV9sgwG2V/VYZlGX6U497uSOtfzjJVDfS5fvJFV4+ECO2Ph1mSZuZtkzD4sdzR
	 0R0tu2WiBZxCtvghtkPkG2xmF9BmEdwKx7ksjm8AUQCqZfd2mF1+FQgXY18Lx5dTKI1n0
	 gr97iJe/IMbN48gcP45MZknER5hpRtzrI37c32OgJWl6vQ6tfeRFCV2CLBi0oPDSpoxjZ
	 qA9yCYdGHbFYzy9W8wbTBI+wGeJusnxa/surK8fpKwVo99ETz4iXc49cUTYJ8rgAn1roP
	 eqNnbPTA+qF6Z8wbNr5sUQUuCN9YgfamFXDVXgcV1z4yPadl9phSf0MzdsA39OI/f6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960781;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gZmyxumi1LX1ogj4J/B+iFKXiTzU5OQ0maDC1vVegxI=;
	b=HXS/iJHGLPZoxXh7y3pC7WuaVVI8kOiKz+wF9x9eAbOTh4wHh2dSxXTtlvKlkLSjYVHj
	 /k4EsyyxmYIfRj3lg+DolXJEQYS+GSLoUn5WdskXECeuDfyfZYzVhYLHPF0MDTWg5Gs81
	 QIlJ4lr7/yXuFO6uu8/++wsgCv2UsDoOziH237PDRdhpENQj98NmF3TBdhZYFDRSJmT34
	 /JTVkS5qru796wJyg9RpQI15JK1Infv+jGm6iOxOPESUln2bzYRnQINTCS4pF/hVDrcst
	 zJUrlAMUrRdD8qAWlghSCsVj7AOSNkZ2f41CEIEmrV7SvFvX8Sw6E5kSY/iA3RdjF3g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960781;
	bh=gZmyxumi1LX1ogj4J/B+iFKXiTzU5OQ0maDC1vVegxI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K/Qq53MF7tar6CsSDDRPmknDalGJEE3eUiswapyg9ixV9puQo7EoNflRmg3AcuAC5
	 nea9aUlEi5GIt+L6w9sh0s9o2snC789mDY9zoIDtXZeor1/k3vxISA8W2wQb5DYMzG
	 wpBSLQaCWBi5Wa54BwqBy7vS381JUuhakqoxbQt8y4D4PLXvMMdv2JPUJTH8GGVwOA
	 4mLBDekWIWuC8IOfjKMolJccttzb+O43GMKBK4wEF/JkAXxb4ffK1KtNFmWmksf4J/
	 YvftezsMJpRO4bdF/zgoiakqB9rWWESlY2K0G6XLa78RUI+dsNVq8oh29Y2QyJigpn
	 DQZVFvCch2pJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1DE6605E5;
	Sun, 25 Oct 2026 20:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83E0779F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 687E0808A9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiNpBw3ItwyG for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:39:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AD4ED80899
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960778;
 b=A1ydVBewSgRnVvNybV0kTzB4N0BeWryj/Lh7WVqPb9ZY3Xi5xDWqJYf/1fdJt4xIc/f4
 A997chEE4nNyfFzmYryaY8gXNvmocmRyOZ0B+2X9Kq5QDivITQt2J2kjPJT5cjqsP/Xj+
 6Lo7/QZboRV4qKtRUhIJjRR6hRJhXH/10JcyReq2hY/QUPNMRRA4fs1BOPS9jJVRRhcsB
 2QQ2BJcXo1d+9fSwev3/b7/ed5oEunYN40KPHoAEVwYpNwfTeQWeycciKqDGafKtTSfpy
 rkocb3drWV9VFXxv0U6dSyg2xV086OvHEUfyANRKsM2SLLTtJqSjVmmnjqy3j9mFoNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960778;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=321csNB0X9gQpr7LmUauR6igRf7WfailI0GBPcqlnT8=;
 b=HBNDH41YZRutn1spirBxWxN1LvPzmASJGQTXXxKdD0575w9pp/JkoOTA15GNTKBuzqUS
 wEOVK8dKw1yrBskEnFuP/OX61POeEmb1m0zQY6MDtXL7rl/JAWCsm/9sdKjuMvuMXWJYH
 gnt0kZP5m24g6+o5i6UR2qU46Gj6+wB688qHwQivkCRhegD3m3/2/xogMrO/k0GRi5SXJ
 V9yK7JYHnHTLE+RswFCnIkeLFBUt4z59MJC35CYljxLtWIoCd50q33xcr3PDH8YKBjYAb
 muNwvIaqVNn4VzMjBSUX9uESe2dFpdsnK9wediDBhJuVh2Opo3Nvs/OXw1ZcDqGQKCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD4ED80899
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:39:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E5769879C; Sun, 25 Oct 2026 20:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:38:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a677b5ec72b59613642563fc9ab50ff4fe41772
X-Git-Newrev: 328f848ce1bc0d593b21142522390f73cc325de8
X-Patchwork-Hint: ignore
Message-Id: <20261025203813.1E5769879C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tools: fix build with OpenSSL
 4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/328f848ce1bc0d593b21142522390f73cc325de8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-lib-object.h-include-openssl-err.h.patch  | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/tpm2-tools/0001-lib-object.h-include-openssl-err.h.patch b/package/tpm2-tools/0001-lib-object.h-include-openssl-err.h.patch
new file mode 100644
index 0000000000..01d722ed67
--- /dev/null
+++ b/package/tpm2-tools/0001-lib-object.h-include-openssl-err.h.patch
@@ -0,0 +1,39 @@
+From 8ed8318d146598cb1c189f051ce7196daf1bb424 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 12 Sep 2026 13:22:13 +0200
+Subject: [PATCH] lib/object.h: include openssl/err.h
+
+Fixes build error with OpenSSL 4.1.0-alpha1:
+
+lib/object.c: In function 'PEM_read_bio_TSSPRIVKEY_OBJ':
+lib/object.c:28:1: error: implicit declaration of function 'ERR_raise' [-Wimplicit-function-declaration]
+   28 | IMPLEMENT_PEM_read_bio(TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ_PEM_STRING,
+
+lib/object.c:28:1: error: 'ERR_LIB_PEM' undeclared (first use in this function)
+   28 | IMPLEMENT_PEM_read_bio(TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ_PEM_STRING,
+
+lib/object.c:28:1: error: 'ERR_R_ASN1_LIB' undeclared (first use in this function)
+   28 | IMPLEMENT_PEM_read_bio(TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ, TSSPRIVKEY_OBJ_PEM_STRING,
+
+Upstream: https://github.com/tpm2-software/tpm2-tools/commit/c2b2c4e5cdc5bbc61779eb4271d5c317efb8c067
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/object.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/object.h b/lib/object.h
+index b48b55b3..2c4102fc 100644
+--- a/lib/object.h
++++ b/lib/object.h
+@@ -6,6 +6,7 @@
+ #include "tpm2_util.h"
+ 
+ #include <openssl/pem.h>
++#include <openssl/err.h>
+ #include <openssl/bio.h>
+ #include <openssl/asn1.h>
+ #include <openssl/asn1t.h>
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
