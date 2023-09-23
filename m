Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D49ECE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 11:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EA8A4049A;
	Sat, 23 Sep 2023 11:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA8A4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYKk3W6M0Qgx; Sat, 23 Sep 2023 11:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B48E40137;
	Sat, 23 Sep 2023 11:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B48E40137
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED08F1BF5E9
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D23B340137
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 11:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D23B340137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-Wy_74G5qxD for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 11:31:34 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0CA740065
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 11:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0CA740065
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA05EA4C0313
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 13:31:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60100)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk0rD-0006sD-26
 for buildroot@buildroot.org; Sat, 23 Sep 2023 13:31:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 13:31:31 +0200
Message-Id: <20230923113131.772390-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695468691;
 bh=Rd24PP1h35LKF1jOChriNfcVianf38rKglEG4weJ7os=;
 h=From:To:Subject:Date:From;
 b=OQtXr/3e8T20RIjBZ7LXXkAoe6xB0Qkh1Smn7O6u/eRplHhcrBE6miNMoG69BoEtt
 by5cPEpvNhy85t1hfuQub9hrjs1ExeFDV9uBzxJHKusCb45Vii2SXtm+HcXsCWPdus
 0f4riBjKtrJaE8GH/12fXAYeOVKhFO5rtNo86U16PFSbf97xGK6cvkciqqVqP0fWsY
 nILXknDFS2cQscZ/zAEvETbk80p3O4RfsTr7Zo2cFJaJgJq+wRSOQqFmSrd0g6PNP5
 GDdc2ngCjEkrB/qMNZb0bh1rOMn2A0LulrXriYqkkBifPkOpi9NbruASDirSv/f3sB
 CuB6UPEKK6jsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=OQtXr/3e
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: bump version to 3.1.3
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

Fixes CVE-2023-4807 (Windows-only):
https://www.openssl.org/news/vulnerabilities.html

Changelog: https://www.openssl.org/news/cl31.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 1c82cd7cf8..9126175977 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.1.2.tar.gz.sha256
-sha256  a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539  openssl-3.1.2.tar.gz
+# From https://www.openssl.org/source/openssl-3.1.3.tar.gz.sha256
+sha256  f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6  openssl-3.1.3.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9c1dbe8694..b69ef032f2 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.1.2
+LIBOPENSSL_VERSION = 3.1.3
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
