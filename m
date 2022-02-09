Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44767C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6F7E40523;
	Wed,  9 Feb 2022 16:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5vsViChwH_E; Wed,  9 Feb 2022 16:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD0AA404DB;
	Wed,  9 Feb 2022 16:09:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F31991BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E20CE408F9
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6wF66HblHsc for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:09:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27B10408EA
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:09:02 +0000 (UTC)
Received: from opfednr07.francetelecom.fr (unknown [xx.xx.xx.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr22.francetelecom.fr (ESMTP service) with ESMTPS id 4Jv4Z3597zzyvP;
 Wed,  9 Feb 2022 17:08:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1644422939;
 bh=aMpHI16LzG6zvXWnviqypxm+zz9bKifKc0OnANOkhfw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=fH7XXiIaiIvgwOIJw/5yDLqX3QZzYipbJTmJdsiuCV1kANHsX2WrWxaJ/0UVHOHgf
 K1PApKLegauZATXiZsAbPB3xyp2mZFCjJnNJ8O0A3LBwqNItzv+ePlk4AEy45sjox4
 3ocPX4pKs2m2EZzni7L473aABLFXwm3dyIq+9/8WHe/onpjQgldofj2+IffOtGROgF
 WU9Pn6/5EPh1YUmck/I3epMnb2Ab29IHRxSpUL3Y70NzzMDUGsmidqh1z2NEdizH+V
 1b4ACUrfceoAb0n7w8DW9kM3Z/M7H8iyPsiQqKv/ol8s7XCg0zRsfocteMR9g/NQnu
 Ap/cGLwwmPFMQ==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 17:08:54 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 9 Feb 2022 17:08:45 +0100
Message-ID: <9430_1644422939_6203E71B_9430_485_1_951512fc2010b31a4d2d50fe12c2ad86f3a0c1a1.1644422916.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644422916.git.yann.morin@orange.com>
References: <cover.1644422916.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX508.corporate.adroot.infra.ftgroup
 (10.115.27.28) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH 3/5 v2] package/pkg-cargo: host-rustc is also a
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
for the vendoring during the downlaod step.

However, when using a package in override-srcdir, there is no download
step, so host-rustc is not pulled in as a dependency which breaks
running the build of a single pcakge from scratch:
    $ make clean
    $ make my-rust-package
    [...]
    [...] cargo build --offline --release --manifest-path Cargo.toml --locked
    /bin/sh: cargo: command not found

We fix that by adding host-rustc as a standard dependency too.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index e1d81197b5..24dd50e399 100644
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
