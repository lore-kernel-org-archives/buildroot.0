Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813AAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42AB64112F;
	Thu, 21 Apr 2022 21:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtAl1puy-xUf; Thu, 21 Apr 2022 21:03:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B2094114B;
	Thu, 21 Apr 2022 21:03:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA481C1189
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C030F41700
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KP7Xu44Gm6Xc for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E79FF419DA
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:02:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AAE1D84105; Thu, 21 Apr 2022 20:52:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 22:32:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 530c72ad7559e0bdafa86eb81dc1ff2444238e2c
X-Git-Newrev: fb9a422eba604cbdcd78826a6d520146c4fffad2
X-Patchwork-Hint: ignore
Message-Id: <20220421205206.AAE1D84105@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: fix mips64 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb9a422eba604cbdcd78826a6d520146c4fffad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable cc-tests to avoid the following build failure on mips64:

  ERROR: Configured target is mips64 but compiler probe indicates mips32

Fixes:
 - http://autobuild.buildroot.org/results/c44f44f36686268479563afd879db588e15ede7d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/botan/botan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index f9ebcf8d0a..6095844b14 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -15,6 +15,7 @@ BOTAN_INSTALL_STAGING = YES
 
 BOTAN_CONF_OPTS = \
 	--cpu=$(BR2_ARCH) \
+	--disable-cc-tests \
 	--os=linux \
 	--cc=gcc \
 	--cc-bin="$(TARGET_CXX)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
