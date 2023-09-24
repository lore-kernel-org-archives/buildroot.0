Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7391FCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 11:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D0EE417E5;
	Sun, 24 Sep 2023 11:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D0EE417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjnfluWAKCjr; Sun, 24 Sep 2023 11:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E19417E0;
	Sun, 24 Sep 2023 11:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38E19417E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 901BF1BF33E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 664364152A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 664364152A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbCLCTtGDec2 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 11:23:01 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDD51400EC
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 11:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD51400EC
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9AFEBA4C0555
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 13:22:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46232)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qkNCU-0008VA-1G
 for buildroot@buildroot.org; Sun, 24 Sep 2023 13:22:58 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 13:22:58 +0200
Message-Id: <20230924112258.1114027-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695554578;
 bh=SpzKEiyeO0V7gtF02pLBrCJFfcgkDAPyyYOJC6JjKqc=;
 h=From:To:Subject:Date:From;
 b=xX8SMTNYXMw86JHhdl+uqOZmz4bJrqkn5GokRU+m7NeRiraV8Y0l3Aql+frmUPpY8
 /MdJb1pZ+aMC9X9YdmGitUKsiW+K5LiLlGA8n8Ivujt88uM7XlTB4ijjIT7s6lnvuK
 gsqJIxErNWOpQoliPLs+Eq2my3gCFmskoPZzaSxP7yryydV8bU5yVMNsNhrJL3cfIJ
 bt/XjIN4MVq1OKZWIWljB0RrICe21g9lEf0VZAQOO+JlveAtl/knXI8rgpaTKb2epy
 v1/7DmpNLkKxqfFLCCYSFieGy2TWgxGQzLvElVIAIjIVTd3nVrBj05eNmGjVsTQyBh
 PTJUc1BdcFhCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=xX8SMTNY
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.6
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
index b6b183c2d1..ccc3c2c205 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.5.tar.gz.sha256sum
-sha256  6957cfd14a29eee7555c52f8387a46f2ce2f5fe7dadf93547f1bc74b1657e119  tor-0.4.8.5.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.6.tar.gz.sha256sum
+sha256  552d895fcaf66c7cd2b50f5abe63b7884b30fed254115be7bfb9236807355088  tor-0.4.8.6.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index e86fec29f4..8e31ca749b 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.5
+TOR_VERSION = 0.4.8.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
