Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8363C433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 20:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8461F60E83;
	Sat, 21 May 2022 20:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsYskeD1Q4nH; Sat, 21 May 2022 20:37:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84A4A60B8E;
	Sat, 21 May 2022 20:37:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B20321BF286
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 20:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A03FF60B8E
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 20:37:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x0ADvrE6XsCd for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 20:37:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB3C460B1A
 for <buildroot@buildroot.org>; Sat, 21 May 2022 20:37:21 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id 3so7536177ily.2
 for <buildroot@buildroot.org>; Sat, 21 May 2022 13:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a/Dv+LAw8X+o/XZszGWNIdqo2baHo3xKe5VK+zaZb80=;
 b=mrJcsjJKaojclTwGdInmP5ebmEK4I0pBV3oY9gNR+onOxkHrWMSwnVQPNhnudrVBYa
 GWOaiMDDJQxytzvzfM5QDlji/NLNfBHTKN6B7w5XJNNGq5QrYCZvX4vYoqVrY8SpYn7d
 s23CNmNWIOxV0/Ekg1VGj+W+YBCwvDwHGBSrwQF707v2yKjFpcFJwZlbZsWkQEKmzYfA
 BNskIhuPVj8Mtr6KXZ8N5Fa/zm389IhfELdbhQ0R8ObcktTS47bFShujypvvlJFmLtyo
 5vGP9YPody4eI5o8ireYksRCyzZulqwWWz6uswnXeeyofS7BiUzc/u10ZeP2UvVicBCq
 1Smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a/Dv+LAw8X+o/XZszGWNIdqo2baHo3xKe5VK+zaZb80=;
 b=f9peOv67to26ko0usM7/P6b+P1mFYE/AJPX1Ki0bwar1Lo5F/g47xAmKH3nEhwAVNl
 HzCy4EVbcK2fqtAVKvYRuYTwLKwYqr6I4KRtEWUSKKUGo4JlTMhoo1PdpyRVb3hIaTIt
 zwHSCiBQy+0QBrKrM/YRBhwk2UF2/CpGjNPgPOZFLLwuOOCM48esn3Az0/Ciw9L6cFLb
 7myNGmlJljwGqmWvGN0yISqrgf0j8PYmjxs0LgvC5EMlrDyu+6Ga5wprbFcepix1Ni0p
 S6UvosIA0MKfdDr4JFc5i9IBVtTtmQM3bhBvoL5A+LaTeZFaWOMET60s2tdX0A2f+S/U
 xmbA==
X-Gm-Message-State: AOAM530l5ShObnXZtx5YckZWy4biD11atkKMpfyPGDTesvK8lGQ1aB/v
 GZHKu5thsFuVtNI1CXBkjlfGRDKGhxo=
X-Google-Smtp-Source: ABdhPJwnlatMc84d2F0AqNfFQlvMnXZ2lYd+an7hMsjFYtbgBnvR0jel7eePXjX05wSsfEGPWVD+ag==
X-Received: by 2002:a92:d24e:0:b0:2d0:e923:5427 with SMTP id
 v14-20020a92d24e000000b002d0e9235427mr8298933ilg.287.1653165440450; 
 Sat, 21 May 2022 13:37:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 i16-20020a0566022c9000b0065a47e16f53sm2499519iow.37.2022.05.21.13.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 13:37:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 14:37:13 -0600
Message-Id: <20220521203713.3425992-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix uclibc without locale
 support build
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch fixing uclibc support when locale support is not
enabled.

Fixes:
http://autobuild.buildroot.net/results/658/658ace73425c93dfa34212564d19395c9018f3e6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ild-on-uclibc-without-locale-support.patch | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch

diff --git a/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch b/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
new file mode 100644
index 0000000000..0f2e6844e5
--- /dev/null
+++ b/package/pipewire/0001-Fix-build-on-uclibc-without-locale-support.patch
@@ -0,0 +1,65 @@
+From 4738c934bbf2a86aa62d752a130d13c524a47696 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 20 May 2022 20:18:07 -0600
+Subject: [PATCH] Fix build on uclibc without locale support
+
+When uclibc is build with !UCLIBC_HAS_LOCALE the macro
+__LOCALE_C_ONLY will be set, use this to disable unsupported and
+not required(due to only supporting the C locale) locale functions.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+4738c934bbf2a86aa62d752a130d13c524a47696]
+---
+ spa/include/spa/utils/string.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/utils/string.h
+index 43d19616c..edf4e954f 100644
+--- a/spa/include/spa/utils/string.h
++++ b/spa/include/spa/utils/string.h
+@@ -275,14 +275,20 @@ static inline int spa_scnprintf(char *buffer, size_t size, const char *format, .
+  */
+ static inline float spa_strtof(const char *str, char **endptr)
+ {
++#ifndef __LOCALE_C_ONLY
+ 	static locale_t locale = NULL;
+ 	locale_t prev;
++#endif
+ 	float v;
++#ifndef __LOCALE_C_ONLY
+ 	if (SPA_UNLIKELY(locale == NULL))
+ 		locale = newlocale(LC_ALL_MASK, "C", NULL);
+ 	prev = uselocale(locale);
++#endif
+ 	v = strtof(str, endptr);
++#ifndef __LOCALE_C_ONLY
+ 	uselocale(prev);
++#endif
+ 	return v;
+ }
+ 
+@@ -319,14 +325,20 @@ static inline bool spa_atof(const char *str, float *val)
+  */
+ static inline double spa_strtod(const char *str, char **endptr)
+ {
++#ifndef __LOCALE_C_ONLY
+ 	static locale_t locale = NULL;
+ 	locale_t prev;
++#endif
+ 	double v;
++#ifndef __LOCALE_C_ONLY
+ 	if (SPA_UNLIKELY(locale == NULL))
+ 		locale = newlocale(LC_ALL_MASK, "C", NULL);
+ 	prev = uselocale(locale);
++#endif
+ 	v = strtod(str, endptr);
++#ifndef __LOCALE_C_ONLY
+ 	uselocale(prev);
++#endif
+ 	return v;
+ }
+ 
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
