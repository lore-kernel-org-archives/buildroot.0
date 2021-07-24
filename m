Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E3BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:07:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D33560E96
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D33560E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20DD160746;
	Sat, 24 Jul 2021 20:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xEE5bp5rX6cs; Sat, 24 Jul 2021 20:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E17160636;
	Sat, 24 Jul 2021 20:07:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 891621BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 805DF400CE
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8bQFwJ4mt9kB for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8704400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3BD2F88912; Sat, 24 Jul 2021 19:32:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 22:06:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05a248571c19d52f11a46c669322e3aaa9713444
X-Git-Newrev: 3662a2f0981d987eb68ad433d24e1987b2a5689a
X-Patchwork-Hint: ignore
Message-Id: <20210724193245.3BD2F88912@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=3662a2f0981d987eb68ad433d24e1987b2a5689a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a87d99af2f88eb2755959163727584f673483748 forgot to update hash
of COPYING which was updated to replace master by main reference with
https://gitlab.freedesktop.org/libinput/libinput/-/commit/354df8bce9874e92de2ad8535fdcedaec0755b27

Fixes:
 - http://autobuild.buildroot.org/results/b82d53ac70737488dd780a7112fc7ea0153768ba

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libinput/libinput.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index de8e94f9fa..7958cbac88 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -3,4 +3,4 @@ sha256  18c6a286583268d39841348e561fbb4713bde0c643b360f5d8a3f27800afdb9a  libinp
 sha512  9a834f075d7a1f892416bb6b241eb052f749d3aa883c4b39c0f1c9616c115d6b9a541b587508646fddaf0d3fe57af92fe4629b522d1d51196499e7b523e0aa90  libinput-1.18.0.tar.xz
 
 # License files
-sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
+sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
