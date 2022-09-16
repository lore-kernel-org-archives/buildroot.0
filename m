Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A03C54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D689761228;
	Fri, 16 Sep 2022 11:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D689761228
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dnz-5hPNclMF; Fri, 16 Sep 2022 11:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD66061306;
	Fri, 16 Sep 2022 11:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD66061306
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DB8F1BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3D2541CAC
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D2541CAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jtFydnFKATAd for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCA5041C7B
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCA5041C7B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A36F383CC0; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:25:23 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 55e3e3ede88026b1c6ebfac9b4c480ce35971962
X-Git-Newrev: 1b80413afde1fe45249ca419f655d375fa4eb793
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.A36F383CC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libglvnd: fix
 typo on BR2_PACKAGE_XORGPROTO
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b80413afde1fe45249ca419f655d375fa4eb793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The typo was added in 2020 by commit
'0378e2e5d9 package/libglvnd: new package'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b414af8ac5590498c4150898ea6de7e63c254800)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglvnd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
index d020c21465..f471e289bd 100644
--- a/package/libglvnd/Config.in
+++ b/package/libglvnd/Config.in
@@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBGLVND_DISPATCH_GL
 	depends on BR2_PACKAGE_XORG7 # libx11, libXext, xorgproto
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_XORGPROTO
+	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_HAS_LIBGL
 
 config BR2_PACKAGE_LIBGLVND_DISPATCH_EGL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
