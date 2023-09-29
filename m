Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4431E743EF
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 07:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FD9383BA7;
	Fri, 29 Sep 2023 07:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD9383BA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gs73_fYT0Gd9; Fri, 29 Sep 2023 07:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CEA883BEE;
	Fri, 29 Sep 2023 07:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CEA883BEE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 57CA01BF842
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31064414FA
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 07:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31064414FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZAJyQD6ntpF for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 07:04:26 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DCC540122
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 07:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DCC540122
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id E0E87CD414
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 06:56:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 852FE40004;
 Fri, 29 Sep 2023 06:56:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qm7Qd-00671e-PW; Fri, 29 Sep 2023 08:56:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 08:56:46 +0200
Message-Id: <20230929065647.1456926-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/libfastjson: security bump to version
 0.99.9.1
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

Fixes the equivalent of CVE-2020-12762, which was a json-c vulnerability:

https://github.com/advisories/GHSA-3797-gmjf-45gm

https://github.com/rsyslog/libfastjson/pull/166

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfastjson/libfastjson.hash | 2 +-
 package/libfastjson/libfastjson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfastjson/libfastjson.hash b/package/libfastjson/libfastjson.hash
index 218a738b37..f220c608df 100644
--- a/package/libfastjson/libfastjson.hash
+++ b/package/libfastjson/libfastjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  881f954633aa76931e4c756ece0bda6fd8a673c6e66955a3db3b2bb9d6bbff72  libfastjson-0.99.9.tar.gz
+sha256  67cde7e85fa372036d7694f3b32cfc666705ab19367920f555af9d1c183edfef  libfastjson-0.99.9.1.tar.gz
 sha256  b29370bbfa98816e1fca0901f18149d920736771bfd68b4ee0eb00c78b38d245  COPYING
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index 7ab978dc67..5ee33ba496 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFASTJSON_VERSION = 0.99.9
+LIBFASTJSON_VERSION = 0.99.9.1
 LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,v$(LIBFASTJSON_VERSION))
 LIBFASTJSON_INSTALL_STAGING = YES
 LIBFASTJSON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
