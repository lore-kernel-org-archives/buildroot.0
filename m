Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD5CD5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 21:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EF2740906;
	Sat, 13 Dec 2025 21:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yKidolKzwgZ; Sat, 13 Dec 2025 21:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC73E4090B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765660103;
	bh=ZFCXd5cum6p+5waDxW1OmKPWspQZieO6qjl6qRmqB4g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oUpwiNwmINsVNDmm1Wsqy+w3CUlWnkU010weonJIxouzXySA22Z0mh/zyOS/C6+zI
	 OY91Fd40hG4WxdJb1EXF8KIXknQL4RLq6gJDai7MQzwcWfoWrxCbVkQFGKuS7SoCe1
	 u+OX1LZyV6w8VVJkrgwk6RE3hSCE37tAD6LKucHTmuLTdLle3Axl2yjv9jpjEAEnEX
	 0tX7v9oY/f5htT+yQyyibL5CphfFXl8CbHaYggDnXjTr6hvVgxXqBYW3GltFBk9sDA
	 vp2Q6OD0sRbYRbrgFfj802if5ZjpiM+RwyM2DH/DAm8Fb+del1hVEW2ytivvm5drTb
	 c3L+KtauSSNuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC73E4090B;
	Sat, 13 Dec 2025 21:08:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4AB62C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C66D04021F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFdQjvwE73tT for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 21:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B768400A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B768400A0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:08:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0ABE386DE8; Sat, 13 Dec 2025 21:08:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 22:00:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdce0b7d4aadcd6e58f8396e8ff0842443135d7a
X-Git-Newrev: 25fe2c4d28f49024b3bb9d48422b462575b7e7db
X-Patchwork-Hint: ignore
Message-Id: <20251213210821.0ABE386DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=25fe2c4d28f49024b3bb9d48422b462575b7e7db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceforge.net/p/fetchmail/mailman/message/59270832/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index ddd71e6c86..3a762971f3 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59258857/
-sha256  38d01fe404e67514df394a6ed1a815bbb61aa90c0fa4402252593aced0e38a1d  fetchmail-6.6.1.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59270832/
+sha256  a5109295ec3319e0e45edd009d2d977042a8326ab52c6a817a82fa987103e4f3  fetchmail-6.6.2.tar.xz
 # Locally computed:
 sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 8906b6c8d2..6a63752d48 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).1
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).2
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
