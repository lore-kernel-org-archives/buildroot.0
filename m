Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9432C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 20:30:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5355561164
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 20:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5355561164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA5940714;
	Fri, 20 Aug 2021 20:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZVyQmgOYlmkr; Fri, 20 Aug 2021 20:30:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B4704071B;
	Fri, 20 Aug 2021 20:30:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 577381BF35A
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 20:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46BC240624
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 20:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guyp7-YEy18O for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 20:30:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0F5F4056D
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 20:30:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 13FB68D479; Fri, 20 Aug 2021 20:29:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 22:29:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 82f5b3724bfe3ab262a384af61f3d2faf9c6c0a5
X-Git-Newrev: 60bde2995b65d4f326cf2706bd784193ec1531bf
X-Patchwork-Hint: ignore
Message-Id: <20210820202933.13FB68D479@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl2: fix licensing
 info
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

commit: https://git.buildroot.net/buildroot/commit/?id=60bde2995b65d4f326cf2706bd784193ec1531bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit c80fbf269c02 (package/sdl2: bump version to 2.0.16) properly
updated the hash and license filename in sdl2.hash, but forgot to
update the license filename in sdl2.mk.

Fix that.

Fixes:
    http://autobuild.buildroot.org/results/0d607b1e81fcca7f01c8243df28b9c3d59040711/

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl2/sdl2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 0620c56062..103dc107d2 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -8,7 +8,7 @@ SDL2_VERSION = 2.0.16
 SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
 SDL2_SITE = http://www.libsdl.org/release
 SDL2_LICENSE = Zlib
-SDL2_LICENSE_FILES = COPYING.txt
+SDL2_LICENSE_FILES = LICENSE.txt
 SDL2_CPE_ID_VENDOR = libsdl
 SDL2_CPE_ID_PRODUCT = simple_directmedia_layer
 SDL2_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
