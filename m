Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A665C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A3DF60F86;
	Mon, 15 Aug 2022 09:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A3DF60F86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMbGNKIRXg6H; Mon, 15 Aug 2022 09:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4381660F68;
	Mon, 15 Aug 2022 09:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4381660F68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49EE31BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D39AE40AEE
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D39AE40AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ehOeJ30_UNf for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C72E40AD1
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C72E40AD1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6645F875A7; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47e09eaee7dd582270e3f41865aef4f7db025ad4
X-Git-Newrev: ce2dd77d0076d0ef9a788fb3de38403fe39ac8b3
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.6645F875A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolftpm: fix typo on
 BR2_PACKAGE_WOLFTPM_NUVOTON
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce2dd77d0076d0ef9a788fb3de38403fe39ac8b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The typo was added by commit 'd0dcc62c4b package/wolftpm: Add config
options for TPM 2.0 extra capabilities'

Cc: Dimitar Tomov <dimi@tpm.dev>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolftpm/wolftpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index d3f693a62e..7e8a108585 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -41,7 +41,7 @@ else
 WOLFTPM_CONF_OPTS += --disable-st33
 endif
 
-ifeq ($(BR2_PACKAGE_WOLFTPM_NPCT750),y)
+ifeq ($(BR2_PACKAGE_WOLFTPM_NUVOTON),y)
 WOLFTPM_CONF_OPTS += --enable-nuvoton
 else
 WOLFTPM_CONF_OPTS += --disable-nuvoton
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
