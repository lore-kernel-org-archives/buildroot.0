Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03787C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:37:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C88AE60295
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C88AE60295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C6076F902;
	Wed,  4 Aug 2021 00:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOIm4AiBZ7ew; Wed,  4 Aug 2021 00:37:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED89760E4A;
	Wed,  4 Aug 2021 00:37:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFEE1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5B8840266
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_pkv5jNmxsw for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67F8440F6A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B33A085445; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:27:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 69324af6c8b61d0a4fdbedff80b7eba1ab99f6f3
X-Git-Newrev: 0ba7a0fd52dd0633b50a11686ebe486c9a6f33f8
X-Patchwork-Hint: ignore
Message-Id: <20210803211018.B33A085445@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/samba4: needs host-flex
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ba7a0fd52dd0633b50a11686ebe486c9a6f33f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

host-flex is needed to avoid the following build failure since bump to
version 4.14.3 in commit 7df2611e9e93f9c3efea39bf0b5c217564618a28 due to
https://gitlab.com/samba-team/samba/-/commit/942c0d2128cb8e64a9354dde6bdae82a1c1c3d88

Checking for flex
Checking for program 'flex'                                                                     : not found
Embedded Heimdal build requires flex but it was not found.  Install flex or use --with-system-mitkrb5 or --with-system-heimdalkrb5

Fixes:
 - http://autobuild.buildroot.org/results/b9ed8be51a0eef77d6e48755861ae266c3b9f811

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 69f4ad26e5..c612ac23ba 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -13,7 +13,7 @@ SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_CPE_ID_VENDOR = samba
 SAMBA4_CPE_ID_PRODUCT = samba
 SAMBA4_DEPENDENCIES = \
-	host-e2fsprogs host-heimdal host-nfs-utils \
+	host-e2fsprogs host-flex host-heimdal host-nfs-utils \
 	host-perl host-perl-parse-yapp host-python3 \
 	cmocka e2fsprogs gnutls popt zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
