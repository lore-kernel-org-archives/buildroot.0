Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80E3C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:48:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 838986105A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 838986105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B55660866;
	Tue,  3 Aug 2021 23:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndlWF7vI7z3I; Tue,  3 Aug 2021 23:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A57026090C;
	Tue,  3 Aug 2021 23:48:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 100BD1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2076240F48
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiabNFLZsizw for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BDB640E6F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E0FCB8283F; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 23:29:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e93cf29a702b9a778b851a158be7eff657f1e9a8
X-Git-Newrev: b784f1bc0fc3ac33a20549069a81ff98260b58e9
X-Patchwork-Hint: ignore
Message-Id: <20210803211008.E0FCB8283F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/spice: security bump
 to version 0.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b784f1bc0fc3ac33a20549069a81ff98260b58e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix CVE-2021-20201: A flaw was found in spice in versions before
0.14.92. A DoS tool might make it easier for remote attackers to cause a
denial of service (CPU consumption) by performing many renegotiations
within a single connection.

https://gitlab.freedesktop.org/spice/spice/-/tags/v0.15.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spice/spice.hash | 2 +-
 package/spice/spice.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spice/spice.hash b/package/spice/spice.hash
index 8f84c2321f..b228f213a5 100644
--- a/package/spice/spice.hash
+++ b/package/spice/spice.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  551d4be4a07667cf0543f3c895beb6da8a93ef5a9829f2ae47817be5e616a114  spice-0.14.3.tar.bz2
+sha256  b320cf8f4bd2852750acb703c15b72856027e5a8554f8217dfbb3cc09deba0f5  spice-0.15.0.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index b515431cf1..ab35265ab4 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_VERSION = 0.14.3
+SPICE_VERSION = 0.15.0
 SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
