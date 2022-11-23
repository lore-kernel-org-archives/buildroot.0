Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96600C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49636820C6;
	Wed, 23 Nov 2022 21:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49636820C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Js0fy0vc9qYn; Wed, 23 Nov 2022 21:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 816B9820BC;
	Wed, 23 Nov 2022 21:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 816B9820BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 605B31BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AC8441638
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC8441638
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCJGlykdRGVn for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:50:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3078C415CD
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3078C415CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DB4E843AC; Wed, 23 Nov 2022 21:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 22:46:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2e75ef9ce5a5aa363a6200504913c736bf5a46e6
X-Git-Newrev: ce2db7b986f6735a1ab840d222de5c590fd2431a
X-Patchwork-Hint: ignore
Message-Id: <20221123215050.1DB4E843AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uuu: bump to version
 1.5.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce2db7b986f6735a1ab840d222de5c590fd2431a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Add nvme_all build-in command
- Add Write command to allow use mmc write to write image
- Fixed race conditions of g_last_error_str and g_last_err_id variables
- Add support for stm vendor fastboot

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 50da0f9bf3..cc1cd83266 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  baaf3e031958075b96530d43d7435f19cb428088894066e0b02349a3b9666666  uuu_source-1.5.4.tar.gz
+sha256  932c0a4acde0f52b907f5693c6d133c83142c4ca6e9df05a38b3ac1e50628883  uuu_source-1.5.11.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 681c1fbc44..647015e2dd 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.4
+UUU_VERSION = 1.5.11
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
