Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB22BCA5FAD
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B138B607E6;
	Tue, 29 Sep 2026 18:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFnoNYkUfor3; Tue, 29 Sep 2026 18:39:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C11FC607F2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707156;
	b=qNov3djywKHm0Jef4MUo3c1ihq+//WmOX2KW/smv61aMfayJGO9mdylFKXPYfjmlTqV2
	 YOQW0Ndfels4seRpH8LIeDxgSja4OfFoomGpjoXoesxUd0JfpG350JBQqNepx/E9EcbYH
	 cMsFUxOJpq695UGmLL6uxCcKZjjtE/AmjmdKiVpWgaaiL96tMhcL2hIijaW0Gjr/vDwyW
	 bBt+IG3jLezhFo0W0Z8FNYOXzFA7mrSbeuoZ0AB5O5S52VFuiPrlsMktt5mOuB7leHuw9
	 5vsPalagvw10SK9WEYL2eYg5Bq9Z1IodbV1TAmZvizmuxTqHUFvroS6pDV8fyojoRwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707156;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	b=ZFJcFOqiC9YasiHCAyzD9e8phgXMPuHDE2EGS6NT93pcMpuz0BS3noLAK4hbJPzigC1M
	 kPWI/XX+XwSGhFJXAnoarSF3wYeyoUZOwbA03MA7+PZ19t3InA4735dLIX6HSfdaMrECk
	 x5WK6pd3NJX2mL8e1ztd7c1ubjAUvBL3/4hIARhwvotXqV9hHxHplnZ/5PzycsnFjmpD6
	 nmalW2jri0zT1hAPHtjvnbnOONj2IvBLApAI9FLNZBlyhGul8DSteuGoXBzfLcTGZ3MyV
	 HNQLbNDkpCxE35ZYqLeizSmINXINut8Lq6obn1gmZutFXHI6hQRr5mCLIFExxMFQAMQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707156;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=swSyYj9/p/drEZnrK1nE/oxSNjEdhGYcMJ+L0zCOXH5WI5s3dMhP4Qcauf66cAoGX
	 Su6bk7Oa6NcOFTP89gQEsJRX30j31EhyTzR7NehZSZ2Jnv1TWLRXSOYxLusALfk6RA
	 qa19ZYGhuKtUDNc9TZqmPx2CA7EyJE9gmsskjdqMT4/BRaKNAsEovk/LHDsRSUTIwH
	 Xk2R5a4enE9iExFDk0DKkAWU0Zc0+RYJkKk6eKHKULbdlWUEljpIGl1mwfvUcog43t
	 3629zDaxv1NShRhb4ukavo100aFdNTJ7mwtlX6m1SCWrUSTJhdWy2c3FHqXU6QhMoR
	 281Z2YWpwtSAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11FC607F2;
	Tue, 29 Sep 2026 18:39:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EBAB314C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD6844066C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14GZRsMz9T0X for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:39:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0E6A44065B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707155;
 b=dUPTX1Z8DsSqbwvRAAOZk+bff7F/dXlFu5NRLkAnDgVqG1sBC3nk6JqlPS1aPda1qO/p
 4PYJveKuN/RD8XsFGYo0BleIc6MeDWvLt7laOydVtb42xE3X/2OGEFeZF7wprF4IHeT8r
 FpE1ojRaS2p+YNpD+3ScpQZGfUHu0SjbxG18jwZEeBruuX8FPE6+DdM0U+YfxNf7Py7XD
 p2hIreC+zuUy5o4T3DQPnKbnpY44Bq+21jlPfvf/3yYOZfAS7Ge3ahv86Ydjk2YnkNKze
 QMiBk+bFXqZWiAmU2yVhiOQIZBtf5SFSogubqRaYEEu266sgprrJ9GJg0wU4LvtcE1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707155;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 b=aOB/vePHurMntl94Qh20VJhi4H/ozCEjGHSYj0FIKOv1yNz9irDQLw7bnx5Ae0QHynT1
 Z0+I++2gLayAca5zBiMwcmI9vjtdVkafwz+nidGW9Z0osxCRJk449+1vCLxST/dVMj0dd
 VTtB/3VbBSc4qVcKISNcJwK8GPaNuQajikuRuBCUoH45WL/1MsqPjgBWdUFGBHereyt7Z
 j9JsQCUFMwhIUpiIG94di/cMvAY55HiQ4q6OjYvVK326gY7kJNzY9zQbtTJaEHcco6fXo
 JA66515ap8LAfGLsPHmqnj0FNZaWtMX3NU18Foa9J/dvL2/26TUAN9YIZ2XJ08STUgw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ipMdhcn1; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ipMdhcn1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E6A44065B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707022;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ipMdhcn1m5U/dQL0+MZqLgu5oQfmdWBLYiScfqG5thJLIjySCUzvjmZMpL0OKebUF
 VW3NQDa2c0EyWzMhnRLiSsd3rO5OXSfX9aCBC+tlZG9/C2eofVOMUI+YSTfhV0oxMZ
 B4RQA19+PzqA2hhN6Mg/VFhkCoj2w+Nxk02phtGI6xXhICrFjeY951tIw44mGchBh1
 r9xU33G1ixcPTg/+LZNKjgB8X0Xe30isQf2gSb60rWYG9tOUBxbNm+Hncvx73Q7TKZ
 XpMc7qCAmyc/BnSDgY8urffXUAttGalIZXLkiJnWpDNJiKxmVjfojc/UzcZkK6IA+z
 w/BFGXFr3QufQ==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 OY1AYcu1Bzfm9bZL049SdAYqJyF5OWWETrsIDFttgdxEsv2WEX5onRSFim+TIaltQS9Zb/zE392
 m1FNYZRyF6vrNfWYUVuK4xrGOXfdsTrBUEc1MKxUFuBlfqvJ/KtdS+7XoqLHdYzAhYSPUgyUgaN
 Rx5pr5YEAAoZzgpSFZbBn/Gh6wURGR9PtgZaef0Efgxx8g+zSHipnpn1XtHO+kPCOMvY4fAi+G2
 Yw89AvgAPuHfqROOiiqU32lmUmrMGQMmL8EzgubJfP+AkxeyPOn3bs+lsKjI+OCu24YPXoBUZlm
 JkkAWNz12Qk7RZLNK9EbArpdSHfiRDtJ6PB1v9UyqEOeKEowKmdD8cO6uoKBKztSe7p0eGluugf
 73GH6Gw/c1vY2fc3qs6uVshPgAwewTtRt2s5n1DyR9fT6cLq0YNzbCufRd8KzvqBp1dLWiwO+BO
 vPiFrbFGSSrqdX+lvk17vjlz+nuogmASxJVIarpt5PekH+d0ZzKFsSdgCYDlg9MTXfrsMVPJTwK
 U83N+DGgxmBpTpUF5PBO5NrqniV2w3N+EM7i3NlUVd4JvAMUluRpvAGX9JNP73yfFd++foTkwdv
 MIW9IKM=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7208CA4C5191
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgn-000000006Jn-1bg2
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:36:03 +0200
Message-ID: <20260929183607.1849293-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 64/66] package/xmrig: Add support for OpenSSL
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
