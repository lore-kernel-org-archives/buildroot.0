Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D87CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72EF4810E0;
	Tue, 29 Sep 2026 18:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHcIsj7Di_YJ; Tue, 29 Sep 2026 18:44:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9178F810E1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707445;
	b=h0Ug9uOlyZvv0+ey651OeG9VNbw5rjJ1lp2LTtnjwWkBywTXYqxdKAxPCtQQ59ozYt93
	 Jcxc1YV3CJUtjqKuV3IP2f88YMxgmiSDcWGMAhpkX7L8m8ytpmUdufIo3S+gAqVvE2L6L
	 9XDefnM7L0Iun7j+vllM9Sp8U+m1/Gx41nHgoKti/mMrSvo31Ek9Rj80S3ERrQwphwhhT
	 PwjjNPekYK08w54czAoZc8WTg+QeY7mttnoJmjv+pkIDXY26etjmlcRlIY6aWTXHQUr6w
	 2ZIVE4xW3LaMbBlDnwxcq1HOE1zaz5PVVN4oayvqCzyNnvKH8ihobYwCa18ojN7vYSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707445;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x1CIWRxq3CU6g4mdjrwFF9eCcx0lT754/w23wGBf/OI=;
	b=Iu3/JlzrrfIjshKL7AWuRpSY3Xncb5Nod/DWjMzcKcApdw19XY15VPbUowTTMZ1qw2fU
	 jeemCGfrvjN0dqpjnGeeYunc4BVB/h6KV2g2tYX4Qs+00z3zbHVFRi+xvLy4Q2M9tF1nz
	 Ykl6dQGbP898o6+1+wtz88NfvxS0BdKa+AWAsdh6fGQChrRx2J/JJFKW3nXflNWT4HK8S
	 /dJv/wVoTaO/777Mw5FEWafwKKwrNBoBbB5VG2vpck3Y6G+GfZDn3GTUmQeyBghnG1f8X
	 qbhDVepA+LTCXuY+O9bNm+rHxryCg3/OI3SSUeVZne0PIY3ISv+UoDgu+N7kVZ+FZIg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707445;
	bh=x1CIWRxq3CU6g4mdjrwFF9eCcx0lT754/w23wGBf/OI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UIp7sIgcqSKJRTD402xQAXEG4YGVNFAESLoYoTj9ODUolukgxG+tXO0pPElZL0fDx
	 wDsK76mdMKmQt10oO1AgFdUGhEVA4i4q9xqbE4iQhVNdsE4F2chm19XgF8aP6qLluy
	 skx8xvpASgkAFTvpD2xtvaJqbNRcBcxuslpl4P3RMX2kuEGzM96s/cINYFCRNMr9HJ
	 0qVuSeebN1QOsuhFmhY3fEvPcE3NV6Erqw+bJKGuKWuOn20+0230h/hXEsGERItvOC
	 FfOy3xQpWSjxjtYFUyi2+tzw8/cZY+7iddnsSAdhk3q1KQ3QHShPGsRA8FmYWLdaP/
	 71pRX6ZqN1z1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9178F810E1;
	Tue, 29 Sep 2026 18:44:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D58514C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22CB46083A
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ireLtRAJexmB for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:44:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 179F86082B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707443;
 b=PdRZJBeUAnUVo0TW+mzheQpDUDDw7kRlXtCNXcf2iJkWc8nLQvfZ7oZznuEL9uF2Qnnm
 wdaAjFgMZcfnzlXAPslrlb8PTstCbxijAkVVRGE+CkbxRz3FPFzPmFhCoZn/2UajSfzjD
 uOHDAK6OGnZ26rM5OoZ/hTLAqX3fvEMdxzCYzBuaah5JtLqc9h30Wx71t5XWpMh7hNWQO
 uqpjeAy44ZczmjEr9eWDoUDM5VwKiS0hi5I5hZkntCSMFmuKRxEmqFZNC310wQqduvkig
 4H7wk/7914wLwy6n7C/8rUD6kci1mW4b5BPu+ShngEdsKE/mA/2hliG+NKsFpy7CWPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707443;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=2v+eu45AUBhi1pyRat6aQsoKtTl4n0znxJiUnpRPCoI=;
 b=M0Xd9cYLQZvkrpTvDulb+xs7QEVzAF17w8kKLU9fqEPqlIStQMH/tZgDa6JQ4Mv4rSaI
 2VUoWPLZkzYnpj4N9r/yhI+vBEoqE4AGoB+C6ef20NzCl3YI/O6tuQ46vso8BiFp1LH9L
 K0QKpEF1W8cC3sjvgOpeIKBgxbto5VBqQfTj3evGJWbZ68Ju9GQaTNufMnCsz1y4a8xOS
 H1J7Fam2hGLfqupG3eOKNebjIRnxKoHwXARkaUBv6zA9+J+JX+mPICFoPf4sk+mvq0+B/
 b/brqYFtVwdonQlyJY+BQQAKdTeMkf3tFkrLFuhRXtdWv4U7Wqo0IQkUCiSRK+mEZkw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="i9Ji/KXf"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=i9Ji/KXf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 179F86082B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707028;
 bh=2v+eu45AUBhi1pyRat6aQsoKtTl4n0znxJiUnpRPCoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=i9Ji/KXfEMOirgr91ME7QzowNStDgs7rqfjlcLWTWLrIkWxmk7copqeO5MhZ/zYVY
 rXe1XB/Nb+CfVzR2mW4g/gNZIkQLK/rwlzVFUmL3QtYzm+gIu14xhsbQghvkqErQDY
 IrWHB9djEdCMJpebUVDguP6dz0angJSOAHDjXIcXPUfoJJohfA6OS403KAuaSN4XWH
 JrMnb1ylErgihottcP2rOaoQWYC0FvCJeDTrKhoDbJfFYD1d6QYedfXcAtaF6E45Gg
 tMkeVmG81NRxlJj6ZwV+w2peshRwptIPw3vogNgxag14Mkd0UzoRgmnYUiZF+q2cwe
 SoqQ8NgsZRv5A==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 /2iAsD/RRx8iGCxCw95bTSiB0SjkC3r9wjr46QFbE8H2ijej+sx2J9nYkQQE2wYfwiqImYf6yJI
 KB5BJjUg6qyjlnTpXy0nWqUCYw9WcBaZkNQC1R1SI5AnX9cEnPFlN/mgnJ7sG4t+p1F4qzyQYk6
 6DL74+NoKRBEdbTybVprJYrUvbGt+u7lmpxqdmwdq9QzfKGqKVnojh67bcZAm/fCBWNEye/OqdQ
 K+MrTy/ygU2KMsL9n8LeCtzSfcXFPa8eu1O0szV/54Kv2xnP+iGB3fKTFnJ5ZaAb35LSHrOWK94
 9ctF7TgFuvqyjwTVyRWMDHAfY/TPZfKd8OoKxEUKQd74ftQr5KKJMdF5OwmaJc/jPiktPH6k7RE
 zlAuY/teQtORfjSNmHmz7ayM8aJmHS/RgiTQmd2QPqX0jX00S3bVdtRO3Ngo6KIf2/Y8cQR9ryO
 vhqkPnEOGsbNRFydbP7FRqXutW+yUvZP/QHJ7nXJNMlIDgnfJLMiTzKvwawzXZcv1cSDwII6d2v
 fCFevtNe3l9LQumKbGGD2filF4D6/uhYv1SYVVf3oSOIZjR2ipxrS71pjWu0cfJs+TjQ+kfvHlk
 iU0N3xNYRsMjaY4CLBtmscWo0vXVfRY5Tc4YAkvLP2nsUu1zOK//O7CwLGqh4g==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69676A4C51DB;
 Tue, 29 Sep 2026 20:37:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgh-000000006Jn-3dcm;
 Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Sep 2026 20:35:28 +0200
