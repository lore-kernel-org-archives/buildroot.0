Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFFCC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 522094193E;
	Tue, 22 Nov 2022 22:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 522094193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g093AYW6GQ3b; Tue, 22 Nov 2022 22:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 431DE4193B;
	Tue, 22 Nov 2022 22:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 431DE4193B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D79CC1BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2DDA40A01
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2DDA40A01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUx7aQDSfxIv for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:41:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F024440A13
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F024440A13
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9786841F7; Tue, 22 Nov 2022 22:41:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 23:41:36 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 558946676958ed471d5c72867318a1b61b6e0e69
X-Git-Newrev: a5ebfbdbdfc370cd7ef5b0fcc6c8640f1ee23eb6
X-Patchwork-Hint: ignore
Message-Id: <20221122224154.D9786841F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/unbound: install to
 staging
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a5ebfbdbdfc370cd7ef5b0fcc6c8640f1ee23eb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Needed for Monero:
https://github.com/monero-project/monero/blob/release-v0.18/cmake/FindUnbound.cmake

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unbound/unbound.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index d86d9c2067..7b62522727 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -6,6 +6,7 @@
 
 UNBOUND_VERSION = 1.17.0
 UNBOUND_SITE = https://www.unbound.net/downloads
+UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
 UNBOUND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
