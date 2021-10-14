Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EEDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:45:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9980E6105A
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9980E6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CFCA4057D;
	Thu, 14 Oct 2021 21:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sAiymbAtGJ-J; Thu, 14 Oct 2021 21:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD65140255;
	Thu, 14 Oct 2021 21:45:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 794D81BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B5CD831D5
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLZI-5Tt0Ejy for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86E298322E
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4FFB89529D; Thu, 14 Oct 2021 21:39:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:33:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c5f47fb360e353f4e26e46f93a02cae0362e21b
X-Git-Newrev: e11b068d6a4d98cb6ae440c528ab5e124fb974cc
X-Patchwork-Hint: ignore
Message-Id: <20211014213947.4FFB89529D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: depend on host-python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=e11b068d6a4d98cb6ae440c528ab5e124fb974cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wpewebkit builds without issue using host-python3.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Acked-By: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpewebkit/wpewebkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 5d5b5f744d..0242f7a288 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -14,7 +14,7 @@ WPEWEBKIT_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WPEWEBKIT_CPE_ID_VENDOR = wpewebkit
 WPEWEBKIT_CPE_ID_PRODUCT = wpe_webkit
-WPEWEBKIT_DEPENDENCIES = host-gperf host-python host-ruby \
+WPEWEBKIT_DEPENDENCIES = host-gperf host-python3 host-ruby \
 	harfbuzz cairo icu jpeg libepoxy libgcrypt libgles libsoup libtasn1 \
 	libpng libxslt openjpeg wayland-protocols webp wpebackend-fdo
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
