Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D148C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:08:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0526E60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0526E60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C52AF40694;
	Wed,  4 Aug 2021 01:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P85kglzts9Tv; Wed,  4 Aug 2021 01:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC77A40640;
	Wed,  4 Aug 2021 01:08:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4821BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C6624149C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XcTZhQlgwTP5 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B583C40F43
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1468C88453; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 22:59:40 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f4408a312752b9456aae92d47bc69e43aaead17
X-Git-Newrev: d9fa248598da41b3291dde834d87218f5c798d4e
X-Patchwork-Hint: ignore
Message-Id: <20210803211027.1468C88453@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wireguard-tools: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9fa248598da41b3291dde834d87218f5c798d4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for wireguard-tools is added by the services/wireguard module in
the SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireguard-tools/wireguard-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index d3d2069846..d2f633be62 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -9,6 +9,7 @@ WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
 WIREGUARD_TOOLS_LICENSE_FILES = COPYING
+WIREGUARD_TOOLS_SELINUX_MODULES = wireguard
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 WIREGUARD_TOOLS_MAKE_OPTS += WITH_SYSTEMDUNITS=yes
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
