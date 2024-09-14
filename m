Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0B5C02195
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AF83411F2;
	Sat, 14 Sep 2024 12:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ictQcDS4CoZQ; Sat, 14 Sep 2024 12:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 926BB411F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 926BB411F7;
	Sat, 14 Sep 2024 12:44:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 337641BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CCBF405DD
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVTutIOSPlGC for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B1B3405AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B1B3405AA
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B1B3405AA
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:43:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E57BCE0004;
 Sat, 14 Sep 2024 12:43:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1spS7r-0052KS-1z;
 Sat, 14 Sep 2024 14:43:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:43:27 +0200
Message-Id: <20240914124337.1200461-10-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240914124337.1200461-1-peter@korsgaard.com>
References: <20240914124337.1200461-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 10/20] package/makedevs/makedevs.c: fix typos
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

And replace Couldn't with 'Could not' for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedevs/makedevs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index a5c9c7d64d..be76155ab6 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -165,7 +165,7 @@ int bb_make_directory (char *path, long mode, int flags)
 			}
 			/* Since the directory exists, don't attempt to change
 			 * permissions if it was the full target.  Note that
-			 * this is not an error conditon. */
+			 * this is not an error condition. */
 			if (!c) {
 				umask(mask);
 				return 0;
@@ -480,11 +480,11 @@ int main(int argc, char **argv)
 	}
 
 	if (optind >= argc || (rootdir=argv[optind])==NULL) {
-		bb_error_msg_and_die("root directory not speficied");
+		bb_error_msg_and_die("root directory not specified");
 	}
 
 	if (chdir(rootdir) != 0) {
-		bb_perror_msg_and_die("Couldnt chdir to %s", rootdir);
+		bb_perror_msg_and_die("Could not chdir to %s", rootdir);
 	}
 
 	umask(0);
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
