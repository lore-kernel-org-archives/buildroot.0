Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F38CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 474E481112;
	Tue, 29 Sep 2026 18:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5f6zR25JcTs; Tue, 29 Sep 2026 18:44:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5F8C581109
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707482;
	b=rh76/Kr2oW1csBLPqyGvdyX8FGUAhmECeriLvIf6tTbtI62t/ROQor4fnxdsb22Ocofx
	 uv2Z4MW0TNBxOtWNGgj0JtEUcEDPS75TzqjVSZeO/10HcxUNjgxxcDBTALcGTCzfIsiP7
	 fhnpfaEOPDnhGn2pJQQEuXVkhg7vLUWZH8ZRLdRT5HVpieDEge2q5d8Wa+3OU10LGW9Ol
	 gD6dfpOw/XUWp8HBdD+hE6haBmzit8XwO9XHlZy+XED6MZehmx8Ivh3hJlhh8t2cs053b
	 IpV+FDP7BfZXhuxBAxxZnoehKRSJ0XSEiYVrMCn6vL70ILfy3hvfHazBirpmxUoc7+Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707482;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	b=IDFqP/D/CU/GNzklSgwxUgd5ewwMoeBZYoJjeKwCuY7CvLCzHwJfDqBwta3DWne62s9Z
	 KNN7NA+GeNTH/bhTFL1PpdiLsxL0ioazyGa/z8IQqXkoBaiFsMjW+aiwhjuXZZa82th1J
	 soq/e+bm+5Z39cvV7MwpDKqCZrpJMF9o3unua3ixX5SLaAbAr68lJujIntNl8T5gj7dKj
	 /08zNHtWN6xfTi1LTg8lymfwJwG/d6Wo6FudoTbbXPOKRn92VSwHmK2VvjnsQa1KUi4Oz
	 fyJ4gQzXrPQtXbUPoBMmgLHEa7gpq7b29Y0OQVeAmIxSRJo2G+A9GVqx0yvNlHolLmA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707482;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dh/WWRvsCYJSp4qS8h9t6o7M1ptUbQXh6MVpO/ndiidisCE8fb1zyYwcz3RFLSGGx
	 pIocYrmp15qHbtC0t7yMLzKLzQlaLBnFJr0LTM7GGEemEtg+Fvj5S5XX/K1dALREcA
	 sb04z77yqCYvqNZGgmBusPXQuczRYHcb8cNZW+akkeBJ9MXatKHQKKTvZ04Tzfv82A
	 83Z0o+5ReFq7u0Wi3vsYGVSrZ4D67mB/4aioyd6p+BFHh8EjLLeUkOnAtJX3FTNOhp
	 uGmDw3eZWiOipPi0MJLKLbAplZf5N7SidwrW3nopF5iXnc+AnCSv5y8ATTQP1HuVO4
	 jZUVX1Zkj+2bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F8C581109;
	Tue, 29 Sep 2026 18:44:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F31D43D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4DD8406DF
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzhozYgLSuKO for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:44:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED2294069F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707480;
 b=mqgl33F8rO8IpjmjxCo0AduAzotleWE6KLP6icOcB+96oaH6YwN7kXK3C9wqMGnR16OU
 jpw01KNCvr3Gj999kxPqsiLyhl91a3Ybe9NDvu9lh6jnS2l8cHJWV5uBCsbYnVbPTPaym
 1CXjFN0g1u7Cql528hioQYoIix1HEv3MuXOjyHejgTsnHXeN15e90egD7Nn8qyNWZQZbp
 0csH0FoEjAsa5qBXMICTbBchk7FTHy5pbB6j8ZDDU42E9DKHIWbrNpugwufMabVvbGb9E
 0ZLY3q1qnErApoV7dfBe6e1Zhpc9r2rhOmdhZ09pMtndAj1U+r9Le2EFeIyJCOmauow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707480;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 b=Qk7fJhdK8JTcl9aea6W0oCrAVCgH47D31/sMbd1UbcXo2dw/yer1foS5PxGlxIjO4mng
 Qd/ZNfbcau1xhqGFbz+pKMqWb1tADUnrMaO01HYzM2XkNq/Qj/6t+KOPp5RAe5Yl1zEpM
 pypEnLTJ8THNyoXeXTeBQouYf91Hw/mnO0wI179zZIT/1uzuRbGyTQeuilg+hCmnF0fNY
 IUYrQdUKN4KYbL7mGpfRY7P4fSNfSxzUlN6377YGX+BamVxOABYJSp2gKflUK9epGirem
 FVw7GbEXC7FoIVZRQnyQ1LBMMuTEKdEOu58ILXyDEPRIp9kc0fMur6rkhRT6SzGhvAQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Q99FlFu3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Q99FlFu3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED2294069F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707028;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Q99FlFu3izx5lBS1cWPjvOf6DF/GE/G3c4pBCsLrnBnxcWVNVjz3N+PdQcBPuej+k
 ojjk9kP6AkL48F+wZdyahXJohgOQuDHlJQT0aF/hOsp0DvXGe1pPhkrKzBPg9nV9rt
 d1u/lPmJ2oVS0dICS9s+k59s9zvnIvCVpKCLR4yGzcTbRn3t5xQw2MLbn2ZYJM+qps
 Mcc/klxZHTodltpH3B+CoyxwhrR16Ob8g4zHsg+mLKULAEgHAau8xUR+EIJeTaQwQd
 qKZstRnQfUwH/U8c2paFTcsY0KCbuqO3ixRwKHRYU4evBYOl3Igrf9P5Fwe2ptztjS
 vBWo4Panwp+SA==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 o4jFoBPq5utGY/j7rIcpo/oIFOCIzOCkZokfUsr9VOCMdMpUbkQwwS+i7oKB6w+Km72lJYwevNw
 3vAB/+pi089eUcnoH5lQWYXY9o/OuCBneXFKkIm8PXyWdalJUym1aQxAnjo3xVK/ap4wBHR/GU+
 JB9FM3ka3X0asDaAYoAkToCqFAgGsUq/hU4r0gewW/PLrsP8rKoCCCtVuB8FQP3HbmYkTCkeiVK
 xmzj/gHk2TJ6nBLzS+A3kwAYDEfMEcl2ijP0a7HeiVWx6h8NFCO31w0FVyi1py6io06iKThVKrP
 pKFvchKuu1glz8dl20bjnKsnT6Gs5FJ3+nAdhTks9vnsJtrb8CLU63/Y2B0xaJ7MD6N5KCpNkQH
 1TNDJMV6hrnm69e5Qf0J9+apbbWqkfQSTXEbgTjY3YNQc8YxZwLnrpvNEre7HQXm7jex1bHLL9Z
 btR3jfvhUksIsa8O+eiYncvvCBo7TLf2HrQdg8M48WbnVx0A2Pl1XIETgU5PDOps2mthZ8NxGtf
 FFFmbja/1M+JJNZ9f7tV7otDKnahW2Kydrd9LPx5hXFrkK8CUlRGydGWrvoTS5I0BMCjHb2VusS
 58A0O5E=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D8B44A4C51DE
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-0cEb
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:31 +0200
Message-ID: <20260929183607.1849293-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 32/66] package/apache: Add support for
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
 .../0004-modules-md-Merge-from-icing-md.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/apache/0004-modules-md-Merge-from-icing-md.patch

