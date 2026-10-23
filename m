Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A34606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mxwHODUF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ESmzeRT0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB056067B;
	Fri, 23 Oct 2026 18:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3e1TDE5Xt2wD; Fri, 23 Oct 2026 18:18:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6B7ED60680
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779507;
	b=gFl1vFecUPC5WfKawlqeijRmMIkqnGkM5ZwMSmRyskli2pN6GH4NTDgr1hT81CrwGhSA
	 X7V+n9ZEcnmO0vGhi6nVqLDkMpSQgwLMqud7PPFVLCIg48KhwXni64kRRXuTZa0IfGs2c
	 nEeVgQVrcPnZnY4m3A5Lc79keZJNu48DCov5NjkVtMFHRAe4O74B6T5/2nXykxEN1hkYR
	 +Dt43x2y5h/lj0XD20CO0Omx2lVMtfWWyxiYAdUngR6WLGtnnoMP6vDh8lCnjvUWSoMhD
	 vRBFPVj5+ADZKBIDX8wyk+e1SaL3J9qxqHJAJP4RulQuEVVH2XvX+zjkVnMlMZA3QNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qOQrCtarQeFdrltDe6CX9OcOBPYcDwn+VXaOmxp0whI=;
	b=Mns8rLV68JfIBFF9Gd0oMNf5fCzxCLduUZehhCJTY8/fxCt/maik0evx0reW6lOXffWR
	 U33TcICbTiUSbRXJ98mvrcSsjHK8I8jfPelzmKxQOWj/2x52eqFDqEXKrVXnNShzSVmtT
	 +lxvzen2A3WlxcgK2zRQZ7jWGaaTahWNmBOA/IfX6y/Wt/67xftcNrjrhIVeiprlbmhpK
	 x9zinWQMTuERmzkk6ZfvB7AGZeKcp/Y6jlzkry6A1Tki3KFjYWT5wNw03WYKeGug6jc1X
	 3SPkugW8CE/5gXUN+D4LkMX2SkqH+m1KxePcOHRlchi/TMyqHvQls4Jdho6xz0aFoqw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ESmzeRT0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779507;
	bh=qOQrCtarQeFdrltDe6CX9OcOBPYcDwn+VXaOmxp0whI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mxwHODUF+geTBj3E4U62eceXzmxTWyzDGorsqTkzOndjQcaWNvexSNrDuGRdXx8sK
	 n/tmS3STqjKNsujl6szUZtjHqNKuEjpu+JT4VidSYtLiFibBFdGyIB/La0BzYTlUF3
	 fy01V3EzDDlRHRbnzGz/AFs6ouW8KDZ7K2zqoDpo/emD7PvU09TNRacv+d+CTxBG75
	 mpiMY3ZB1aNQ3s7z2cSBnUaRnSsMJngJz1H7CjHsvWl4EWGAfuYmfiCwqprPZKHGdf
	 Sy7UjuRjarNfc4amC6FMuyRiQ7Qo7KQg0fP/i0ghSCPfXxkZEgni1wkbFXCAsJWdiZ
	 5TqXmC5m9hZQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B7ED60680;
	Fri, 23 Oct 2026 18:18:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A0AC235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C2326067B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sA8qnpD45wpX for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9FB8560628
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779503;
 b=DPRGSpGjIZ1xtFN/v218CLuFDp1WCLBm8TdL6Rwx0k4UZEk+gu6iv0rK2QQK1QXI6J8C
 djIRrZRXWF3KUxV0bO5KPEUo2o6F/PWc2gMgyHSPs+X6dZlvhJSbFSoa52CPdkayzM//M
 M3524oV7dgLslvLO5eR6fys244fseoK64WJqV9X9NuJ2TBsK4MRFPrPZrAVKmdGNk0Dd+
 fXmaRglwCYBi8Z4FMqR/oKCfzGUrVUu/78FK0KcyA3msafdEioIAFiJ6H8acEFYl0iJNK
 p8+SYXWM2MfjuDsAw8jdzYrD2QF+ENDax7yRLXdZw5oqfUA310moxQoYLC8EKv6CFDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779503;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/nkyevKNDRvQTYBtfO1HyQ3c6fsQyLpnL8crOS/ErlY=;
 b=hW1XxdaBbj69P2dw3dUGSjv2JUE1/74cY10m3mkQyLeBjp6oHW/iXExt4YQ2kpTWutHZ
 h/oPJzioLRTameRhyhQJO/Om84dePRqbKe11Me26+wlZQZbgZFWrh9uQwQQpKP4QZqhXo
 U5D7/jTpT7F7ca1Wvc8uWXFi67XBeKSlRaSyPJIvyi9aFoZz0y2IrbAal3sj0ofQP5tQh
 G3UeZiiqM6bZ0ZaW9KRxUHZXQ+lageK3m7FL/ldUks91clktEBUQAJ1LWGe2wQYhf/egi
 b5Xev/e8O2UoeOwvBvACj6nf50/5oJLuyTYkRsFl3cyWZU7b47WY/0pvPz229ynNuSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ESmzeRT0; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c31"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ESmzeRT0
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FB8560628
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:22 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-705cb6ceebaso786997eaf.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779502; x=1793384302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/nkyevKNDRvQTYBtfO1HyQ3c6fsQyLpnL8crOS/ErlY=;
 b=ESmzeRT0RWPUdaRc2AWxrhtQr8svj/2ffHQeYY7qgqeh0M/xNqflRQqNvqgCLzxwgs
 nXeuoev0x+4ljwG+Go4n2HNfdpjGQ6M7iZoUsV1/Ms3E+zncJ5mkaga6PO8xycKPZ4DO
 WgE4J2YXkjwxUgIy/EysbfzeZu2NSW5vZC+UXQRgN/k3XW9qJxgRn0V2HvVvaFG+RnyE
 s/rxHoCNL214Wt5vqIeqCVLM2g6u7gHDnWGI3ddGyO+1jkB2GSn3jBmCy4N/+TtyV+2a
 HmJnevKKB14vGzntOQLaudGem3BYNWXDWcki0nr7kuISkKbk2Y/zALwYMm0cHBoUx369
 z2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779502; x=1793384302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/nkyevKNDRvQTYBtfO1HyQ3c6fsQyLpnL8crOS/ErlY=;
 b=tbUd3BuwoDoRvslfzrlvArOFyn+Oo3hlBUqRSJvLRgotxHw2J2jUxi3iwET4Qa3qjr
 QvYjNhLVyIW9g/OcSamMCpcAaFQv9lWlFEQRfkXFBU1VuAkqbivoJg1RJv18/zO3ZEVD
 P0VnGEBKi4qb6tt3nbuUrMX6zQScax71Ogge+zU6kNhLWj+NXScQVtHwvzUKzP1rkIOf
 9NIathmSAQw3ehsq8jkXSghIJC3EhhLoa0yS3pLWhz8xxFsktVbxvbaHBjXTIhR83kZR
 Fkaz2kTBtPHZT7dMW0jUCFe28ifN2q95H+L6Y/OJuvpN8hJaf2sV5t0yiejD71L6YdP7
 YdKA==
