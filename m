Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D205DC88E65
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 10:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D95540604;
	Mon, 14 Sep 2026 10:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdkseOSl_G-O; Mon, 14 Sep 2026 10:30:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7706440611
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789381832;
	b=QuJhMPalKNqWTBiz9P2r3GAivl4ADKkHNtnaTYTDiWElK1iX+p5MIykdAWgjmUYcJvSJ
	 xztU9cp4gch5cdC7/96PWzjs5Av5uTPzNUFOHAUQwUpx+3ZwE7n65iSDH2TfRirKt39lZ
	 sOJ8kUrbXS/dlrm63ZfB6wvh963euPXWQ/xQEFOOdSyvEFhbp7Aq7uJmJuSpU29dV1MKR
	 S6HgujpeTbcoZUDRgyUtLAFd5iEy565M9oW/iTRedXGskHAw/r2IsZB65HP+4JPZwAWUp
	 E1bnLwmvQDQ2rQrWUXfoGxnQmxrwFhyPppFs1UnffPJtqiUA4McGypiFe8TFlDgzjxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789381832;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7tywBCtntAA3OVROiSzbp9iN8gbc4B3KK9gbNkpcHJU=;
	b=UbdKyQVejxgulzXwopUixqmZqhEQNcMm+baWdBuqcC4KCcqeohsQltdNqB5zi/bTpF3l
	 gPY2aUV2bJmGy2nJNYY7Ga59D2jUO2FdUukkzgLNHfZi5bihZe7SsP4n6Ma9LQV73r++M
	 qLX7UDG8jPJHWq6ZdFJxN3joil2MFnH9lT94agRl6KVwWpxmnDi3bf2dFk53ayr+GTOkq
	 tMRZ3sEkFg9XpsjxAjcpEcAz5D6IJIuXtBjhYnmr1WArY8mjc16RkkJd1cYQrakpeuz9I
	 M421SdY5vU49TOU7OmingAKpO1dc7xN5yct7Wz9kRxyPEtVASXGGpy8BmxifSZtztIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789381832;
	bh=7tywBCtntAA3OVROiSzbp9iN8gbc4B3KK9gbNkpcHJU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J+yb2HssHseS1NmY/SybtVtvGU4uUEqDO6zuAqxIojCi8bB7LnYzz1q3e/576WcY0
	 kZEywShK/PzGELKQqiapz6Xk2U9dK7+EwXLB/TRp/1Y8B4VAnramG9BgZBkNzWThEp
	 Q0Ys0z6Pj1DSfDT7a2AGl5SsKtyAO5t6bzaWQMsfnvuztKdcUfnWacj+q13NEu4Yxe
	 BaKcgo7qDZZcjiZw7jCG+ghH2Nm+dBdLNMLrmutDx3gLdkmIAr7II7nEQPfqSf5ORp
	 X8Z6kl4JgC+k5Ud3Ona+48pEa/2gS1gMPnhDpUzTO1xPken+RuYGwgerQRYPvdrZZi
	 CH3nKLFVMmgOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7706440611;
	Mon, 14 Sep 2026 10:30:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F37A7224
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 10:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D975660689
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 10:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsMwE2JEw0gt for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 10:30:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A6F086067F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789381830;
 b=LdymnQTiSYyAhy9yGDoasvHCc2C1oMIlFGDs2O7IQakAiYISPnaZpuwg2ziP4NTy472y
 QX+GoaKbx0y9uf3eow8ePvMiYinefHOMRcndhp8vG9DtDMT+nUmcgc/TIwFRAbcQL/u0j
 eBKW3m/uFnkLUe6CnM37U59Ugl+VXPWed93VW3hDjTRfLIMUdM3zVZLNuni0ZC9Ym5oPT
 xkhZm1gapNtVAowFiZqijV/R1wd69OH8OYRknVFoFom426/0/oUPICqKw1lPrv2O/Ag+G
 mDrQPq1K8jDV2gcok7U6F2xn3aCdKm7cGDThwg8lph8eMKJwvZxKKxkiiozc0S4EZQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789381830;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Organization:
 Content-Transfer-Encoding;
 bh=hoeNREkWuQ0VNnZY9JpjSQ+gKdxiFxu8E9h8m0a3P/c=;
 b=Ot9k61QC8IjEue2W/p8MLylCYTTrIaJUZ+tskB2XtMCI8Z2FR41nM+mCLcpTx4MgRtSL
 cWn9ofeDmoB68qavYQHGDAUTklKWIQwpz5s/QQheJvprJ8IHTBUnJnDUfw6M6Ht7q7Pm1
 0fVFF2M9PfZD1rjq655IozIe+CUuRGdP1nAR8VxtmdaE1CITJs0+3sU826SJeLtXADqL+
 +1i86cb3Rp/w8VAiC0TYvmMU1QQ1cht1dj3+sPmHh+qO5K9mUXzQNmDn4X1cQu8RplbhX
 PXlgcGC2xKyhhjpihRDlM0uh618Xn5LyiyI6nk4pXSK+r8EqW1AT6C8g1/KB+fgCPgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BFt4muOT; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BFt4muOT
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6F086067F
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 10:30:29 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f9f0b20so386131966b.3
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789381827; x=1789986627; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hoeNREkWuQ0VNnZY9JpjSQ+gKdxiFxu8E9h8m0a3P/c=;
 b=BFt4muOTiaLqwhfNVqNhUIINdmhbpOtWuBVTFqzXBcVrMLJZyShjxxl3UG81eu9L6L
 xHhb187BVJqycHcuJ5yH/2guO2j6WOA6B7BEA7dUBfJCaGraJ98VeBEhH9iQWckqLstu
 sTKJCGzXgp7+oBWL7uTuDT4MU3DWVXLPUaViRzzr9PFT8hYx1LwhmxCMHjGcTjhpsodk
 XQg0hmvBtKr1nQSzQAWkK2bir48Wl/8RqLGoRl5Efao/h9E357+AbH06EKap10/oOzgk
 hMLpNubZDE4yZ8yMFuRJbi5o6uUAXS2DsDLxaV/vjwoGfrBMK+V7P5YTdW+7dU8nX0qZ
 pshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789381827; x=1789986627;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hoeNREkWuQ0VNnZY9JpjSQ+gKdxiFxu8E9h8m0a3P/c=;
 b=lXik6q2d8LuwRXia7iHLUH5yBoHKWduLncQvvPcryRpYupM0ts/W/S+O4wj7bVhMZ/
 TsaWdMHJr13tsBQjouAuJJzF9YWR+BjS5kMrnBgAVMiDUiAUlSiFnElKisAPGQnok+L/
 CHAye1KgWKPC4NBi3gWwlA6NsbqRYBvVCaT5/BMtYaxBsf0GJHWs5/hpyq9mvc47SEh/
 cJfk5/ANnzYywzG+qci/gxn4nvmHT23nezkrQe8PsKK3YZOapq6RdIhUBKCGgmuhq31b
 8lIhKes5JmYQp7R4mC5OAoYuvAUatKQRIyXzWBdE+TL2I/K3O2H4vhNtsH+QN/J/1p2U
 FwKQ==
