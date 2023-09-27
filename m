Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B55E82CB7
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C884035C;
	Wed, 27 Sep 2023 19:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88C884035C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUaNDP4Obso6; Wed, 27 Sep 2023 19:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3F70404D0;
	Wed, 27 Sep 2023 19:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F70404D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 204351BF32A
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06DF14199C
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06DF14199C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oC7MTkLT1v27 for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:18:51 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3C69404D8
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C69404D8
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0DEEA4C06F9
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 21:18:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60624)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qla3c-0007b3-25
 for buildroot@buildroot.org; Wed, 27 Sep 2023 21:18:48 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:18:48 +0200
Message-Id: <20230927191848.1217422-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695842328;
 bh=ERww34YeEsQSti119PTGhKlb6ttFQxIOGUXg2r/jWYE=;
 h=From:To:Subject:Date:From;
 b=fLiIHXk2i3XVoFfyhZkirnhc7tTzBd9jdX98SrwsfvnWuvov8EXsYx7rlUZDpBMmb
 lNA0IEBACM5NGNODvStwSnrbd8cCgMbCnwKt6WHJ8uizWLG2gMa3uV4w7uPXqAxWUF
 O0FIHm9fehE5LLbXoC55/UELz3hhyi00SYbKI4+BaHW17FzowjEOAOHN8Etg4HR4m9
 r3cSJS+cXLa5jBRa0n+0Y5URuISDyhvrLeWk9c+Lf9LlGtXYe4lCJLrRC3mWKPxH4M
 gUyj3A1Ab9S2C8da3z54RSMRwMxDrb7JB4aC8QsqQdG2PN+daJ7Gp2Rd3g2jPTgbzj
 GCnZeLJWH3S+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fLiIHXk2
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.7
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

Release notes:
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index ccc3c2c205..933208fce0 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.6.tar.gz.sha256sum
-sha256  552d895fcaf66c7cd2b50f5abe63b7884b30fed254115be7bfb9236807355088  tor-0.4.8.6.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.7.tar.gz.sha256sum
+sha256  b20d2b9c74db28a00c07f090ee5b0241b2b684f3afdecccc6b8008931c557491  tor-0.4.8.7.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 8e31ca749b..1b29fd336e 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.6
+TOR_VERSION = 0.4.8.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
