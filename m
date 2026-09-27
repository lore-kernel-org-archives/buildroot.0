Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA09CC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E9934050A;
	Sun, 27 Sep 2026 10:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51er8Hf5klZo; Sun, 27 Sep 2026 10:48:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BBB1540862
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506104;
	b=d1szp9skkHtBEhJZcwLmAY+bGF3GPPlwSDfRvXR77AZ3UKvdk4wDYyIDUGP96T61UtmQ
	 F552HhE2xYiCgbb1WEQeoxudwPULCfuCI7hZU/QfdSwLhmZhM9cdGtoYemvcD8m/yBBcD
	 Qdq7wrvtUjafJSC7UtCnHK7IsYfOHB+L+szuzPeCRkiv891vWObypMa+uPTkG4YgDgQ+W
	 srhHT1+avyL1k7ZnzoVPttqIjbi5x4d4K3uu7ujJqyPteNE7ef75lwQaSap+axMvxB93J
	 9MOL1SN32Xi3UOJwvjsRl7R/SqUM3QHwX4khMD13yl98Uuzd/HWlqA46V/sOAmUREHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506104;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	b=iqgBIfwWjhmmmX9rS7wxggkBZPq3MYFWmyD9iwnOE8Il0Zkzjd2jPKLBQzJy9SjQLMeG
	 hxNSBfFTIHrH9rN7J8Dpmu4Rm6CGNaAfFo5/BNL/ltZa/2dlFg/JhTzD38yE6KdZ7vfyq
	 fMWLOMi+xQt5XDKInb2j7NXJM540Y/rdM68ZFhYNLDllN97zkAZxneSxr7M6zTIGHh4HT
	 LuoQXWM/4jAvLhEEjV9FqsHf6WazgZJOVUSclmlrO5ceAj2acjw38K6qGCFe93h2u/a4d
	 wQfptYLlz2elHzGbT9mWbgGMHn/DLkgTIOCMVagO3p6Uj/l7S6Xc9fW1gwPuHjbyXdw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506104;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JpTDBaYzjNKe35r70EK3/PyrICyclbgF+SVKHCePNN/OlH8828nUdJhDECH0n9bek
	 7XJrz40ur3j95H/xMTT6/A7wwAUxvoDU6WB7+gdngJOwJvhH0oEK0AqkuOHOz/pw7C
	 MuQA1hpcoc5CQeGseNnasQNZDMxSRG49GAYmZxUN5xr+Yna9PksTnjuIhgNwGfsjjg
	 y3CFPwtL68Bxf3pmBpZc+Rb+iqcwxtlXR3qZGMr40Ze6vo2EzZNkfDGd1LI5DVEjmz
	 D6NqbrP+a82AJMmH/UE5RPedr676hDMqGcHPwJzvj7xBi5ihjkjXvyc1xrwaDz7BRs
	 qo6hHel4Hmfyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBB1540862;
	Sun, 27 Sep 2026 10:48:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FEED335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9827605F5
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6VZo1K_dIrJ for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:48:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 027E8605E6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506102;
 b=MoMnSlTfmilM7vYUndtScMaj4LoMrBm43A1nNDX6Dpi1adVchMuDWka67+otWXyeVcWs
 nXYmBfc+hcw6iLRm92QYrgJfixjWFhLEqo5EZoKW8koYR4nO0JgKkO3iIGDA8h2Bg8lrw
 ENdGqdRYAHlBz/T/fXNVmLJda7w3fa8ArM/NNE2XCNU6g+47ZNnkvonMwGcH2frHC6NE4
 uCbO54PP3iko8XwEna/i8FPmwZ9J+9j8JA8TxwEsnLsU2ovm3diQ4T3CrN0PwJ8a9APff
 gxpu4LiJ7MdaZcBai9h0Dsf4tev26h/QsoiXEyPeS1fEfeZH/1y7fS2PLxJ533QXVFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506102;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 b=Mdf2UX7nUsP0l1W1HctA9cncnMx+bGun1iFsbci/oDZfJyGchZNi1nlcfQy8SSPFEamc
 NnT4MVmf88mDFQYQDwIRx3NBYp3+zvRo2xJJ7/5yiCWbx2sYN5aciqfDknN6r3xyILARd
 PCsTPlorwHdFguwst2t4sQRPGCfVoYtrnecq2NkT69gDATQvAQU13zRtGh8kKsfo1C8xA
 fGfkf3lYjcA75bxvkTMzZ8MBV8vBrUwXTdj0QqZs3YQeXIx8V3YtZ5Y1ChXUe0tL1v43t
 E67pYj6IiQcziQuYNKtf9zfdIEBMfh53/SVZvWx9YXrwtIi8QxE3IYGArvtTy5OZY2A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MZ5b69RI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=MZ5b69RI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 027E8605E6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505838;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MZ5b69RINQcdgN+6HwQAzOF1OFeC7zZYPYaXKMakXNijkHROU1XA6I5r0JFVc8gal
 OXl6770CwVN8wj9GScaX8FpL7iUMDq0S/wzsluQDeXkaYm8dbzMMwdQzQ+WqtmHcGR
 h9qAr449nifVrJXkToV6HXGOwbJj124Kf2tyaEzj5WwqLOIHJrHTZJIAKcAPX2mGsm
 w7m4UYXa5C4ByVd9J6fRYzSS35J8P2FzACJKsRuPQBsVQD+UoATsbiefXIYNlVfwsT
 2kGEqqX8BzchqOcguDfufaiUcyTkrTWqWNderphH9xxE8I2HQk2nOu3N3ALKPqaaLq
 GQegQLKq44aOg==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 gA177k6dHlRCtjH7KTWQt9Ry0ucxmCR5queY8JR/VhOdS19CsRhToFv+ZDvWFzJCkVGFiDj759G
 DNKkg0kGJxUmEEfm5PNiiK6rpbaYq9QSaHJMde0LmtqxfxajhpGXz+7rxi54GJzC/em4GLEhzTH
 CYL18GA4zkYnKAT4r67ApT3/G/CDiHUANrlqpSf+wD8VZW4ak4eYie+7S6STX241JTWbvDODDOU
 wTiuj8GR1kiJHjCRHObLcHwW6ktwFkgRTA6Xu6jtsPmqv5lxu715QmqMyfZrq7ng2Fkz5EuO3pP
 LFsFCHnj5lQGff8bJpBfZ2MN+zshuFJnRVOCeemIb3DNBJUT6AFJcRrS+hyIh/4j3ZT/aegF7aq
 2uvPLzy/MXf/PONSFBkzJ73xRzOoNrXHWogDLB3rzf1gBVwhYB0KNIIJkbDT6fW3gHcybE1U7Zh
 Xe3QlWFediDD8OjiVCa5emEfp2VeViPf09ZnEDxRaO+Q2Hdcdau6w7nqXYj4K//0L1E1HeccP62
 hTrTwKbLnKda+4RW0ZHx8MzMfwf4wm3cY+SuO6QvgH1TbXae74bJo0LlD3z+k1otqmjI0Q3kIvT
 GcJWNXGp01p38QiCttTHxiPtZVZTAHGDqrAjWADFAqdXPQJssZNCXrBddZfjgWpm/f46bEU4Cjy
 67vHj7NVUlPSIorm9Vmsd
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 09819A4C4F7F;
 Sun, 27 Sep 2026 12:43:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLj-0000000007a-0emA;
 Sun, 27 Sep 2026 10:43:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:51 +0200
