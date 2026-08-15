Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904E9C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8201680F2C;
	Sat, 15 Aug 2026 15:48:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NXSYzK6f_T8; Sat, 15 Aug 2026 15:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DCE80E41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786808938;
	bh=Hk5XJmW1FsP4Vnq43gDqDbyl6rFha49+9e2GX7Zh3wM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PcakYJwRpQuPjOb6TRF6WAauhfINz2KHkfcFHaoGhSq62vXR0D90qSCfeASS0vphd
	 eMLZXy/uVb89/WWNqltIcBt96NYZe074W/JpL8vl+L8k3b6SxVuUMRp2kuoE3BSJEq
	 oG43XOxsWtFWCfBCvOWO3SOMXbCaub4Sk3Bw7auutbZLAawV1chpluYYqygvHt5U1P
	 5w86jwKAA2DZF+PtOI2d4uhXEZPUhlFyV2pvmLr3/cH59E5Mr1/sFy5o1dnXlWVLM9
	 jIk08O8xQJ5jcFwVRRhtt6qOymApSHqg4Ua9dstgw7VEFAVcDbCiu7AELfgGcc6x1b
	 IAiFV8vFPVVZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DCE80E41;
	Sat, 15 Aug 2026 15:48:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 175FC361
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1C9A407C4
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HucEQv0WFFwN for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AD7E407BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AD7E407BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:48:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CAB88D72D; Sat, 15 Aug 2026 15:48:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 17:32:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f867f10392bcb651a42ec2ccf68efddfccf8c43
X-Git-Newrev: 6490c97a5e4b42e363e2c238458ec1c7c5fd97ee
X-Patchwork-Hint: ignore
Message-Id: <20260815154805.8CAB88D72D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bash-completion: bump to version
 2.17.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6490c97a5e4b42e363e2c238458ec1c7c5fd97ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes since version 2.11:
https://github.com/scop/bash-completion/blob/2.17.0/CHANGELOG.md

The hash of COPYING changed due to whitespace (tab to space) formatting
changes. See:
https://github.com/scop/bash-completion/commit/56eeb3e0b16d78a3f004c1e0c083c2eae3aa55db

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien:
 - update release notes link to use version tag
 - add link to upstream commit updating COPYING
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                   | 1 +
 package/bash-completion/bash-completion.hash | 4 ++--
 package/bash-completion/bash-completion.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4460523447..98c9ee55d3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3056,6 +3056,7 @@ F:	package/ubus/
 F:	package/wolfssl/
 
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/bash-completion/
 F:	package/ccache/
 F:	package/dos2unix/
 F:	package/font-awesome/
diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
index 7e952e5b02..294ab65a2b 100644
--- a/package/bash-completion/bash-completion.hash
+++ b/package/bash-completion/bash-completion.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac  bash-completion-2.11.tar.xz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58  bash-completion-2.17.0.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
index 8b0e949416..fd046de8ae 100644
--- a/package/bash-completion/bash-completion.mk
+++ b/package/bash-completion/bash-completion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_COMPLETION_VERSION = 2.11
+BASH_COMPLETION_VERSION = 2.17.0
 BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
 BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
 BASH_COMPLETION_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
