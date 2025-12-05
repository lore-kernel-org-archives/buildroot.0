Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCC2D374A1
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76DD46F4CF;
	Fri,  5 Dec 2025 21:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeiEggqyLIEZ; Fri,  5 Dec 2025 21:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8CC26F4B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764968559;
	bh=hHUUUVmixfTOWRU3CzT/jzv/E3jIhMGz+YY+6jwMB1I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pxg7eSZcEtIMSX+oaEk6FavFRiC7XXBH5+kaafJjoEdIJ9G3eMECW5gDDQ2YEOquF
	 gHdg4RDajedcm5VoUGhDSGLTzdJthKKp7FzZSk+mdaFPjBWiOVF12XbnT/RvAL94Vo
	 EC45iwqujcvyY3GumoEmHdGnjS1CYeRqENuWUO1F70gMTMisYRHihbMdC8cKZUSIR/
	 f59CGTZ2r8TaC5MOG1q10iPFTVhPHEhrMqobzb8dhBVrczVMye0Adg3ZdTvktOCDvt
	 0HHEiI9clxIxi41nkWxwlTeGBaJwOoqNBi58KLXniZUIrMm1Jrte2Ev6bDni8MEyji
	 7ZuKVFnum/Rcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8CC26F4B3;
	Fri,  5 Dec 2025 21:02:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 907CD1A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D10D40417
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRS68nku489b for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B2B440010
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B2B440010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86D20865F1; Fri,  5 Dec 2025 21:02:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 22:02:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78513ff979f457a7e817ea27fa600fbe3835aff0
X-Git-Newrev: 29fae1d4595417ae7fd12ce946b4abe306a5bee3
X-Patchwork-Hint: ignore
Message-Id: <20251205210233.86D20865F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 25.4.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29fae1d4595417ae7fd12ce946b4abe306a5bee3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/intel/media-driver/releases/tag/intel-media-25.4.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index a6bae999f9..af27309bab 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e034525b508aa85914736ef9b9c59b6ab51ae9008c9c815e3ee354a5ada76b4  intel-media-25.4.4.tar.gz
+sha256  7ba3b1d72286053e0785b7975e7ed2001ba3f6e00a8541aff0c61a6495ef5138  intel-media-25.4.5.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index e64d2facc7..59cc4b2f89 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.4.4
+INTEL_MEDIADRIVER_VERSION = 25.4.5
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
