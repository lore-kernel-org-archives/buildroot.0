Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8D4C001DB
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 19:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC45D40448;
	Fri,  4 Aug 2023 19:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC45D40448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgoOmcJ4NRsF; Fri,  4 Aug 2023 19:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 007B64064A;
	Fri,  4 Aug 2023 19:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 007B64064A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 599B11BF346
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 19:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3775540448
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 19:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3775540448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlZbF926jLFO for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 19:38:08 +0000 (UTC)
Received: from smtpcmd14173.aruba.it (smtpcmd14173.aruba.it [62.149.156.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4ABA140A59
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 19:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ABA140A59
Received: from localhost.localdomain ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S0cdqjgvdXI7yS0ceq50ZD; Fri, 04 Aug 2023 21:38:04 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 21:38:01 +0200
Message-Id: <20230804193801.93049-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDwQ1Cae3aQ9yRIZ5GKfV+SraU2tuS5d5NBkRtvCM1HQyZTPMMJifb/udzfuK/n80HZfOKOfn8eE28E37SoOxa7Go88vpM0MUuVbAyxXUGeRK0+een4D
 SzwWAgA7XvUEzovZSlVge9mj7Dq4/1+x9oUwqqXrlc1ZySFGAIdhImmlWCIErWAW5XTR+3ahM1DnLdRFqbwsaid54GIdWI7OTg/RI2qEDExBjxuQ8ns8PDpF
 YGYB3nSrSfWRGda3vKeY+7yL44A6cjnwE3VkFrCkeV4/+W7SX54jh2Shc5cNr0bR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691177884; bh=IPmj2acf7AldqP/2ElBvK7RmEP2qaiTDtKM7cew5uA8=;
 h=From:To:Subject:Date:MIME-Version;
 b=Zf0dbO7YRQgFA8nzcE5k4yz433PRihxwmnZty/jQSY0g/r4RfyjCb4kgII69FNbll
 vWizcvyhiMacXhHlPjN3TdwwMyiC+9SXl1KSr+iPdUAETLHKhrPQFw6YyQvQmiGBPw
 KgJJRjPFn0gv45CEdWQ/j/HraK+xCYHH3x59nHphZTXT3DfhpOqQXlM+SV65vVPGFy
 TvizQagRpKPzu/cVaY8p0mFx/914/ZqpUzGA22k6ppsXntmaRjVHe5kbGySMBujy4e
 5lWp7cmBzhGf2vFIKs0JdfSH+Y2GIlL5tmFFJV0Yvb13haHpowo85qTDjQlw72QBqi
 ocfNdEe/bu5nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Zf0dbO7Y
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.1.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 6b71e3819c..1f0d9befa1 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c1ce780acd385569f25b9a29603d1d5bc71e6940e55bfdd4f7266fad50e42620  harfbuzz-8.0.1.tar.xz
+sha256  0305ad702e11906a5fc0c1ba11c270b7f64a8f5390d676aacfd71db129d6565f  harfbuzz-8.1.1.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 3118ec62c9..6d52c52a85 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.0.1
+HARFBUZZ_VERSION = 8.1.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
