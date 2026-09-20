Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C25C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CBA16076A;
	Sun, 20 Sep 2026 14:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXBSxKLrDlVX; Sun, 20 Sep 2026 14:51:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2D0986073D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915879;
	b=B8N8kDlXW8l71KXHJVI572eoAcMIFwfASp5u+VjadkR8vlXNc1KyBENng0H/bKU2wtUb
	 Eab2ZgghJYlY1TiR2n0t0OgQAB+Im9vTPjGGs+aH+QczZ1//pt++Nm/dbutLO1fxYE+dc
	 kh1DRxxRUsiO1xubYZkOrKzNFoUxEJ6zvsCOmfzVFukoXXnWm6Knu8WK7FGfbT6n4iwW3
	 eHQN+rjGa2NXVvoJ7kBd8y+EhPHHOdXuZmGiUiB25xf8jNruYGk32NeEmNfl/+kdG1SbV
	 j7ejqZiftxe/ahOTmW/5RRh1nYGp+NMULVKkxhwJGqwkn4XJvakmbrWRsFkRiN/nWiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	b=hNg3JFx5wLgYn+PoSmMkU2s1ZcIg4RzkGp2op9fX81lxF9FeNmEAusosTDCTPvHTuyZl
	 XBSRJdlwG8o4Ek8Dif2zuXs4FulkVqbu0met/q91RYBz117YSnXDCZpOMG6d+nxcVhORc
	 5bGNQ/52C16cGHqhC2Bo3qhw9zR/g8xi/5YsuSuXwwCD7PBrdbZYeNB/PccGiJkCt0TgT
	 BDWaE2ainh/FOxocE5E958Y5ur81ujkW+uyFsJ32ICZKzOQNE2vYsXpXSGFB0UBxaJQeI
	 FkPOuMni1/BnYQx8FC6E9ds6TbeIQEwH8oaAOyU/PSSlDiXbRsFp0h37hOtASz88ZGg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915879;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXgZJFwr2cPUT+jBJsRvNiImZDcHJ3GPCjFy71Z7X5SQ/s/nxmMGlbn+T6jVNrnul
	 3RJg2RiWG2Kcu5X223fHWjStThWZrgyckgGyD0NFRxCL57wcCdX9/Dy1FerTFD9P4+
	 pvUgWSi9EhoyM3OvpXNHaTgJJXQXzub5kWH4lq9aP0P5ERCjPnel8Bo3nV12Mcth2j
	 vc4VRHQqvlxBS+uWNqULmcYhn8ur/18/SemuDgO7X7uP/8qgUrhwArBntRrARQu+vy
	 ax+grjxxQI12Nhjxt4cw1l/R0+1umWMr8ercTOEp8FesoGJxWZ6xxTjcW0LGpBbFGi
	 h0UhQDy20rpnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0986073D;
	Sun, 20 Sep 2026 14:51:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 051A824D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAC594002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bDzoYiYn68J for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:51:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EA69C40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915877;
 b=ExfK0Tpa27y2fxuxy+lC9NhW6MBoJI0+3kmLaFs2omuYAzy4CqNcfLlY+M3whefCcJa0
 Htjmp2bzCh6GQL1GKO6OpkjpCcF2I9Hn+lSqtcFDenaZXeO1+/jdvjOjBfv8kqmVkRL/B
 MhWs9k1TlGUs65BvkIFPKaV7TcLQaajDrm4KI+Ih2MqFIRJp6uNPRhqKM5VeOEKBU1feN
 Md7jXDd0SnCMNCgXW2iH1JRgdOZjHgi/Fzzhc6dskFwESQOa4Ix67DVvo6yRZNgmJClT9
 7ZK3e77w6PseaPUL6oOamXaS1gmszPs5ZfwYm3RNCkRO0lS4HbcoJJEz3D5EwckCYMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915877;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 b=KmGT9KA1fPhCWtKbKfVageYicf/imbnpciZUwdn60pZ6qy0OI8oTUFGhRKqaQ0Nrj46Q
 fRHlqZdiAPaP1R8am+nRCRmhiimddQZ0mSbxhtUEi+0rF04kyUYDfu77y0HKhZOTykRqw
 sXFcpXDQo47hkXSyKIrUTncj3zLlfJhtgkD8sX55ovaayQwDU9VJntIXb8UP5e1o2yQEA
 SNi2+TXSWQiYNdrwiBo3L/0ZYAiJ5r3ODazTWqsHZXzqsaFH8v/PSZ0CgzPdeHhYjL53F
 NdjCzHasswXqZh3BD6YSteVJujDsQkrGtDYtvtYGAaXPs+55LpTmJZyGSTIJCvnRGEw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="e/d7L/bp"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=e/d7L/bp
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA69C40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915503;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=e/d7L/bpn+fOUWBkC1NIHTdgxEpJI31Ddht4SrPy4yB7Y/l/tzG/JoUSLJuPQnevI
 SIwlIHIrlfP1HUHZATn8tdEa5Fz1jB+5FGIcABCvmLvYQEJP0mQQ3KD8G/dzCkecum
 h1fYQmjhiwvQucbaIA2TmOqscd3RC4tItsQsqX4/HO9BgMNUuN4DeinhB+gETSrxZo
 ZlIDLgC3uohpVgKr2POrbHpZU+4Afcq0ZMroAMmykjM9hiHmC4MoGuZF356jWVyvfJ
 pKD5N61RPjhLO1XknC+fnFCq26cAGBaMTHjR0ML1Wauq4EcWSrXCR5fxRjvfccqG4f
 z7S14DQvKbyzw==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:G8kbrbjv13tzuDKBDwIpTqQV//EYkrdqsB9aC2uGPqQwfJ+8cNxXRJTQXlfRgKHfkNxRdPBJJnEXuNIIznKI+7uo9AQs/YVP3fBuS4w5++DCzIuhOY2Vd2YGhapajYHhCtKrd+s5+SDuGG1pRT7OxJaRUq8ectjY1e9e8IE6yrUDAVugrCKlB0Vqo9CnxL3KPxBzi6Tkp7OXAphDdEOXCBHne8gR3MlyTZW9lCy8t92wFMSyZUYAXJcmvTxYPHvS6W5mNY1H4rmPwxUut8J/XPmRTG2aRH8laAwN/HODidIAR+oRsd7O1KaBN30uyNBqz2NmZIohDdHUvMeNM47z8edkDRN/ZfvBNOGgZJCq7qSkh4L056oLQ7mYhn7clsLvl9hvjw2tThtYiE9+cvhm2xR56M2AjYIFaVbTjnZMU+z2WP5nsXlljuDuaO+wH8EFIMPMGBWYmKVSe0QblPDNyzQTtAM8dBYQCOR4FLYcTJBI+xMHIc5icR1Br84AzeL/EqSzVH89Ks7pQF2orh6SFssfej+5i6MTVVzDbZcpRo684TI1qgf4jyfpupxUlbhhM3TzelYbOaGpKrIbMKMBKt+NeKklMPY=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FBA7A4C4893
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imi-000000000hB-3Zfr
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:55 +0200
Message-ID: <20260920144428.3009612-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 34/66] package/ibrdtnd: Fix build with
 OpenSSL 4.0.0
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
 ...ateManager.cpp-fix-build-with-OpenSS.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch

