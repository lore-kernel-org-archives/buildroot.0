Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BF8C54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 22:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB64415AC;
	Tue, 27 Feb 2024 22:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBwa6J7P6GjW; Tue, 27 Feb 2024 22:24:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F0B6415B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F0B6415B7;
	Tue, 27 Feb 2024 22:24:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37A101BF842
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23D1C4044C
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 22:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuVNzyBFroSY for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 22:24:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C9124012E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C9124012E
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 22:24:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07AE987B3D; Tue, 27 Feb 2024 22:24:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 23:22:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4533e42622e46f2b8e0ce4d1936c6534393d3aa1
X-Git-Newrev: 67f6d1dad2d4dd2af64a9eae6935e75147cd7bd2
X-Patchwork-Hint: ignore
Message-Id: <20240227222447.07AE987B3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: update PCRE
 dependency to PCRE2
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

commit: https://git.buildroot.net/buildroot/commit/?id=67f6d1dad2d4dd2af64a9eae6935e75147cd7bd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

micropython-lib/unix-ffi/re/re.py uses libpcre2-8 since commit d8e163b.
Thus, update micropython package to select the PCRE2 package instead of PCRE.

Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index 26a00baab0..849a5452f4 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -13,7 +13,7 @@ if BR2_PACKAGE_MICROPYTHON
 
 config BR2_PACKAGE_MICROPYTHON_LIB
 	bool "micropython-lib"
-	select BR2_PACKAGE_PCRE # runtime
+	select BR2_PACKAGE_PCRE2 # runtime
 	help
 	  Core Python libraries ported to MicroPython.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
