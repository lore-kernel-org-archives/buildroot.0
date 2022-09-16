Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EB2ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B3ED61223;
	Fri, 16 Sep 2022 11:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B3ED61223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGRZprh5Yl0P; Fri, 16 Sep 2022 11:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 688E86121B;
	Fri, 16 Sep 2022 11:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 688E86121B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 375231BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20BB261221
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BB261221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WldJPq7MoLS for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 581E961207
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 581E961207
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 488C483CBA; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:20:39 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 1f6d55ad8421ca89fb5890372df616b8e63cc2a6
X-Git-Newrev: ed208006659a68c3c091b356e5dd85aa290e2919
X-Patchwork-Hint: ignore
Message-Id: <20220916114714.488C483CBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/uclibc: drop old
 SPARC symbols
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed208006659a68c3c091b356e5dd85aa290e2919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 59244619944725e7d01619829d80d15dfd7c19c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
