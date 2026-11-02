Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D6606A326
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gs3j+CT0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J11AYKkE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDB5480DB2;
	Mon,  2 Nov 2026 08:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyiIVW0m6ZSu; Mon,  2 Nov 2026 08:54:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EF83A80DCA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793609673;
	b=DDsnrFj9AQuCwzwZiCF8rDEFw898l6QY5GpX4EVOu0MuQsygNUzaWl6AyXQZHNpX6UwG
	 XJuze2M5m4E9l7fIee8y1U9txvLV7roC3kvFxiTDAsB1kjabLR9BatKvOpIFJzxwsK1s5
	 FeyEvSIovUi/NrCTSZ3wQ6igrYF4AgLzyaf9jrsUKsrz15Mcey2++n7+pSe8nRjqtxBWS
	 GsmxEl5VZcNOmkz+49c9oRhkwj0aal0s5u+aEtX76RU8OquDYVFkRmqd5CC3pJaLCyOZN
	 uKJNhXEpi3UljWQJzYY2DoxCmt+Tpol3vLE86kSp1/q5zfgAN2uG4hyZ63VwibnRK6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793609673;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=elbz2xtUOO0ZkF4XQv4SKeLnMq3vZ4VIh5vKcE5RGoE=;
	b=bs/+VCU7JADowo749knW2UU28ttl9Zh4xKt9UA5NGtdUF0p3FPspdoDOihFbnB2DF6sC
	 IcM6diY7wWW4qk6vx1qiKpjX3ChwU+mGgbeBWXpSQwxlCRSYr81W/uhOr8uou95GjCPVX
	 hNNhZJoDeusXWjXBvn2/VZI5knc4ormyS36ExTasmUTC/EfP6kZqxTBQ5icJo+/eDcB9n
	 ni3vS4cE0CvExQGaeUMne7qx5ARTSGSKCDKSkVI50AJ9Bnldd9mZudd+dmuTlXsuluyij
	 g/9z6l/N6bwt936AhOoBq82dppAn9p9HswIff1kzNkBFCt7E3wojBkW/i3ufxhZpqqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793609673;
	bh=elbz2xtUOO0ZkF4XQv4SKeLnMq3vZ4VIh5vKcE5RGoE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gs3j+CT0Yoi7wrUa7UGpm00PZJqxqigkyK6K4YuANTsMrKYfpGZ45lHGcdq4a8Ykt
	 uKYcD2QfIHMr8f4m38WNCjtknJXQmX81n/zs8/JzyNJ7npM6XBc13fq4Fvt3fNu4p6
	 iXZQARKigCOK+mKTbrBtzJcZKuJgETz3bJbxe1OMn9u2EgQES+Ec1cefjHAynTkXtg
	 nky9qdGDci2m3URZd/QRZhHgVZLUz0KtkCbmE4xfg2nu5xA7C7BEQAkQV3K5IdUYTX
	 g6ljq+3Y3Rber2MVWVO80YSNV1pp6mBliNgHXqshF2ixCazPpzp+bk6tZujuAivz93
	 7CcOIwxM39mng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF83A80DCA;
	Mon,  2 Nov 2026 08:54:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EEF8356
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70EE2400C8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCOLsgOa9-oJ for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 08:54:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4BBAC400A8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793609670;
 b=Gc49tZCglamPWmiq92ubAYWLJGgU2RgN4Iuvnu4spa9um28BsC1F/ulPcA82CtXv0CMs
 pOXpaXcttoiwyJTN/JraObu5myBj/kL3nsI4qifZgSvp201ckVvebO18gjk7u2OOXGJw6
 HGB92bvtoUeyZYUIxlyRNg904zxUoV4acKCjMK7EMDSgmtus+uDs+6I9agrZBLyX2xIv3
 wZmEk+7n8/ROSHHxDUuggBxL06G4YcG0Gsh1hFTkDPepu0DYaYIo/GoE39yYIO4xG/cuG
 UFQx+ef328MWoWGnY7c5uT8i8pgvVcoGqbC7yYni3tX3Y+MlBG/g2saat7RIHwWLd1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793609670;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=WxdUJbXLeIb9LeSZt8TnTQQthvXjicoFxJLqxNfVOJQ=;
 b=LC7B374d55Cj5CgwS+XzvzGLmsZxhbScGa9QMafDgOwUjDxK/N/cFnuNFN2zyCcSV7rK
 p+6nlCf0se+EgpU+GNx9UKVBtEbFkYYbEuVBYfENktQ0xL7T4lTzv9/fq20es9zIlmJpR
 MIgD7RhCtXR6qZLJR1vp6hi+YLD+b85jWCsSBaYhy9+nI+7goyg1dtErzQoT6ruJxB7OV
 v6rV46nOjHbfM657Q2rYB/CZdenVr4VnLGQOagztMarthUe2BB2v1iwXsyLCfTp3+wXVO
 1wemMWZVUkf9xSBMksTJeZuuVg40doqiFsG/cDtfHBUOsi6mJz4ul5+YRBJemgHidCw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=J11AYKkE; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=J11AYKkE
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BBAC400A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:54:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1451835f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 00:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793609668; x=1794214468; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WxdUJbXLeIb9LeSZt8TnTQQthvXjicoFxJLqxNfVOJQ=;
 b=J11AYKkE5shN5O003VI8Wg8VHV67JNxYSSggomQiro6E9m8x1QOpd2WgkVmWGxBiLY
 p8oXALMRQNwvdnVp/NfPduTkU+Mlq2Rp5rh1tW9eXWTqmrVXGiyYygEornQOUUgcgiuQ
 CWdZbZ/UGHnOghvEw6q8TKKzU1Ug0Ue1eqyfOaExKExUl9LMzxp23yXbc+lcMeiFBKFz
 B08NT0zmJqSw1pQHd1n19UwLqQ5vjDHox0PDNquKZfn9xJGdaaO4lUnnwmchRs4J/3kA
 m5U8hIIfBJ25efGnyLGI1GAfFLX4Z2N4Q0SaftFUPfwOIHiOUMboIOyqlispGz+4yb+M
 Q68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793609668; x=1794214468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WxdUJbXLeIb9LeSZt8TnTQQthvXjicoFxJLqxNfVOJQ=;
 b=D0N2KRhZQgzxp/RSVEZsiPPl/oXr3nI2ZSIS0qGBHm3oOWMVvWRCv2BcX1AKsIZBvj
 yLY+3UyJGg7WmK3P7Q6YMuba2bF2ispUNyjD1rdQIg58uz2oX4DnfvFYu2TNdGaeI+6u
 xk96nQfOa47sC9wr+1UApd5YVP1lq1JU60ap7EQ+FcmqPTIdoZXTaWvPYL917fe4wfLd
 fgECz4eGjsDQ3uGD9WtqFNBQ/vDsl+bXfnhS3kRQAgPBPFVMQmtkK+f+UuxWOVMzM4oS
 cUVv3yxaTilGviKx5/iyeAI9wbVla7NBHscaSos3uplx4dTFttlaWvKDtOi1Z6ntyiCa
 TaFQ==
