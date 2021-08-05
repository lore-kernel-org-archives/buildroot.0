Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30917C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:43:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F1D260ED6
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F1D260ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5688783B7D;
	Thu,  5 Aug 2021 19:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NfAq_cDrL6oj; Thu,  5 Aug 2021 19:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCDAB83B77;
	Thu,  5 Aug 2021 19:43:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1248E1C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 022AB405F5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPwRr0qmFOle for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:43:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D53A405E9
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:43:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F26CC83CB1; Thu,  5 Aug 2021 19:43:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:41:31 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 423d3a4346f69b978eff95e391e15f819cdb570f
X-Git-Newrev: f79c32fbc1f32313ec7a2c533ec02470645f5fd7
X-Patchwork-Hint: ignore
Message-Id: <20210805194318.F26CC83CB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/samba4: needs
 host-flex
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

commit: https://git.buildroot.net/buildroot/commit/?id=f79c32fbc1f32313ec7a2c533ec02470645f5fd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit 0ba7a0fd52dd0633b50a11686ebe486c9a6f33f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
