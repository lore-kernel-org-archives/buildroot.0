Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC64606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iL2lf1Xa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9429E60660;
	Fri, 23 Oct 2026 14:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vWshfZ2AXvh; Fri, 23 Oct 2026 14:05:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B27FD6069A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792764315;
	b=ey5/yIP1wB4r5fTqCnSlF0zLOBcVPsGzVVBnUsYwcRfwWpX0lBoROixaQqtb62ePhvQO
	 s8QbJDr+ghfgSJp3RE712B/M+PyiZ1kARzPJvHKKNyI/MVLY5vQWATCgLkS8k+mTLqrRs
	 gjmsJiu9nQXp4FNtG9qPRDjf/rEWtfxNumRCvYu8S/2mzB/UuPXYtTwLYwmFnAWEgN+jA
	 lHfOBCGZKPV13hJCmb30fTT48mhASojWTUDl4VxRc1RvDtMmghg8hdUmv6ABnRTFObTdc
	 uCRUpJLq1kRM+z/GUeSKGUjGrG19UvIMWtlQ9Uc87lHki9HGiGe0ugj+5LOJCOlF52g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792764315;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=m+7mV7pBpHYtGWu4qFt7LZ+9Sc6W1sQ6XWPEGELR1Ng=;
	b=pRSUhFF0Fjfb6dltKpGopPHgujecRkNLJc/+OA/obKqHAQDCj+3S87Rd9TLTL34IrrlY
	 M2sqjTRKKb7zTLUSdqVBSpYfIRliWdo9sXj/VtgcClWjg1GPXSx9jg21NoC7akYNiTLU9
	 8UOSKs1z06cY6/EqMxion/8UMvknqq/I3D3Or8UVevpWR6zOy234yPWgpGjMLuh88B3sj
	 q8SQUFywuL998K0yakvjl6kn8Yu8teYa0tcjvYLR/5PAGW0MnyaDL9ngF7LxDPn3KAU01
	 5+IXwAiFiQHk70cD/Myz44Xjv5u275U75nk8xbXJ/fNJaZno78/UB7msPQfsR4f3lpA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792764315;
	bh=m+7mV7pBpHYtGWu4qFt7LZ+9Sc6W1sQ6XWPEGELR1Ng=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iL2lf1Xa2efYTWTpq8CCZeJw7HLPVNLZTFde6WUGqu5b5ezUEMJLyOdJBWkNm/A8I
	 P5DUCMFnYochIOZk4fSjfNRTs9wiT/kJ1HaxQrzpKquQBlt1SEiv75AoqK0rje1l1f
	 yZd/1pnSHU3mUQEmDBg2CEA45qiHa6Wj6VXF0zaa8bXFoANXdoEwMREaaLXjAvjt45
	 XXzXXowyNP62GXJbf+L1QHRS3iy6J80XEpa6O6PxtOAXhiAzW0QsIGbJDLqoXNwKfW
	 Jyz9F4veC3wVZIS5Tnr8johSI/+5cCeiWNdyHEHcfMrvwozKfSM0/MTOz5ltbNO5iG
	 0WlURmXb0Ecuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B27FD6069A;
	Fri, 23 Oct 2026 14:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE2AC3C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFF716069A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZbusIuUOskB for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:05:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8EC4B60660
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792764313;
 b=nQV2QXK44Mkt+j1a8n1MEzMCXmwA2Lo5AqijZjOzIV06XxfTb3f3r9kvdL8xuO4Zf1w3
 /HiIeh1FU04fqqKyo8t4sYUfcYfPHvlG7ZawfZ/flCXNdEOieR9EL2a0yheaD+DqPeWZD
 lfRJAmX/KM+9pkl1fwqvGb4hmPqgX6PKdzT+z7yR54SaX/Yu/8I6ueVW6p/2OV8c/LyKc
 qIZwrdyroCNLSgq5/IsOlY5Wa0Q7xSmSJrQm+c5Fq16AFJmVC0Tbc7V6c2EtCWuClN7J/
 rn+KGjrxOr7FJGKwYzxD/+QDjdLLDfPylc3XVVJEdSxOVQvuVIgCzxminwrjmMepnQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792764313;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:Date:
 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
 X-Last-TLS-Session-Version;
 bh=9QnqkFFi3B7hSzWDoSNpGpzeHDIWjYlynBsr7vNTyKA=;
 b=YyeUnDQbQnChd06NpBOpbxJ7AnR0Y5QsGTeVjIX+2EVF62j5HNiMnrCw+Gc0+InOJeGt
 GQo71y5SrImaqCsa/IUUBjs2a+Uz/aa42xtt694EoSei1D1Ab0exSe02/tbSQEQHpaD5k
 XauNcyhpUlepGlobdqOS/R4mpBOYwB5TYnncbpOJSiNBbHfs+OfOIplAgudSp/0R3vTnT
 pSrDlX9vvlhb2DikqKHcJNDYRJ68tMQSpDBe4nMecTJkSIZavmZVzJ4aiHeoUvRIDhPm3
 iZKcswhBjIvFUsh44hreUKbc9A5cPxdWDpQcpM98kSSDtNIOpRA30wTnEkeQ7vT4GTg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jA9GfzCp; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EC4B60660
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:05:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D3434C51460;
 Fri, 23 Oct 2026 14:06:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0C12D60398;
 Fri, 23 Oct 2026 14:05:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1AC3710328E54; 
 Fri, 23 Oct 2026 16:05:05 +0200 (CEST)