Message-ID: <20260927104301.1801638-74-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 73/82] package/sudo: Add support for OpenSSL
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-for-getting-an-ASN1_STRING-s-length.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch

diff --git a/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
new file mode 100644
index 0000000000..eec375f70c
--- /dev/null
+++ b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
@@ -0,0 +1,46 @@
+From f97a34bc7b390f185d544e21b0ef75db1275953e Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sat, 22 Nov 2025 12:28:50 +0100
+Subject: [PATCH] Use accessor for getting an ASN1_STRING's length
+
+OpensSSL 4 has plans to make ASN1_STRING opaque [1]. hostcheck.c's code
+mostly treats it as opaque, but accesses two lengths. This is API added
+in OpenSSL 0.9.0, so I'm not sure we need a configure check.
+
+WolfSSL only recently const corrected ASN1_STRING_length(), so maybe
+there will be a need to cast away const.
+
+[1]: https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/sudo-project/sudo/commit/f97a34bc7b390f185d544e21b0ef75db1275953e
+
+[Bernd: backported to 1.9.17p2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/iolog/hostcheck.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/iolog/hostcheck.c b/lib/iolog/hostcheck.c
+index dbb900e71..8383d2c49 100644
+--- a/lib/iolog/hostcheck.c
++++ b/lib/iolog/hostcheck.c
+@@ -323,14 +323,14 @@ matches_subject_alternative_name(const char *hostname,
+ #endif
+ 
+             /* IPV4 address */
+-            if(current_name->d.iPAddress->length == 4) {
++            if(ASN1_STRING_length(current_name->d.iPAddress) == 4) {
+                 if (inet_ntop(AF_INET, san_ip, san_ip_str, INET_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+                 }
+ #if defined(HAVE_STRUCT_IN6_ADDR)
+             /* IPV6 address */
+-            } else if (current_name->d.iPAddress->length == 16) {
++            } else if (ASN1_STRING_length(current_name->d.iPAddress) == 16) {
+                 if (inet_ntop(AF_INET6, san_ip, san_ip_str, INET6_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
