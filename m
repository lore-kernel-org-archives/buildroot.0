Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A40FECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AACF40324;
	Sun, 30 Oct 2022 20:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AACF40324
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2Ti3nD_sPGl; Sun, 30 Oct 2022 20:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA4F240294;
	Sun, 30 Oct 2022 20:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA4F240294
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 680731BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 442CA400EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 442CA400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GY60OWaCZQHa for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:18:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CE42400DC
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CE42400DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFD3B87618; Sun, 30 Oct 2022 20:18:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:10:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba74bc8b6783aa478d00f3318c13064d66274ca9
X-Git-Newrev: fed7c4406aa07f1fb99bad5d5669f8562eb6e6b9
X-Patchwork-Hint: ignore
Message-Id: <20221030201810.EFD3B87618@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uuu: bump to version 1.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=fed7c4406aa07f1fb99bad5d5669f8562eb6e6b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix memory leak cause by getaddrinfo
- Fix crash when last block actual size < m_output_size
- Add -dm to disable small memory for debug purpose
- Fix a dead lock when reset stream
- Stop http download when error happen
- Add error check for all request_data
- Fix linux build warning
- Add gzip stream support
- Rework buffer management to support small memory version
- Fix support of empty environment variables in Windows OS
- Fix crash when environment variable is last word in script
- Fix update libusb path
- Update libusb submodule
- Drop vs2017 support.
- Use $(DefaultPlatformToolset)
- Try remove PlatformToolset and set WindowsTargetPlatformVersion to 10.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index de00c649b1..50da0f9bf3 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  9fcfe317c379be1e274aae34c19e1fd57188107f8fd0cdd379fe4473aacc92b1  uuu_source-1.4.243.tar.gz
+sha256  baaf3e031958075b96530d43d7435f19cb428088894066e0b02349a3b9666666  uuu_source-1.5.4.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 7ed2599598..681c1fbc44 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.4.243
+UUU_VERSION = 1.5.4
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
