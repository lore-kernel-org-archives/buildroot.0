Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F1EC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:59:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D352460BD3
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 12:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D352460BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2CC6403E7;
	Sun, 25 Jul 2021 12:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrZLx7scsZ2y; Sun, 25 Jul 2021 12:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF9D9402F5;
	Sun, 25 Jul 2021 12:59:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 254781BF95A
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5F7960682
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enhNI-WonmHA for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:58:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B41060645
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:58:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0469A88DC9; Sun, 25 Jul 2021 12:23:51 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 14:58:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfe37c448c0a09ec0584a5407cd56e14b89fba65
X-Git-Newrev: 7f3c177b4e9736a65f0bf67666ec84392d8c8dff
X-Patchwork-Hint: ignore
Message-Id: <20210725122352.0469A88DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acpid: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f3c177b4e9736a65f0bf67666ec84392d8c8dff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for acpid is added by the services/acpi module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpid/acpid.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 3473e7b5f6..1214251dc3 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -11,6 +11,7 @@ ACPID_LICENSE = GPL-2.0+
 ACPID_LICENSE_FILES = COPYING
 ACPID_CPE_ID_VENDOR = tedfelix
 ACPID_CPE_ID_PRODUCT = acpid2
+ACPID_SELINUX_MODULES = acpi
 
 define ACPID_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/acpid/acpid.service \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
