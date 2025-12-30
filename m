Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97225EE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F59E60BC3;
	Tue, 30 Dec 2025 18:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TCW2rDl4uQV1; Tue, 30 Dec 2025 18:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F3FF60BAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118363;
	bh=iQkpRzzShLwrdyF8kYQb8iaRXBFotMMr8rd/Es64Kso=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P76fFgsouy/dR5a/KcSiEzriB/F+dVatPXk7QdetAgJp+zgNN9bYagZOiFAYya6hy
	 TW4iG1ct75oyqH0BLq/Vt6vcCvtfHKjjg0YH5BK3QMbuABmMmAplZDWoeh3aV24iv5
	 XJTyaz25IHnXyZ5AC/6Gz3pdqEnBPkNYt31dkQIwQRvAexAsHEWp1ZYCfwNn0pJC56
	 QNSJ3LWAoQuEssub1dgf9h7XNX6114j+nGZ1c8wwVKXlZ81vRjdy1XN4ZW9KES9+pq
	 szi46EdojX8WYr9aeSkXYe7OkDoLfmdsYD3D+sXix0n9iTo3mt3RcUKtojGYZ7A53F
	 ZBMcIhpnrHWhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F3FF60BAF;
	Tue, 30 Dec 2025 18:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6721535B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49FC1403F3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zx7bzb0YEvXH for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84BEB403FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84BEB403FD
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 816E087C37; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a8754fd7cd4a53ab457a53afc4e90ce6d96c9c0
X-Git-Newrev: e644b58f51e09a5227146a7b394bff607e69cd7c
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.816E087C37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cegui: remove dependency to
 libfreeimage
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=e644b58f51e09a5227146a7b394bff607e69cd7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to security reasons libfreeimage will be removed from buildroot:
https://sourceforge.net/p/freeimage/discussion/36109/thread/435a3549f4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cegui/cegui.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 2e56322374..835658763e 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -11,6 +11,7 @@ CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
 CEGUI_CONF_OPTS = \
 	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
+	-DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=OFF \
 	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
 	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
 	-DCEGUI_BUILD_RENDERER_OPENGLES=OFF \
@@ -92,11 +93,4 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBFREEIMAGE),y)
-CEGUI_DEPENDENCIES += libfreeimage
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=OFF
-endif
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
