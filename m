Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F9CCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CDFC4080A;
	Tue,  6 Oct 2026 16:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0e5ANiWLymW; Tue,  6 Oct 2026 16:40:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 61487407E9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304823;
	b=DAbK1zeVRpo3WJ/8CGScrl9aSXpzDSARL1c/TDIYS9qzxI6LTrJaIY5hvnXrxWqGu8Ye
	 6V0k+FzvD7H9/J4uHwWznpBX/vaT0nAlNL+ONh1Ne+QEVYrZrF/4YKpC1lmHJzJn7WSnG
	 5oMUcg441HLbn+QMIWW5oR79XilWovNg6gHHwCX1OYia86zKej1jMAanWtV55Wx1dSt+D
	 ILEDyK6lifmdxR6sscrG6qLZQM+TUItnrD146O9NkS+OdnnFsafSFD3YR18wNRfCwo0Im
	 /pcUSuoE2rKbtju1W4dZ5mfwiD3Re2tqrnzc7uJxhzAWBowDfCx8BNRj/GLoVLzLy3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304823;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	b=I5650ws6s1tHyjsDOmguf0ZKr1fZcx3IPc+G/k91GeIoYHp9kEij/2dSdfgfJ1ivoGst
	 vk7UbgYW/WIx18+IhogGUnCxmVMb1pFbMs4ijhoyM1ZpQuwdpbMhMU2pKtUd6bwwZ0YZK
	 kZqif+YLeoGkcVOW641l4196b0pWDRvHS/7TIetonPKBOne+cduzQs7FK4LN44iTqxIqU
	 F+DFJqxWiYfFc8BxTdfwy4vH7W4/3/LdGBhXl+6C457YSIa+3/B4idw5Do4Ya6mxBN1Me
	 0JMImEfkv8PZ/nNO9ibBO5724aCOOy0WM7/lCvg9Mv0tL1dwZJ5MzBYGNGltjFa71eQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304823;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HHdmZmhFFb4EAQmBfKHBzSUs7Ic+2tY1p6xquYaVL63ofrlxZTnwothbMrYh4AgPX
	 jRfWyB35EYAMILUTl07aIBs6RQFZikYVKrT7EXam2ufy4sdO9kpdVVcP3JrOjxAf6c
	 PTFzk9gEMjLbJS/I886sC8mB6n85hTlG4coqiDnwuNkfTxG6huY4wfJ3ltvk5o8XfM
	 7A26qTyRhhmpexOJiLURH83TLqv1O30JYiumnfnTr3kQGhVXzz9J/ixpI+m1M87LJW
	 LvHsjXetghsv0uJ5ePszgMYUy+vp0rJ9F8oHr4rNxwR6qgtfFdJ50BwUvrlhG6QNkT
	 I2jz4DXHKG2qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61487407E9;
	Tue,  6 Oct 2026 16:40:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AC3634E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C6E8402CE
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkAd3xJCgBzK for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:37:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9CD4F402C8
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304648;
 b=J4XAU2wOsLylV42mJLtu98Hebh+4HFU6XWCRPXsdg9y1Y75WrIYeZpk2+p4cuPmPaMpu
 ZFc07QbBSxbcthoVAJ8bIH81hfTFdGu5OPLuLgkISyUV7kIBtecRr5f6QsFbj6HsvFmx2
 JOXOIRqAcfqORR/BLPYWOGt74V1Zd3UQaMmIWU5CHtl9DLcjLS5i8fyocTRDk5a/T9E1j
 szqo+HfE7AYVOJi9tKjZw58FeyOyFz/g8D60zBtXS+9kIZkeucGWQP38AUgQoR9HvNEEZ
 Nt2dA5YzpUKIx2VeEmC5pD54+tmTYgKBhHLwVDT1Wvnrx8FQAb4+s5aMtnqHBHvwm9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304648;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 b=PPY3WL5xFpFkw77VHmSIWtAC36ervs1drtC88JzblsH71OS8we7aW0Y0w8NlBsj7zMY1
 SEL8g/WTkuA3/B89HvRkCPeBrWTTP32WP6Qjrx9UAXWl6feSQsnq61Rvm8zkPk8RhMDM0
 Vt8Hm58APFLks4D088quoz7uDs9ghz4NBneNBe1gR0IRouRZbjjqYIhvDAwtvqg7R+FLZ
 Eu7K3JxpDIH1N3ubKvjHQfnzq/JId86OhdceA9DjEK+2vv5uvOIA72b68TsJI33yNWgdS
 9zZlqFB8FwchO7ldvjVai6mTqx/ssowRnEfCM7maUG+Z2UyW7/MP63UDeSlhQW8u0JQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YTOGHxZl; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YTOGHxZl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CD4F402C8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303713;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=YTOGHxZlAk56O1O11ITV68qsPv+czEcHf8czl8F7zJTgscdK9y6BoZ//nWZJ5iHvn
 M2UI8fTBX/PyArWgO00Q7nCX8PI0/TE/Z3UZ0IBSyHnKueDD2eYPJqVFyf+73lbKKQ
 tlpUFuqlR+SQQeG8Yl5khzTcNvotIXZ96xE5cTvBdPT6ent9h5Cndn1YAIWmDe8PYd
 9p1n8UUhUTSL1BkagFsQZBxR4g0bNMT1cgaDyNpq2G1YdFsiyhzSGqsIac9Ul55II9
 Xv9fMcsTSeJFpEbOXnKAoWEpeUhDGHXFMOQu00vHY2LD86j/Vt/X+428oDCrJGHaW6
 tx5xHFdNzVyiw==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 c2mWu0aKkmsaIaZzNQxyBOXOTxzPLwFQ1q/n9tApe4KnLDBSRf+zp+/fdN3ichT/A2B/UYr0NtL
 GFkEJBk87x16FDyH4ZsxRw0BcEr58S/HQQHJM+RVyOQd+ziGVHTgJj0sNj3gDqbVFgDb4Qb59lw
 oacOdeKFCUXu/P63/Q7YQTwSuf50I8eMVsjdUjhZohAWnpuLUyRb/A4W0fOUlViRNBYQEoUoOAz
 qJj+EW2bFBhRmGEIdo3UWg/AwQDDybgV5a9BT1zYlr8b1DGtWTnvRAu1DnN1gTImiDixzONePvN
 BEyKuD/fbVaBT2FO5mc0UcrmTBKM8Ij//jcPe3v30hTx0GQ9jgs3/yT/rVH5PrvzLaBi6jD01OP
 OPd9mpTlcSG/BoGxtCXh7+BLDNdPXVMRJQlk0SpkBpO5c/0PW+QCHmQVqugkBb6wN79hTrKqWJS
 bDHMyb/VRhdCqk+3CrtKTdp3SboMysvRZqzEq/bND50lxH5G8lugy2ttO97snlDymkbdxdzBTOG
 Mj5l7MTh+txHh+M3dBnGDCXvDevbQJkp6Qoy5dun70KU5dR5b62/UWuGQXOASXh1XZCp6x6gkMN
 Bq8sz/k=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98EC9A4C5576
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7un-000000000ir-3q3I
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:36 +0200
Message-ID: <20261006162106.3439373-56-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 55/84] package/xmrig: Add support for OpenSSL
 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch

