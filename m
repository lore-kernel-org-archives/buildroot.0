Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA54BC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E0D880ADA;
	Sun,  6 Sep 2026 10:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxifxMeYYpRh; Sun,  6 Sep 2026 10:33:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C358D80CFE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788690796;
	b=KzaPQav/3KR943A64HlLMYcFmT26qtAvdkYiPyDuO/X6z60jnVOvhCiwryXDppWUQ2HN
	 qqetVIkgZwIBvxud4/ATc8XtgGooP27fnblHvm2slF8U81Vw+Py7KErpcKbfS7otvLp2e
	 lusj9mWrkU/OXs1BFCeUFOh0+Tuo5ZfxKsF3ljk6Ep4M1RZeFhtl+0iPgFWNikwMAWcEt
	 ArXAqywS7rwPT8fFEy7SZi1VuglQRyOdNFAqdWVBESkvmyLBHqWqzhzcEeDKGpLfbGJMR
	 /q6Aj+jSord6T6T8hNPA8v2cGVpdNfFCuGyhtumxbEuM6IuL0ir6JOljrJ7Wx5FO+2w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788690796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jOT3aT7nWJnyms5+uQ6sh4S1bgFiJC7g7uVOAYiDI7A=;
	b=k893JxvamZvp7dR+R7E6gKtBbIjMeG6YTw8t4oAjAuPhDMLC0K78WsAE1XPzOjUJNgSS
	 kQdzvwuy4I9rrgKMKc+7LjqmavtFfzPcWS0dK4d7gmnGb0NxW0p5suaW1TCd7x+OZ36qz
	 AiXL+UYWI2t0cQTzq0pAkQFYXyMRX1axHaHHNOw+qa8dIj7KRKvsDLeqcDxR4A5PsfQJ8
	 xv/JhN4EdDX+fSm7zDTOhPo4FXfXXjMTFkPlkXLHC1JnYHfuywzLljZFkzC3kHiymWhD4
	 HzFVwVFOichXubmID2ufW81CfgXwhuTPzX6dNRjiQPnX10eFbswribzLpkSVs8IaZ4g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788690796;
	bh=jOT3aT7nWJnyms5+uQ6sh4S1bgFiJC7g7uVOAYiDI7A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mA2Pw+LQOKd97AAdJPOwgqLsOfENVOc/LsxE6/mnUeXd8ajSICgG6xX0ote8qd32Q
	 wndCEziqYlRx+ww7V+w63n53RpADyD7jj9TzNnnrA2KkfhaQLqo1w+5LdfbwZDdPFM
	 SINXyANNvMiOb6t5OBOuBsAuy52fRhDvb9pk4/fQ2m1FxcaZXuKJ3dTWd9sMjH4FK1
	 BLlgWecdw5jwsvsV54pJ9tGMrF9hCRMq2KZQKPBrepIHiwXMcfuN59mkUpRVdH34jc
	 gwRcjXZ3OZ43D7fVc4GPtHA/xdt6MIv23QyJjzARbWqez/ebmSjI+/P61DtZDGO2fH
	 R5dgLWOMZAFQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C358D80CFE;
	Sun,  6 Sep 2026 10:33:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C5453AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 124094008B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTXdZEa4Ye41 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:33:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 765514006B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788690794;
 b=krQs2Hq5D+HMM3nZp5jJqIqVWPwaCN574mnPAydKql6xqEfHi+Nk1vIBXXqHSFU32HGO
 HFETUksc5wTaod2CCbwhkLCnBHZhwvQ1LNZO7/fl2jM0BKiL22IKNv8TxMsPk10QVG1NM
 cxhNol/owzyqiuVtcvhPfwJ9Bwvr3pdiaFPQXHS1y74Szbv916BCD2Vz1t9nrMJRBN6fV
 UkziBKTNKkxjax1NlulScba9gRLU+OvseE9hnb5JPhk5OJLz6igCbaqvYgZWWrjSXRDtj
 5K/OXz18L5iQlCm8baOnIQ8PzzBDg7UMUUuAUE3Ibruw9iAJNeL/pkMISIBlREYdJIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788690794;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=P704rX3a1jwm4PpHKlXqizozoutXe7/kC5u82wMZeZI=;
 b=RxVJWO/ti3ffgNH29iczIVMnv3u4gIIPYiHCwhNxY2x6YRJcv28q3fCmtzp/HCL7dyrV
 Ci3OGW8ZsM+4DWzS5SGEnh+CexRT2nrt6HhfnnK+UbzR79IiPFDDjXNRjoAUKVMgrPCgm
 jphDsqvnvGXbclzxgS3wf5k/qkVA0NXMh/8LHzTLIwDccKFP4lYN700mR0mWZzLhB5Ut7
 KZDeQnwAaCJy2MuYFuMSHEMwDSMHbPJ8m0e34xM90DEVhh7KmZo6e1ZxlfJ3q07vpyxAt
 GyLmj2jzHERO/oxw8hRvG4+7HMnjnVs35NNYVmJp9GRPG/jmOrJVcyWDoNKW4G8bsJQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HQujHUIP; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HQujHUIP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 765514006B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788690778;
 bh=P704rX3a1jwm4PpHKlXqizozoutXe7/kC5u82wMZeZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HQujHUIP798YLRuPLGrFFZkGtYIlUgf7rMzTHesL6zY+t4MtAXqisBTiAMP46UHrc
 L0GE38jLz+ffNznqJqrWVgK1e2uDzcn7xITFGkp2dTlTn2JqOLd9G1aj8Z6dIFEXOQ
 bjyFWDlcAy0gjqSd2JZy1F3bXjO7v9ZYFFt5W43vTabsF5OKFi06QySKkwi/I8eUnY
 BAUJKQXyYPKl3e38t1aGTYkfLCK9v5yC8N1jCyb67phJuNHNBebLqvutsZSBgJsEfy
 MiLsUHKJAGzjxwxMN1dsvChh7dpKttjYFGvvEs7oOsAfCuQFt1pXlDsbqRzP6kxPW5
 MBYYxV8Dslosw==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5AD72A4C3469;
 Sun,  6 Sep 2026 12:32:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53358)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3ABG-0000000048S-0b1o;
 Sun, 06 Sep 2026 10:32:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Sep 2026 12:32:54 +0200
