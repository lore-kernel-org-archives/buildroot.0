Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE98C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 20:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6156E4018A;
	Fri,  1 Mar 2024 20:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2klmHRpTVml; Fri,  1 Mar 2024 20:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42009401DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42009401DD;
	Fri,  1 Mar 2024 20:23:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 642471BF28F
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 20:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8751E83705
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 20:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YibwinCv8aGx for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 20:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7EC268386F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EC268386F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EC268386F
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 20:23:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso1416168f8f.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 12:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709324627; x=1709929427;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aQp1fNS1JjTJdznYvuGi8aE+vsvNzDSbW+D7dLXTTA4=;
 b=OFdSou1DEtsTaGaY66Q8tr5ODqrbukynJkf/wHmHS/fbIVYojYz01vljPwqO7JL+Gy
 aavBe6CVgEpSKqfOwJQ1cjaBqdRc5yfxch5oYECXf6EDF1FSVPYUR7DlwUx8VfX93wfn
 am5ELp3+0LxLxhF87/xw1gAQ6IMokopPOTHeLfVmHxSdex7YPp3Xjy6MFajLsWz7yHM9
 78Ge5T1jeb+VGdKH0SB/IRMyvTgLJt9XNfUjQeY4oBAVnuuw+tIHP1AoVJZsv5uiMbsa
 9YO6SkP4kg+RQ5IogurVQBDEhdDu5AAFu0ARcnJ52oVj3cIAkKxYwjO2Z1xplzYMbCW+
 ki+w==
X-Gm-Message-State: AOJu0YzRGcXA8cPmM+zlRrY/duWrMKO4sG/CShtLjKa12IL8GIJCu72r
 Vyffm/iOfAIoMBLtjcVaaa1xqkMrnG2+UDZZQK3NEITmlUTgLWiD1NCHMJ/4
X-Google-Smtp-Source: AGHT+IEnZb135CIU7aFOCiRHiXVwe9ObLNIWwa8K/px6xjwnRe+//MlQglxmQGXe9BLr42E5cOzoKA==
X-Received: by 2002:a5d:528c:0:b0:33e:1818:13d8 with SMTP id
 c12-20020a5d528c000000b0033e181813d8mr2707033wrv.5.1709324626549; 
 Fri, 01 Mar 2024 12:23:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b11-20020a5d634b000000b0033d6fe3f6absm5312197wrw.62.2024.03.01.12.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 12:23:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 21:22:57 +0100
Message-ID: <20240301202257.898989-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709324627; x=1709929427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aQp1fNS1JjTJdznYvuGi8aE+vsvNzDSbW+D7dLXTTA4=;
 b=D0IV/MYLJxAc3y/qTwq04x+SWNp8YbgX6udzmxUCGl2M558rFjpCghQjcacB18Po0z
 nATcRKRekCRJlzsUA7psVFVyUK0J+JLnZK+gPkmWSQuPOnjxkcQpmNE8/asav/kxpCTh
 /f6Eb7vKDja9m8YFYR03/BCZoEhGEc8bvOoJX/Hnza0nOW494jh0u3qD59X8Tm9i2TNn
 mbSlHYHewSVLCZGEBXUGpmiW3Ie9zpb/Sb0YaqX42fFLQaQdRMwZMTV24bqNUx5rSmDw
 H7jw+A7SiGP7ASpjNGGozUi0NU76lIbH4FRA8ksEPwHrubfxvm/acDK0QUkx0OZSnaIF
 E2lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D0IV/MYL
Subject: [Buildroot] [PATCH 1/1] package/libcoap: fix CVE-2024-0962
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A vulnerability was found in obgm libcoap 4.3.4. It has been rated as
critical. Affected by this issue is the function get_split_entry of the
file src/coap_oscore.c of the component Configuration File Handler. The
manipulation leads to stack-based buffer overflow. The attack may be
launched remotely. The exploit has been disclosed to the public and may
be used. It is recommended to apply a patch to fix this issue.
VDB-252206 is the identifier assigned to this vulnerability.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ing-OSCORE-configuration-information.patch | 38 +++++++++++++++++++
 package/libcoap/libcoap.mk                    |  3 ++
 2 files changed, 41 insertions(+)
 create mode 100644 package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch

diff --git a/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch b/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
new file mode 100644
index 0000000000..e75250d613
--- /dev/null
+++ b/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
@@ -0,0 +1,38 @@
+From 2b28d8b0e9607e71a145345b4fe49517e052b7d9 Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Thu, 25 Jan 2024 18:03:17 +0000
+Subject: [PATCH] coap_oscore.c: Fix parsing OSCORE configuration information
+
+Upstream: https://github.com/obgm/libcoap/commit/2b28d8b0e9607e71a145345b4fe49517e052b7d9
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/coap_oscore.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/coap_oscore.c b/src/coap_oscore.c
+index 83f785c92..e0fb22947 100644
+--- a/src/coap_oscore.c
++++ b/src/coap_oscore.c
+@@ -1678,11 +1678,12 @@ get_split_entry(const char **start,
+                 oscore_value_t *value) {
+   const char *begin = *start;
+   const char *end;
++  const char *kend;
+   const char *split;
+   size_t i;
+ 
+ retry:
+-  end = memchr(begin, '\n', size);
++  kend = end = memchr(begin, '\n', size);
+   if (end == NULL)
+     return 0;
+ 
+@@ -1693,7 +1694,7 @@ get_split_entry(const char **start,
+ 
+   if (begin[0] == '#' || (end - begin) == 0) {
+     /* Skip comment / blank line */
+-    size -= end - begin + 1;
++    size -= kend - begin + 1;
+     begin = *start;
+     goto retry;
+   }
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 62f08a20e9..29161142f6 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -15,6 +15,9 @@ LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
 LIBCOAP_AUTORECONF = YES
 
+# 0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
+LIBCOAP_IGNORE_CVES += CVE-2024-0962
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
 LIBCOAP_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
