Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEA2C0015E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 13:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDDF560EFB;
	Mon, 17 Jul 2023 13:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDDF560EFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24izsCmsIG8y; Mon, 17 Jul 2023 13:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09FB560B8A;
	Mon, 17 Jul 2023 13:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09FB560B8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A40971BF2BD
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07F31400C5
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 13:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F31400C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSToDdVa13_v for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42E5F40514
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E5F40514
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 310E5872F0; Mon, 17 Jul 2023 13:17:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 15:01:25 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: ecdd588f4343d8e336571d331d61b87d91e72a9a
X-Git-Newrev: 747f62053c52a54ba2b603f3909371e3bd993809
X-Patchwork-Hint: ignore
Message-Id: <20230717131709.310E5872F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/fwts: fix build
 with BR2_OPTIMIZE_0
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

commit: https://git.buildroot.net/buildroot/commit/?id=747f62053c52a54ba2b603f3909371e3bd993809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/fab/fabd031d38cb618cdb11b4a86cd853b0da61695b/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4a239f14efdd4eb0fcbf89d403cde4dd31205a41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwts/fwts.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index f04c7a848f..3af54a1afd 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -15,6 +15,10 @@ FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf libglib2 libbsd \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
+ifeq ($(BR2_OPTIMIZE_0),y)
+FWTS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -O1"
+endif
+
 ifeq ($(BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE),y)
 FWTS_MODULE_SUBDIRS = efi_runtime
 $(eval $(kernel-module))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
