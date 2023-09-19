Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1624DCE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 20:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A25FE4194E;
	Tue, 19 Sep 2023 20:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A25FE4194E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZIFJ4HHtcgt; Tue, 19 Sep 2023 20:01:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF01440963;
	Tue, 19 Sep 2023 20:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF01440963
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 959761BF409
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F36F660A82
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F36F660A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tT-GviYDRPbi for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 20:01:53 +0000 (UTC)
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5499E61242
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 20:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5499E61242
Received: from localhost.localdomain ([146.241.100.148])
 by Aruba Outgoing Smtp  with ESMTPSA
 id igusqluiFhFedigusqud2n; Tue, 19 Sep 2023 22:01:51 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 22:01:49 +0200
Message-Id: <20230919200149.3712528-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKbT9I1hghNRWBF3Om95lPV5G0bkaYuhNLtDtfnHeZVp+it6/K3RdRsk+PuVh1rPP0OUh8rq0y4WuPNnPIoFBDdqIHY8qpl0u0KznGfubca4r25GUAa6
 ZwMYK2dzp7lYbFkDhk9XuYr1OdblG6TKh/KZgHfjmlbMm2KEtEIRDgu9oKubnWevoaHx0oGJHMhL4sqVLtynFddwJr1EZ9ck8G7ORAHAp7ow57y1tjbAxOBn
 JLEj9uff0Mx+6GYsxiqBYFFWg74uWUHif4yUNBkmBe1oNdbgfqtuDnzTuN663/6z
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695153711; bh=1HlUZh/zUV7y7PpLOdMCBqz9WvlX/yItHAzLg/3eeHc=;
 h=From:To:Subject:Date:MIME-Version;
 b=F/TKLKH9tTnRTKCHOwhInXwFQrqS4D9wepZEw8hf1Y+0/Usq10ufw9lVKdPhpwvOE
 DYXp5g7ZpVvNOMKKbFh3lm4ivH04QvQyQlnPNzEmouPtvQnXptdSS/N79OOwaJOHgH
 NboThB1q/miuaSNAhmz6hwFPa9g7Y6cHnlK+bRJSeTTzhafnS7efSxSvLMm0q7q015
 rEpZ8uUM63rQkLxCenOrzbWZN4fD+djOPmy0vc8uva+yvMwfzR1UInz3TRLjI+iiqH
 rFrpspSrZQBFynnwadgoc8/4/vUr3Bykvstjhg/YW5aL3ErYzcvgxH0h61YaCYQvsV
 IUvk8cfhhNtBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=F/TKLKH9
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.2.1
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
index 8791899a4a..3f601d29ee 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8cb7117a62f42d5ad25d4a697e1bbfc65933b3eed2ee7f247203c79c9f1b514c  harfbuzz-8.2.0.tar.xz
+sha256  0fec78f98c9c8faf228957a201c8846f809452c20f8445eb092a1ba6f22dbea5  harfbuzz-8.2.1.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 43c559ed1b..9a9859c133 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.2.0
+HARFBUZZ_VERSION = 8.2.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
