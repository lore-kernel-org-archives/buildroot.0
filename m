Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277B6F9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96AE183CD1;
	Tue, 14 Apr 2026 17:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irdnIokhKAw3; Tue, 14 Apr 2026 17:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07CEC84C4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189098;
	bh=2Nuknj2QFM4W5UZd27oEW6/b1dXF5U1lY8ZqnKEd0gc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lSQtzoxeqMVjkrg9ZzS+EfZ3QEU2NDOvn3qaj6UCdIglyFChVZbNl353pJDzSIQOZ
	 ejfUeLF26cCANusBNLgN2Lsvph7lHv9xN+ZIJEJlxcU1hUe45P0pBcpL3VACI02/pI
	 sbk+jGlfoGMgK544ZHKiS7i0lF2AyW3HHv6vJ2Ry9n91Y1iITgtEVjZKOr2FtoJCbk
	 9yJ+fMzaS3YZN4uSx8A9SC6KSP86G1SWv1vLhA2zgLFtMc8K+I+o+ucMq60pBEqqxv
	 +097HUlUNmkzJhEqEClYXi/wo3/iLtDdL3gAmptb5MJCdXAXiccb1fFZffkjuk1RN2
	 5Hd6URxg7oA9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07CEC84C4D;
	Tue, 14 Apr 2026 17:51:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8579283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A21160A95
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Skf2IVrtyuZV for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 822F160822
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 822F160822
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:51:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E6267FCF1; Tue, 14 Apr 2026 17:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbae39d4c715cf1e71b64c6bcb28f31cfb154aed
X-Git-Newrev: b84a18218ce556e6b499b8304b1e0f7cdf14f2ae
X-Patchwork-Hint: ignore
Message-Id: <20260414175134.0E6267FCF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.1.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b84a18218ce556e6b499b8304b1e0f7cdf14f2ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.1.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index d0f0d36eb6..38ff675617 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c56899fecc003d047ce6afbdf471851512e0ceac66c2ef22ac36f1e6ce46170c  intel-media-26.1.5.tar.gz
+sha256  85743dad01a54c85f3fbd0285bbdb01c00cfde0f8a79efa5b66376d536221420  intel-media-26.1.6.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 99c36ddff4..6c3f862ce5 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.1.5
+INTEL_MEDIADRIVER_VERSION = 26.1.6
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
