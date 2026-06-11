Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B214CD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF29610B7;
	Fri, 12 Jun 2026 11:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BN_wUyFvvxz3; Fri, 12 Jun 2026 11:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C61A761119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263473;
	bh=RrF0pl3ZorK4RACziO/Z8b9tj8JibxNWR/WIplrEPHo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EZ9SUvdj2bvpqKAdk9J2rk4Z+5Ehc8lK1MqsIeKfsjVBFkJ2F9X3ut0SueY/5ugVZ
	 D7a8IoU/DTMrWvFPvATzOBPrwbqEBruCpcQq6eugO5ufnb4+lVKy9OqrFb3cVXryjU
	 IITWQllBR/AivPQ1HRlmr3nuzyKOR8qZ6usorf7Z10S2qjvRlykh40Hjl3WFxjmpj5
	 CLQ/Lx5Iate9ygSNaouwSbvIVUuUzeC89ZcPDo3/Rq1sOxq274apizeN0IBZG491wE
	 0Xw+DtdQ1fgc0A2iLH6wipNjlO+Lw/3orio+eLhGyVQGpV+JViahBtHVpFMXv7MaLG
	 IS4IqW7kp1GgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C61A761119;
	Fri, 12 Jun 2026 11:24:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEBD237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F1A760F20
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bc9M1y-QLApI for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6582260F12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6582260F12
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E3D9880EA; Fri, 12 Jun 2026 11:23:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:47:29 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 42581bd3cf7708d4dd1b19c543157c013caae61a
X-Git-Newrev: cb6bcec96a88129322682a991b1ff0fc606ae2fc
X-Patchwork-Hint: ignore
Message-Id: <20260612112350.3E3D9880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/php: security
 bump version to 8.5.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb6bcec96a88129322682a991b1ff0fc606ae2fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://www.php.net/ChangeLog-8.php#8.5.7
https://news-web.php.net/php.announce/493
https://github.com/php/php-src/blob/php-8.5.7/NEWS

Fixes CVE-2026-44927 & CVE-2026-44928.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 08f8c44d150c5fa2d9c8a639c076090cd6a76bba)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index c85df44d73..2a89d03ecd 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  826c600b7c6f956bd335558ca3bdbcab23b22126c1cc8d9348be2280a2204bb7  php-8.5.6.tar.xz
+sha256  01ba2ed1c2658dacf91bebc8be6a4885f69b811c7993831fc48e26107ab29985  php-8.5.7.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0eae93fac2..0bfb12a8eb 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.6
+PHP_VERSION = 8.5.7
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
