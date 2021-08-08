Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74B4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:07:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CBE60EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43CBE60EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05CE6402DD;
	Sun,  8 Aug 2021 21:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUNxZsNXXOHe; Sun,  8 Aug 2021 21:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53888402AD;
	Sun,  8 Aug 2021 21:06:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED1591BF42E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6ACF82993
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJDqYBglDYTV for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:06:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C41882978
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 21:06:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C1D908D2F9; Sun,  8 Aug 2021 21:06:36 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 23:06:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27b032941ab4b5ea81cee7f9e10e21ffea258616
X-Git-Newrev: c9b496bf180c21ede9efda694f2dc88af05ddd16
X-Patchwork-Hint: ignore
Message-Id: <20210808210636.C1D908D2F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: nss needs yajl
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9b496bf180c21ede9efda694f2dc88af05ddd16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nss can't be built without yajl since the additoon of the package in
commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

../output-1/build/libvirt-7.4.0/meson.build:1986:6: ERROR: Problem encountered: Can't build nss plugin without yajl

Fixes:
 - http://autobuild.buildroot.org/results/18db9ec30d5e60fbe9f5096c3fd1a30396e11856

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvirt/libvirt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 108996942d..b36cf3fb60 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -187,8 +187,8 @@ else
 LIBVIRT_CONF_OPTS += -Dlibssh=disabled
 endif
 
-# Can't build nss plugin without network
-ifeq ($(BR2_PACKAGE_LIBNSS),y)
+# Can't build nss plugin without network or yajl
+ifeq ($(BR2_PACKAGE_LIBNSS)$(BR2_PACKAGE_YAJL),yy)
 LIBVIRT_CONF_OPTS += -Dnss=enabled
 LIBVIRT_DEPENDENCIES += libnss
 else
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
