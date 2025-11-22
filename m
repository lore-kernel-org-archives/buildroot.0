Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4408D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17248143D;
	Fri, 12 Dec 2025 07:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ujQi5JI7o_7; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A1781416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526138;
	bh=mXhuvVFNdJ2vuiCDPeHUpmgrdU/JAJNsekkpo4CEz7c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jevfak+BjN8bHXKqjieoOET2Z5PUd6a+I8eEBoKbwDWZObZq+uDccgWncyfKhY1m5
	 FjasgVlTdKiVq85If1w6ocstabE64CbzK+eo5kjA00vhbS7VxnQbvBYxWF9v/k2YIg
	 1VHawjs3LGLeLPWt+KsCOegAZ0l0mFlTL6U5BDp9eZBUgnrHka/rZm9ibBjDqVZ2cX
	 l0nK881gRfiYcFJCUIa8XCxNORZVdlRzFEbq7OjZmULmokLjw9xWZ97UXgC53+3R2S
	 3sSmc98aAUM4LeN8nhbvT62gPHvIfkryAsXozC3nuUxYSUTu3CJfybkhvO4xRww6T0
	 TYeJNBBJQw26A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A1781416;
	Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FCC12EB
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55BC841132
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_4sKmeyrxQI for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9184A4110A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9184A4110A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9072F8076A; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 17:14:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f71ae1c8c7be7472b262fabf4fde10fe0d515e9
X-Git-Newrev: 8d996b98ea0e0b83e8c4a77a07494d5689753001
X-Patchwork-Hint: ignore
Message-Id: <20251212075534.9072F8076A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-gnupg: bump version to 1.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d996b98ea0e0b83e8c4a77a07494d5689753001
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://pecl.php.net/package-changelog.php?package=gnupg

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php-gnupg/php-gnupg.hash | 2 +-
 package/php-gnupg/php-gnupg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
index 084de7750a..8bd2eb5c90 100644
--- a/package/php-gnupg/php-gnupg.hash
+++ b/package/php-gnupg/php-gnupg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a9906f465ab2343cb2f3127ee209c72760238745c34878d9bbc1576486219252  gnupg-1.5.1.tgz
+sha256  4d4a0980759bf259e4129ef02cb592bbeb103b4005e7b4bb6945d79488951a50  gnupg-1.5.4.tgz
 sha256  da1136d4d9326317cbd320dadddf7e9b4b4edffd973eb083cb7b9754fb6a15d9  LICENSE
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
index 89054f5f7c..6b76795533 100644
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_GNUPG_VERSION = 1.5.1
+PHP_GNUPG_VERSION = 1.5.4
 PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
 PHP_GNUPG_SITE = https://pecl.php.net/get
 # phpize does the autoconf magic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
