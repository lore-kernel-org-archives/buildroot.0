Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB640C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 07:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DACC82AEF;
	Wed, 20 Dec 2023 07:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DACC82AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8r4iUbSeAQOI; Wed, 20 Dec 2023 07:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5118294A;
	Wed, 20 Dec 2023 07:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB5118294A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F1FD1BF59A
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 07:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 718F941DE8
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 07:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 718F941DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cf99wIRIp3oI for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 07:56:21 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 269FF41DE7
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 07:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 269FF41DE7
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 268711814B9; Wed, 20 Dec 2023 08:56:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 08:55:57 +0100
Message-Id: <20231220075602.1306889-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1703058978; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=neuUZTNPHspF1vJ8m79ANwcSc7mhkvRw0zLjyE1O0DY=;
 b=KsZdJB5Avjsh0qL3HOWPqmXo42lKal1miHkSSjRwBAFSBpu88+fIcTo5KtebpUwNZUZy5p
 eOprHeVUMbtrrW7W3Szuh8tkEPaksYY3cngmj677e+qD9478FUSCALyeIZIrrz+Ayt6J7Z
 8Omjx47St8D7thD+ho+NFgtKaJGvdSk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=KsZdJB5A
Subject: [Buildroot] [PATCH] package/nmap: fix wording for nc symlink
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/nmap/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index fc6312d0fc..6e097a9884 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_NMAP_NCAT
 	  written for the Nmap Project as a much-improved
 	  reimplementation of the venerable Netcat.
 
-	  If symlink to "nc" is installed if neither netcat or
+	  A symlink to "nc" is installed if neither netcat or
 	  netcat-openbsd is selected.
 
 comment "a symlink from ncat to 'nc' will be installed"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
