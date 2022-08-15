Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86770C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C2FD81372;
	Mon, 15 Aug 2022 09:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C2FD81372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiwILDmtUEpN; Mon, 15 Aug 2022 09:18:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C5E81365;
	Mon, 15 Aug 2022 09:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22C5E81365
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15BC21BF990
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D519540AF0
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D519540AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLEX9bH8zzoy for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CFDB408D0
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CFDB408D0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 43D86875A3; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a8753719312bdc99785f59896bbe4455ba69d8a
X-Git-Newrev: 59244619944725e7d01619829d80d15dfd7c19c2
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.43D86875A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: drop old SPARC symbols
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59244619944725e7d01619829d80d15dfd7c19c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_sparc_v7 was removed in 2013 in commit '16bcf46a63 arch/sparc: drop
old SUN-specific variants'.

BR2_sparc_sparchfleon and BR2_sparc_sparchfleonv8 were moved to legacy
handling in 2014 in commit '43b78e7285 arch: sparc: Add leon3 cpu type
and remove sparc{s,h}fleon{,v8}' and later removed from legacy handling
in 2020.

So drop the remaining references for these symbols.

Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index ba8b5885ec..2555487f06 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -159,8 +159,7 @@ config BR2_UCLIBC_SH_TYPE
 
 config BR2_UCLIBC_SPARC_TYPE
 	string
-	default "V7"	if BR2_sparc_v7 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
-	default "V8"	if BR2_sparc_v8 || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
+	default "V8"	if BR2_sparc_v8
 	depends on BR2_UCLIBC_TARGET_ARCH = "sparc"
 
 config BR2_UCLIBC_POWERPC_TYPE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
