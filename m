Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F56AC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 10:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C708607FE;
	Mon,  3 Jun 2024 10:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YZZewwdb-ee; Mon,  3 Jun 2024 10:23:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 084C560756
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 084C560756;
	Mon,  3 Jun 2024 10:23:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56C3F1BF31A
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 10:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F80D401FB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 10:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LB62ICAgWSW2 for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 10:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D0F3401AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D0F3401AE
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 10:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FE7E879A5; Mon,  3 Jun 2024 10:23:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 12:19:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cdd3d1ccfbf36a921b737749367a70ad29e87a5
X-Git-Newrev: 0e567a1580eaffcf6e18a68747e7d5701bcb176d
X-Patchwork-Hint: ignore
Message-Id: <20240603102339.1FE7E879A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: add optional tpm2
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e567a1580eaffcf6e18a68747e7d5701bcb176d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When tpm2-tss package is selected, systemd can enable its TPM2 support
[1] used by systemd-boot, systemd-cryptenroll (when cryptsetup package
is also enabled) [2] and other tool systemd-pcr{extend,lock,machine}.

[1] https://github.com/systemd/systemd/blob/db11bab38ccf1ed257f310d29070843d4c58ea01/meson.build#L1341
[2] https://www.freedesktop.org/software/systemd/man/latest/systemd-cryptenroll.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8987dc19a6..483b2d24a5 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -577,6 +577,13 @@ else
 SYSTEMD_CONF_OPTS += -Dhibernate=false
 endif
 
+ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
+SYSTEMD_DEPENDENCIES += tpm2-tss
+SYSTEMD_CONF_OPTS += -Dtpm2=true
+else
+SYSTEMD_CONF_OPTS += -Dtpm2=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_BOOT),y)
 SYSTEMD_INSTALL_IMAGES = YES
 SYSTEMD_DEPENDENCIES += gnu-efi host-python-pyelftools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
