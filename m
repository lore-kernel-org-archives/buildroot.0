Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13973E77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 19:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9D0683ED3;
	Tue, 14 Jan 2025 19:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSZbP4d7RpWH; Tue, 14 Jan 2025 19:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E0BD83BAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E0BD83BAF;
	Tue, 14 Jan 2025 19:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6559194B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53AFA83BAF
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTbJtvKn6D1R for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 19:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09A0183BAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09A0183BAC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09A0183BAC
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 19:45:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23AE11C0006;
 Tue, 14 Jan 2025 19:44:57 +0000 (UTC)
Date: Tue, 14 Jan 2025 20:44:55 +0100
MIME-Version: 1.0
Message-Id: <20250114-fix_curlpp-v1-1-24daadf0f798@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALa+hmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0Mj3bTMivjk0qKcggJdCyNDyzQjw7RkEwMLJaCGgqJUoCzYsOjY2lo
 A6Iwf3VwAAAA=
X-Change-ID: 20250112-fix_curlpp-8219f21fc408
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Sergio Prado <sergio.prado@e-labworks.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736883897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xUAp2+l9R74hL4brYaMZet47xlKVf65qmY98beuFWjE=;
 b=lq8rLbv1GOkeS9ulgSKsIjhGUYRvhwy+Lu99UnMjynE2MsAhghLHpth4O1iCXzylyLKkFB
 Sh8z4LYH3b382FxX0jz2sFHv1ztkA9xDg46FK8uwX5HjRPBDsSOKgVUvkjDr4I/Ra8/5+c
 76DOn0c7FoREg9kjufr3h0jTRTBlFNDvspJOVvqjqA952Jc15J62JFmGVdY7DpZbUlfA3e
 CY/scg64HtoScBIY9CuydXX88XTwuqcj/blkoHComrAXBtiV700NnmxtXSMZ8lwES0Jbmb
 Oh0XXYiZFmHSf01vlX9/y8FDbyaVCMdbf90IptUxaLmDh31j3CxZy5S1jYT71w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lq8rLbv1
Subject: [Buildroot] [PATCH] package/libcurlpp: fix invalid conversion
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libcurlpp is broken since the bump of libcurl to 8.10.0.
This patch backport a pull request from upstream to solve it.

Fixes:
    https://autobuild.buildroot.org/results/4a4d3b248898f0e73620fcb1a7a94dcfb6e6866e/

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Buildroot 2024.02 isn't affected by the issue
---
 package/curlpp/0001-fix-invalid-conversion.patch | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/curlpp/0001-fix-invalid-conversion.patch b/package/curlpp/0001-fix-invalid-conversion.patch
new file mode 100644
index 0000000000000000000000000000000000000000..e95e9cd7c5589f9c5b1cd87a684cd930b2fd0d80
--- /dev/null
+++ b/package/curlpp/0001-fix-invalid-conversion.patch
@@ -0,0 +1,27 @@
+From b945d57a5acd12bda320a63eb9e45bbb7586cdde Mon Sep 17 00:00:00 2001
+From: Aaron Smith <aaron@soccergeek.net>
+Date: Mon, 16 Dec 2024 11:48:33 -0800
+Subject: [PATCH] Fix "invalid conversion from 'int' to 'CURLoption'" error
+
+Use cast to 'Curloption' to fix compiler error regarding invalid conversion from 'int' to 'CURLoption'.
+
+Upstream: https://github.com/jpbarrette/curlpp/pull/178
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ include/curlpp/Options.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/curlpp/Options.hpp b/include/curlpp/Options.hpp
+index 40b64ed..292eaa7 100644
+--- a/include/curlpp/Options.hpp
++++ b/include/curlpp/Options.hpp
+@@ -308,7 +308,7 @@ namespace options
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_LIMIT> LowSpeedLimit;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_TIME> LowSpeedTime;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_MAXCONNECTS> MaxConnects;
+-	typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
++	typedef curlpp::OptionTrait<curl_closepolicy, (CURLoption)CURLOPT_CLOSEPOLICY> ClosePolicy;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FRESH_CONNECT> FreshConnect;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FORBID_REUSE> ForbidReuse;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_CONNECTTIMEOUT> ConnectTimeout;
+

---
base-commit: a320dbd96d08dc5bc28614915bc664f81eb0fba0
change-id: 20250112-fix_curlpp-8219f21fc408

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
