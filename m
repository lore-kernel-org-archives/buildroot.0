Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC5C606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sLTf1wk4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=GNOn15Ch
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF79B4099A;
	Thu, 22 Oct 2026 21:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LN8sDYRgEP6s; Thu, 22 Oct 2026 21:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1CB214095B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703454;
	b=o70xiti1SdoZmA9aONumi6rk2KF1zNh8NE151XVbfLh6JbXQGxlc8+trBCfIVQ4DMpJe
	 RyxQ/wyUTTu/UkMw5l72j5vQQ8lvPPqrBMNmni5uUo468YWBqmPPQb3T59ou8z0oDs644
	 WGIfikAwHJQw6Hm/IQPDwnJQfJA+FDA/t/hXcxUeshCvo5GDf8V9lXWoFzA9mZmV1sJzN
	 U7+uvVygJsZM7v0gT71r+DP5ZRjgF8UiVit+dw9nywQSsag+G+o2fHc3wsnHNSLmajwpn
	 0ihC78UOXVjJKFWg5Qd4f0kD0WVOIre5amnhXYPVDYve8P9r8YJPfit4F+4ds7qO+eQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703454;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sB25rB7QLc1FPY6WlkOIC2tPlJzxiP6gAmyDy4dAVxk=;
	b=ACbUX+knyAeBhUyX2cjZKPqdl6pZwGtbCyzPv88cqGEUDwmttVYkMOxN3wDAw4Wvaq0T
	 bxN2tXFJFfVPWXRoIL7p1HEQz9NaKJ/mm11AWCZgLshlSwk4iqDk/lyKu5eUvMzuX7Qe4
	 XeTOAn4anUjprueObub5MH/GAauTHbC9pE9/CWbvcYX29vKO0a3E0suM4NVdlM9K6UGuy
	 oiKWsnq1AY/g8IXZhOZiw4v+ebb0DpMYdVvkCentDS8EPBvade7rF9xUdTOKtD2zq6GgH
	 lRPxTv9NhGKLdj89GV6P9FcBLT49YTvLefmC3Lws6Y0PBk7zatyD6dcX15GJvfzBxbg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703454;
	bh=sB25rB7QLc1FPY6WlkOIC2tPlJzxiP6gAmyDy4dAVxk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sLTf1wk4I/lGmQoCCy75VVegRkiaCOy35oPbM+Nn32j3DwJi0LUk1kBxBbILHdezu
	 grWPlAMFG6XS4Fa+Jvu1pUHAlX32HKRw7+D6Sf3Sujkjjmc3dw3+nbkQBRxaj13yA5
	 GMkKG+JtNKXN4jjfZ+7bURddGUTlB+GxjLD2uKkPqBf8CLDdGuuQHFqMdeKOcitqkN
	 YLrVCTASbkjaaEET0FtIS8igjCxK/F+4J9sH4gv1FMDGXhvnAKsLYOT+q7SsZ2xShs
	 e3N6IL5KSbMzV5LZ94AgWmCRSxgrifNvk14KKYlzc855HQQbp5T1XEHD18A4fUKp/D
	 aRjifR+7oKUtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB214095B;
	Thu, 22 Oct 2026 21:10:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB56F4BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCFF06080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1D-ihfvfcPd for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:10:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9AA2E607D4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703451;
 b=Wk6pu60bp+BZpUxwD3S5TAEFvwSI+1/fdEh/U3k4klcPEQjGlGNgjcF4IlcbC75D4KxN
 ijeo6ktROdeXce44HJI0Gwg7O7pb5nq8IHsmInt2prd5kU96l3DVbqzv/s/Mm2o2BWW87
 1pYbDLYLy2YwIxjea7khtQbmz1AC2WM6ZldVt5hwRbXDtUzSP/s3h5n6VjD2WoXhWXPXx
 +INlYpICcaOs0iV6c8B42pXsrTTXNb+nEL5+9lV6jb9zfxR5ql407zrPLWKhgTfSOJblt
 vmEwZHZyrZdDsBZWMnNSR9e4lU4SPvUD6iRr7lYhxAV0Mb8MrIGgKaezJQNwsB2sSdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703451;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ausaT4JHQrhqDGSJY2wiojLS01WaKm8hG7doOnogdT0=;
 b=ifbyBZaDplsuv898IzfFTv9b0gXYIfAs69KO2bkRFtkuB9obzuhsyeR+Gq2qJkejuL0j
 EWX9Iy+sonk/Ne0F/RPgiAxM4N2xW5iNrnjJwq8m4PkhZYoRuYgZC+bFEt/T9LHNFcNPu
 uywd/FHO0Wo3K6xCVjZHCSIBYGoycd8DCrcG9mGTTDAuw69o0Mk2ImXvstQiracK8roMq
 puIt9O2WSkFRaGG++xCYRGmOTrlYwNKfiVqA09AURFop2Kh7oDHoqYLA18Hhtg2xzfhpk
 XUpD2jeFV4jJKkiDmgkKTFyMv4g+gPkRk91eyX1dRl8DjgzG+GIL9tHVlVdpeS2kkdw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=GNOn15Ch; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GNOn15Ch
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AA2E607D4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792703449;
 bh=ausaT4JHQrhqDGSJY2wiojLS01WaKm8hG7doOnogdT0=;
 h=From:To:Cc:Subject:Date:From;
 b=GNOn15ChEbndCskD7Ts+iQ8Nkyb1kTWfh1xP71wp92pV10SDGa7Sb4ZnSfpOJlTtb
 98PbjC8D1Es07ypHJwiS0B9D7fdxPCiHDW7Dge/71jlH86g40tYwz6daY06GGO2L5B
 2TE17ooWT8ZFh4t8lnc+04tUBFHuMoEAdRPIoDBRadBn/50iWzPGpbv+2ctqyvMGJe
 7Hk2yxxFVEH2+pIIhYQhhCQagch3CHWUkYCKWOlmx8HArQZnx7ge0nr0iRTdCvSQwb
 k39nd/GIoUajx2wvrN/+pvakJ/VnYUi73F4LBPlmRGzbqOpVlGD1s2jmwcwhVVjOj7
 grIqMn7QSRwww==
