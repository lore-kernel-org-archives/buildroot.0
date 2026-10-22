Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E40606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 06:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UOPOECpe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=qpUlWoJL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE67481182;
	Thu, 22 Oct 2026 06:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uqm_mfAh7Zrl; Thu, 22 Oct 2026 06:02:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 44CAC811BF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792648957;
	b=SvheHm8ApNLNZJr0lY5c29JUfR5bVCvnmtTqBshKKcsYfwk6psnv6xJB/99VBe8Me1Qc
	 ee3sw2jx1nNe/TmZz6Z5yQWLqBhrwx5Unp8apeLw//GG67Wn8FovIXO7JMA2w5iDi0o1N
	 bIIYsSFTs4QMZzsLyH1XhSsD40vPD4gQxIC5HE21VOQEjTMLkVCuKMoNgX1t1QWe6W0bd
	 BrC/jYy8qHgLsgx6z6Hc2V1DU8X2dZw1oFUKogo/VXZ8nxt0aB47MeHFLi75z40DNUgpZ
	 HM0V9uOb19zoafB7eV1l/qRzV4OA7yV3QOwTpvAerL2StxLn0TqwRN+o372xUwmowWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792648957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+n1Z9n5uNE80e9yRu6JaD3ZDeGyGMN8V9Jl8BKgwD2w=;
	b=itLYsYznFhWJYHStPqpXfmXno4k49VS4JahLMCcdx+gMNalQspWuNaNocBMQvXWN43Kv
	 ya1G1mZUdKSzEN5cVoXfrDjSR/ZMKRXtw+xsRbwWYHuPFGciMiLVARLAJJHIPKf13BTkg
	 OS1N9GWwE3DECv3KWO5mInmSFvrpaJbrw5oKeWA/zDtgeaJ7PECJJj7LSlksf8aQnAzDE
	 QGunbHV/6eLqZ6iV88IKleAF0g2LW+f3JeHuQSt/LXI0gzeYtHI+91GPZ7dIUtvoHNMn+
	 CEl6fA1EySQBwnLbNt/799iH0pYhW9JovGSRPSyzHzpLBMdgE8tf82+EicCwyFdhGDQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=qpUlWoJL;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792648957;
	bh=+n1Z9n5uNE80e9yRu6JaD3ZDeGyGMN8V9Jl8BKgwD2w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UOPOECpeS3Xh5s9S52YHgXdqJC3hcYmJzvNMRj2dMhv9DzVV1eTPIuV+Jo4Nc5skK
	 NVHdvnhHXl0Zv/WeL6kU1n3I3WZDGSa3Ok4HLgCk5PQi1sjRnJZuoqTL6YXhJ/MmkP
	 hUYeUBZk9YSoXCdYg9w2uAcFkfoTaGN5Ilx82m8aGMLMMbq9HSuliUlShon22GRaVP
	 +0F4OoRd+IWvnLyOL8To7NU5UVB5dtus3943gL8pPb3UTJHCRFrudfxa6rv8FxHing
	 1Gje12y/kE5ihymFHX3VnUbpm/ihL8cYz0e/KrBXlSR4WNfDchjnNLSMFBjDeoQHAZ
	 lQ1lGn3rp7Edg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44CAC811BF;
	Thu, 22 Oct 2026 06:02:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DDBF356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FD92811BD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpN20dw-od4L for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 06:02:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7E3A181182
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792648954;
 b=IiH7IRpTT/D9vSrpzvzkHCFHga8X+2sqdtMucrWZoiqSS1ILzcklOqwtCHdIeiV2pVmq
 FKmXrRdblU3QKy3oARQtT35MpQjKnCa5XOwADxJC9YTP/UsgvFTyN3u2isnyqU6kkLo3P
 VYOeWLhHfdA9Bp/Xm5Jk955VdZ+CDhSUxVXRpwG7G+USYgmk9SMMaUS6QBVUr+OX73opB
 RVABm5KCKMPhnjIo+lfMTQapdMg07rRHYfMCVn7b3uSt0cNqyF5WTFxLIu3r0kSXxFvE6
 DV2i1+inCD/7fb5J+gbrJMRPQfdiP0r3DoQGDS8ApBrtrLqB36uz8zOQ8Jti0JNXSrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792648954;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=k9jN448WYcRfdq/jrJHFL0iArAS4Ewle60ADBanqSUE=;
 b=U7HAN5YIamhImUMy+O+ni5deq8QPrjqLH/q7mxIeS+sioSrTwgHswFg2W3Keb+IWgooH
 7GOpKKaXUuNiKyeVvso9AHx60wlcqpJGNalDA2apwKEjw8kKRrfIL5tLfvOZPwHfjzCs/
 nktl5H15Ej+SJcuR0EovJ85FcD6bIyPGu/v+M4auce+gzzo1/8Iw7ztBn5cd2zVkUNXm+
 FwQySK/ldxY9pmYtj+PQJE6qhFZhhCnEu1jAz3ByOOxn/Vt5cIyGlCndt5P7aaAv0RU22
 zBtdkS4wNoiDYjccDuJi4syO3LX9GwDqbZS5MC6KiBlwcqX1QOBSdOB/0lN+gbKkV/Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qpUlWoJL; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qpUlWoJL
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E3A181182
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792648939;
 bh=k9jN448WYcRfdq/jrJHFL0iArAS4Ewle60ADBanqSUE=;
 h=From:To:Cc:Subject:Date:From;
 b=qpUlWoJL3NDrrICoXiRg9SEnuSDN9qAYzk8jS2OcmW9foUxdlFTV+6xSo0q7iJkOv
 17Ba2ZsvP27Eo2Bl+HiCkb2v6Dub4FwPSNHL1H5NjJbMpQcmoshltGzykenIao30kw
 QUsuC5POOKuoFrMMlK/NifwS5QJ+eHfjCjt3vNDZhMDdd2tyJFNmP1GeRinGUlNJqX
 e4VsJilAJXGZnYpUd/j2FaEwlrqo+c2dqbhLPZVGmY3+QL4FHCSMvjnA3oUM7ugXlL
 RrdpcbzIjUrnhS3QWffPV8oyFvp7k6e4EUP3ZVeHaU5C1+iqd6yp60hD8pt1OeNY26
 1Tt7bwagvpbjQ==
