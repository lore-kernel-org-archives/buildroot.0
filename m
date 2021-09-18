Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D616DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:14:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8482361074
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8482361074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F00C8299D;
	Sat, 18 Sep 2021 20:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gooCiirU8poE; Sat, 18 Sep 2021 20:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B47688291C;
	Sat, 18 Sep 2021 20:14:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0A5D1BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9A5A605FB
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIDoKrGd7aD7 for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:13:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D943B60604
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:13:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id EFC818B6B3; Sat, 18 Sep 2021 20:11:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 22:09:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6ecda7615675061c96eca2268aa462e0e2c5b4c
X-Git-Newrev: 9badccc9d4887aa2365d7350e3b26bd4250dad48
X-Patchwork-Hint: ignore
Message-Id: <20210918201128.EFC818B6B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: bump version to 1.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=9badccc9d4887aa2365d7350e3b26bd4250dad48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Changelog (since 1.14, from [1]):

  ver 1.17:
    Fix issue with sending additional and vendor IEs.
    Fix issue with IE ordering for 802.11-2020 support.
    Fix issue with frequency update on channel switch events.
    Fix issue with drivers and handling of IF_OPER_UP setting.

  ver 1.16:
    Fix issue with writing provisioning files with a passphrase.
    Add support for Authenticator & Supplicant RSN Extension elements.
    Add support for handling Transition Disable info.
    Add support for SAE Hash-to-Element feature.

  ver 1.15:
    Add support for FT-over-DS procedure with multiple BSS.
    Add support for estimation of VHT RX data rate.
    Add support for exporting Daemon information.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 9decf459f9..9bd8f9c252 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  21be6ad59ba666ba1e50e01889d647472b9b2f96f4941123db036fd33c257f0b  iwd-1.14.tar.xz
+sha256  6f946f823b0dc3205e4e72becf8ad1915448d194f5b10d8003e4c8c5a18e4ef7  iwd-1.17.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 171c96edcf..9737f2c626 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.14
+IWD_VERSION = 1.17
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
