Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0F0C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 12:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0899B812A5;
	Fri, 18 Sep 2026 12:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1VN_Xxjt63u; Fri, 18 Sep 2026 12:41:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E47C781294
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789735293;
	b=W5SPRWy0O4ulFjM2PBVGMTMWztWn8iiDbVonzOHtvj8Ulvk3vMh9hjK4XheKaZ6NGgpV
	 ZPklyPX6ArMMTwXtDMVUY5LDvyK1Dsceuryvxiv4bK4mCiKHGDaFZLT+4u00SoXq7pBrK
	 AQMGNMIHZ6If1n6Q9HjNNwb3Kogq9Y/S3cPYQOA24co2jKHg+KfS5XkNoqX3NVfbHWRP7
	 ODz3olNBjq0znETEPBQmovC9+0o4MnbglAavD1qMoFCtWaZa/7PaIUIjP3irY6SLyJjna
	 BYUoI6IwW1yKnwesq+sVkGsfyrSh1O7pIJijxa2Vf5D9ln7tYJk/MG/7w0ENaKGqPTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789735293;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wuYZ5cI3tRHMLzpg1iYoyv/jg5bl1g8/2qP0ZRHlO98=;
	b=IuhVEmr8gTXNBLk1bpgJ5gCYcyruV26CR5GEzX3FOyymILe2+m508NE1BFeqKH9GddEg
	 hkoRoXfIoL7zmAweRjQdHefJMzeXiApdIn0EZZF7U6+hQlEfqw+ZUFF+enNbBtQ3EfQ7m
	 /7QTk9v5e4ZKY7PtK8gI03l2hox+bAbv1JD3V6XX133l3LKjHY2vJ6lBDCMgh2ghV6LKW
	 dwY1Num7kv2Qn4nnTlQylb4KUpwqrxFriCTOSKl+2z63UkOHXnk43nlGpBF4tWbbdRyX3
	 AEjUu+1qjQDkAc+9IBpUDIev5HH+YDRmlPmbQdpmROwrgsfGjgfuJSCE4EYXBGmLZPQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789735293;
	bh=wuYZ5cI3tRHMLzpg1iYoyv/jg5bl1g8/2qP0ZRHlO98=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PSg1brHMfSDY3ikCwOUvbDmjmDHK8sfIvARG77queL1f3rLD6kcLl8J7e+FhToZZ9
	 h3IxqXGBa1vBPQViP5utsE3e4LiUttfHiOwAP5/VpNMVqMnsajRhIeiBiB4a3G+kBu
	 J8DPFAPvGBqrfNTY8+IuC3v02Gwv78DgMIvub5Xoyc436uCsRzeWlETs/oQdJ7meo0
	 P51gftsCicb56te1a9ltrPXFszpSnncfLr8s9YzUbSCSZ4lI6+1L6c9qV2XUL5sAj4
	 mil56NLyN7yRz2/G1GwJ0uInQYkFKzhkM5bmBH8jepmp2KXcLWn0Y1qQlYLdBnMyMb
	 VrTdhBaSaKJYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E47C781294;
	Fri, 18 Sep 2026 12:41:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EAF642D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2464760D67
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peTPSkIfXgRb for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 12:41:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A34D960D62
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789735291;
 b=ONYVFezQ4GPKGadGubMnNlnWulYzl3wBbZGFHR/r1zezkfOgbD+agvOjC7Xa+dU4iTZK
 6PMEM0k081iX2SbX6S3zWhMSfCiNm6QlEoZuxKLsbERzxOvwCWfEpVnPuebE9vPw7QVdh
 p94s4N57EtEfG+3vVE50ehAJ0FCW2bhlt9O6jwE0HembbWQdUbVfoquoUyuAD1BlzAM7v
 Cqn5RUgm9JFgj+gaIdz1aUMo6UtYXQKocWnusa47KGmnJwkfvd5VXlQKM/crk1c1Wc1TP
 HM665kYkGgtMArN3XYBz8XPnLSQV84T9NLICRPHk1nLs4q+KLfF+niKPLJ/Kjpr7aEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789735291;
 h=X-Greylist:Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=nz/UXiZQYZKqyorbze+WEi4x0/4ykkXdQGC5UZtWZhw=;
 b=Ww2upRz5ruxA78ct9kBkh27a+DhxwXZH4JoTWe8jFoSDXafZfpJUWtHoXRDjkHdgNUG3
 dxxnUrqKxi8Tov8FFx4/oiZ4Q7GPJ4dhcukcs4tIV1KnOmAxBoNhJ+8iPAxpXLhPrI0h7
 +xzTk+c/Oa1pWVZzOOqBxzUQjbGQKjCEPkL9m0Wb0Mz1MIc2QN9VVUAFce7M6bnK5CI86
 7TpTyriqbN9JTafkTWmoOh94adlQdSNM8Zuk42iKr/9uyEvtIbVQSqBc7vNxyc8xynfQH
 zfSxvgkoUbC03O6M+1BrBrHiw9VnGP2Z/7zYwbqUchTq+g0Kct/RspEsAwmoagWlyeA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=n621.de; 
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b=brBSaiyq; 
 arc=none smtp.remote-ip=136.243.2.102
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 18 Sep 2026 12:41:30 UTC
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=brBSaiyq
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A34D960D62
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 12:41:30 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 5FE19E00217;
 Fri, 18 Sep 2026 14:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1789734860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nz/UXiZQYZKqyorbze+WEi4x0/4ykkXdQGC5UZtWZhw=;
 b=brBSaiyqZYuFg67U4SIWBc3mNqer4KCuuFmd0ewcGHqRU4vgFp7CLDeQM0KDQAXXiZ8+kj
 YEJqEPotwyO7xD7Q3Z38g4ZpyjR7BY1saH8RiALJMpkCK71w/Dpj/V+JsMAZJl71Xw1XRr
 82VHhCep0LeVAgAKLFE2HXe2VmYWt9A=
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Fri, 18 Sep 2026 14:33:37 +0200
Message-ID: <20260918123409.22775-1-fl@n621.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] linux: fix pahole discovery when
 BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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

Around Linux 5.11, upstream started introducing checks that execute
"pahole --version" for feature discovery (e.g. [1]).

However, when building with BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE Buildroot
only lists host-pahole in LINUX_DEPENDENCIES, so it isn't available for
the configure step when using BR2_PER_PACKAGE_DIRECTORIES. This results
in the host pahole being used (resulting in host-dependent behavior), or
no pahole being detected at all when the build host doesn't have it
(which will then disable Kconfig options that require it).

Fix this by adding host-pahole to LINUX_KCONFIG_DEPENDENCIES.

A similar issue occurs when running "make linux-menuconfig" and friends
because PATH deliberately gets stripped when pkg-kconfig.mk builds
x_CONFIGURATOR_MAKE_ENV. Explicitly pass the pahole path to fix this.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=5f9ae91f7c0dbbc4195e2a6c8eedcaeb5b9e4cbb

Signed-off-by: Florian Larysch <fl@n621.de>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3599a10b50..cd80904113 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -125,6 +125,7 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
 LINUX_DEPENDENCIES += host-pahole
+LINUX_KCONFIG_DEPENDENCIES += host-pahole
 else
 define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
 	$(Q)if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
@@ -387,6 +388,9 @@ LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # therefore host-ccache would be ready, we use HOSTCC_NOCCACHE for
 # consistency with other kconfig packages.
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC_NOCCACHE)"
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
+LINUX_KCONFIG_OPTS += PAHOLE="$(HOST_DIR)/bin/pahole"
+endif
 
 # If no package has yet set it, set it from the Kconfig option
 LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
