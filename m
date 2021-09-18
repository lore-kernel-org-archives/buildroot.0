Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A0DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 10:47:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B2060EC0
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 10:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79B2060EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A47E425D6;
	Sat, 18 Sep 2021 10:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBb3n5I2bMD1; Sat, 18 Sep 2021 10:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA0A425CD;
	Sat, 18 Sep 2021 10:47:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D37F1BF95A
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 10:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BAFA401B2
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 10:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqqcrlIWK65l for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 10:46:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C224C40019
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 10:46:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BCAFA8B472; Sat, 18 Sep 2021 10:45:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 12:46:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baaf71b9bb13c3c42ed99ae4488e80dcefe28513
X-Git-Newrev: a1fa1d4b709be2d73acd113b5a8c5930f37e7b14
X-Patchwork-Hint: ignore
Message-Id: <20210918104503.BCAFA8B472@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: disable docs and tests
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a1fa1d4b709be2d73acd113b5a8c5930f37e7b14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable docs and tests which are enabled since the addition of the
package in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
