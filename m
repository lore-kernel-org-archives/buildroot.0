Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5739CC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 10:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F4D360773;
	Sat, 15 Feb 2025 10:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGpWSkt7xK9U; Sat, 15 Feb 2025 10:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 667BC6077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 667BC6077D;
	Sat, 15 Feb 2025 10:41:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29E4BDF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E1066077D
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46ltH7k0az0o for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 10:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF60D60773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF60D60773
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF60D60773
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:41:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 381394341B;
 Sat, 15 Feb 2025 10:41:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tjFby-000Wac-1a;
 Sat, 15 Feb 2025 11:41:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Feb 2025 11:41:25 +0100
Message-Id: <20250215104125.125263-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehvdefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeetheefgedtgeevgeevhfeiheelieeljeejgedufeekleekjeejgeejkeefueffjeenucffohhmrghinhepnhhlnhgvthhlrggsshdrnhhlnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehsthgvfhgrnhesohhtthdrnhgvth
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/unbound: security bump to version 1.21.1
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
Cc: Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security vulnerability:

CVE-2024-8508: A vulnerability has been discovered in Unbound when handling
replies with very large RRsets that Unbound needs to perform name
compression for.

https://nlnetlabs.nl/downloads/unbound/CVE-2024-8508.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.hash | 6 +++---
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index ba876299c2..6e94f8fcde 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.21.0.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.21.0.tar.gz.asc
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.asc
 # with key: EDFAA3F2CA4E6EB05681AF8E9F6F1C2D7E045F8D
-sha256  e7dca7d6b0f81bdfa6fa64ebf1053b5a999a5ae9278a87ef182425067ea14521  unbound-1.21.0.tar.gz
+sha256  3036d23c23622b36d3c87e943117bdec1ac8f819636eb978d806416b0fa9ea46  unbound-1.21.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index c63311139b..03a5e8e150 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.21.0
+UNBOUND_VERSION = 1.21.1
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