Date: Fri, 23 Oct 2026 16:04:47 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-netsnmp-enable-blumenthal-aes-v1-2-bb34083800a5@bootlin.com>
References: <20261023-netsnmp-enable-blumenthal-aes-v1-0-bb34083800a5@bootlin.com>
In-Reply-To: <20261023-netsnmp-enable-blumenthal-aes-v1-0-bb34083800a5@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Julien Olivain <ju.o@free.fr>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] support/testing: extend test_netsnmp.py to
 test AES256 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TWFrZSBzdXJlIHRoYXQgc25tcCBzdXBwb3J0cyBBRVMyNTYgd2hlbiBidWlsdCB3aXRoIEJsdW1l
bnRoYWwgc3VwcG9ydAooYXV0by1lbmFibGVkIGluIGJ1aWxkcm9vdCB3aGVuIE9wZW5TU0wgaXMg
ZW5hYmxlZCkKClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Ci0tLQogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZXRz
bm1wLnB5IHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9uZXRzbm1wLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9u
ZXRzbm1wLnB5CmluZGV4IDk1NjFlNDk4MjhkYi4uNjhlOTk0N2ZlMmJiIDEwMDY0NAotLS0gYS9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25ldHNubXAucHkKKysrIGIvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZXRzbm1wLnB5CkBAIC00MiwzICs0MiwyOSBA
QCBjbGFzcyBUZXN0TmV0U05NUChpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgogICAgICAgICAgICAg
b3V0LCByZXQgPSBzZWxmLmVtdWxhdG9yLnJ1bihjbWQpCiAgICAgICAgICAgICBzZWxmLmFzc2Vy
dEVxdWFsKHJldCwgMCkKICAgICAgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwob3V0WzBdLCBleHBl
Y3RlZF9vdXQpCisKKworY2xhc3MgVGVzdE5ldFNOTVBBRVMyNTYoaW5mcmEuYmFzZXRlc3QuQlJU
ZXN0KToKKyAgICByb290ZnNfb3ZlcmxheSA9IFwKKyAgICAgICAgaW5mcmEuZmlsZXBhdGgoInRl
c3RzL3BhY2thZ2UvdGVzdF9uZXRzbm1wL3Jvb3Rmcy1vdmVybGF5IikKKyAgICBjb25maWcgPSBp
bmZyYS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAorICAgICAgICBmIiIiCisg
ICAgICAgIEJSMl9QQUNLQUdFX05FVFNOTVA9eQorICAgICAgICBCUjJfUk9PVEZTX09WRVJMQVk9
Intyb290ZnNfb3ZlcmxheX0iCisgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQorICAg
ICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CisgICAgICAgIEJSMl9QQUNL
QUdFX09QRU5TU0w9eQorICAgICAgICAiIiIKKworICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKKyAg
ICAgICAgY3Bpb19maWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAi
cm9vdGZzLmNwaW8iKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYXJtdjUiLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsPSJidWlsdGluIiwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG9wdGlvbnM9WyItaW5pdHJkIiwgY3Bpb19maWxlXSkKKyAgICAgICAg
c2VsZi5lbXVsYXRvci5sb2dpbigpCisKKyAgICAgICAgIyBDaGVjayB0aGF0IHJlcXVlc3RlZCBB
RVMgZG9lcyBub3QgdHJpZ2dlciBhICJJbnZhbGlkIHByaXZhY3kKKyAgICAgICAgIyBwcm90b2Nv
bCBsb2ciLiBXZSBjYW4gbm90IGp1c3QgY2hlY2sgdGhlIGV4aXQgY29kZSwgYXMgdGhlCisgICAg
ICAgICMgYXV0aGVudGljYXRpb24gaXMgbm90IHByb3Blcmx5IGNvbmZpZ3VyZWQgYW55d2F5Lgor
ICAgICAgICBvdXQsIF8gPSBzZWxmLmVtdWxhdG9yLnJ1bigic25tcHdhbGsgLXYzIC11IHRlc3Qg
LWwgYXV0aFByaXYgLWEgU0hBIC1BIHRlc3RwYXNzIC14IEFFUzI1NiBsb2NhbGhvc3QiKQorICAg
ICAgICBzZWxmLmFzc2VydFRydWUoIkludmFsaWQgcHJpdmFjeSBwcm90b2NvbCIgbm90IGluICJc
biIuam9pbihvdXQpKQoKLS0gCjIuNTYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
