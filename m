Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58B8606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JpssYzEW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A913E4047E;
	Sat, 24 Oct 2026 19:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JCeaP0yK09T; Sat, 24 Oct 2026 19:03:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AD5AB404C8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792868628;
	b=CfsYw8rxT4lJ1pL3U38lwhdwSwLP4UkcfddkwDVlK9eK/eSiXow/ivQo56RvRHOyZnDc
	 XuE9mKPgYqhiSwAiUcYWvXNJ+nZ4EkIe0jheUanI6y3xZyY1rHQ+t9zFWfOPEnyTNYsXk
	 03plxk9zF4YaI4J2fQif45Wz6l8Q540Bvz0gaHkcDXG0K4vGc5yYb5ROAcjKFLBJpqh1T
	 ybqWIUhOjP0A1FWJki/QII93XAIuHysGYsX7FMhKBM7WMjXMFTQP7XPnMC+iGQ/2N1ZrA
	 yaAEkRLKd+QJdwKmFTP3MiebKsJcLkaOkyhe09h04SK2bxLWEgiAJhbu8vrTjUkE45A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792868628;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Q4dZ5TAZlNmupV2HzixnzqC5HDHuzZ/DUfYtIE/vTEg=;
	b=Z3HtNthRIgfgpyT42qP0wb03+a34pKO6aXO+tOs1lWz/sWN6T2kyI9otHEn9RAg7NgmF
	 T4gCzN+wUomY60Xw0iZfYe5pFaMKExB1ENjBmEyGTJcKYe4FDakvIkUDq8GvqgItJp/06
	 6vvbR/cNh70QJt5LOfhN0WbWOwwNoERIR5MAn3x81tB+MZ0mBaiw/g/N7JByZ4yVGLk/l
	 eieoy7w8PkDgmtLHxKN1Q66ZD026Y+MwU1faoQIU4TAS8MQyOzamYFXyC24vrHcSf7xDz
	 DtH4Vs73GyJIY6AqI0/ZFuvsbu/dPUS2nwBHsbyqrJfU1cDfZxekBK36vCN9UbX7ZvQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=devoogdt.com;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792868628;
	bh=Q4dZ5TAZlNmupV2HzixnzqC5HDHuzZ/DUfYtIE/vTEg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JpssYzEWatu18PfRVXtqqp97qAhhaRWAZGfuWPvtwbFuULjoOi5nMo7NM7t3p4ag/
	 Hgfm9gb5wvh/gTalNUgdpHOFmuI5o6brqwZsZLLMpKHK8/WGlcD5wmlEB4PdWlHRMM
	 riy5XluaYIXsUX86FLXYaRR6ObSyhvoY7s3jCfNqrXQxBAr1vKk/6wjqALP4EMC+vB
	 o0TnsBvSd89zzGBl3eAqTmqh5h7u1Fe+Dsngm3xwO4clj/kaK1B6XvxMQuxDAweeJ5
	 j2uwbdTcJA87R4qvhhOZOgHHhdnTl3tZa3lxGQvA1z/GSPHIlf4J3r5mhj32aJk/UO
	 gtKVS2XNHvthw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD5AB404C8;
	Sat, 24 Oct 2026 19:03:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5A763D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C36124043A
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_0bcP069v1w for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:03:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A0146403FF
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792868626;
 b=OfOuQ/pPMk/QX80D20mJam+SFMCtRI1kVW8RZzOHjg5bCbVywYW9tX+yEvPPGzan2K6I
 jrzvbhxF2M7BieLyVk/myd0uKx8t8aDj23t9VFLqkb+a4Zz3/Fa928sOVSthXc+u8Pvw6
 5HSnDu2zceUYPJJnFqNVZchst6RPlyuVFdPAOcfhPIkm+LEyNeEHIOc/jHLcn4H4K9e7Z
 ptoMFAdkJARoWfevVN85+fscxuT7kls8pJk5EqR+PO+y7E4zTomGBBm4cf0hZ6x6o+Jnv
 DUS4tQoOZelmCVt4td7+AFjx86Wh2OzEeEJqNux6RFED8kRBbJZMYF6HOl4VW8PpD3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792868626;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=uZZXCTO+/WQ/kAuOzw++IFgh3s+9koJT/6w4vbO5gII=;
 b=SyQ5m3bBvMtnSCItp6wvFWSc/UhmdiY4mpJQ6FfMxLvaCQFNAHx1I0qXkKhzHd+4wOR+
 ta+uWOCHfHv7oAUpP/BLW/VNQsV7FYUuyAzfMh+mnAQ+NHQDQe8C722IHVdC9rM9pMVti
 UWDl59/JeQXp2+k7ILRiaMf+Zhgb+E2fdkAs5m1c9PnZuWp+JxYyXCQ5jzR3x8ZPDAXH+
 p3bVl9HEMRd/GZKGkrBO8M7vIvyc6KUcFeu5NRpigoYWsNRTscfd6hT57ZBuI2Q1ockxc
 z6uxj2hmgz2uOTpPRh5opoOImhVqxybvGEQNG7y8yW64mVwg6DwvRNlPay3AsxhJeog==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 arc=none smtp.remote-ip=209.85.128.45
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.45;
 helo=mail-wm1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0146403FF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:03:45 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so733045e9.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792868623; x=1793473423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uZZXCTO+/WQ/kAuOzw++IFgh3s+9koJT/6w4vbO5gII=;
 b=RVAIimAqusqBWCPJCEiW2s4NfHS4RIiPP1lKR5pJFaMSczDdfaKW8tQ90RFmAxEcoC
 pgjd6jg8PBoaN9yrvDN/j2cTWL8Ve2jcib0L4EGeGbeYNje6c42HCAMWwxooveX1JguL
 rpKAeeMJRWOWjt7pC0bQ2ULa6eX0jCQGDhFT33OPPl+q/KARYYHx4WUmMLZLx6uzx/kn
 Kaw1YpF9NbiEI0OXF07AvuHohEMypQc8X/3ruSO/JAU6su5NXlwHAzTH9BT8N4/ImIs6
 kSq6YlIOFrs1GFfPPc2VNcZrGKaHxkxwMp1d7WsfxXVS36siO2Z/y/ZaS4m6jcrqp8xl
 xhJw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwfsb/iy5Ghii9hPLq1ds2z4t/n9ridPTG3NC2OnOkfwA0zEuXKFGR/RcUXHJgKt6ay3mZG+Xa4lQc=@buildroot.org