X-KAS-Sym: v3:f51bdf72230551df:J217wBZ+cG8mkcKpGXI5ylQ57yT3Q7xAAEsD7Ceq/Q0kM
 b0dwkyit7CIVWZxKNHRz3Hn6k1t6LK+tQXZD7LCoEK0o+62XwU4S3I8BTyVK8iAgFb5oxd3dnGA
 OFthYITRNyhiAro8GOoA4zc9txsFBfaXWqjMShINjkr5F55y8BuxBtHMSi7pMCePjAy2NcF3fOQ
 TzdqUYwOqvDJ0RcL1jcJsW6PyFnd36TbbowIe8mEeeJy8qP9+WhdRO2QRvd1PZWfj4FNGAYRQcV
 5xp4aMf6z/m2+OKbXuNFqUFjJozrG5BF5Y30W+cf3NRfr28PC9E6bPs8JXakBX+4MlrtD+3g==:
 cr1QH0ts+GCWP+/JhUTRwBgmWeJMNurh36HR5j5HUSRMGisX2pQggw+AncXiW94oQsOM2hMbAEm
 Ns2JYP6194hV6qAX5ZuhJVjRkL+nVsOem70vZ5Iub6hjMVDAnLoiFR14zsgN5FaqUvQs4nXrz9m
 ZMdLYm4cmGo/oQuqZS7rxhX49s7fQLrfYkuUzW+Tght7fUlYcp8hu8Mtir8NaHRIJdYBmzeNT/F
 sGuY+nn/Q4livhM7mrKbNHOq7G/+tskNWlq0fbWMW615YQPHg0R66dnJQGaFdz5MpPGdtX18m6t
 4QcXgpME/4BgG4ob8ww8oFKJz0Cljk/DTIR2k0R+My7/L4IJVFB+ux7Tv4IvBOjD8/T3XrRT98J
 xgvJztFMo18emb3m3awvioFwMckBxKBy0J6HNFExgW6+zCaGHlH5t30k9LQmZiXu6jT98T3Jwma
 fMkJ7JCSYMDm1QMFoSyBoaGzuCRQGI+yTOj6HsLfYgD4kuoj2K1ZOtedUu4+9idVg25HttvJ7Ba
 SBWEO9gS81hUobDqF3OrQ7I61OJ7XlX5jJY2ZnoU72wBUyu/lY9WG4mK2+G94j8G497l5bh2aX9
 xqnZK/xVq9DRE1HDf/m9NcSWEbytp/UVWqcqvcA5vk0AuyIl1wlhhFT9K2OuttTWWt0eOgD+93b
 zPriC8T82M4/MKg3Q
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05AC6A4C63C7;
 Thu, 22 Oct 2026 08:02:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58388)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xJlsY-000000004gi-0iDh;
 Thu, 22 Oct 2026 06:02:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Oct 2026 08:02:17 +0200
