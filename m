Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12E7C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 10:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C3F60646;
	Sat, 15 Feb 2025 10:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECELxg1SGDg9; Sat, 15 Feb 2025 10:49:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6036E60895
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6036E60895;
	Sat, 15 Feb 2025 10:49:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC0BC72
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE1260895
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBbIjxue2w5s for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 10:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D27F60646
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D27F60646
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D27F60646
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:49:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ECD243299;
 Sat, 15 Feb 2025 10:49:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tjFjm-000d1d-0L;
 Sat, 15 Feb 2025 11:49:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Feb 2025 11:49:28 +0100
Message-Id: <20250215104928.150001-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -51
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehvdefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpefgffeugfdvheekhfdtkeeuudejiefhkeeljedtvdduteekueegveevjedujeekveenucffohhmrghinhepohhpvghnfigrlhhlrdgtohhmpdhsohhurhgtvghfohhrghgvrdhnvghtnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvght
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/mpg123: security bump to version 1.32.8
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security vulnerability:

CVE-2024-10573: An out-of-bounds write flaw was found in mpg123 when
handling crafted streams.  When decoding PCM, the libmpg123 may write past
the end of a heap-located buffer.  Consequently, heap corruption may happen,
and arbitrary code execution is not discarded.  The complexity required to
exploit this flaw is considered high as the payload must be validated by the
MPEG decoder and the PCM synth before execution.  Additionally, to
successfully execute the attack, the user must scan through the stream,
making web live stream content (such as web radios) a very unlikely attack
vector.

https://www.openwall.com/lists/oss-security/2024/10/30/2

Release notes:
https://sourceforge.net/p/mpg123/mailman/message/58834094/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.hash | 6 +++---
 package/mpg123/mpg123.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 5a83f29586..67ece34528 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/mpg123/files/mpg123/1.32.6/
-sha1  886c8c5f100caccfb4fefabc1c75ff6e2a834128  mpg123-1.32.6.tar.bz2
+# From https://sourceforge.net/projects/mpg123/files/mpg123/1.32.8/
+sha1  dc4d8d9d7fdc9c6c85e3036734eb937272a97800  mpg123-1.32.8.tar.bz2
 # Locally calculated
-sha256  ccdd1d0abc31d73d8b435fc658c79049d0a905b30669b6a42a03ad169dc609e6  mpg123-1.32.6.tar.bz2
+sha256  feee1374c79540e0e405df0bc45fde20ad67011425c361a2759e2146894a27a7  mpg123-1.32.8.tar.bz2
 # License file
 sha256  c22482728a634a8dfdb4ff72a96d4c1ed64cd8f3e79335c401751ac591609366  COPYING
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index dbf595e172..2020fa55e8 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.32.6
+MPG123_VERSION = 1.32.8
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = https://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
