Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4DACA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83C1F40750;
	Tue,  6 Oct 2026 16:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCG2ZtnBemew; Tue,  6 Oct 2026 16:34:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9BE1140781
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304495;
	b=Td9HYMBAC2lT/kkBksCx6mgrcRCqv7aP06P0BKj7pXShyDJc6IjbazH4706jKoA8GShU
	 zsYNGfzaaNsce4wax//u09lL4izKvINqO+nuDqZQyb0qBYRRgfUsh6G2dD5MWiatG7d1C
	 kSa1r9Q+CqW5tJAI4zbeb+EosGt5j7vnvd8CGlcJKDYKPPWjdBXL1r4lzMxMN1BaEiuaO
	 Gj/49JfMVcyT/iyotSHA6ieClHqYvbsokqGXVM5L450tBRTS4uQj/7VUIwRxdfV44VsXT
	 SMOeDVYQXXY9vMQEjGxl1TtMt5Du9CKpttXsvF8wJavOKUwgpZC9KC3BsGznxL5Oy6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304495;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	b=lmGGrz6MPvqYKskZdirmYpu1SQJad/K57ZHQ7LlY5LeeO8NgIw8Wtp5kBbflpsEyhRCN
	 MuPhoAo5SzrIDXZDox67B3ZJRLaezC1zDyilIdU83XlVuEKiz1Mjsduj+vO/p/NXpEcW7
	 qeCjDVmnLMbmKuVKNzlvox2LlSkTFpwpQlGDLX61w5yKFjypTRpupigNfCsQx9gtXA/CK
	 D/Z0yOWxMBJi6gfHlO+QrLQHxkymb2Et2bqAc/1MHtU3ikn18Di07e7wQG9N7zFeY0xH4
	 eISv4xjADYfVkcR2LFECp7PmSXlxNX+xKpnQtaskX66smzAIIMCw8UoSbTwgEPceirQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304495;
	bh=H8P85J2FOnuEAUjhO6ResMDATOR9OFP9x/ckxRw8Zv8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=We2hb3Kp3bjM+wpy0K+2FhNj/bOhaqwMKjY4VCn32wCf5WehIJj9cekIXMZ69PurJ
	 q3ewt8gNWDxwx0F8O1N0IecsKllNjFihrShYNJYV2AIwY8FLHd9RXwrkpXH0L8yGRi
	 vzgluh5KPYjxLgCkECRpXhk2R24kL+vnMSVdEvZls31rwGXk+ghmKZtJMVT9rppwUj
	 VTj2q3T6a9NDSDCoAZYLzi8cTc0JiECev0Qy59Wer8Pf2mgHoSbDOadxQqwbcavLfU
	 oX6XetaRceiessNG4rRfuIBgZBSrOiMu6NDE3sYrpPFE2nFyaN1ZvlaTfgkl3HFI7s
	 HaJHJ8LJPfTZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BE1140781;
	Tue,  6 Oct 2026 16:34:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20FCD317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0792B80E3A
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmX-yezENAXZ for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:32:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E36EF80E50
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304330;
 b=WZTW3TwQ1F5iG0O3ImG7VjfucNAIAVtJXGMreIff9bj0ORuG9zLKjpWbKiKUconsFVsx
 nxRQ2jPWNVlfxIqKNrAXCgCzgWizqcqQOqiC0u+Lmb4dFkuPQcgVw6bDQlG9eQMYnP+pe
 mkwba11xgM6eVk7BZ2mbuZGmNxZCY1WvEbAKtrRHDioztn4u0BM2MltBYk+J3DSLaH5R/
 rfdrBCc3QCJ88xv7rNb3UDHYG/1kl067H6QyjT+84f2FfREwTbWqfC43bcbxLN3gc7eBE
 loB8YWgJzvzOHoy6bs2pNqyBfFgpx3UT0re/eRaVN9SUGqzHpcOuOiCtfylW8FKMLjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304330;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 b=cZMJ4ercMcBlUbSre7oMjLjF02KZIN65xHVbuFPIPPJOl91zVaLCn6Q5WFF9h3qE3Hh4
 fdtY0/wS0jBEkzPD/okp7noeIfqb/vyKZq8x+ib+wuUpUsqSFglrqAnQqs35qlmoqoGwk
 RTHONtREJI3ZaiIG5GHqzl8VR9UhVGLGYyLGAU03IHduEQuVOs9/v5I17WvlsWEJNONYu
 z++2u+MoJh0mddutzl86Oj8a7JAFsOSdAjV4MjV5ghpqPjF6a8PBbcDlhg/m4eaOOhUp6
 ODz9U7jhvTqP2JkcLDZ+eR9KHKxWpDdyPEKObYuY/hYrJOnDSXHkMctYO8sAsQ71g4w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pwsk7TVe; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pwsk7TVe
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E36EF80E50
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303709;
 bh=hN+rkTfMvgGwGDUF+5ypUCKmRadn4RPSM3EwGTgPJCY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=pwsk7TVejaotpxiJ2z/V5QeWYawc9/Iuto0TV/xamW0p74ciupey0AIADRPHBN4fk
 lnQSaMiOZC1F+tEWzTh5x8PZBmXf0f3KFendPI8ic5uQb1fFxXWgKbockQHdv+BEpo
 Sq7lGWbQILphqcj4B4whBxEulbPs7ut2Zud57hBFLLwPzwMFLF7dUQg72xLyCeXoHC
 Dl0Gx+G45rpKH79+2Wi25/XC6KGOBDEbVBeEJPT+dAarsbVTXJrb8Td0Iub6oR6Vvb
 S5mKoJic99JgLl3qMnDUXGR4C1LMK5gQ62k/QGgMqi59AuC2AWrsN7jUridP/1iZOQ
 qZDlUgI9u4+2w==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 woSLGiTq0N18HFnCfhJ3f0piG3YbAWRMcCtPW53FEsvR8hC0hfPxvMOm43f4qPEa9TVwq9OONy+
 WDj0NMctWhAqpqW123KWbwqTfFlmaz1J3InlRUsHKRVWYILnLeUXTvETDCuJjChXHN8u8P6ytPN
 A1VXtNQzkWXPS6uJRBUUPHlGGtP7u+must0OUeCD95Zr2SaJTw9fa+Km9Ivpj6hBUf2EuV5vEUX
 RBrVcCW4MGO0zq0ir8SwCmsMPTLyQ3vkDEkH+dM/EIpZQlYxayK0dBy5wkr/giyqKTENNir9JjI
 bO/fYaXykIXxuzTwJ35CI1+bkCNcNu241H7L0G7RW1jr4rAE8rt8gVWgtIuPXxAMVMPaKX14JsK
 UYGJuLb3f3Ztgc1SdCQ1ofZC6vAXNJ4xB4YswT2i77xV9zJB8QWM4VrP+ENLYIyx3zGOO7BjsVn
 VCmeq30lQlckjhdqs6ODe4Asif2QUkkYDDvLvi1+Oa1RhXvMPCamK53N9l8tIT4bAYCqHlgMaWh
 p5Lp2rcBzJ3Ihob8HouUyd3TvA2YDdfiqM579I+lrAhvohtaNgJkEb/6JTTehaCjxjGKc1b/8OF
 JfG7dkE=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 466A1A4C54ED
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uj-000000000ir-2uIp
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:10 +0200
Message-ID: <20261006162106.3439373-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 29/84] package/clamav: Fix build with OpenSSL
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
 ...-crypto-Remove-cl_ASN1_GetTimeT-1731.patch | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch

