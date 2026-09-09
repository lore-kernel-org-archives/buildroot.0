Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1016C79FAD
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 08:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A5D606AF;
	Wed,  9 Sep 2026 08:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTKfqfUaUvXF; Wed,  9 Sep 2026 08:14:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AC422606D3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788941671;
	b=CPabm5K+CfhEeach3XdkV2y1CS0YPGDdXpDRSD3CThm4ApA3URprgRDbOqXYDXwj1h0x
	 i7z48XFFvtjb+YL/TOWl7kIdFid8PQRBlur77wR1rfl1opzDiFdTdByIxhN185DPXtF9j
	 MnKoZtwX0urogMyGShvHndmSErigK/N8msao8ueSmF8zYssIrHvrHCvw6C3PwGmsygy/8
	 s+6bwAIlT+iK5PbPH4aeZBKbX5t0AwGu0Q7Zpm2KO2TsoAcObiHILmnfJBHYtAXuwFb4T
	 pTtn/JEkYQ8v0AwuUvnFeFGhBmfbGD0Kkpo09zv4zxjznJQ8SzIfqcbe4Hx44JZeHvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788941671;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8zQY5rwE5f/Pk9+WXtcFeLHmTWa+LZ3PPR8MBaBUDQc=;
	b=qnLMy8luEDgd0lVXpGqpY+BgOb32+ArmwsmuUsEmABimph8qSvPGSnj1aj0osfSDA4wm
	 MjMnOySmxt1ZxU3DSzYnRgVpB3F2RwqdMmIF9W7U9EDHseslnusDJFnUQ9qW1y7jsPS5c
	 KG6D+yi8bjAKhWJ2qjzah2ie7cK1pwOxGqn4cBz5I3dmTx04eFhhfCWpuH0BNOEsEvFZ5
	 LXMcyAGefT16VCZTg/oK+E6OoVz5+5aOIg3B3xSobRIgMObADCpmgM2xCs/sRPzSRyASO
	 kn/2wAY8y+jakMKHfxG0nLdI502U6IEdLf+4gMXNulO7w/lBEpyilhOd0B2HYMRXD6Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788941671;
	bh=8zQY5rwE5f/Pk9+WXtcFeLHmTWa+LZ3PPR8MBaBUDQc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ioxe5EWo5s3aq8BO2XORpG+L0xeNxvqKeVoT8ckKGZbeXoM1tsHk08axcTklhYi14
	 8ehTK41+t8h0X2kTyjLtsPgvDsLIzxD43ZQzSTXB8Gbfj5pzBe/Cdf9GhQq0+smpXW
	 tUEsgKV9ZejVPARqIU+j0dwvjS8ks4eSGbaEHBCwsua60GBMNgRhn7airHskljAleK
	 8C3EjbV5IUqbWoqB/Nk3lUtxRQfKgGU1RrLik+wNZywplK/J6mTIkkkyJtMo1h/ekE
	 X3Z1E3ypyP9kygJbz5pNfibgFNEB2ytPUBTsDyQrtus0IesSSPX6OK8/doT74p64bR
	 c/r6h/u0y4vlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC422606D3;
	Wed,  9 Sep 2026 08:14:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90EA8724
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 08:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7683480D7F
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 08:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBQm4umbJ3ep for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 08:14:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5592980D6E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788941669;
 b=LvneHTw9eL0jN7coWfujRyUQ8mOPbEWVtyMehTeNzNdVqA1OyCeriC40GehjsVsgivje
 5sZdbzxOVigZ2pI8cqIJaFDvqvEeyjZ2IuaZUj8yOcOWmxCLF6SUjUS6ekjdgIVqRn1sE
 0KTWXcteXNvYzL0dpVkkmx+I+Jbwv2qI2QEnyW4kR+RcJSSOeQT4r6VTeCDmcQUJl5Lwh
 M2ceK8V04yhN15pOxAIELtiHIjntRFmCCTjVIv9dGOrxePTXbCOpYPiWn/Egmab5Q8dFI
 95Qu2+MqJhFJbBlWoSzV2kpuog8Fdez7WgGDFF6SIajZp08pU2lcXCbqI+JOiJ6mn6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788941669;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=muig+1EgmQPhbxnkbT8/QT3ggwxbbeB6O+1N+LSeFac=;
 b=scqpI+Zq86DFJFq9xwmQytLJapHBY2zoH5bprK6kkftTB68Cr5SaKyvHae6VjzGlMprK
 AzGjx5X9iKRWS4q8riALye70R2nm9uD6rfIkqc3aav7AZrh8QogoWrWja7JZ/ym1SdRUq
 3R6vsWygtgRrbaP7Fh/aIiZjTjkt+as3PkjfOqn/q0pjwPWMahyztfnHnamvuyeN4y+k/
 cIyuXbhb7ZIPeRJZt9nb1VFRXrWKoiph7lCeqVRVvf3nLCkd1vL2AvydgM29b3b6GoVd9
 +XiSTm6y0UD0CtBWxqjTw7EkOlfhnSYjbAK/P5qOy/9augM0J1sEOVlig9OShqzDf2A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=S3w8LysR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=S3w8LysR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5592980D6E
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788941641;
 bh=muig+1EgmQPhbxnkbT8/QT3ggwxbbeB6O+1N+LSeFac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=S3w8LysReWcKW4YkegEC6kscxDoxVUVrwds2Txqy34tttmqg0HqSOhX++/7r8XixW
 UGItt64QqRbeL2KnP427H9FtDbkbCWp7ILsyjTKvDa51IZcTGqZR0q6vPyJLMv8i2F
 Ey1Mt700WT5p3XocnJl+It+6F8uPJ8L6YUs6c5MZZqJct9zKxC9XiJLtEH3TwemszG
 NFuxnxVjEnWzyx2AlDKYsRKzOzgOJTSJRzFkMAyZ3msHAEP8pUHwyZ8t/yhTu4ulrV
 xmJu+pbs7PjM3j1TfDcL3qA6G7ph0SnvTvRKDovcRlDTDp3+k84HrzpnS5MmDOpR+U
 t8cKkjE1/KjtQ==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88769A4C39BC;
 Wed,  9 Sep 2026 10:14:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53672)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4DRC-0000000012o-1cWc;
 Wed, 09 Sep 2026 08:13:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed,  9 Sep 2026 10:13:44 +0200
