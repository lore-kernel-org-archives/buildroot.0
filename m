Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9DBD0E6DF
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 10:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A2B80CDA;
	Mon, 21 Oct 2024 10:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oe15joMgZIUh; Mon, 21 Oct 2024 10:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE64180CD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE64180CD1;
	Mon, 21 Oct 2024 10:15:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 555B7AF2
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 10:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A75E80CD1
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 10:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdrcD1Wyg91U for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 10:15:18 +0000 (UTC)
X-Greylist: delayed 304 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 21 Oct 2024 10:15:17 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E6F180CCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6F180CCC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.130;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E6F180CCC
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 10:15:17 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MOiLv-1tGw8r3LLD-00T3Qa; Mon, 21 Oct 2024 12:10:10 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Oct 2024 12:09:22 +0200
Message-ID: <20241021100941.11360-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:9eBsuhz+6voBQsceQ0TAxa+p4B6tbRqwxHxJTW0Vwzj2JoYT80a
 tjumFgOqXq7y0OVJb/jHURAoZlJjmdbS9w8Sgd9eocM6iQiZTQ3WmSqSKBZPMYHTXuSCh9T
 QHGhZW/qSv8sX+j074VcpV59QR/Bght7hBKOgW//yf3AurVdvWf81B16uGrQtmIlW8HrxCb
 5hkALwlyMhlyiuYvmIKtw==
UI-OutboundReport: notjunk:1;M01:P0:lyOeBtjHpV4=;hHJPkEDu5bTLvHpMP3q92j8yPmU
 kklHPybcIWQAdvJNH98FXW7SbJj8rckLlzkA+rN+ZuiRBfZKBGe+VB5WHTG3t8uQZ4zd1R0uF
 9gF6V88TAUQxC11e0i56VN+QPxKwvit1E4zdRqsGZXzRG9dGK9/TcM5VT0ZfTodGjQn/1A7FM
 gUQuHgIZyF60eVZLxDIoWNnfDAN+FEJpdTAKmxo38mVXkTwrZbUE1OwmLRi4zn7cbeLBRsocd
 8AaI/X7w81UK9KcyAhILeoGKMPtNEl6QAjgZEgZkOcvezrtvSxzNHsajC7rkPoF5u05ujSaoJ
 997mDtJUMXFLPWV8CArLEewe3ALzqWXltVE9canVBHzVmllxyQaA5IWbCgtOVUBWznSN4VP1Q
 tJ77eYEIMyAvv0UJDuRteQuB4RhdiASrJ6MU7+C9zMaz3kU0S5dUJtyYiK+3y/1wkafPjqADm
 B6T3nBXwo3maKyX9EZ9olvhhBn9KEapACG6PPH9ArVOJVtgkOuo9sS6y0lgB6+Awvb/mgGrr2
 x1BpoOH4MWpGjyyCOv9TouDa+G3a1+AOo8l/9o38G0b8dSawGWn2j6ZYNlNgy4HpEkgiBqb2m
 Y4IPlbHgEEX5qZNp45WrbFbQydFC3rvEojW6PTfY0Q7is3sjTTF5lsOs9vptbUpUA/grHslkn
 TbhVwQdpPRW6p1K27+LO2etzGCW3VDQTkZpfQkYAAGczwa5hdsi0LOhh7Rtvi714YbFiYa7VW
 rEZ5EJj9PW4GEKgQnXJKYfzZFrCO3KWpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.8.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a minor API issue.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index c02a149a68..ec2f89e57e 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8c1eaf0cf07cba0e9021920bfba9502140220786ed5d8a8ec6c7ad9174522f8e  libgit2-1.8.1.tar.gz
+sha256  184699f0d9773f96eeeb5cb245ba2304400f5b74671f313240410f594c566a28  libgit2-1.8.2.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index e817a5916a..67c9901a38 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.8.1
+LIBGIT2_VERSION = 1.8.2
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
