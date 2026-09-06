Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA8EC79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15816605F3;
	Sun,  6 Sep 2026 10:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAv5tE_DT9ja; Sun,  6 Sep 2026 10:34:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2C4246060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788690851;
	b=Tp9SsuWNnvVl+Jl+ZsgA0WNMcHUuFojSDEfGUcrD/eSMy8vN1L2aucTcYBzNEYsNYyJG
	 TXyjVTYeNOxk80PEGZ3PoBNPgEhQgf8RX4eSf9FH/h78aMj6lwACkP/yr/ElXw1cyGe1v
	 PkqFsq2cqS922HWrZhO6/9K7mOWkAndz4Lu0P0ccI3R9lbr5q63hZDcAd1Yb92MIx0W0K
	 mYYMKlwtBDAN6QcQso9d3ROSg0wn/CToh1im4ODoo8Qxwvs6EplR/IG5eMHYKs/4qja5u
	 nQHercxD38zwHZ5Nj+OeAUtGMe815sN6hL9Vg3cU665a7ucDrIPTAmQPmSt1dqMGFhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788690851;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bMamJu/vUHRuN0Kx4z/AiaZeOaQHf3LgDzQvNEMdmiY=;
	b=WAj5mXdjKpTePaL5SBhiqiZNotNgMcfGT7vZFimq1uvHRoEMyf+EY+ygunu/EhLzg/eX
	 BffBO0pGtd4J+rzOci0/Sp3Ikz1R8jow/q06znr+8QRha0pyfHjld1OtVfFOW+zAOAN5J
	 M73f5Wd38m+s4JiWu3pjjgK9V+nm14MB3DtLlm1zQ3ptLW3b4XBDdsM9StWyf58/JJ16I
	 +Wfbr+wrlRYVSC7ng/hLy42R7vfhUdfMXXZE9D94PoTr4iLOEYFWf7zcJSA6yHLf1HKcV
	 bYqLCMYPMi79aZUPPWcclc9/xZ3Xlt9JEwRRcvJLtttCfXE5rjJnJ56yHhOeg5lCt3w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788690851;
	bh=bMamJu/vUHRuN0Kx4z/AiaZeOaQHf3LgDzQvNEMdmiY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ydc3CubE/UiYA4EBiW5LDKab7Vs1WGddIo4ArvHRCI82tMSwMA2O3eD6eJNcnYkQo
	 mYwmVDDzJ+cT9spLm81XrTCtDQuf7fnWnw+2Vn17jQcMFnFamhBJipc25xkf+MHINE
	 em/AVxU7WW7QD59zNBg3ZiEvWnOa94KETbUPmhZft8ShMT8T/0/gb1PaQygCPT/DZW
	 pXGXYcqWrPlTAFMR+Vl87mSxfMROfZ03+zWpw5+LwqKlPd/9UOpgquwiwK+/hBb4eq
	 7zYFbyKG9hUipeaDdgPBwj4AY/gGt0hi/k30tEYRqa8G5nCUjPgSaDhnbAHXu1Hjp1
	 YhXcAcDiSo+9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C4246060C;
	Sun,  6 Sep 2026 10:34:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C3A4990
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DB6E80DCC
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLpKCpMuuJP9 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:34:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1242580DC8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788690847;
 b=GAuXe8hudZW5mBanukHKxJ4fzAqsd5HqJ3CPksWAq74ZGghQbxvNtdkoHbSk6KYEvai9
 mz6SMxcvFEDwicAJ8RSwlWj64l4Tvc/5qBack0xOk0k1IVq3UGQy20a1tAp19Crs8Q8Xw
 32dLenA4nRXpU7h/auH7bZTQr1ujsaxWPvQ3qGP7utHDyulQE4zrkTYPDMMA99aXqySfH
 fVsHumsbeTeinjw2a6X/0fDNwlZ6ehcb8PQ/WbTvJ4j2Lm/UinLz9g8WqWSa4lcm6sd9I
 ogIm72cOpAJznNg6m700rfYyrwUd0U6rLojzPOMsUzOjsmUwVdLShE9hKoOgdnYR05w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788690847;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c71DNa+9yTvquHBsm/SOpX7IDtoL6/1FggNQam92ckQ=;
 b=lbYXGRWMe+lnax4bHc8TjAZTXs65xdD0bf7SOjyj+a0Ys982EENtirH4OXpk8c7mrWEj
 NygTKsW6MRp9E1AogNDkIv/Xon/Dz+ckNLuxY2asc+RQ7CkjjlWsm3677ciNB6iKd5Jiv
 XI7t9BvvJRebHFgZd5D0bHxvkXywYdxrA3J5LhJ42/DRMiqxyLYRXt2Kq7oYSYRYXWLub
 YXLQ2pwBXqYcexPFHHHJVQmlwu6nYpPNBIHglmFBfvSDXOZP53LWovDvMzQ2mZDPUqkD3
 5irwhnYNjYVHNmubL4NmBqhSOV8sYJQZ1HdDF1HCor0nuD96TSplDa0R6Yth8gNeW5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gPc32LAx; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gPc32LAx
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1242580DC8
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788690781;
 bh=c71DNa+9yTvquHBsm/SOpX7IDtoL6/1FggNQam92ckQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gPc32LAxKuPaFtbubs0gytlJjvMCxUNksF7gYF/Nle6oA8QyE61l18A/oGt7k9hZo
 FZjOFJfkgIVk6mEqxvYy9C3gVANjENq9MFA972lMpGiGtL2LXi1Lu7ASU597tWzm0t
 x9w5fytip9+AKnlD1XzsG74gkV22TUeVA90MYKWGI2NZQv0YnAvwRwyDU0bWElNav0
 qd21lKetYU5f/JXIfVKmRSqR3gNrMuP4s1nQdP1olkBrrFAMNzPqYvpQEul+CFs0gr
 hr5HEeXSoVAQJv1nOyZyUFBKZTxzvlmw6xNdWO62vB8u/YFurObq8UujKCBtxcICUP
 HDXc3GNW5yXDg==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C7929A4C38EA;
 Sun,  6 Sep 2026 12:33:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53358)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3ABG-0000000048S-2E0V;
 Sun, 06 Sep 2026 10:32:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Sep 2026 12:32:56 +0200
Message-ID: <20260906103257.3688362-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906103257.3688362-1-bernd@kuhls.net>
References: <20260906103257.3688362-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 6/7] package/binutils: make binutils 2.46.1 be
 the default
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

Now that support for binutils 2.47 has been introduced, we follow our
policy of making binutils 2.46.1 the default version.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/binutils/Config.in.host | 2 +-
 package/binutils/binutils.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index fc8733bfec..af00a10b9f 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_45_X
+	default BR2_BINUTILS_VERSION_2_46_X
 	help
 	  Select the version of binutils you wish to use.
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 93a2e82834..ca1bfb89b3 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -8,7 +8,7 @@
 # If not, we do like other packages
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
-BINUTILS_VERSION = 2.45.1
+BINUTILS_VERSION = 2.46.1
 endif # BINUTILS_VERSION
 
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