Message-ID: <20260929183607.1849293-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 29/66] package/snort3: Fix build with OpenSSL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch

diff --git a/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..9f4232901a
--- /dev/null
+++ b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
@@ -0,0 +1,63 @@
+From a32587b0fc22a716b70f242f7a130de003fb3b42 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 11:45:48 +0000
+Subject: [PATCH] ssl: fix const qualifiers for OpenSSL 4.0
+
+OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
+X509_get_issuer_name(), X509_NAME_get_entry(), and
+X509_NAME_ENTRY_get_data(). Update local variables to match.
+
+This is backward-compatible with older OpenSSL versions since
+assigning non-const to const is always valid.
+
+Fixes: https://github.com/snort3/snort3/issues/476
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Upstream: https://github.com/snort3/snort3/pull/477
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/protocols/ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/protocols/ssl.cc b/src/protocols/ssl.cc
+index 733d19adf..4afac05dd 100644
+--- a/src/protocols/ssl.cc
++++ b/src/protocols/ssl.cc
+@@ -860,8 +860,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+     while (len > 2 and !(common_name and org_unit))
+     {
+         X509* cert = nullptr;
+-        X509_NAME* cert_subject = nullptr;
+-        X509_NAME* cert_issuer = nullptr;
++        const X509_NAME* cert_subject = nullptr;
++        const X509_NAME* cert_issuer = nullptr;
+ 
+         int cert_len = ntoh3(data);
+         data += 3;
+@@ -918,8 +918,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_commonName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 int length = ASN1_STRING_length(asn1_str);
+                 
+@@ -941,8 +941,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_organizationalUnitName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 org_unit_len = ASN1_STRING_length(asn1_str);
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
