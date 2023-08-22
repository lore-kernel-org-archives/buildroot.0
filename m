Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F6CEE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0913E41684;
	Tue, 22 Aug 2023 20:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0913E41684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxcQEwa1VTrA; Tue, 22 Aug 2023 20:37:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10D16414D6;
	Tue, 22 Aug 2023 20:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10D16414D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AC381BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41BF781BA8
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41BF781BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvt3USF1S1kB for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:37:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 709F081BD9
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 709F081BD9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E7C4861A5; Tue, 22 Aug 2023 20:37:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 22:36:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8789ea3ad0b91755223105b92808c9f90a38e85d
X-Git-Newrev: 29d8ce9c4130a3e4fb3fdf8ce0bfd896979072c8
X-Patchwork-Hint: ignore
Message-Id: <20230822203731.5E7C4861A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kmscube: add optional
 dependency to libpng
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29d8ce9c4130a3e4fb3fdf8ce0bfd896979072c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

kmscube libpng support was added in:
https://gitlab.freedesktop.org/mesa/kmscube/-/commit/a09d38f94e27dcc5fe52adf99404c821028e3e9d

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmscube/kmscube.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 699af0b6c4..a47df74f7b 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -10,4 +10,10 @@ KMSCUBE_LICENSE = MIT
 KMSCUBE_LICENSE_FILES = COPYING
 KMSCUBE_DEPENDENCIES = host-pkgconf libdrm libegl libgbm libgles
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+KMSCUBE_DEPENDENCIES += libpng
+# libpng is automatically detected in meson, there is no build
+# configuration option to pass.
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
