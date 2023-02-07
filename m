Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC81EC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AAF140934;
	Tue,  7 Feb 2023 10:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AAF140934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPaGmE_j6ET8; Tue,  7 Feb 2023 10:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70FCA4092C;
	Tue,  7 Feb 2023 10:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70FCA4092C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD7501BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A718960E55
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A718960E55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2pOrtUzn5GS for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:39:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB0F760B00
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB0F760B00
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B682384033; Tue,  7 Feb 2023 10:39:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 11:39:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26893ab1c67d7df8c1b71269051ad41b5ea03e5e
X-Git-Newrev: 7ff52ac09b1c21fdce65deae39127b31d47858e9
X-Patchwork-Hint: ignore
Message-Id: <20230207103959.B682384033@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: bump to version 1.5.21
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ff52ac09b1c21fdce65deae39127b31d47858e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fixed android super.img loop download 52byte after some block
- Use login header as in curl
- Skip sleep in usb_add
- Add empty line after input password
- linux prompt ask user name and password for http(s) download
- fix linux build failure

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index cc1cd83266..a5b665620c 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  932c0a4acde0f52b907f5693c6d133c83142c4ca6e9df05a38b3ac1e50628883  uuu_source-1.5.11.tar.gz
+sha256  e89d3665af499ab71360d948176cf64619b082f8272a994d1fbfc000e67c0f14  uuu_source-1.5.21.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 647015e2dd..1a5f84ce4d 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.11
+UUU_VERSION = 1.5.21
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
