Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC08C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC12F60F22
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC12F60F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8781460AB5;
	Thu,  5 Aug 2021 11:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPDo2PPT4qNh; Thu,  5 Aug 2021 11:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE23660AA7;
	Thu,  5 Aug 2021 11:08:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBB1D1C1135
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9A4140355
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gB5k-r7JysqB for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F11894029F
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:07:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 895668B7EF; Thu,  5 Aug 2021 11:07:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 12:48:00 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: eb880351a8e4395f15b5ecfd85979f3c6589ed53
X-Git-Newrev: d8a7cd188bc3ef6445042510d268724a61e5315e
X-Patchwork-Hint: ignore
Message-Id: <20210805110700.895668B7EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/postgresql: add
 cflags_sl option to pg_config
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d8a7cd188bc3ef6445042510d268724a61e5315e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Some external packages call pg_config to determine the installed
PostgreSQL cflags_sl option. Add this output to Buildroots own
pg_config, so these packages correctly compile.

Default value is defined at src/template/linux as:

Extra CFLAGS for code that will go into a shared library
CFLAGS_SL="-fPIC"

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ed4cfbb7730b0172f1e503a279e214810eec049f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/pg_config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/postgresql/pg_config b/package/postgresql/pg_config
index 3b0cb35f2c..099f1ee390 100644
--- a/package/postgresql/pg_config
+++ b/package/postgresql/pg_config
@@ -31,6 +31,10 @@ case "$1" in
   --cflags)
 	echo "@TARGET_CFLAGS@"
 	;;
+  --cflags_sl)
+	# defined at src/template/linux
+	echo "-fPIC"
+	;;
   --cc)
 	echo "@TARGET_CC@"
 	;;
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
