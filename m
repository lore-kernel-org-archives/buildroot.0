Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CEDC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 19:17:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405986136A
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 19:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 405986136A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7E6E80FEF;
	Tue, 28 Sep 2021 19:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdfcOmFLBH6e; Tue, 28 Sep 2021 19:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 531AB81004;
	Tue, 28 Sep 2021 19:17:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8599E1BF404
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 19:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E20340594
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 19:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLPGpTdIQ5NI for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 19:17:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5764C40586
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 19:17:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 468998D457; Tue, 28 Sep 2021 19:15:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 21:17:17 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: f95ef2e65d48ac3e868f1481a5cac2a9941638fa
X-Git-Newrev: 96a48f122250335f6a5d76d5ea1c6c9d9d8d461d
X-Patchwork-Hint: ignore
Message-Id: <20210928191504.468998D457@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libvirt: disable
 docs and tests
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

commit: https://git.buildroot.net/buildroot/commit/?id=96a48f122250335f6a5d76d5ea1c6c9d9d8d461d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Disable docs and tests which are enabled since the addition of the
package in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a1fa1d4b709be2d73acd113b5a8c5930f37e7b14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvirt/libvirt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 847c35e06e..396dd61577 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -33,6 +33,7 @@ LIBVIRT_CONF_ENV += \
 LIBVIRT_CONF_OPTS = \
 	-Drpath=disabled \
 	-Dapparmor=disabled \
+	-Ddocs=disabled \
 	-Ddriver_bhyve=disabled \
 	-Ddriver_esx=disabled \
 	-Ddriver_hyperv=disabled \
@@ -41,10 +42,12 @@ LIBVIRT_CONF_OPTS = \
 	-Ddriver_openvz=disabled \
 	-Ddriver_remote=enabled \
 	-Ddriver_secrets=enabled \
+	-Ddriver_test=disabled \
 	-Ddriver_vbox=disabled \
 	-Ddriver_vmware=disabled \
 	-Ddriver_vz=disabled \
 	-Ddtrace=disabled \
+	-Dexpensive_tests=disabled \
 	-Dfirewalld=disabled \
 	-Dfirewalld_zone=disabled \
 	-Dglusterfs=disabled \
@@ -64,6 +67,7 @@ LIBVIRT_CONF_OPTS = \
 	-Dstorage_mpath=disabled \
 	-Dsysctl_config=enabled \
 	-Dtest_coverage=false \
+	-Dtests=disabled \
 	-Dudev=enabled \
 	-Dwireshark_dissector=disabled
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