diff --git a/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..966744abbd
--- /dev/null
+++ b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
@@ -0,0 +1,40 @@
+From 357fab10b79e49dc9b8f42dc6cf425a8124a3f40 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 2 May 2026 16:45:38 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0.0
+
+src/base/net/tls/TlsGen.cpp: In member function 'bool
+ xmrig::TlsGen::generate_x509(const char*)':
+src/base/net/tls/TlsGen.cpp:118:32: error: invalid conversion from
+ 'const X509_name_st*' to 'X509_NAME*' {aka 'X509_name_st*'}
+ [-fpermissive]
+  118 |     X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+      |                                ^~~~
+      |                                |
+      |                                const X509_name_st*
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/xmrig/xmrig/pull/3808
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/base/net/tls/TlsGen.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/net/tls/TlsGen.cpp b/src/base/net/tls/TlsGen.cpp
+index ad2e648b..59e4f0c9 100644
+--- a/src/base/net/tls/TlsGen.cpp
++++ b/src/base/net/tls/TlsGen.cpp
+@@ -115,7 +115,7 @@ bool xmrig::TlsGen::generate_x509(const char *commonName)
+     X509_gmtime_adj(X509_get_notAfter(m_x509), 315360000L);
+ 
+     auto name = X509_get_subject_name(m_x509);
+-    X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
++    X509_NAME_add_entry_by_txt((X509_NAME *) name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+ 
+     X509_set_issuer_name(m_x509, name);
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