X-Gm-Message-State: AFuF++lQmf/+9SbHQfZOdAqR4+aUKh38vqiU9SrzkFhXZazlzAZPwbmy
 8d+h5A0AmmX9tRQeO/OtfMqKZemqwRCd00djXqxf9kf0g+970TrNVEjpfvArYA==
X-Gm-Gg: AYBFou1crZIhEwIZ37VdCRbGOyI+/7S5tLltBtfkWNNSZ/nQ1oYzgbTD14FRLRgbn05
 XZ6LHGKKw/I7BesUXJvGF0hRJt7R08Y30V2Ex6nmOhkBJCZkEbZJ6Jq1cYw8MNz2HvZwmA2+A7y
 lQzLgx1MZs3YVyZDSCYkCAdODE15+IGbLG54ep9aWPXu0srzw3TOrJD9MSXM2lOELptn5TkI8UW
 zKmIoRrw/hg9xrb+fxbOpCCTmXr4yiM1g/hVKUUGXXDXRb2UuX6SuXMs91OaGvp3Wj6EJISjfCP
 eeX5V1y+HhkOaF/fXj5rknVUuqWtbH2qT/DF5IgQFRw37M/vqBXPPt7DnmEyqWInJ/GE+1zvLUC
 3wwMhsFPT5qhlUs7FPP1KxHIx1BWHN6LoxX1twN060Maz8MOCdqXAf17wFkdtGMj7WRQ1RCPEJK
 i/EzA+r6HCHq9NWosRTi53xd/nG/oOP6X2yyDnc442BYMgpBVaU+1k/8YQrM44//aaXkjhayVf7
 U5uy6JuS2dNSKyYTkdvQr8OtW8l6CGGI9qQRA==