Message-ID: <20260906103257.3688362-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906103257.3688362-1-bernd@kuhls.net>
References: <20260906103257.3688362-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 4/7] package/linux-headers: drop 7.1.x option
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 7.1.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/from-6.17/linux.hash           | 1 -
 package/linux-headers/7.1.13         | 1 -
 package/linux-headers/Config.in.host | 5 -----
 4 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 120000 package/linux-headers/7.1.13

diff --git a/Config.in.legacy b/Config.in.legacy
index 6975f1f15f..e4824231fc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_KERNEL_HEADERS_7_1
+	bool "kernel headers version 7.1.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 7.1.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_WESTON_SCREENSHARE
 	bool "weston screenshare option removed"
 	select BR2_LEGACY
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3aecea4fad..f362bced0d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
 sha256  8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03  linux-7.2.3.tar.xz
-sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ae826f33111fea6f1d279dde7299d7463c8dfd204aeb75a8fb5432bc60a28191  linux-6.18.49.tar.xz
diff --git a/package/linux-headers/7.1.13 b/package/linux-headers/7.1.13
deleted file mode 120000
index a4e1d3ec9c..0000000000
--- a/package/linux-headers/7.1.13
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/from-6.17
\ No newline at end of file
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 365fe11931..2ba298090f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -52,10 +52,6 @@ config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 
-config BR2_KERNEL_HEADERS_7_1
-	bool "Linux 7.1.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1
-
 config BR2_KERNEL_HEADERS_7_2
 	bool "Linux 7.2.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2
@@ -486,7 +482,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default "7.2.3"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