X-Gm-Message-State: APuU4Z/YxKsYLrNpNRVo/3c6PzAqavf3U5BcWMpTbVw4SUPz9b1fUqrM
 7sy709KHMe0wh2nES2LEysTPPpy7wjuEkroNJvDFOWsCWEV8eM2uPTie7WUoAQ==
X-Gm-Gg: AYBFou2ogeGjJbXtgv7t1xktLAjlNBb5BHX29H6LerC0Bhh3AhDgtfL4htuAuLCK6nw
 igC8dHRoD0LMLj1m+o3hY5PjtR/qWtBFxmpRbpUj+GJAyAbtUX1lAAZBv/eedKFIsGB/IxBqeWy
 ijLMRsdNEfTiL+k/MgA9eCuzGyLf3I5VAEyjejem1s4ph1fwp52gLiFhFgDsv50kYynMamQ6dpt
 OwcUjyifuYzSZNNnphRyrupCXGI/3WOXalXcdLnaPtaGlbtLv17P8VbI5AyJFscjmHLuma04NeW
 N4pOAvA2gGOGNFUpqPPL1CSH50aPLb1L9pFD9i3r9dClGzHPk18i7baXV21ucGJgUyzoZp5a+AZ
 qtxr5juDbtut7MfBduLh0xKFXS0I0IFhRpvnJUFTxaSN24Nwg9MBN3lobjxgrCujWDTTsWbbsAp
 z2KR0mQ8PvHAIAYNvHta0C5F43JvrIydrXfUfpB5PV89MwdXVORe4TrgQTOaNneYIOWVurfYi4b
 PqBf6rHmMx5OG5Df8lXjbgUNyIQD5r/PiUr5hmMPJk5yCz4NwaRzo7mIDrh7mpwSu2aIHMdce94
 /pwyGrgW7ywqtqdKIIxFGYhc3MWR/JKZYdFGfNOxwP6TgK60YlV8AA==
