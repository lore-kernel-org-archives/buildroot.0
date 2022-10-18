Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A25C4332F
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE5316110C;
	Tue, 18 Oct 2022 19:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5316110C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Yhdu6wXnJ24; Tue, 18 Oct 2022 19:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B5060608;
	Tue, 18 Oct 2022 19:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28B5060608
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 528C31BF95F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E10583E22
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 19:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E10583E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmS3ng394Q3B for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 19:43:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404F88349A
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 404F88349A
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 19:43:24 +0000 (UTC)
Received: from opfednr05.francetelecom.fr (unknown [xx.xx.xx.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr22.francetelecom.fr (ESMTP service) with ESMTPS id 4MsPRY5Fbjz10Ws
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 21:43:21 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 18 Oct 2022 21:43:19 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 18 Oct 2022 21:43:08 +0200
Message-ID: <4895_1666122201_634F01D9_4895_296_1_acafcb63e0879326a88681d7f3d27afeb31ccd51.1666122184.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666122184.git.yann.morin@orange.com>
References: <cover.1666122184.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1666122201;
 bh=DbjA2dGFQEkSlSwIwpgEJjHlErkM4ppQMyszMyB8vwc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=FXNTsQxuDGJyEAN4G72agN0E6skQ6dpB7+BnCEsEJuclcX3IrC46mI7arWShz9fpx
 t8chYow6hDTptXxytVrqVbGfsGNMnCDMkmCtozXhlsa+DLTeVRdWaLrMh9Ega6sive
 fHA5xyaKND36orpq6qui4m+cwFaKLyemhxnxtBRt+VAS9fPSWJTkFIfhNbk3lEenQW
 KxK9sI6R0LUed2Q7FHm/hvZzTn/hvkjf4ioEw+rj/yEaD7glQWS0dgpqSIcQXrSR9r
 CQS3sR5gmmFgrDJXzIS8mzvw+y52oC5qeBNJ8X78gIvc189GWYZOIV11swkGtOp6q5
 sJPOuvnkIdiMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=FXNTsQxu
Subject: [Buildroot] [PATCH 5/6 v3] system: introduce a choice for /var
 management
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we have a single solution to handle the /var content on a
read-only root filesystem, and users can opt out of using it.

We're going to introduce another solution (based on an overlayfs), which
is incompatible with using the factory, so we'll have a choice of three
mutually exclusive options.

Introduce that choice now with just the existing /var factory, and a new
option to opt out of it.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 system/Config.in | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 806a747315..074fda509c 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -156,10 +156,16 @@ endchoice
 
 if BR2_INIT_SYSTEMD
 
-config BR2_INIT_SYSTEMD_VAR_FACTORY
-	bool "build a factory to populate a tmpfs on /var"
-	default y  # legacy
+choice
+	bool "/var management"
+	default BR2_INIT_SYSTEMD_VAR_FACTORY  # legacy
 	depends on !BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
+	help
+	  Select how Buildroot provides a read-write /var when the
+	  rootfs is not remounted read-write.
+
+config BR2_INIT_SYSTEMD_VAR_FACTORY
+	bool "build a factory to populate a tmpfs"
 	help
 	  Build a factory of the content of /var as installed by
 	  packages, mount a tmpfs on /var at runtime, so that
@@ -181,6 +187,15 @@ config BR2_INIT_SYSTEMD_VAR_FACTORY
 	  var.mount unit, that overrides the What and Type, and possibly
 	  the Options and After, fields.
 
+config BR2_INIT_SYSTEMD_VAR_CUSTOM
+	bool "something else"
+	help
+	  Choose this if you have custom dispositions (like a
+	  post-build, fakeroot script, systemd units, or initramfs)
+	  that prepare /var to be writable on a read-only rootfs.
+
+endchoice
+
 config BR2_INIT_SYSTEMD_POPULATE_TMPFILES
 	bool "trigger systemd-tmpfiles during build"
 	default y  # legacy
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