Message-ID: <20260909081345.3114385-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909081345.3114385-1-bernd@kuhls.net>
References: <20260909081345.3114385-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 4/4] package/liburcu: bump version to 0.15.6
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

https://git.lttng.org/?p=urcu.git;a=blob;f=ChangeLog;h=44d0d303b649682d05b3be85fa702eb919343807

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/e25940ddc695aae05e98a5eb597e09f2f835615f

with the exception of an unrelated build error for the linux kernel
using the defconfig bootlin-aarch64-glibc-old:

  *** C compiler is too old.
  ***   Your GCC version:    6.3.0
  ***   Minimum GCC version: 8.1.0

due to upstream commit included since kernel 6.16:
https://github.com/torvalds/linux/commit/118c40b7b50340bf7ff7e0adee8e3bab6e552c82

A build using this particular defconfig with kernel 6.12 passed:
https://gitlab.com/bkuhls/buildroot/-/jobs/16384475368

 package/liburcu/liburcu.hash | 4 ++--
 package/liburcu/liburcu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 5b5947f6b8..6f45dcc28b 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/urcu/userspace-rcu-0.15.5.tar.bz2.sha256
-sha256  b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1  userspace-rcu-0.15.5.tar.bz2
+# From https://lttng.org/files/urcu/userspace-rcu-0.15.6.tar.bz2.sha256
+sha256  850b192096eb11ebf2c70e8f97bc7da7479ee41da1bebeb44e3986908bac414f  userspace-rcu-0.15.6.tar.bz2
 
 # Hash for license files
 sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index cf1b08e469..14fe6e91eb 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.15.5
+LIBURCU_VERSION = 0.15.6
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
