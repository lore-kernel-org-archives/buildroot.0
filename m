Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3A1CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 380F283AB2;
	Fri, 29 May 2026 08:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lAsJS-D-6-H; Fri, 29 May 2026 08:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58A9683AB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043122;
	bh=vxxrQSR6HPPYe3eJnzgicJWyOVRgxbHDvzbBMFhuKdE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kVK/8CWOR0ks3u2+UHu8YjFyx1DAaLv9Lo8C6BTgojR9SqFLJ3OoK96QPt+IVlST5
	 qyJ1R2p+7xOKLfDyoklMY8pQsF+3kO7hwzb3V6tg3ZyZKrDqQ8pNIQCtCqA59Ccfn8
	 J2PqeGtNFI88LBCKDXgOgm8bjR7rI2ge4f4lXtiB9ZSqcVsnFk5j4VstE1/9SJkQZe
	 TkyIPpZIr+IdxKJglG6eMN4wyPptvRE8/yFBIMDPNSr3OOnWcg5r1V6ytJ4Yw0hvGq
	 FlcA8mMmwGBvymIftqD+UVNC2RR61TRIBAx+FiGP3oiJRH67bBWvXK4MGlAzQ4aB/o
	 TSgwk5xawEHjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A9683AB6;
	Fri, 29 May 2026 08:25:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA7182E9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCFB76130B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6sek3xThd8b for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4939761309
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4939761309
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9590870C6; Fri, 29 May 2026 08:25:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 10:12:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cbc4c032e51e9b946313ce92222adc8601590802
X-Git-Newrev: 9113cd5acd12ee4ab9d4c38843c1e551a6d4566e
X-Patchwork-Hint: ignore
Message-Id: <20260529082505.D9590870C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dropbear: bump
 version to 2026.91
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9113cd5acd12ee4ab9d4c38843c1e551a6d4566e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2026q2/002398.html

This bump includes
"- scp: Fix regression in 2026.90 building on older glibc or other libc.
  reallocarray() was required, it is no longer needed."

and fixes a build error introduced by buildroot commit
5b136c89ffed35c30dff1802924a4dcf9bdab798.

Fixes:
https://autobuild.buildroot.net/results/637/6372e58671d3719b127dcb69642420a07f441790/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4254d4fd82c1929f034150b280f92b3264bc5847)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 81296375a1..31ac153b89 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  16be820347723271b0fea6049ffeed6d6680d7429c65406d8af37776393a0250  dropbear-2026.90.tar.bz2
+sha256  defa924475abf6bc1e74abc00173e46bfdc804bd47caafa14f5a4ef0cc76da34  dropbear-2026.91.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index beb635e15e..a7de8432af 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2026.90
+DROPBEAR_VERSION = 2026.91
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
