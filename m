Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD9FC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 21:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AD324074E;
	Wed,  2 Mar 2022 21:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hm0zvwrzImWY; Wed,  2 Mar 2022 21:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92230404E2;
	Wed,  2 Mar 2022 21:18:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EBF41BF3F2
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B059401D0
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83m3a7AdkQG3 for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 21:18:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1950F401C4
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 21:18:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t11so4769420wrm.5
 for <buildroot@buildroot.org>; Wed, 02 Mar 2022 13:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kqb/b7QarB3XApa0gbDbw06Gl/AQl5yFFnbudE4e7yk=;
 b=AtQMsNzYfg53IgfsvkiMSRFSXqobgnWXBXZfuMrkNzpKhD3Fmvdy3GjRSlm7KLU3xe
 CD9agOCoQ81u6lIw4O7M2lZhWmYSr3nK6PtwbDd88OxBti1oauSXCs3VeJdTwRQZf3ul
 Mrom3tayHaoDtG0uYeTMLUULVpIBao5MDSsOFVUr6IMudJ6Y7QfO3MXTszaiGxKfQglb
 E98D9GFsia2ACds+c3kwVfcFRlOVWOcX8Gitwmak3MWVtSYee/uI5hdlTIWpcJNWpAco
 jpW89xT9HRPKYvwUQMvBzSwBaBi2rUmX2tehCTbSh0+C+AyqRebzDDn4em2W0MZuSxZV
 Ofmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kqb/b7QarB3XApa0gbDbw06Gl/AQl5yFFnbudE4e7yk=;
 b=VhzFAkOUze8NizIy1n7M/KippUNB+nRkr7PJOQPQi24bEKCUnQub/GsrBTT+3sK63h
 ks2iJO2SiwOk0ZP55SZ7yiVybgtXTRZyTdz3mR+WYUOhwCqJUCMotvvhVORYUMy11n4V
 cc905AyXKPc2EAtH2N2a/f8I97dEVXkGIOyfrPkT3QeTzB3FXpyrUn/ifbygiPorVIN7
 UF66Ks0AkM4YayiUcPqvDBWLQ8xSy1JYEiexrG8avo9TfMS0ci9BpYYrYkuhjgWV7thO
 Onn/TltZO+3194ubGmfZqPCo6iUcgghAtu0ZStiVa76Vonfh2bH3im45Z2LEy/Hm7Yo5
 Vl/A==
X-Gm-Message-State: AOAM533tYISRAvh7YAYmvD6MBkWsoyv3Qq4i1gru14EQKUwfVneKobVj
 +mWgCzCyLmsF9dGaxFmv9T4GCSTtp7Q=
X-Google-Smtp-Source: ABdhPJyzGrA1Ri8Em2O04uJuCmNfvziNmmcH1NthKUNl0yoLGHDLN2fkd7EF+lzml8FcVg9P0psRRg==
X-Received: by 2002:adf:f152:0:b0:1ef:587b:e91c with SMTP id
 y18-20020adff152000000b001ef587be91cmr22042378wro.717.1646255899895; 
 Wed, 02 Mar 2022 13:18:19 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfc787000000b001f049375350sm138980wrg.8.2022.03.02.13.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 13:18:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 22:17:24 +0100
Message-Id: <20220302211724.2351984-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: fix build with gcc 4.8
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 2.86 in commit 5b29096f8fcb0acd8890073a56ba9d620b1f911c:

pattern.c: In function 'is_valid_dns_name':
pattern.c:134:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (const char *c = value;; c++)
   ^
pattern.c:134:3: note: use option -std=c99 or -std=gnu99 to compile your code
pattern.c: In function 'is_valid_dns_name_pattern':
pattern.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (const char *c = value;; c++)
   ^

Fixes:
 - http://autobuild.buildroot.org/results/eb0c34ff58eaf103f51c7171ecd97a3bdb887601

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...src-pattern.c-fix-build-with-gcc-4.8.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch

diff --git a/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch b/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..90bb02b23a
--- /dev/null
+++ b/package/dnsmasq/0004-src-pattern.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,57 @@
+From 0c89dd2fa0fe50b00bca638dbbacfbd361526e0a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 2 Jan 2022 21:57:52 +0100
+Subject: [PATCH] src/pattern.c: fix build with gcc 4.8
+
+Fix the following build failure:
+
+pattern.c: In function 'is_valid_dns_name':
+pattern.c:134:3: error: 'for' loop initial declarations are only allowed in C99 mode
+   for (const char *c = value;; c++)
+   ^
+pattern.c:134:3: note: use option -std=c99 or -std=gnu99 to compile your code
+pattern.c: In function 'is_valid_dns_name_pattern':
+pattern.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
+   for (const char *c = value;; c++)
+   ^
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=b2690415bfa1bc105e61b75f642fb5c1aaf0fae8]
+---
+ src/pattern.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/pattern.c b/src/pattern.c
+index 03e23b9..928d259 100644
+--- a/src/pattern.c
++++ b/src/pattern.c
+@@ -129,9 +129,9 @@ int is_valid_dns_name(const char *value)
+   
+   size_t num_bytes = 0;
+   size_t num_labels = 0;
+-  const char *label = NULL;
++  const char *c, *label = NULL;
+   int is_label_numeric = 1;
+-  for (const char *c = value;; c++)
++  for (c = value;; c++)
+     {
+       if (*c &&
+ 	  *c != '-' && *c != '.' &&
+@@ -242,11 +242,11 @@ int is_valid_dns_name_pattern(const char *value)
+   
+   size_t num_bytes = 0;
+   size_t num_labels = 0;
+-  const char *label = NULL;
++  const char *c, *label = NULL;
+   int is_label_numeric = 1;
+   size_t num_wildcards = 0;
+   int previous_label_has_wildcard = 1;
+-  for (const char *c = value;; c++)
++  for (c = value;; c++)
+     {
+       if (*c &&
+ 	  *c != '*' && /* Wildcard. */
+-- 
+2.20.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