X-Received: by 2002:a17:907:97cd:b0:c29:462b:f917 with SMTP id
 a640c23a62f3a-c29b86f3b5emr235957766b.14.1789381827055; 
 Mon, 14 Sep 2026 03:30:27 -0700 (PDT)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966021ae8sm401380666b.22.2026.09.14.03.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 03:30:26 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 14 Sep 2026 12:30:20 +0200
Message-ID: <20260914103020.3485030-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/1] package/mrouted: bump to version 4.7
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

Multiple changes upstream, for the full list of changes, see the release
notes: https://github.com/troglobit/mrouted/releases/tag/4.7

Package changes:

- Drop local backported patch, merged in 4.7
- Fix invalid daemon path in S41mrouted
- Drop executable flag from S41mrouted

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/0001-gcc15.patch | 33 --------------------------------
 package/mrouted/S41mrouted       |  2 +-
 package/mrouted/mrouted.hash     |  4 ++--
 package/mrouted/mrouted.mk       |  4 ++--
 4 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 package/mrouted/0001-gcc15.patch
 mode change 100755 => 100644 package/mrouted/S41mrouted

diff --git a/package/mrouted/0001-gcc15.patch b/package/mrouted/0001-gcc15.patch
deleted file mode 100644
index 781f83f5c7..0000000000
--- a/package/mrouted/0001-gcc15.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From cdb388c8dc6e661d2a23f1e9b79102bc68e89af5 Mon Sep 17 00:00:00 2001
-From: Philippe Troin <phil+github-commits@fifi.org>
-Date: Wed, 23 Apr 2025 16:04:20 -0700
-Subject: [PATCH] C23 compatibility.
-
-bool is a keyword in C23.
-
-Upstream: https://github.com/troglobit/mrouted/pull/65
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/kern.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/kern.c b/src/kern.c
-index 27f8dd4..04f1c36 100644
---- a/src/kern.c
-+++ b/src/kern.c
-@@ -104,11 +104,11 @@ void k_set_rcvbuf(int bufsize, int minsize)
-  * in the kernel and "panic". The kernel patch for netinet/ip_raw.c
-  * coming with this distribution fixes it.
-  */
--void k_hdr_include(int bool)
-+void k_hdr_include(int flag)
- {
- #ifdef IP_HDRINCL
--    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &bool, sizeof(bool)) < 0)
--        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", bool);
-+    if (setsockopt(igmp_socket, IPPROTO_IP, IP_HDRINCL, &flag, sizeof(flag)) < 0)
-+        logit(LOG_ERR, errno, "Failed setting socket IP_HDRINCL %u", flag);
- #endif
- }
- 
diff --git a/package/mrouted/S41mrouted b/package/mrouted/S41mrouted
old mode 100755
new mode 100644
index 7dca258255..d653425719
--- a/package/mrouted/S41mrouted
+++ b/package/mrouted/S41mrouted
@@ -11,7 +11,7 @@ MROUTED_ARGS="-w 30"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $MROUTED_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index aabfd19f33..a38fec413e 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/mrouted/releases/download/4.6/mrouted-4.6.tar.gz.sha256
-sha256  49443c47b5b28a5ab65d796f3495d72a94c1c95e54333cb11fe04075006b576b  mrouted-4.6.tar.gz
+# Upstream sha256 from GitHub
+sha256  24da2782297dad2727c7b467ce232837f3e71a8a42d15e0bd029495da83abc3e  mrouted-4.7.tar.gz
 
 # Locally calculated
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 077afac2b9..e44a0e46b2 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.6
+MROUTED_VERSION = 4.7
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
@@ -13,7 +13,7 @@ MROUTED_LICENSE_FILES = LICENSE
 MROUTED_CPE_ID_VENDOR = troglobit
 
 define MROUTED_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/mrouted/S41mrouted \
+	$(INSTALL) -m 0755 -D package/mrouted/S41mrouted \
 		$(TARGET_DIR)/etc/init.d/S41mrouted
 endef
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
