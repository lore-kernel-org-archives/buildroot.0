Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5C3606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kQVX/a5s
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D5780C81;
	Mon, 23 Nov 2026 09:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87WE8v8udwjG; Mon, 23 Nov 2026 09:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ACD6C80DC5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795427643;
	b=PcSBHTuXAlnlA0avSMHPbk574Nx+xzVQRiUH5L4DaXXPIS5IqOstSGAT+T8jLCd2WmWp
	 myCXO8AC3p5bFYCAWD5g+l+pHfSkqQEp+1ZNLNrmAF/fuRIwyIFlRyoe8DvremKGMT/9I
	 PHZWD2AaxfeLqqy2cLnrN8acQ2ovUDyqw5CsIHQb/1aS9EgogBcU2+XN6gtDyfgtt7QhX
	 3VnnhF2OD3b8dsLKpS2bHnSDw3rd6YeeTqUHPYq1d0QNUssxE4N3eJcaSu3hlQZeDsCBS
	 YBfTsPPOiVpwfz9dAvnq2ijUvX2s1LJVYKvaAcrayfwYWQ5QacO0BugYauiLphj4wDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795427643;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qty6FfYB70cWLyPPJOytWMvXVV0WpxPKBFmwPTLapFU=;
	b=FDp2ImwiUKP12bsNMHTpkinaNfAj9/lOd85OYY0Lv/pvzlQ7xr+nipn2hj6SEdhR7HXd
	 cDtB0y53MLwa1KnkXvRAqooOWGorWnjS0YnNpssz7pbbFVxtHEJSAVEmeHKjF5X1t4poZ
	 geZA1ZSdRlIayrbnPxP/K6BYcC3jzRHYHa/CQrtincuNcn0Fl4dzbBaJ+OieqtuioDSew
	 nworeX76zoJLKIVFJabpQtvUKOfDD9yEgLL0rzfl2ZACkGz8BKpqq30VXgBuP6PMO6KXt
	 8X/CwqJBK3VV+aTtwGPEfv7rSIqZioEM7YNYu1ygIyZ3g9LBR4qHoHwIznjxvKIAq/w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795427643;
	bh=Qty6FfYB70cWLyPPJOytWMvXVV0WpxPKBFmwPTLapFU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kQVX/a5sG+HSHL8EHthLB7DkZAf1XWQcxlEEAEAhxqSppgMfewO43HR/2h2aWXVqa
	 Eoxi+la7/RhQ3eH3el+z2qzZNXvbDvhsfH+XPfws8EqydOGPALCVoLQU9B+oAFuCyh
	 i/BTgK7tY/eHLpV0nCNTDizFgp1OY0c0nKs0rim5hGmTzwh0Llf6zElHlsAXfKVxuk
	 IbSmIw1XiaZUtOaFCPYHo3wLKpEIt/FNiNBCDbdsMOQBN0YR8MIGaOP41bpAZWyiTl
	 OpVhyfqA6T4sXWz8CPMgXJCWngpo3op6A94DNQZhB7hE9p5A0O6UZUFCtPSA/YZi4Y
	 a3Ixnh8XBiQuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACD6C80DC5;
	Mon, 23 Nov 2026 09:54:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7043499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D80AA605E3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JRL0e3iHh-8 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:54:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE628605ED
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=209.85.128.44
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.44;
 helo=mail-wm1-f44.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE628605ED
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:53:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so25902445e9.2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 01:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795427637; x=1796032437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6Ky8u0Z32AtpTtd3QkwMCWVSuNikiv29qRNyu0nhzGs=;
 b=PVr3HwxFFkev10iiMwCjac4OLFBD2up10khbDNqGwLjaA29r7L95/2/KYp0VcuG7JI
 RbyDiqaQjpDhHiDq8wZR2hy91m9VB4HEnRt6PSNaChbGWCaMBj/JcOCCf2BdbU/Uterm
 vdxM7x4MJJsRvZRc+ecZPsdjiJ3b/V/vOO0UkCiv33Lcs4czdX1ycYPRQoaooPgIgPya
 e5kJZ5T7sppVWCuhvWA5Z7q25OVRTbeC4qyj7ym9Fl95WwqoCnWevx+9qnV/AWu4jU11
 2x54k8WnHW/XIL/ZOZFlOQlHRTL5JYzoao88eq7SGoaetTOxshniD4DqtP7amIPeWAS0
 GB2Q==
X-Gm-Message-State: APuU4Z9Ty81mICuYac4wZNmnnPr9Mx3coTIxwwnODXADfmzoa1LU0KZT
 rhPkrcJO0nYHVgz5rGfXQfjOahiS4JwfUSRQwEegL8RY4XaXmOgQh30C+0NllhnZ