X-Gm-Message-State: AFq9FYKAT73htDW75gOzL0tdhXzfcvyyp/Cv6c1ExVdbi0BLQ3/gNfca
 L0qg6H67PAIXdo6wBIEU76dXWxZMXhlOHBHNzr0Wv/zQa9REbJBK9Xyn/QtaLA==
X-Gm-Gg: AYBFou3WWI8eJnKZphzXD9D+A41vi4YK+EvJWXd7JYLCzvlBUXbY+M9G+evBK8gSl8v
 +Mc2Uv1FsJChjMOxN7OfOzMke/VcCJQ2+W0jc/KURkXausUiX50DI1okM+v/yhcU4yZoF8OQIP9
 UGi3dNgMPvU7r7QJisa3XAaU+A27fkexbTs2ry6Mg5lrmWkmFrJMYLTDitBBOz7J18Joup3/wtf
 7mSnUZ8K6oZOzmlr56Z3xjCCTWgpiRzeZ8+JM9To6NXd9RaFONSRgdVwys9LPXHF7VNyp96P0Zl
 a3g6LjwUOBrJtVFg/EMSr44UG9n84flR6Fb2BPgyDf1Bt+25FI6WEiF/S3PE/06HylOrf8DvoO3
 x/Ln9ygU8K5OlWMyI9wuAPlYXgsksor1U055rX7AUgwdE9HfwFWNyp6Q/dBz573Tjs74Q5jUbaG
 FnILO4GUUPZx0KKqbdKkDKNZNtTDgZP/c6f3qCYWvL1TDkak4fu6gYObSXuNnt9WO184qd8DKo8
 Df8U4kqm3oZeXJsZ+14eGNhT79m+6T0UDsRK+9QLZhuMrTzEYkydhSvrCM086JJZdYugv3o1B7N
 in3WDRVQjohEUwx7snABpCFXf5IbDu3KpxJ2p/c8D36PxZ7EaGmb3GZevV7HnmSKIydq3bibbmd
 SxDjpqntKiYW4uOuz7CUJ9myq01XH5n5vWH+A6Bz4XGr11hXF0A+SwKkGWIcabz8sVgP2adpwtt
 NIPEl7XBS85lzrelvp9rCC+do=
X-Received: by 2002:a05:6820:3287:b0:6cd:3fbd:1d63 with SMTP id
 006d021491bc7-70b88aeb6cemr1920794eaf.77.1792779501659; 
 Fri, 23 Oct 2026 11:18:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:19 -0600
Message-ID: <20261023181818.920329-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-asgiref: bump to version 3.13.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 43195778f9..087a48c6ff 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  1997ff1970b2879b5945c9e8c9f8765d  asgiref-3.12.1.tar.gz
-sha256  59dcb51c272ad209d59bed5708a64a333083e86017d7fcdd67498eeab7784340  asgiref-3.12.1.tar.gz
+md5  a0db8c36bb7847ea40fc11def500ceb5  asgiref-3.13.0.tar.gz
+sha256  034cc8cbf72d00553b4be256703ac545120b4e50af13b49dec99da899aeeecb4  asgiref-3.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 4955a631d1..8242eaab63 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.12.1
+PYTHON_ASGIREF_VERSION = 3.13.0
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/e6/26/3b59f2bdae5f640389becb1f673cded775287f5fc4f816309d9ca9a3f93d
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/6b/90/f5fce14e95fccf53b58e8e2c47cd84d40d105d64073ae1ac75166db150e0
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