diff --git a/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch b/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
new file mode 100644
index 0000000000..60e29a1fdb
--- /dev/null
+++ b/package/clamav/0001-libclamav-crypto-Remove-cl_ASN1_GetTimeT-1731.patch
@@ -0,0 +1,136 @@
+From 0097a6f99d9f6b78381e12b677a38fb62242c41a Mon Sep 17 00:00:00 2001
+From: sebastianas <sebastianas@users.noreply.github.com>
+Date: Sat, 1 Aug 2026 00:13:13 +0200
+Subject: [PATCH] libclamav/crypto: Remove cl_ASN1_GetTimeT() (#1731)
+
+The last user has been removed in commit fa15aa98c7d5e ("bb11594 - allow
+for compilation against openssl 1.1.0"). This function is only exported
+under CLAMAV_PRIVATE to be used within clamav, not by external users.
+
+Removing the function will not cause an ABI break since it was not part
+of the officially exported ABI. As a side effect it will compile against
+OpenSSL 4.0 where the ASN1_TIME type has been made opaque.
+
+Remove cl_ASN1_GetTimeT().
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Upstream: https://github.com/Cisco-Talos/clamav/commit/0097a6f99d9f6b78381e12b677a38fb62242c41a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclamav/clamav.h      |  8 -----
+ libclamav/crypto.c      | 65 -----------------------------------------
+ libclamav/libclamav.map |  1 -
+ 3 files changed, 74 deletions(-)
+
+diff --git a/libclamav/clamav.h b/libclamav/clamav.h
+index 8a3767f78..fa75677ad 100644
+--- a/libclamav/clamav.h
++++ b/libclamav/clamav.h
+@@ -2413,14 +2413,6 @@ extern int cl_validate_certificate_chain(char **authorities, char *crlpath, char
+  */
+ extern X509 *cl_load_cert(const char *certpath);
+ 
+-/**
+- * @brief Parse an ASN1_TIME object.
+- *
+- * @param timeobj   The ASN1_TIME object.
+- * @return          A pointer to a (struct tm). Adjusted for time zone and daylight savings time.
+- */
+-extern struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj);
+-
+ /**
+  * @brief Load a CRL file into an X509_CRL object.
+  *
+diff --git a/libclamav/crypto.c b/libclamav/crypto.c
+index 8b398e402..968264811 100644
+--- a/libclamav/crypto.c
++++ b/libclamav/crypto.c
+@@ -1746,71 +1746,6 @@ X509 *cl_load_cert(const char *certpath)
+     return cert;
+ }
+ 
+-struct tm *cl_ASN1_GetTimeT(ASN1_TIME *timeobj)
+-{
+-    struct tm *t;
+-    char *str;
+-    const char *fmt = NULL;
+-    time_t localt;
+-#ifdef _WIN32
+-    struct tm localtm, *ltm;
+-#else
+-    struct tm localtm;
+-#endif
+-
+-    if (!(timeobj) || !(timeobj->data))
+-        return NULL;
+-
+-    str = (char *)(timeobj->data);
+-    if (strlen(str) < 12)
+-        return NULL;
+-
+-    t = (struct tm *)calloc(1, sizeof(struct tm));
+-    if (!(t))
+-        return NULL;
+-
+-    if (timeobj->type == V_ASN1_UTCTIME) {
+-        /* two digit year */
+-        fmt = "%y%m%d%H%M%S";
+-        if (str[3] == '0') {
+-            str[2] = '0';
+-            str[3] = '9';
+-        } else {
+-            str[3]--;
+-        }
+-    } else if (timeobj->type == V_ASN1_GENERALIZEDTIME) {
+-        /* four digit year */
+-        fmt = "%Y%m%d%H%M%S";
+-        if (str[5] == '0') {
+-            str[4] = '0';
+-            str[5] = '9';
+-        } else {
+-            str[5]--;
+-        }
+-    }
+-
+-    if (!(fmt)) {
+-        free(t);
+-        return NULL;
+-    }
+-
+-    if (!strptime(str, fmt, t)) {
+-        free(t);
+-        return NULL;
+-    }
+-
+-    /* Convert to local time */
+-    localt = time(NULL);
+-#ifdef _WIN32
+-    ltm = localtime(&localt);
+-    memcpy((void *)(&localtm), (void *)ltm, sizeof(struct tm));
+-#else
+-    localtime_r(&localt, &localtm);
+-#endif
+-    t->tm_isdst = localtm.tm_isdst;
+-    return t;
+-}
+-
+ X509_CRL *cl_load_crl(const char *file)
+ {
+     X509_CRL *x = NULL;
+diff --git a/libclamav/libclamav.map b/libclamav/libclamav.map
+index 809341f42..f3efe1a33 100644
+--- a/libclamav/libclamav.map
++++ b/libclamav/libclamav.map
+@@ -271,7 +271,6 @@ CLAMAV_PRIVATE {
+     cl_verify_signature_hash_x509;
+     cl_verify_signature_hash_x509_keyfile;
+     cl_load_cert;
+-    cl_ASN1_GetTimeT;
+     cl_load_crl;
+     cl_sign_data_keyfile;
+     cl_sign_data;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