X-KAS-Sym: v3:f51bdf72230551df:mgwc2np/01HqnFMRjXCerrzaou+iB/8xK3BNLNpxtDiUa
 2YrtBSA7JhjzUDu6SAj10VNUqRRVtWj6Kr4S3AJeeipvrmd2DQs6A/LpLQ9jzrWOme9pODRwTCH
 kIffcseROQ+h0ke43l9w7jqPLLmJmtLv4MA4PYRV5dLD+jNxS9EnKV+Owe/R282ti35GAFDNj/K
 RKVjUhQ4wj+nKy+tQwwsmoyKe+iUPDcq7Cz2MFCVs+ZzlBkEc1XkhEJVWVTnByHTUhZ5WgDu5xf
 jqj8CijhQYFGGpnXWEnP9IHyuOBGq/H1imXXb9hWX9BmLexFWtgjAP8EuTYbvOSF9ZFrsQAQ==:
 HtUWnY3p009HKXhdsgW60YHAoBmb16/XX3Xd2vGeC+erWuLLtXeSxr0XxvWFk8e5Af287RuQTFM
 fegRGLDy9oGq2AYtskI+r42OyVXK2NyyUEz01uw1GJdOQmOgVddQ2ofkAVwgwtM0QJDFBqc5BV3
 pi9DBq3klQMNst+/MHn/EKdKzEbQBqgS7Kla/uHQNFj1y9bK1TlxIp/81k8bYb+3lKpASACIeRH
 2CjsiyOPZ41chWwY9+nMLN49SGoegog5KiHrXWsIRIoXhgdG+vHt2+O2zve+obV1nS63NXKlG4j
 wVWkeziEWRxVPh6P29ie7BHnKEBvbZpvaEXVY7GrhmlOvL5OTtCJq8a9L6SeAHS8B7SCgzLKNW3
 mo4Qy+cWe4AV/ufCDtqxy/D+kQ0c/f3+TkX0Mc07drg6vpXNm0iuvl3/CmtSOHn76J8a7mH0lRL
 b1u4dGdNBcdABQX6P/O+HVSpQGGOkbUdpdWRXttZzxELzf/0s48T/fUVAD4mKv97Hz+5d9o5Foa
 D0a1gZAmfqGa/lYpZMYvRS5hSSDvu2ei8L7uBq86YIAGLalJe+tV8AgyVhLDB9uCw4VXeoEKAoX
 JE0iM2pO
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12E14A4C65D2;
 Thu, 22 Oct 2026 23:10:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46430)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xK03k-000000004Uk-1Cgp;
 Thu, 22 Oct 2026 21:10:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Perale <thomas.perale@mind.be>
Date: Thu, 22 Oct 2026 23:10:48 +0200
Message-ID: <20261022211048.1243312-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.20.30
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

https://ftp.isc.org/isc/bind9/9.20.30/doc/arm/html/notes.html#notes-for-bind-9-20-30

Fixes CVE-2026-19630, CVE-2026-94300, CVE-2026-96888 & CVE-2026-97313.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/16191cc29d01d60a67849a754c3bbc27a0df448e

 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 8129fa2d2b..2d6aa2fde4 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.29.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.30/bind-9.20.30.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1  bind-9.20.29.tar.xz
+sha256  9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e101e82e1e3b4fef  bind-9.20.30.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index a05ef6c362..7fb07fc83c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.29
+BIND_VERSION = 9.20.30
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
