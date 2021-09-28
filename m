Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C6AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:36:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD27B60EFF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 20:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD27B60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CC36405E9;
	Tue, 28 Sep 2021 20:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggBiKIHCNMGZ; Tue, 28 Sep 2021 20:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F18840175;
	Tue, 28 Sep 2021 20:36:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B47181BF5E6
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A430340815
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 20:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G0_vm5vc0VGL for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 20:36:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D321140724
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 20:36:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AD1B28D45D; Tue, 28 Sep 2021 20:33:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 22:35:52 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 1cebcd27b86f57b41c0de7f1ff3ab6ddf49ca9a6
X-Git-Newrev: 5792946eb9baf02fdf3d2743a08d6eb8a19100e4
X-Patchwork-Hint: ignore
Message-Id: <20210928203356.AD1B28D45D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libvirt: security
 bump to version 7.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5792946eb9baf02fdf3d2743a08d6eb8a19100e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- storage: Unlock pool objects on ACL check failures in
  storagePoolLookupByTargetPath (CVE-2021-3667)

  A logic bug in storagePoolLookupByTargetPath where the storage pool
  object was left locked after a failure of the ACL check could
  potentially deprive legitimate users access to a storage pool object
  by users who don't have access.

- svirt: fix MCS label generation (CVE-2021-3631)

  A flaw in the way MCS labels were generated could result in a VM's
  resource not being fully protected from access by another VM were
  it to be compromised. https://gitlab.com/libvirt/libvirt/-/issues/153

- Disable Cloud-Hypervisor driver added by
  https://gitlab.com/libvirt/libvirt/-/commit/56fbabf1a1e272c6cc50adcb603996cf8e94ad08

- Update indentation in hash file (two spaces)

https://gitlab.com/libvirt/libvirt/-/blob/v7.7.0/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 93cbbb2ce8b1e196e7a22fd43a31fe8c932b9605)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/libvirt.hash | 4 ++--
 package/libvirt/libvirt.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libvirt/libvirt.hash b/package/libvirt/libvirt.hash
index ec96dfc62c..e8cbb34e2a 100644
--- a/package/libvirt/libvirt.hash
+++ b/package/libvirt/libvirt.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 b366d73dee6ce77a226bedef592e0620ceb8e22e5998f60768017f79fc4ead26  libvirt-7.4.0.tar.xz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  1b616099c18d14b9424a622f2a0bd3e0cfa286414f3416bd1a8173621b2252b2  libvirt-7.7.0.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index f30baaab71..0f6c7cef7f 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVIRT_VERSION = 7.4.0
+LIBVIRT_VERSION = 7.7.0
 LIBVIRT_SITE = https://libvirt.org/sources
 LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
@@ -35,6 +35,7 @@ LIBVIRT_CONF_OPTS = \
 	-Dapparmor=disabled \
 	-Ddocs=disabled \
 	-Ddriver_bhyve=disabled \
+	-Ddriver_ch=disabled \
 	-Ddriver_esx=disabled \
 	-Ddriver_hyperv=disabled \
 	-Ddriver_interface=enabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