X-Gm-Message-State: AFq9FYITu6XzI67q+4pBzseB6xxbW3rOi1ajQMTqxUU7MyD4qPlXJft1
 AbqK9mISRa/fHGp7mxEWPSvBtv3B8IcoAwRE/HdG/G+s6znhz6UqAmgy
X-Gm-Gg: AYBFou0E2obxjOrTy21KymIGg3T1YqgnakUwIv+OYHvVq2GNoAm3csR8E+RjuyFXn+t
 T/TLKH7jrzwAzu8YfEUUzxxc6B6liNlyqPkSqVmtlL6JfbxYmZ2X3r1lZRicqyyPaImCwZW3tmc
 mCCBgzvi5tj4YqcNRa640ABKqdf2UdLLrrv1A/Dd8Hi17mb2hLfvDDvhLLDnyoJMiYNUwzgZAuR
 5bP0/pnj+Nvgka8ga4hQLqBti+NOIChAaBMeImXwGoFRe+m6oevhJL81UJ3xGj8nneMkRgLidGL
 0cj/yDfeaSpp3njOUuDDdV4EER0ftf7W6T0lPb8CJhillxLN4RsmzZwERBkJvZ3hSuSj3pmbEdn
 go2lzFwPNDtAkvbFsQxTT8WCSf/2GIZmKrTNCr5hGF17BruUUv5XzG0ChaZdNrlZkAxoP1L430X
 kYwr48QqWTecoTgAUoSjHDaL0PJs30MsT9YuEg2ZmHsMh4TyirBrlNpU4VcE9liIU184vOJ43Oc
 1nBuis2iDvzg+5uIIE3udS5Z7up2rEcckgtDK2e04U1ZNhmuo4jF7hU4PsATeVOR3mi1hq5tg8D
 zvwMV9vHKBqwnJJDSsD1T0MSks0HmJdypxeANl8iRNaDranIbVk0NueyNOZpyrZgSNkkMjnOKUc
 +ADJR8432GsUlpw==
X-Received: by 2002:a05:600c:c173:b0:4a2:883:4adb with SMTP id
 5b1f17b1804b1-4a35ac9ea4amr37515545e9.22.1792868622977; 
 Sat, 24 Oct 2026 12:03:42 -0700 (PDT)
