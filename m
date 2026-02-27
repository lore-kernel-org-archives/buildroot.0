Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFA0FEFB7C
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D7CC8322A;
	Fri, 27 Feb 2026 19:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqop_c6Vj-it; Fri, 27 Feb 2026 19:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6951983231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772220495;
	bh=br9z8SMzgiTDCcuIRwe2jkv6GW7Rq5WnWej2Iw/mrlY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ddwKx2qZR/2bObMi8+ZyYs5GI7kTMC/beakaVtrO61k2k7j5ylNIextkzullFMHcA
	 uQ5cv68dLzqafjMBpdfE5d/KDgElnaSW7Wj7OBpXApWm6dIyJoFCPKW/1LZ26kOYoM
	 6yEi8MXhUzxPpagw6hLGifJOBWEHqjQbmomXMeYmZwfrN5DWeAj4n0KoDUY8SNoTAt
	 F37/UPDHqomGT1Ceru5w68baDZLdRuhivGxIsFJIBLhVCEv/Uv6jL8+j04m+qaDW1o
	 2ilNG1jj6Ln4VR8dfuZS2yDfmXVZuUABDzzPSJKnaCDRhjcoYDxvHzNbKwS0ESfTxh
	 muFICH7ExoVMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6951983231;
	Fri, 27 Feb 2026 19:28:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5953E1F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B4BC40D4B
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:28:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glbgzFWPNbod for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E2C40D45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96E2C40D45
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DF89846DE; Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 20:17:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e197babd387cea2ab23bb1c1735ba270f6f6edf1
X-Git-Newrev: 13daf36ee2dc089d9bb22d9c2b5c3da2499e4bb0
X-Patchwork-Hint: ignore
Message-Id: <20260227192813.7DF89846DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: Bump version to 3.27.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============7755681002418794959=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7755681002418794959==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13daf36ee2dc089d9bb22d9c2b5c3da2499e4bb0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Various bugfixes:
https://gpsd.gitlab.io/gpsd/NEWS

Signed-off-by: Mattias Walström <lazzer@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.hash | 2 +-
 package/gpsd/gpsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index a7b76afbc6..38604c72b8 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ebb66ed92018b79cec88efb60e35a596925eef46502cf03d6ff0aea636ee7461  gpsd-3.27.2.tar.gz
+sha256  409873f5048462ef1ac413a51ab35caa8b50b31be62b3347bee1cc2994e7c649  gpsd-3.27.5.tar.gz
 sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 6dc01253a5..27a02c1754 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.27.2
+GPSD_VERSION = 3.27.5
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING

--===============7755681002418794959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7755681002418794959==--
