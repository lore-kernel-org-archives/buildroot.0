Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B5BE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 19:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E7040360;
	Sun, 28 Dec 2025 19:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76GHRe7AYV1n; Sun, 28 Dec 2025 19:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C600D404A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948497;
	bh=B7RKLcmJvjr0h4wV0ogIW3p4vcRVvQCyyNIz2ogS1LE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p6ydd405hrssDZ5tT+nNnNvwZLvBI+nVeK7zgQJzs9CisUFQhLk1TS8OZX9l3t+SF
	 MrNH5HedopdXuET2IwWdB3909pAbMeuDJN5dYUlf9iOYXRwg/RRrDCfbO9F6AWWsnh
	 4vmMd3LinpB547FCuniBUcr7r3o7z8E7ZbP51oWNBqVLm3LiXrf5VxzbFIAlV7dKNS
	 c/lrMLB8NFflFMLK6AadfmL8Vdf/psMashAOEbGFink4/LwZa1a+h7AxYmn2+SvJ1K
	 TSZo5uTIMvayk8tcJlUw9bhjh8AxMhRSdJdxHAHeoq+pSCPB921pJ7P6idmSmcnhS/
	 Lv1V1cYVb3Qbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C600D404A4;
	Sun, 28 Dec 2025 19:01:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 222231E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FA9F40424
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1fg_zjQsDww for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 19:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 314DF40082
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 314DF40082
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 19:01:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AF6B87972; Sun, 28 Dec 2025 19:01:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 19:39:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5335dd173328674d81529775e3659ffcfbbc445a
X-Git-Newrev: 4e1f33f70753836cd6ca1ccebb0017419c62c597
X-Patchwork-Hint: ignore
Message-Id: <20251228190135.2AF6B87972@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 25.4.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e1f33f70753836cd6ca1ccebb0017419c62c597
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/intel/media-driver/releases/tag/intel-media-25.4.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index af27309bab..ad742a3af1 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7ba3b1d72286053e0785b7975e7ed2001ba3f6e00a8541aff0c61a6495ef5138  intel-media-25.4.5.tar.gz
+sha256  e5cf57c66e22359d1ec07d766b04e5da43677b9330999ce0dbf686aac60cf6bb  intel-media-25.4.6.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 59cc4b2f89..a00525779e 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.4.5
+INTEL_MEDIADRIVER_VERSION = 25.4.6
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
