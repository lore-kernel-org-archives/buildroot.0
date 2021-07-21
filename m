Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7557BC07E9B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 07:26:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E73760230
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 07:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E73760230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1761404DE;
	Wed, 21 Jul 2021 07:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 198BbWURiwnM; Wed, 21 Jul 2021 07:26:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30BFC402CB;
	Wed, 21 Jul 2021 07:26:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35E301C1148
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 07:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 245EA402CB
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 07:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOv3aOEEyCGm for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 07:25:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 733DF401F3
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 07:25:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 132B584536; Wed, 21 Jul 2021 06:51:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 09:25:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5906644b45269b1a5fe109cb64fad837e4fbff2
X-Git-Newrev: 6dfde38c71f0e46dbcac7ac58fae6ebcc515178a
X-Patchwork-Hint: ignore
Message-Id: <20210721065150.132B584536@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/darkhttpd: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dfde38c71f0e46dbcac7ac58fae6ebcc515178a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9ca64820db6766ad51bc835c86948cbe2c87e209 forgot to update hash of
darkhttpd.c

Fixes:
 - http://autobuild.buildroot.org/results/a1503d8d6f67a3742350b0188b0b2621afe5c476

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/darkhttpd/darkhttpd.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
index c6520ba5b2..af5a2bf8c9 100644
--- a/package/darkhttpd/darkhttpd.hash
+++ b/package/darkhttpd/darkhttpd.hash
@@ -1,3 +1,3 @@
 # Locally generated
 sha256  1d88c395ac79ca9365aa5af71afe4ad136a4ed45099ca398168d4a2014dc0fc2  darkhttpd-1.13.tar.gz
-sha256  3239739831a668d1273c0ef5ae1b2147e0f423288b16ed997d7e695cc7e0a6c9  darkhttpd.c
+sha256  44e784df460954c7760e2eeae69aecb12a3d23ca1c0a4f6047c3c6452b2e2f49  darkhttpd.c
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
