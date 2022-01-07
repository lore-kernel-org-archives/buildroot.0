Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A8EC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29AF0410DC;
	Fri,  7 Jan 2022 18:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ekIsx0EtUOu4; Fri,  7 Jan 2022 18:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC210408D7;
	Fri,  7 Jan 2022 18:27:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4211C115D
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1764A607A4
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gg0vrYxyIZKx for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:27:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 712D2605A9
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:27:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E27B58344C; Fri,  7 Jan 2022 18:21:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:23:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55fcba2a7c41d29f3f93bb37eec1264af4b45fb0
X-Git-Newrev: beac3aef6cf5ce9d09e5ace631faa3a3a9e41900
X-Patchwork-Hint: ignore
Message-Id: <20220107182140.E27B58344C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: install in staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=beac3aef6cf5ce9d09e5ace631faa3a3a9e41900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install libvirt in staging to allow collectd to use it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/libvirt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 9a4788c905..41218c0e53 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -10,6 +10,7 @@ LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
 LIBVIRT_LICENSE_FILES = COPYING
 LIBVIRT_CPE_ID_VENDOR = redhat
+LIBVIRT_INSTALL_STAGING = YES
 LIBVIRT_DEPENDENCIES = \
 	host-libxslt \
 	host-nfs-utils \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