Received: from KORLIN44614.barco.com ([2a02:a03f:eb5f:fa00:a625:9f0:b064:c303])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4a35a00e1b0sm57069445e9.3.2026.10.24.12.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 12:03:41 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: a.mestdagh3@gmail.com, aaron.mestdagh@barco.com, buildroot@buildroot.org,
 thomas.petazzoni@bootlin.com
Date: Sat, 24 Oct 2026 21:03:38 +0200
Message-ID: <20261024190338.329172-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACXRmJgcK7muMCy4CDejE8ZiZ3z==C5j9oP0doqcLQK=J53xDw@mail.gmail.com>
References: <CACXRmJgcK7muMCy4CDejE8ZiZ3z==C5j9oP0doqcLQK=J53xDw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/fluent-bit: bump fluent-bit to 5.1.2
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

From: Aaron Mestdagh <aaron.mestdagh@barco.com>

Upgrade from 4.2.0 to 5.1.2, bringing multi-worker network ingestion
and improved OpenTelemetry processing.

The 5.x releases also add Google Cloud Storage output, Windows Event
Tracing input, NVIDIA GPU metrics, and new metrics processors, alongside
FIPS, TLS, and proxy improvements.

Signed-off-by: Aaron Mestdagh <aaron.mestdagh@barco.com>
Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2:
 - Fixed author name: Aaron --> Aaron Mestdagh
 - Fixed patch index: [PATCH 4/4] package/fluent-bit: bump fluent-bit to 5.1.2 --> [PATCH v2]
   The old patch was on top of the "[v1,1/3] package/librdkafka: add new package" series.
   https://patchwork.buildroot.org/project/buildroot/list/?series=88&state=%2A&archive=both
 - Refreshed the merged 0001-lib-ripser-initialize-temporary-diameter-entry patch
 - Used msgpack-c 7.0.2 & librdkafka 2.16.0 to test, all `./utils/test-pkg -p fluent-bit -a` passed.
---
 ...-initialize-temporary-diameter-entry.patch | 31 +++++++++++++++++++
 package/fluent-bit/fluent-bit.hash            |  2 +-
 package/fluent-bit/fluent-bit.mk              |  2 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch

diff --git a/package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch b/package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch
new file mode 100644
index 00000000000..a7213b8de14
--- /dev/null
+++ b/package/fluent-bit/0001-lib-ripser-initialize-temporary-diameter-entry.patch
@@ -0,0 +1,31 @@
+From 83086bf5092d76c2fffbcd7f0cb671083bf0a3c3 Mon Sep 17 00:00:00 2001
+From: Aaron Mestdagh <aaron.mestdagh@barco.com>
+Date: Thu, 8 Oct 2026 11:52:22 +0200
+Subject: [PATCH] lib: ripser: initialize temporary diameter entry
+
+GCC 6 does not accept implicit default construction of diameter_entry_t.
+The temporary is assigned before use, so initialize it with Ripser's existing
+invalid-index sentinel.
+
+Upstream: https://github.com/fluent/fluent-bit/pull/12533
+Signed-off-by: Aaron Mestdagh <aaron.mestdagh@barco.com>
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/ripser-1.2.1/ripser.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/ripser-1.2.1/ripser.cpp b/lib/ripser-1.2.1/ripser.cpp
+index 6bddf7271..b9ccc89d6 100644
+--- a/lib/ripser-1.2.1/ripser.cpp
++++ b/lib/ripser-1.2.1/ripser.cpp
+@@ -183,6 +183,7 @@ value_t get_diameter(const index_diameter_t& i) { return i.second; }
+ 
+ struct diameter_entry_t : std::pair<value_t, entry_t> {
+ 	using std::pair<value_t, entry_t>::pair;
++	diameter_entry_t() : std::pair<value_t, entry_t>() {}
+ 	diameter_entry_t(value_t _diameter, index_t _index, coefficient_t _coefficient)
+ 	    : diameter_entry_t(_diameter, make_entry(_index, _coefficient)) {}
+ 	diameter_entry_t(const diameter_index_t& _diameter_index, coefficient_t _coefficient)
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index be02761ed53..7fb94d60b25 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  44fe0f52e89a63b213695748f99691d0a6247a4bd05065f1b517c798d9f89bcc  fluent-bit-4.2.0.tar.gz
+sha256  1971d86c7dc0f3e6b906890297635d6a3a84e5e7ad64d36521b74da202fda62f  fluent-bit-5.1.2.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index a3a44b8dbe7..b53da90706f 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 4.2.0
+FLUENT_BIT_VERSION = 5.1.2
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
