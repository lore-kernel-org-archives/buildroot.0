Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346D0D4337E
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B25148280E;
	Fri, 12 Dec 2025 07:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkPLk3AoCd-2; Fri, 12 Dec 2025 07:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B4B826FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526150;
	bh=WbLvxQ4ZwutkOXWdc5nDzf5/aoQUSeu27/Cy/TvbhFo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OvUgjBzm769whe8oGCzNsA5d/S/LDOetuxAypftcPCuJhLgVjxYIw+1CdavkRcFtm
	 6dSdkD3KHDEum3dF9ptwo62FR9EDnim1uDirOISB5XAbMTL4Sh0VBN2jRMFowzDG2l
	 0hrw/KjEtaMnq7ojVyL9TIT98BSFGCL++b9DFgBy2BzRK2uG6+sBxpuJ/5q4V2KYzr
	 jILhAOvMQV8AkxaoFqa5FyWSeUnxfwfar6qmeZr77MNjM8YSEqdw9h6/aMHRPOq4Lp
	 1n7tv5aR6BM4vsLx6/qwhYG/neOvfaFz+7W3AS05pJt4reiQ27PFEzgAnkixsYEbGq
	 piSDHCkuC0SRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3B4B826FF;
	Fri, 12 Dec 2025 07:55:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D81A2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2146281311
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3PcK4p-FG7a for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 810A5812DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 810A5812DE
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F60486C9A; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 17:14:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b243b77ebe5eedf8fbc683d5539d9bf386da4420
X-Git-Newrev: 00bc19058eaf6fff7bb07328d69b7709abfbe9e2
X-Patchwork-Hint: ignore
Message-Id: <20251212075534.7F60486C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-amqp: bump version to 2.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=00bc19058eaf6fff7bb07328d69b7709abfbe9e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://pecl.php.net/package-changelog.php?package=amqp

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php-amqp/php-amqp.hash | 2 +-
 package/php-amqp/php-amqp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-amqp/php-amqp.hash b/package/php-amqp/php-amqp.hash
index 159a157a49..1c0938542c 100644
--- a/package/php-amqp/php-amqp.hash
+++ b/package/php-amqp/php-amqp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2de740da9a884ade2caf0e59e5521bbf80da16155fa6a6205630b473aed5e6dd  amqp-2.0.0.tgz
+sha256  0cb16d63752a0055de55a22062a6c1744908696d92268d76181284669025d993  amqp-2.1.2.tgz
 sha256  ecd004e9ae3fcf54896b562d5e8008e36041f2620076effd58e5f4187299cee8  LICENSE
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
index 7e58234d1f..5507032ee1 100644
--- a/package/php-amqp/php-amqp.mk
+++ b/package/php-amqp/php-amqp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_AMQP_VERSION = 2.0.0
+PHP_AMQP_VERSION = 2.1.2
 PHP_AMQP_SOURCE = amqp-$(PHP_AMQP_VERSION).tgz
 PHP_AMQP_SITE = https://pecl.php.net/get
 PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
