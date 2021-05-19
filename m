Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7136BC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:23:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C9D960F0F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C9D960F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F333740441;
	Tue,  3 Aug 2021 21:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egPGfDvA8wDi; Tue,  3 Aug 2021 21:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01C22403F0;
	Tue,  3 Aug 2021 21:23:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1234D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B7E960653
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dy9XMelJBjR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9EAD60673
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 409628B43E; Tue,  3 Aug 2021 21:09:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 May 2021 09:26:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 08194ef1596c7bc9687bc5eff1018c9452a72a04
X-Git-Newrev: 9b83bb13826ac3c34e6fb67a5092d94d98ca6a5d
X-Patchwork-Hint: ignore
Message-Id: <20210803210941.409628B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats:
 verified CPE has a known id but not version
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b83bb13826ac3c34e6fb67a5092d94d98ca6a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently a verified CPE reports the following if versions are not found
 cpe:2.3:a:qemu:qemu:5.2.0:*:*:*:*:*:*:*
 CPE identifier unknown in CPE database (Search)

This patch clarifies the report to state the 'version' is unknown instead
of the 'identifier'.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0cd3674c52..42c36f7f94 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -610,7 +610,7 @@ def check_package_cpes(nvd_path, packages):
         if cpedb.find(p.cpeid):
             p.status['cpe'] = ("ok", "verified CPE identifier")
         else:
-            p.status['cpe'] = ("error", "CPE identifier unknown in CPE database")
+            p.status['cpe'] = ("error", "CPE version unknown in CPE database")
 
 
 def calculate_stats(packages):
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
