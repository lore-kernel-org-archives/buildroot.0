Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF8FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 15:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D06D1404EB;
	Thu, 10 Feb 2022 15:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KqRmnF7kDyDK; Thu, 10 Feb 2022 15:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B87B04056D;
	Thu, 10 Feb 2022 15:30:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8981E1BF3DB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78D4160BA8
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaTC0fDqNa0P for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 15:29:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87D8E60B79
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:29:35 +0000 (UTC)
Received: from opfednr01.francetelecom.fr (unknown [xx.xx.xx.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr27.francetelecom.fr (ESMTP service) with ESMTPS id 4Jvgf54zcdz4ws4; 
 Thu, 10 Feb 2022 16:29:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644506973;
 bh=0xBI7Nra0jNFGCjVWPnLyi1DwoqKAKhizlPPLS9JBzY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=friQ42tWnDbZ1993q5DjgktdR33kokAHdIFxQWSldcjPCtq7Dds6JI3vTULU20pxK
 w0SGbCDp8wFuFGlGs9NKGFhIIexL+d/nWmNtFxv+9uHAVMMaDUJaumz4piou1sXFHA
 cdlI3VPi+Yw/Z9IOrz9+qpes7MA4XxBNpZZ0A/F/NqyzumDbKFV7wBxq3VleXBDTuS
 S3Ch8PEmgtsFRMDJZbRrDuvE4GM+vAD/BTZB6KgYkgifwSOTpe6t8IpXRIdvUYgivR
 z5tU6z4G/qmBtUJ1vB6O7uajgBhyL3FaQuMk2s9VhBfllJUpZUdPPHC9+Oxg91V0r9
 A/P7U3Jc1dyhg==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 16:29:31 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 10 Feb 2022 16:29:26 +0100
Message-ID: <11363_1644506973_62052F5D_11363_173_9_da4c09036712600e0ab76db801a5a5c693bfa267.1644506959.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644506959.git.yann.morin@orange.com>
References: <cover.1644506959.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 3/5 v3] package/pkg-cargo: host-rustc is also a
 build dependency
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Currently, host-rustc is a download dependency, because we need cargo
for the vendoring during the download step.

However, when using a package in override-srcdir, there is no download
step, so host-rustc is not pulled in as a dependency which breaks
running the build of a single package from scratch:
    $ make clean
    $ make my-rust-package
    [...]
    [...] cargo build --offline --release --manifest-path Cargo.toml --locked
    /bin/sh: cargo: command not found

We fix that by adding host-rustc as a standard dependency too.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 8b246abfed..6f5125f1d4 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -65,8 +65,10 @@ HOST_PKG_CARGO_ENV = \
 
 define inner-cargo-package
 
-# We need host-rustc to run cargo
+# We need host-rustc to run cargo at download time (for vendoring),
+# and at build and install time.
 $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
+$(2)_DEPENDENCIES += host-rustc
 
 $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
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
