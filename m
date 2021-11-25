Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E805DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 19:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80EF3408EC;
	Thu, 25 Nov 2021 19:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHQKzUstbxf8; Thu, 25 Nov 2021 19:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6E30408F6;
	Thu, 25 Nov 2021 19:55:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7E011C1148
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3C0E401D9
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HinTRyX29K5e for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 19:54:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEBAD4019F
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 19:54:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B2B3D8F53B; Thu, 25 Nov 2021 19:49:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 20:49:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d0536d82d722f46c235ab99e916c4ab67f46292
X-Git-Newrev: 83eeee84e1dae273851ba8dcf01e5f0fcfccbb1a
X-Patchwork-Hint: ignore
Message-Id: <20211125194954.B2B3D8F53B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nss-myhostname: rename
 MYHOSTNAME_SET_NSSWITCH
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

commit: https://git.buildroot.net/buildroot/commit/?id=83eeee84e1dae273851ba8dcf01e5f0fcfccbb1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/nss-myhostname/nss-myhostname.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nss-myhostname/nss-myhostname.mk b/package/nss-myhostname/nss-myhostname.mk
index 08683a542b..b1bdca8ef1 100644
--- a/package/nss-myhostname/nss-myhostname.mk
+++ b/package/nss-myhostname/nss-myhostname.mk
@@ -10,11 +10,11 @@ NSS_MYHOSTNAME_LICENSE = LGPL-2.1+
 NSS_MYHOSTNAME_LICENSE_FILES = LICENSE
 
 # add myhostname after files if missing
-define MYHOSTNAME_SET_NSSWITCH
+define NSS_MYHOSTNAME_SET_NSSWITCH
 	$(SED) '/^hosts:/ {/myhostname/! s/files/files myhostname/}' \
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
-NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += MYHOSTNAME_SET_NSSWITCH
+NSS_MYHOSTNAME_TARGET_FINALIZE_HOOKS += NSS_MYHOSTNAME_SET_NSSWITCH
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
