Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AAEC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:44:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2D7660F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2D7660F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B8AA4058A;
	Wed,  4 Aug 2021 19:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcfXU_7Cp3Ad; Wed,  4 Aug 2021 19:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15DE0404F9;
	Wed,  4 Aug 2021 19:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2728C1BF3FB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A8D960776
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TXjdtKegmzhJ for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 19:43:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D28C60A50
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 19:43:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6221E8B6DB; Wed,  4 Aug 2021 19:42:51 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 21:42:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a778fbb8ad794ea513101c493971497e20f1bbec
X-Git-Newrev: bf44a11cf67fde4ba96928a2a4196103b7ec4ef3
X-Patchwork-Hint: ignore
Message-Id: <20210804194251.6221E8B6DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pulseaudio: add
 SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf44a11cf67fde4ba96928a2a4196103b7ec4ef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for pulseaudio is added by the apps/pulseaudio module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/pulseaudio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 19e08f55ae..372cd98da8 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -11,6 +11,7 @@ PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
+PULSEAUDIO_SELINUX_MODULES = pulseaudio
 PULSEAUDIO_CONF_OPTS = \
 	--disable-default-build-tests \
 	--disable-legacy-database-entry-format \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