Message-ID: <20261022060218.752140-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/2] {toolchain,
 linux-headers}: add support for 7.3 headers
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/7.3                                         |  1 +
 linux/from-6.17/linux.hash                        |  1 +
 package/linux-headers/7.3                         |  1 +
 package/linux-headers/Config.in.host              | 15 ++++++++++++---
 toolchain/Config.in                               |  5 +++++
 .../toolchain-external-custom/Config.in.options   |  6 +++++-
 6 files changed, 25 insertions(+), 4 deletions(-)
 create mode 120000 linux/7.3
 create mode 120000 package/linux-headers/7.3

diff --git a/linux/7.3 b/linux/7.3
new file mode 120000
index 0000000000..74e2b2d5b6
--- /dev/null
+++ b/linux/7.3
@@ -0,0 +1 @@
+from-6.17
\ No newline at end of file
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 83d7d04e16..27bd3da1d9 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  87363c24f10e06321eb362765521094e94471f6bff8bce2d6b3e40f39f004953  linux-7.3.tar.xz
 sha256  bb18468a8dc8978aa00caa6446e753f7b6da3fee56b6b7f38b16f9430ba02d4f  linux-7.2.12.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
diff --git a/package/linux-headers/7.3 b/package/linux-headers/7.3
new file mode 120000
index 0000000000..a4e1d3ec9c
--- /dev/null
+++ b/package/linux-headers/7.3
@@ -0,0 +1 @@
+../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 405d278e1e..36d72710a0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_7_2
+	default BR2_KERNEL_HEADERS_7_3
 	help
 	  Select the kernel version to get headers from.
 
@@ -55,6 +55,10 @@ config BR2_KERNEL_HEADERS_6_18
 config BR2_KERNEL_HEADERS_7_2
 	bool "Linux 7.2.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
+
+config BR2_KERNEL_HEADERS_7_3
+	bool "Linux 7.3.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -131,8 +135,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_3
+	bool "7.3.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_2
-	bool "7.2.x or later"
+	bool "7.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_7_1
@@ -480,7 +488,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.160"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.114"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.58"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.12"		if BR2_KERNEL_HEADERS_7_2
+	default "7.2.12"	if BR2_KERNEL_HEADERS_7_2
+	default "7.3"		if BR2_KERNEL_HEADERS_7_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7452d96122..4e6a8d7927 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -681,6 +681,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -694,6 +698,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "7.3" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
 	default "7.2" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 	default "7.1" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
 	default "7.0" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 721fd272e0..33171214ff 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -178,8 +178,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_3
+	bool "7.3.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_3
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_2
-	bool "7.2.x or later"
+	bool "7.2.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_7_1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
