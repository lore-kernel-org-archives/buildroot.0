Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E39FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 353AA41DB7;
	Sat, 18 Dec 2021 22:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCs1N3xTylPw; Sat, 18 Dec 2021 22:24:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F78C42016;
	Sat, 18 Dec 2021 22:24:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 836721BF23C
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7342484CD3
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zb5vvBC00kRS for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:24:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB64884CB2
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:24:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 78E447F908; Sat, 18 Dec 2021 22:19:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 23:24:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e6ec456ef0c4d90878787a7e3525d9e12b01d02
X-Git-Newrev: ab0c5e305fb48204c99db87a71e461f597a00b2e
X-Patchwork-Hint: ignore
Message-Id: <20211218221928.78E447F908@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmediaart: needs host-vala for
 introspection
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab0c5e305fb48204c99db87a71e461f597a00b2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
3db4d486d689b4a9d59c8f7637211893b0a1cb1b:

../output-1/build/libmediaart-1.9.5/libmediaart/meson.build:63:2: ERROR: Program 'vapigen' not found

Fixes:
 - http://autobuild.buildroot.org/results/189e12686b059ddadf84ced40efcd9875e5e1521

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmediaart/libmediaart.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmediaart/libmediaart.mk b/package/libmediaart/libmediaart.mk
index b4c09d85e1..77665fd95b 100644
--- a/package/libmediaart/libmediaart.mk
+++ b/package/libmediaart/libmediaart.mk
@@ -28,7 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBMEDIAART_CONF_OPTS += -Dintrospection=true
-LIBMEDIAART_DEPENDENCIES += gobject-introspection
+LIBMEDIAART_DEPENDENCIES += host-vala gobject-introspection
 else
 LIBMEDIAART_CONF_OPTS += -Dintrospection=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
