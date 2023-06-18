Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD89EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC4E960FCA;
	Sun, 18 Jun 2023 13:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC4E960FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvsCWwiknfV6; Sun, 18 Jun 2023 13:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3C5260FCB;
	Sun, 18 Jun 2023 13:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3C5260FCB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 167B91BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1DFF403AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DFF403AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FCM5yzWCjZ5p for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:31:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D9D5403AC
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D9D5403AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C69783FD4; Sun, 18 Jun 2023 13:31:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:30:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7faf0389fd6a999f877b037e1bbbd1b04c36fa49
X-Git-Newrev: d7a7d93be42b022a7444e9ff48f3cb588f310a69
X-Patchwork-Hint: ignore
Message-Id: <20230618133126.2C69783FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: update description,
 how to enable HTTPS support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d7a7d93be42b022a7444e9ff48f3cb588f310a69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/inadyn/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index 3589823da4..63b2d9ad5f 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -4,9 +4,13 @@ config BR2_PACKAGE_INADYN
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_LIBCONFUSE
 	help
-	  INADYN is a free DynDNS client. It gives the possibility
-	  to have your own fixed hostname registered on the internet,
-	  although your IP might be changing.
+	  In-a-Dyn is Dynamic DNS (DDNS) client with HTTPS support used
+	  to automate the task of keeping your Internet name in sync
+	  with your public (DHCP/PPPoE) IP address.  It can also be used
+	  when you have backup connections to the Internet.
+
+	  For HTTPS support you need to select one of the libraries:
+	  OpenSSL, GnuTLS, or mbed TLS (PolarSSL).
 
 	  https://github.com/troglobit/inadyn
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
