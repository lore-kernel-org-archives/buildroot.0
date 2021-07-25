Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F348CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:29:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B113260F46
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B113260F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 826AB401F5;
	Wed,  4 Aug 2021 00:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJQxwG1_3FCc; Wed,  4 Aug 2021 00:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F3984063D;
	Wed,  4 Aug 2021 00:29:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15C431BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D44DA414EC
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1S72HYG6L5aF for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BED9404A8
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7CF1D83FBA; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 10:01:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 94640cc8e9e306de38675dde23c23771b8ba65da
X-Git-Newrev: dfa4a4dd2a9495ac7aabefb7c45f2c74bf1eab2e
X-Patchwork-Hint: ignore
Message-Id: <20210803211016.7CF1D83FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/netsnmp: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfa4a4dd2a9495ac7aabefb7c45f2c74bf1eab2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 87bef179222e wrongly removed hash of COPYING

Fixes: 87bef179222ee8a0b0f39c8f96113a4ecf813085

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netsnmp/netsnmp.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/netsnmp/netsnmp.hash b/package/netsnmp/netsnmp.hash
index e3adb28c6d..9d196c8bee 100644
--- a/package/netsnmp/netsnmp.hash
+++ b/package/netsnmp/netsnmp.hash
@@ -2,3 +2,6 @@
 # https://sourceforge.net/projects/net-snmp/files/net-snmp/5.9/net-snmp-5.9.tar.gz.asc
 # using key D0F8F495DA6160C44EFFBF10F07B9D2DACB19FD6
 sha256  04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071  net-snmp-5.9.tar.gz
+
+# Hash for license file
+sha256  ed869ea395a1f125819a56676385ab0557a21507764bf56f2943302011381e59  COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
