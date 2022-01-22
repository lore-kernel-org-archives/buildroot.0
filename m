Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56002C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 18:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8167F403C8;
	Sat, 22 Jan 2022 18:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQ0OiF1Pd7tB; Sat, 22 Jan 2022 18:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40758405A2;
	Sat, 22 Jan 2022 18:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF1F21BF5DB
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAE1C40897
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 18:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4xEIMrOrFcCc for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 18:00:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00DA1408A1
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 18:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B6AA882A1F; Sat, 22 Jan 2022 17:53:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 18:53:45 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 27f4f1f03cf6cf11b711a9090429c8664377750a
X-Git-Newrev: baed11290ece14044bd5486a17b6f595a1391513
X-Patchwork-Hint: ignore
Message-Id: <20220122175335.B6AA882A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/linux-pam: add
 missing BR2_USE_MMU dependency on comment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=baed11290ece14044bd5486a17b6f595a1391513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

BR2_PACKAGE_LINUX_PAM depends on BR2_USE_MMU, but this dependency is
not taken into account in the Config.in comment, which this commit
fixes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8f0df6609a0a1045c16a7d55711f21fc42af756b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-pam/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 84aee5cdd4..931cfdeccf 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -11,5 +11,6 @@ config BR2_PACKAGE_LINUX_PAM
 	  http://linux-pam.org
 
 comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library"
+	depends on BR2_USE_MMU
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
