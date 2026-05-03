Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8A3CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 19:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C15AE84259;
	Sun,  3 May 2026 19:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cv2vdXMm_aNL; Sun,  3 May 2026 19:37:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED2C88425B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777837053;
	bh=kbuFu21kuW3RGYPd6GfM3LGPb718rIiqd/1LvyICqEY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ViqF890Jh6IJqrNwMx9ICtTEwrlWMMpbEUzjmNcB9Khs2vre20MGXVwYMZoACPVPn
	 FedC8+NWTNImQq69GBZ8hDGm1/EydRZX14c6Sp0zPGQXscr+FxAo/xcbb8/k6Bm0O+
	 gLnl/vSLeRxJL64iuWvBjPHslgb68d/OqCL/hoOJLXgBAv5paN4JusAI21JetEIHGA
	 Q4yJh4rMdMxp5GWEY19L+eoH49/dch3opk02VrF5utGrf3h5BtnsDFG+uXccFWzujh
	 I9DAuh0QA2cXVQfsXBMkgxMVZ9n6JMEcEK810g6Kkou4el4Jrxq4IxAFktStS2qXu6
	 dMnRJ+TqaCKzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED2C88425B;
	Sun,  3 May 2026 19:37:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70B9B204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 19:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6215661273
 for <buildroot@buildroot.org>; Sun,  3 May 2026 19:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Fq_FC3aLqC8 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 19:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9155461257
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9155461257
 for <buildroot@buildroot.org>; Sun,  3 May 2026 19:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3820C8410F; Sun,  3 May 2026 19:37:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 20:04:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca673af9efd9ff80106adbfedebbde079add9b3b
X-Git-Newrev: 06964fba6bb7deb3f53f0ebad21f351b5db201ed
X-Patchwork-Hint: ignore
Message-Id: <20260503193729.3820C8410F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/06964fba6bb7deb3f53f0ebad21f351b5db201ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 38ff675617..bbdd3eedd9 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  85743dad01a54c85f3fbd0285bbdb01c00cfde0f8a79efa5b66376d536221420  intel-media-26.1.6.tar.gz
+sha256  32f984333d0804ec8f784f25cf443499ee86074a7da7791483d9a9afbfa97c74  intel-media-26.2.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 6c3f862ce5..61d8dd408d 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.1.6
+INTEL_MEDIADRIVER_VERSION = 26.2.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
