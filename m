Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B969EEB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 19:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F228F4059D;
	Sat,  8 Jul 2023 19:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F228F4059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjDItOlD6FpR; Sat,  8 Jul 2023 19:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C90405AA;
	Sat,  8 Jul 2023 19:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47C90405AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFC31BF2B9
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E905D60ACC
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E905D60ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8B9d6H7B_Sg for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 19:41:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A63F760A9D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A63F760A9D
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 19:41:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20DF9A4C0E50;
 Sat,  8 Jul 2023 21:41:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43470)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIDoT-0005KE-2a;
 Sat, 08 Jul 2023 21:41:49 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 21:41:45 +0200
Message-Id: <20230708194149.3441129-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708194149.3441129-1-bernd@kuhls.net>
References: <20230708194149.3441129-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688845310;
 bh=4AYk92Ql5/u8rNrxi7eg/vQi9Aw4oEHCo14P9VrFgec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M3VueFaxxcFwoI4+cDGL3CZfehvwvNjkUwIOezejhsMMFUYkO2B6WZwja+cyk21aD
 qo3UppIzXokjCU05yZvBSwkgrR4a6SJbh7WYiVrwyi9Y8bqmFOn6VoY37LamlT/dIB
 Vl9nMXiS5tAXoagWdgOfhDD+gcWb6bBYVKkCPWzPtOf5YEcVYJ1YHd0TgcW65r+TTN
 x6PiWS6u2hCJmCGcmwctvhbM7odkcqrrLcy60+XV47ZgNE3Zu7fz5sdcWC41GTLW3f
 /c881JewUNZrCgcDEDC4GyRsMHLp8UDo9nlxKiOfAn8dLh84ciJhQPEQxc6SEYUjT3
 QXEqt30n4mSuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=M3VueFax
Subject: [Buildroot] [PATCH 2/6] package/perl-http-daemon: bump version to
 6.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Removed md5 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-http-daemon/perl-http-daemon.hash | 3 +--
 package/perl-http-daemon/perl-http-daemon.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-daemon/perl-http-daemon.hash b/package/perl-http-daemon/perl-http-daemon.hash
index c19b3b9558..b1d92ad8e6 100644
--- a/package/perl-http-daemon/perl-http-daemon.hash
+++ b/package/perl-http-daemon/perl-http-daemon.hash
@@ -1,6 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  3111b0081d08d8b225f52884033de349  HTTP-Daemon-6.14.tar.gz
-sha256  f0767e7f3cbb80b21313c761f07ad8ed253bce9fa2d0ba806b3fb72d309b2e1d  HTTP-Daemon-6.14.tar.gz
+sha256  b38d092725e6fa4e0c4dc2a47e157070491bafa0dbe16c78a358e806aa7e173d  HTTP-Daemon-6.16.tar.gz
 
 # computed by scancpan
 sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENCE
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index fe50c768bf..c017c4e099 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_DAEMON_VERSION = 6.14
+PERL_HTTP_DAEMON_VERSION = 6.16
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DAEMON_DEPENDENCIES = host-perl-module-build-tiny
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