X-Gm-Gg: AZFdTZeHZAG1j9NWa4aVNAA6Mte/gR5Itz/vmiMZiBlss7zzGQBG2DtxGMVEC24+mGV
 F9hkNUDoELZIaiOUgTwbqsrtVFOQG4PNWzfToJqB3npNupRcLQ74H7kUk0/51+Q2L4/s9Mp77m1
 aNcfdfy9Ume7LVU3f8Qqwbrba8ZJasys4f3UC2g3R1EYFUysk1RpAcIZmyLOc1cIPjXGecUCmID
 gQVwL6Zxw/dJtEwVBeYuzolPks3VLr7A7ckX97ZrDxEJFhTWarBTHVJDQua2uoqEfx6sg8l8wAW
 CrRJmPeR1tq5ge7PP2q/f/TzeQhYUqYocfVV6764nUGLaqiZ4nJbne0wcdNR57/Xh/gC1WbZ1N7
 NxXLC/5/nQ0d8mwmWbW9nuhfXdoDxGxHUW1+z1jLa54YacQB3sjhNl5mtHwrGH0uMMb6iUALxi2
 TbP66pR0xwIAKDtoheWzPLYMNr1zSx72Oatoyzw62Nm3jNp44Ijjp9p/x08DGP/2XdOfBex9nlL
 mphfmuymmrevaEsMumU8GR78n2ST9SzGtJHxnOrR8BlPSgrOPPkxZSWjTfQMMF6stojqD5455ju
 r/IvpD/0A5//MbSog7lsnaAzPRqo997tixQKHqQ9VKXIT5doPEf/7hVLUy+mw2vSJ90ui5vMwAb
 0LTrRzn7IKFKm/kcLrJTQUHNOsO2ekY6ent+WE+5n9zoD+fTkXcy/ngvQ2xsLgUZnqdLZATaEca
 xv+x1mFG8Piy8Lhh8375oZxFXuJWHT4cM=
X-Received: by 2002:a05:600c:a088:b0:4bb:6473:cde9 with SMTP id
 5b1f17b1804b1-4bb8880f2d8mr189676105e9.6.1795427637372; 
 Mon, 23 Nov 2026 01:53:57 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb9067846esm186202105e9.4.2026.11.23.01.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 01:53:57 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 10:53:31 +0100
Message-ID: <20261123095339.1566394-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123095339.1566394-1-thomas@devoogdt.com>
References: <20261123095339.1566394-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 03/11] package/fluent-bit: bump to version
 5.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Release announcement:
https://fluentbit.io/announcements/v5.2.0/

Drop the Ripser compatibility patch, which is included upstream.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...-initialize-temporary-diameter-entry.patch | 31 -------------------
 package/fluent-bit/fluent-bit.hash            |  2 +-
 package/fluent-bit/fluent-bit.mk              |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch

diff --git a/package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch b/package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch
deleted file mode 100644
index 1514779f550..00000000000
--- a/package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 83086bf5092d76c2fffbcd7f0cb671083bf0a3c3 Mon Sep 17 00:00:00 2001
-From: Aaron Mestdagh <aaron.mestdagh@barco.com>
-Date: Thu, 8 Oct 2026 11:52:22 +0200
-Subject: [PATCH] lib: ripser: initialize temporary diameter entry
-
-GCC 6 does not accept implicit default construction of diameter_entry_t.
-The temporary is assigned before use, so initialize it with Ripser's existing
-invalid-index sentinel.
-
-Upstream: https://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81d28d7c08128fd7ded167
-Signed-off-by: Aaron Mestdagh <aaron.mestdagh@barco.com>
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- lib/ripser-1.2.1/ripser.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/ripser-1.2.1/ripser.cpp b/lib/ripser-1.2.1/ripser.cpp
-index 6bddf7271..b9ccc89d6 100644
---- a/lib/ripser-1.2.1/ripser.cpp
-+++ b/lib/ripser-1.2.1/ripser.cpp
-@@ -183,6 +183,7 @@ value_t get_diameter(const index_diameter_t& i) { return i.second; }
- 
- struct diameter_entry_t : std::pair<value_t, entry_t> {
- 	using std::pair<value_t, entry_t>::pair;
-+	diameter_entry_t() : std::pair<value_t, entry_t>() {}
- 	diameter_entry_t(value_t _diameter, index_t _index, coefficient_t _coefficient)
- 	    : diameter_entry_t(_diameter, make_entry(_index, _coefficient)) {}
- 	diameter_entry_t(const diameter_index_t& _diameter_index, coefficient_t _coefficient)
--- 
-2.43.0
-
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 7fb94d60b25..8ada8782560 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1971d86c7dc0f3e6b906890297635d6a3a84e5e7ad64d36521b74da202fda62f  fluent-bit-5.1.2.tar.gz
+sha256  7f1b92ed09e43c33d8c572bc1643ad0e797f129286468faf85ac56beed6cccad  fluent-bit-5.2.0.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 272cd9385cc..8b87e0b5cfc 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 5.1.2
+FLUENT_BIT_VERSION = 5.2.0
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
