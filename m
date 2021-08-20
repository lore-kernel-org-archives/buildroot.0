Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FD8C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:42:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97EC360E52
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97EC360E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74203830A7;
	Sat,  4 Sep 2021 18:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZfvKL26HOud; Sat,  4 Sep 2021 18:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4D1A83183;
	Sat,  4 Sep 2021 18:42:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6891BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B2DD401DF
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APNMk3Zzasl0 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BD7340266
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 208CA8834A; Sat,  4 Sep 2021 18:23:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 22:29:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82f5b3724bfe3ab262a384af61f3d2faf9c6c0a5
X-Git-Newrev: 60bde2995b65d4f326cf2706bd784193ec1531bf
X-Patchwork-Hint: ignore
Message-Id: <20210904182355.208CA8834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: fix licensing info
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60bde2995b65d4f326cf2706bd784193ec1531bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