diff --git a/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
new file mode 100644
index 0000000000..4755409747
--- /dev/null
+++ b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
@@ -0,0 +1,41 @@
+From 7dce31ed85b2e2299e63e7704ae2ffa7ce08d1c5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 1 Sep 2026 22:44:06 +0200
+Subject: [PATCH] SecurityCertificateManager.cpp: fix build with OpenSSL 4.0.0
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/ibrdtn/ibrdtn/pull/287
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/security/SecurityCertificateManager.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/security/SecurityCertificateManager.cpp b/src/security/SecurityCertificateManager.cpp
+index f2bbb017..0093d418 100644
+--- a/src/security/SecurityCertificateManager.cpp
++++ b/src/security/SecurityCertificateManager.cpp
+@@ -146,8 +146,8 @@ namespace dtn
+ 				throw SecurityCertificateException("certificate or common-name is empty");
+ 			}
+ 
+-			X509_NAME *cert_name;
+-			X509_NAME_ENTRY *name_entry;
++			const X509_NAME *cert_name;
++			const X509_NAME_ENTRY *name_entry;
+ 			ASN1_STRING *eid_string;
+ 			int lastpos = -1;
+ 			unsigned char *utf8_eid;
+@@ -188,7 +188,7 @@ namespace dtn
+ 				}
+ 
+ 				/* retrieve the string */
+-				ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
++				const ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
+ 				if(!asn1){
+ 					IBRCOMMON_LOGGER_TAG(SecurityCertificateManager::TAG, error) << "X509_NAME_ENTRY_get_data returned NULL unexpectedly." << IBRCOMMON_LOGGER_ENDL;
+ 					continue;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
