Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F98D2ECEB
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 20:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F8D0841BB;
	Mon, 19 Jan 2026 20:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-B2XLbGdtdX; Mon, 19 Jan 2026 20:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B885841B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768856180;
	bh=PUPchdAVDcg9MWM6xw/HT5JDXjjb1f79NFAJr9BqRtk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jQUYYVCXfhcKDXaHGGBizsmlCBd0zo0p0R0ueVOpsXj21p/QhXLUPCqOKFrhQ15R2
	 d0dvN4oZ+6DZ+8RJSxnSRmF+xk7PmEprg+xvDWNJ2Z0IvYZ25ALxOFU/4WFJPHrflF
	 GJYu1HA2s6WlHfybhpMnhu4TGnLO7nymXCHs7lGZH7W+clcq4w7OzMjJeh1xNETBSA
	 d5DbmOVo1yH8XhGKBJF+Nrf1qMW2WjRDzRH5x3htM++ZShC4YeeGZipvUskv7fI9kf
	 mjAzPRBeER0if2JNzhBAIflI4b+86cfk8/Knb0snV6fvN6cXdTzJHqlAw5bInAWjZd
	 Z7FjpKhEYMOJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B885841B4;
	Mon, 19 Jan 2026 20:56:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 689752A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5046A61643
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTCus8xg77DD for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9042561642
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9042561642
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AC8A886C5; Mon, 19 Jan 2026 20:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 21:20:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04ce8230f44457f9f4355d68990e8fe03b1099ec
X-Git-Newrev: 3e542f87e44574441b504fa2ecec284f55d25597
X-Patchwork-Hint: ignore
Message-Id: <20260119205617.8AC8A886C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-amqp: bump version to 2.2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e542f87e44574441b504fa2ecec284f55d25597
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://pecl.php.net/package-changelog.php?package=amqp&release=2.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php-amqp/php-amqp.hash | 2 +-
 package/php-amqp/php-amqp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-amqp/php-amqp.hash b/package/php-amqp/php-amqp.hash
index 1c0938542c..22ed4ffb13 100644
--- a/package/php-amqp/php-amqp.hash
+++ b/package/php-amqp/php-amqp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0cb16d63752a0055de55a22062a6c1744908696d92268d76181284669025d993  amqp-2.1.2.tgz
+sha256  5ae624bd785e299523f6132c204bd562cc73066dd33a10a12aa96389f55a4de7  amqp-2.2.0.tgz
 sha256  ecd004e9ae3fcf54896b562d5e8008e36041f2620076effd58e5f4187299cee8  LICENSE
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index 5507032ee1..f47c0ae874 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_AMQP_VERSION = 2.1.2
+PHP_AMQP_VERSION = 2.2.0
 PHP_AMQP_SOURCE = amqp-$(PHP_AMQP_VERSION).tgz
 PHP_AMQP_SITE = https://pecl.php.net/get
 PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
