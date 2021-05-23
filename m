Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDE8C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:46:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7AF60525
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD7AF60525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA12E608F5;
	Tue,  3 Aug 2021 22:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7g3kUgUHgZ9w; Tue,  3 Aug 2021 22:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C30C60681;
	Tue,  3 Aug 2021 22:46:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49AF81BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9779405F7
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoCn8rH25SBK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5D3840430
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0877C810E2; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 May 2021 20:03:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5dfb873acfd85196fe141a3e5b9fd170a4c36094
X-Git-Newrev: 65c9ebcd90b3686e488c1d638ce5e664d0c18fae
X-Patchwork-Hint: ignore
Message-Id: <20210803210945.0877C810E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnids: drop
 LIBNIDS_IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=65c9ebcd90b3686e488c1d638ce5e664d0c18fae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

NVD database has been updated:
https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:libnids_project:libnids:1.24:*:*:*:*:*:*:*

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnids/libnids.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index 4a9138b80e..3e36838c40 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -13,10 +13,6 @@ LIBNIDS_INSTALL_STAGING = YES
 LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
 LIBNIDS_AUTORECONF = YES
 
-# CVE-2010-0751 was fixed in libnids v1.24 but the NVD database is not
-# aware of the fix, ignore it until this is updated
-LIBNIDS_IGNORE_CVES += CVE-2010-0751
-
 # disable libnet if not available
 # Tests in configure.in expect --with-libnet=$build_dir
 # not an installation patch like in our context.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
