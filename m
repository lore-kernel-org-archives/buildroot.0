Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A03CA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B20060880;
	Fri,  2 Oct 2026 10:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9WOtSfrRbqB; Fri,  2 Oct 2026 10:23:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3645D6082E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790936636;
	b=VsPW9mgnswT2X7DPFKGlhL3LINEmHO3fbx5F0jEBd5xa27kWAolje+/5Mk1ly/h1pMXl
	 OzsvhQRFHFGTwjl3US9DDgtvoSUDgdbT1mo8yefkIhq9EQTe6frFabzmEQSKbF4EvL3Fr
	 5V4vlLGPHvz3D+e9b9HxGdpeJ9SU6Gj2HEwfAvZhCjO1GL0pz6Ex8VsjLWmTDGzteL4F4
	 6pQlLcvQVVvIses6l+P6XDL9XDwnpuH0urwsfmkx+jL2hHpTbmtRWFO+nBF641EcAnzQf
	 EFMoCU4NwuXXFBsM1hS7MkkvPMklETE/e+slXPeIIau0GX9wCHuzvA2tEJqS7krhh7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790936636;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=1rMxG7odi5Cfa1R8GI74v+HgYZzsRKjpbKe7GOH/44w=;
	b=TJo8oxLdFDWezb6Q7DKgHEuCnJjp7L/0f7Tu6pnvqVgp59nDMlW1N5mw8FxAmurKgFlO
	 q9IOGPiqGNCOkM2wQFO5Nh/x9BSvfW0/jMLfRoMnSVACYnay5EQuVKvuDE/ny9/dfEXqR
	 4Km5xwnlE0YtnszWabo6svhF83m/OL7J9c+JbJXvCDc8fvksHJl91uFYEuNSo5v0ZtWKQ
	 intOGMV+HDBHo0sXmKyCnJfFY4L5tnvRziebmYz5W4iUPPpk23FmHxCIPi/3exMy5M6M8
	 LDZ+2xJL4nNwBOz8yjLW9svELaXhyJTy2Hr0W0RgjAwuhESgW4dbUxz+czTpiAwKVPQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790936636;
	bh=1rMxG7odi5Cfa1R8GI74v+HgYZzsRKjpbKe7GOH/44w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VEQMTFB2x/40M/VK2RaqT28pcCQPwDnmy1L3v5VGDIf7lguUjRiNTn2mu/I0C3xYD
	 JmfiuB+gVr3HfUQjHklgzLr0ttrkUN3BYDxWuEYTMI0dhdNVIkwm5BJD59CnSnOFgQ
	 YbMXx2mhuM1XhXg0IMtMxZmiOlicXq2cTwhrRgbGdvD0bm3zR+r5VWIzHglS6F0/gP
	 pE6Jvihv+u28qsXdIUHRgT0ruvPQqOsfSmBtzLCuo1vRUgmYIkgGCtwQV+MatQYGtp
	 z4QJvc+X84Gtvk6oRugTKy6ldLxE5tK1ejmS5Tuff5NJqnz1vmeHDd9IfUdF9ApisG
	 WBr58vdItGRvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3645D6082E;
	Fri,  2 Oct 2026 10:23:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E6434D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02976400B3
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWkn35O7UChR for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:23:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 847CC4004A
Authentication-Results: smtp2.osuosl.org; arc=none
 smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790936633;
 b=YJk1ag5/57X1D1A4AZNM6jBobQb99y03A32KeUvz4uk1ZuO8xaFwrqPUL4aTBhRUgCBV
 by5s3NliR3gOkjGG81ZEr2C9YvdWD5Ei4oqkZ2gz/wCln1VZyeT78WNao3HQisu/87HaW
 uPRQxhAohYBJvk//SD0yiO5+n25/5cQRUfJrtrkR45m7AsR++cEkOaCKttN+xRUWrWswm
 S+lZyRb69avAsflcp8jig7B6C4jnO1QpWgkeH0elAjX+lmb1qMlbqRsCL0C/YTh/QX/7b
 zv4dOdpM0NdocdFa1VqjNjD5LK8ceMiR5VHdHHcJtfKNknPT0E4lHDIlotGnp55lm6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790936633;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ZkWR+dqwra5KbsDZIM3KGD4Op8jJgmNSc1GeZoT0P94=;
 b=qmBSG54uUYtH3cbnaA5WteCwp8wq5m3wtmSqklZHfXNwp2jqepsvMxnCan0dX4q1VBuR
 MWiipmzZuy6LueouTx6+Pb4hkg/aSOVVPQognfo1+MBpHJKn7NF7bJj91D5XkcFsQuFmZ
 KII33hdTOjIoU0aymzl9ZfBAmQI8JOd2iz5IQr9jBbBl8KvT9fuCOzNtIKzmjX135CBNv
 y8pXKzrF/IDSYUySYcxfEfTeFEBTxo3juWOlNAx5fzfAvK1yFvQFSJqeuF0vB8BMeP3bx
 WfOYBwSehwdBeXZjbr3uwEEtrLTh1d20LFQCwjlwAG3jkQABPBxQhwfzB5XtQHagR1w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=HEO2pJw3; 
 arc=none smtp.remote-ip="2001:4b98:dc2:55:216:3eff:fef7:d647"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com;
 envelope-from=paul.elder@ideasonboard.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=HEO2pJw3
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 847CC4004A
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:23:51 +0000 (UTC)
Received: from neptunite.hamster-moth.ts.net (unknown
 [IPv6:2400:2411:160:2f00:337:442a:994d:7d4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0539177;
 Fri,  2 Oct 2026 12:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1790936515;
 bh=VKalnfYEhpVZEpxPIbxHJhHHxXTjoVDMpvZJfqr72Fg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HEO2pJw3Ra5rMvNBFjOb8gJyyXjscESW0mD6d7Rgr9pQGvC+EaybJkhVfkqHOqST4
 PlCmm6SlmPC7/txdkxXX2b9ylTDiiJTi5gE6i/Ud40zLY1fJZHe+py/DADaCYOTXFI
 D4sQMgSPiQfwzteLpebGUuNxqatnO7C2kdRO5eDM=
From: Paul Elder <paul.elder@ideasonboard.com>
To: buildroot@buildroot.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com
Date: Fri,  2 Oct 2026 19:23:32 +0900
Message-ID: <20261002102335.12501-2-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002102335.12501-1-paul.elder@ideasonboard.com>
References: <20261002102335.12501-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/kmsxx: Bump version to current head
 as of 2026.10
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

Bump version of kmsxx to the current head as of 2026/10/02. Remove
build options as appropriate.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

---
The git commit ID didn't seem like a meaningful version to put in the
commit message but neither did it feel useful to leave it blank so I
just filled it in with the date... I hope that's acceptable.
---
 package/kmsxx/kmsxx.hash | 2 +-
 package/kmsxx/kmsxx.mk   | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/kmsxx/kmsxx.hash b/package/kmsxx/kmsxx.hash
index c141ef7e0725..1d74a0602598 100644
--- a/package/kmsxx/kmsxx.hash
+++ b/package/kmsxx/kmsxx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  99759fe9334369ccd80ab0bbfe1110ee47e74f1e20abc2d7b2f028067ea0a0c3  kmsxx-824bbb1f4cd062d66b457faca50f904b34dfd96c.tar.gz
+sha256  8671e99766590055cafd58793eaf56782044e2cf1203a8a390a5726457d39f7d  kmsxx-4d2008f5893a5d6ea2b2bf5e70bc539bfcaf6db0.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index f65cc668d484..5aeb48910c7e 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSXX_VERSION = 824bbb1f4cd062d66b457faca50f904b34dfd96c
+KMSXX_VERSION = 4d2008f5893a5d6ea2b2bf5e70bc539bfcaf6db0
 KMSXX_SITE = $(call github,tomba,kmsxx,$(KMSXX_VERSION))
 KMSXX_LICENSE = MPL-2.0
 KMSXX_LICENSE_FILES = LICENSE
@@ -13,8 +13,7 @@ KMSXX_DEPENDENCIES = fmt libdrm host-pkgconf
 KMSXX_CONF_OPTS = \
 	-Dkmscube=false \
 	-Dpykms=disabled \
-	-Domap=disabled \
-	-Dsystem-pybind11=enabled
+	-Domap=disabled
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 KMSXX_CXXFLAGS += $(TARGET_CXXFLAGS) -O0
@@ -23,7 +22,7 @@ endif
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_CONF_OPTS += -Dutils=true
 # extra handling for some utils not installed by default
-KMSXX_EXTRA_UTILS = kmsview kmscapture omap-wbcap omap-wbm2m
+KMSXX_EXTRA_UTILS = kmsview kmscapture
 ifeq ($(BR2_PACKAGE_LIBEVDEV),y)
 KMSXX_DEPENDENCIES += libevdev
 KMSXX_EXTRA_UTILS += kmstouch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
