Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3CBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:55:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7571961502
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7571961502
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51CD283434;
	Wed, 29 Sep 2021 14:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4jjatnBgQ83; Wed, 29 Sep 2021 14:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2530832DC;
	Wed, 29 Sep 2021 14:55:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EF321BF426
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DC3A600BB
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SyvbxaDA30WT for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 14:55:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9342360BE8
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 14:55:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A80BE8D4B2; Wed, 29 Sep 2021 14:52:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 16:45:36 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7786d71922fa33d7c51c8946b4ab80f051fb7ae1
X-Git-Newrev: 9d772f2c49666016ecdc6a5838367bfb18f454e9
X-Patchwork-Hint: ignore
Message-Id: <20210929145255.A80BE8D4B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/bind: security
 bump version to 9.11.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d772f2c49666016ecdc6a5838367bfb18f454e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Named failed to check the opcode of responses when performing zone
refreshes, stub zone updates, and UPDATE forwarding.  This could lead to an
assertion failure under certain conditions and has been addressed by
rejecting responses whose opcode does not match the expected value. [GL #2762]

For details, see the release notes:
https://downloads.isc.org/isc/bind9/9.11.35/RELEASE-NOTES-bind-9.11.35.html

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6977ee6e0ecf9cc9b24e5f41f9598f22fd0fcaf3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 9311d82d6d..12b80149c5 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.11.31/bind-9.11.31.tar.gz.asc
-# with key 2455774D42FDFE6B9C383EB8FE1002BC5970811F
-sha256  f5f24457f42b2e86870d887596e47500e4d40521a098dcb96f3a06f18adfa36a  bind-9.11.31.tar.gz
+# Verified from https://ftp.isc.org/isc/bind9/9.11.35/bind-9.11.35.tar.gz.asc
+# with key E9AB6E79233C0416E8993F450C03AFA90A5967C4
+sha256  1c882705827b6aafa45d917ae3b20eccccc8d5df3c4477df44b04382e6c47562  bind-9.11.35.tar.gz
 sha256  cad49daa42654bc241762cd998630168a2542c8fd6fad3881e2eac1510bb6fcd  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index a5c246a54a..0d95da209c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.11.31
+BIND_VERSION = 9.11.35
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
