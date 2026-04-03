Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42470E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6634880CFA;
	Fri,  3 Apr 2026 17:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xn5Kd7qkEYGI; Fri,  3 Apr 2026 17:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99BC180CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237713;
	bh=ZE18+sL8q392CVJRXqOAA1aNQFnUGrSY/k5ADQhcxTM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y0oTz4LRVVpcPSjdiSOaNmU8smGofKGftoB7dy1oNrOV+qvi/+9ji7bswx614nTC4
	 0I2KWZLlOY4QOjFvWL0lR8xHrMK8Qo/n9hf+43stcSEhX/lMcXd1iFCoOgOPqxlxFK
	 aPCEj1ev3gpE/6D2DXxWwCGOVw3GdUlDNDw6JuR/lD1pnTtP63hn18udf+cCWiIgal
	 5jagU1NwQacOrk1L2ZQd0EpjCsjayOBDopGWcfGQ0/VURri8CD4cLA8cbTQQs0TQD6
	 eGs/radzGT4gJ2FxIXIxk1Xd8IvrP+MBV7/L3LCug31K2z9VBJPZ/zNA12LDYwEtpU
	 a+IQixoFkOAyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99BC180CAB;
	Fri,  3 Apr 2026 17:35:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BBC72CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C25C40308
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCnV6g0FYYrw for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B4214006F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B4214006F
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00D4D80104; Fri,  3 Apr 2026 17:35:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:32:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d28468b921e1e86c0a46502d574e26e293844702
X-Git-Newrev: 3664f8ad49bf09180e766efc0e07856fad6913ec
X-Patchwork-Hint: ignore
Message-Id: <20260403173511.00D4D80104@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jansson: bump to version 2.15.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3664f8ad49bf09180e766efc0e07856fad6913ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/akheron/jansson/blob/v2.15.0/CHANGES

Switched to sha256 tarball hash provided by upstream.

Updated license hash due to upstream commit:
https://github.com/akheron/jansson/commit/2297a2e320ebecc6dc98f7034a2f38509ad1d7f5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jansson/jansson.hash | 6 +++---
 package/jansson/jansson.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index 0d9dc7b5a5..747f9e4420 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,3 +1,3 @@
-# Locally calculated after checking pgp signature
-sha256  fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9  jansson-2.14.tar.bz2
-sha256  1fff7d37d22157bcd81ab53b6c54da755d7c2f868f15807d9bde920f10730da0  LICENSE
+# From https://github.com/akheron/jansson/releases/tag/v2.15.0
+sha256  a7eac7765000373165f9373eb748be039c10b2efc00be9af3467ec92357d8954  jansson-2.15.0.tar.bz2
+sha256  150d90904cd8de73609bb177b42edd3867b07b4b7b786dbba319f30de39fcda2  LICENSE
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 8efe28bf4a..e60bb1aab6 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.14
+JANSSON_VERSION = 2.15.0
 JANSSON_SOURCE = jansson-$(JANSSON_VERSION).tar.bz2
 JANSSON_SITE = \
 	https://github.com/akheron/jansson/releases/download/v$(JANSSON_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
