Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85EAC79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 13:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 582E66078C;
	Wed,  9 Sep 2026 13:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWm0lR6-UsRZ; Wed,  9 Sep 2026 13:46:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8E0DB60769
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788961617;
	b=m9cf/g0RsgJgpMM07uPuZmHnVYyYcs2T4C7bx6+RLZ2w+DtKHPPFkXmUFSe13xKubOa1
	 f8l37LX36KMT7ngCRFZJBpT48i6a/HiZbYKKRvuOPlXw9p9bQ0OydkR0JLeiDBA3vUk7X
	 h0HmjQlR6OPqoCd4VwmRx2CTVjqlo32yhttLTFpBh1OSfKN41yh+/rEgqrw8bUve3h6Si
	 cYWI4v4+YqnOtBjTZhE/PVBI+WpjSI/ZnCljdQSzdTZ5AzlIJip+moLbKQkvQaA+3roV1
	 3BJVieB+mDRtw0JOPeM3B26ZiBbAmqjllSiJXfMGTKRpbr6Zq6KsGDDJ22AbjI5XoMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788961617;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PTBKk0DBZCD8AIK3NKV9F/JTeFDB85BpNeBCaodJuWE=;
	b=qd3sMcG793ANsnpet/UEq8UCu11QaUeXPl3syCWHXwXf1yBxw1/vk5D6zIyqRCZwPfRx
	 7S+bYnLaUHZ3b/fQAl4+NfmuNAIGZNZVKDFbm3qEN+T56fwGtaPmg9o8i2DH3Fy6zDb8x
	 lGqszt9S9LziO8Y9+fN7Wk2bKUdYfHPUvS/tsKRFY8/evP8nPBmT4drzVlhlv63CpOiqt
	 NfDfx4KreN4EqUbiXvC5re42dyD2ZsIlWG3i9z4yU7NzyIU8BuL2UEVCzgmFkj1kcHb+F
	 Bgu3C0ERVkN0r/Oo2crzYhs0m4YiWkGRfhQqqhj5/tWZLn7hyGsXrggRJ4IH2lNZ9YA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788961617;
	bh=PTBKk0DBZCD8AIK3NKV9F/JTeFDB85BpNeBCaodJuWE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ImDFGo1kmdH10l/aH1k+tv29UGjTEDM3oFj+SdbbnRDj+XbnQGNSRe4pFABMVxjE6
	 CzOFgwZCjd5HBad5SLPxcMNi8bWobPLYaUS8C39GhgoiEDDexBXFuaw8xvTOMGDzmw
	 283XRpjuHMrLtbtrZ4/Z+Albz76drxD1rBs6hxPd4UBXn4C4eif8i2ZrLZoIrPeKuN
	 5DjPFPPnjTEkwatKSrR1dJQyOvGKK+z/5F69rilkmjNcaBaDHJNkqOgXPAyO7YYVmx
	 ToJNpnvpievcVKTvA/aBFnEYf4FKZSWWLdc1us1Q5Xo/WEc45GtM6mv4rMHxf8p/UB
	 woRoT8JwhZJIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E0DB60769;
	Wed,  9 Sep 2026 13:46:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B3174CC
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CCE34071F
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVIyDCEW-xyo for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 13:46:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 76C81406E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788961615;
 b=LOQuRC1jqYL5yMCaTy67OJOwtryhdqqCXymKGUhv80ig8yEwYPtJdyo3/4RBEep4yZas
 DoYyoDkIRn8BGqvqmBiuKF1ccGpsB+v/em+MoXrhY5kz1bdhsEYoXvV3UB8UnkfyTyhFr
 JYHBUVvgc0G5C1n26c0I1b3VHvXp9548dgVh0s9nPVwNgOsI0gx/UwIXFcTuxy69IX+Z9
 g+sgmO0nIlWQgBFpXGHJQDT5tE020fWqQTK22pX7jjO3aPIzQ3uJCaeAMNxiUyQkU0XuR
 70jeKXUo28TseUmHzwiErY/57eegNC89fYPVLV4drWdoUfraXeY7GzoyyPDRrL/nS1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788961615;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=we8cll9E37b8hHpqiVHhRrCHpzT0vdcQsbDLdAMpZK0=;
 b=lmeymcanhKIxGBCxaUteJpgz0jVZLQWV9+Il0C1LZVh8duNrdJd/lbtz3YmAJ/bRMZgz
 mOqVwjQlSoTVaD4Ijy54Ke4WPdQC3SlslSyR8dfMWRiey/OIPEraUvu7frgyEyGGjFXxQ
 zTOEc3BNDcomJRIoUf6mwkBvp9EdP6olawdqB5JSp2hotJR0MoAiBnNv9naoVz8GV/NFX
 t0DoJcDtpp2YRuK3m/LiZsw4ULwjdsjtR3uOOgh6MnzWm2dsx12Rij5nbdsYksia6rDEx
 Bw8TF2dVJCoexAjyIp5DsXySWKHo4haLQMVwdsaOE3f/1+9y9dHJt+1rCnACt2V9sdQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76C81406E1
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:46:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87646954D1; Wed,  9 Sep 2026 13:45:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 15:46:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b076d3755ffc9865806bdf19efa99c5e70d3b03
X-Git-Newrev: 2d71c874d2605c5d2f66fb69a3fd8c8110cebc77
X-Patchwork-Hint: ignore
Message-Id: <20260909134552.87646954D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2pd: bump version to 2.61.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d71c874d2605c5d2f66fb69a3fd8c8110cebc77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/PurpleI2P/i2pd/blob/2.61.0/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/i2pd/i2pd.hash | 4 ++--
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 0d7755b585..05602226cf 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.59.0/SHA512SUMS
-sha512  5fa4365eaa6fbc0e448732d3c96b867e27db21927727aeb9df8241d56fea08561028a7b6d51ba7fa1141d53c95b848108806edb9f420c2ebbed85f627f045af7  i2pd-2.59.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.61.0/SHA512SUMS
+sha512  d88bcb4d4879b8c2399f03f30f360a4121e20659665eda90d46495bf036666e99a05666acc6abd4b67294e5c7d61fdf0d867789e85316dc5338a5c5ee79811c5  i2pd-2.61.0.tar.gz
 # Locally computed:
 sha256  eb5ac2a5ede8cd6bed9e6d93ad943119a73bfaba378f21bafa307f9b026b2034  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index ac0348c24a..aa0b4fc394 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.59.0
+I2PD_VERSION = 2.61.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