X-Received: by 2002:a05:6000:184b:b0:48d:deaa:4dbb with SMTP id
 ffacd0b85a97d-48e6e2fc210mr20921485f8f.40.1793609667664; 
 Mon, 02 Nov 2026 00:54:27 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba53d7sm24041304f8f.53.2026.11.02.00.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 00:54:26 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 09:54:23 +0100
Message-Id: <20261102085425.2117520-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
References: <20261030152434.3738285-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] Bump sysdig to version 0.41.4
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series bumps sysdig to version 0.41.4 and falcosecurity-libs to
version 0.21.0, which now only support 64-bit architectures and can be
built with both glibc and musl.

The patches not merged upstream yet have been submitted:
- https://github.com/falcosecurity/libs/pull/3153
- https://github.com/draios/sysdig/pull/2190
- https://github.com/draios/sysdig/pull/2191

Changes v1 -> v2:
  - drop the legacy support (falcosecurity-libs and sysdig as virtual
    packages, with the 0.10.5/0.31.5 providers for 32-bit
    architectures) [Thomas]
  - uthash, the webrtc-audio-processing musl fix and the libabseil-cpp
    musl support are merged, so they are dropped from the series
  - fix the kernel module build on riscv64 [Thomas]
  - move the lua dependency change to the sysdig bump [Thomas]
  - sysdig needs luajit or lua >= 5.3, lua 5.1 lacks luaL_setfuncs()

Build tested:
- aarch64 glibc, Linux 7.3
- riscv64 musl, Linux 6.18, lua 5.4
and run with qemu-user (sysdig --version, sysdig -cl).

Angelo Compagnucci (2):
  package/falcosecurity-libs: bump to version 0.21.0
  package/sysdig: bump to version 0.41.4

 .checkpackageignore                           |  1 -
 ...cmake-Permit-setting-GRPC_CPP_PLUGIN.patch | 34 -------
 ...-pass-ARCH-and-CROSS_COMPILE-to-the-.patch | 38 +++++++
 ...ver-replace-removed-task_euid-helper.patch | 33 +++++++
 ...gure-pass-a-user-pointer-to-access_o.patch | 43 ++++++++
 package/falcosecurity-libs/Config.in          | 39 ++++----
 .../falcosecurity-libs.hash                   |  4 +-
 .../falcosecurity-libs/falcosecurity-libs.mk  | 98 +++++++++----------
 ...llow-to-disable-the-container-plugin.patch | 37 +++++++
 ...-only-include-zlib-with-the-bundled-.patch | 43 ++++++++
 package/sysdig/Config.in                      | 28 +++---
 package/sysdig/sysdig.hash                    |  2 +-
 package/sysdig/sysdig.mk                      | 32 +++---
 13 files changed, 293 insertions(+), 139 deletions(-)
 delete mode 100644 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch
 create mode 100644 package/falcosecurity-libs/0001-driver-configure-pass-ARCH-and-CROSS_COMPILE-to-the-.patch
 create mode 100644 package/falcosecurity-libs/0002-fix-driver-replace-removed-task_euid-helper.patch
 create mode 100644 package/falcosecurity-libs/0003-fix-driver-configure-pass-a-user-pointer-to-access_o.patch
 create mode 100644 package/sysdig/0001-CMakeLists.txt-allow-to-disable-the-container-plugin.patch
 create mode 100644 package/sysdig/0002-userspace-sysdig-only-include-zlib-with-the-bundled-.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