diff --git a/package/apache/0004-modules-md-Merge-from-icing-md.patch b/package/apache/0004-modules-md-Merge-from-icing-md.patch
new file mode 100644
index 0000000000..b4f04ba47b
--- /dev/null
+++ b/package/apache/0004-modules-md-Merge-from-icing-md.patch
@@ -0,0 +1,57 @@
+From d534e42b07969755b27eff2892ea56cfd909f063 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Tue, 9 Jun 2026 06:44:42 +0000
+Subject: [PATCH] * modules/md: Merge from icing/md -
+
+https://github.com/icing/mod_md/commit/9fd90380db0722f0ccc14ff1c4da0ca21d4da75c
+
+Add OpenSSL 4.0 compatibility:
+
+* Use getters instead of direct member access.
+
+* Struct was made opaque in OpenSSL 4. Getters exist since OpenSSL 1.1.0.
+
+* Keep OpenSSL 1.0.2 compatibility.
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1935161 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream: https://github.com/apache/httpd/commit/d534e42b07969755b27eff2892ea56cfd909f063
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/md/md_ocsp.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/modules/md/md_ocsp.c b/modules/md/md_ocsp.c
+index aee799a7b3..2e7f14dff3 100644
+--- a/modules/md/md_ocsp.c
++++ b/modules/md/md_ocsp.c
+@@ -533,13 +533,23 @@ static const char *certid_summary(const OCSP_CERTID *certid, apr_pool_t *p)
+     serial = issuer = key = "???";
+     OCSP_id_get0_info(&aname_hash, &amd_nid, &akey_hash, &aserial, (OCSP_CERTID*)certid);
+     if (aname_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)aname_hash->length;
+         data.data = (const char*)aname_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(aname_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(aname_hash);
++#endif
+         md_data_to_hex(&issuer, 0, p, &data);
+     }
+     if (akey_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)akey_hash->length;
+         data.data = (const char*)akey_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(akey_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(akey_hash);
++#endif
+         md_data_to_hex(&key, 0, p, &data);
+     }
+     if (aserial) {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
