Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B0ECD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E8741B40;
	Fri, 15 May 2026 13:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wD53-txC2rzb; Fri, 15 May 2026 13:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC3641B0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851805;
	bh=cxj242tElQ+gtSb81+7SxcKbRCCXGIGeA3vPgJiQ4qs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mYsrhJ+XDefWsE6hw85FeNxU2DfopmObOVBZZ2KvFBei5tgZQjqXT3aSTNaQ22Ajy
	 xJluBXCp/inEI7m+M472jGBfAo1PygZpS44PTDs0tiPRBT+r+Kljz77rTWv7j/KjMx
	 QPSXOTZyhbvRrH2yxHY8kf2l7OVHi4gboMBf4mnWGaZnI0QtMDWHcNKvGKlX0c6/xP
	 olFXTOkj/tXeHc2Vwq/PZwnKT+c+QqomFPBuBfppPuOTR1xI/ZChD3Y2cCoBZuaNmH
	 hY9+yPTrctzrsC7pF3LVEcNfQSWvmzzh32GoSd2HO6EkZo8LQlA4pb4Q/Bxj0oao8J
	 jvKo3HhmorFiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC3641B0E;
	Fri, 15 May 2026 13:30:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 260A536E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B068A6157B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuMT7M9pYaOi for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E9AB61577
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E9AB61577
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D21DF86356; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:57:49 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: bef8aefcde882ca234f202ce7f76f12fdb6ef0e4
X-Git-Newrev: 465f1dced9a19b543a64f7d7da5a376c430cde77
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.D21DF86356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/wireshark:
 security bump to v4.4.15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/465f1dced9a19b543a64f7d7da5a376c430cde77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.15.html

Fixes the following vulnerabilities:
CVE-2026-5409, CVE-2026-5408, CVE-2026-5406, CVE-2026-5407, CVE-2026-5299,
CVE-2026-5401, CVE-2026-5404, CVE-2026-5403, CVE-2026-5405, CVE-2026-5654,
CVE-2026-5657, CVE-2026-5656, CVE-2026-5653, CVE-2026-6538, CVE-2026-6537,
CVE-2026-6535, CVE-2026-6534, CVE-2026-6533, CVE-2026-6532, CVE-2026-6531,
CVE-2026-6530, CVE-2026-6529, CVE-2026-6527, CVE-2026-6524, CVE-2026-6523,
CVE-2026-6521, CVE-2026-6520, CVE-2026-6519, CVE-2026-6522, CVE-2026-6870,
CVE-2026-6869, CVE-2026-6868.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1880965a3b8dccaaa93dbdc36806c06b90d77eb9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 7572ea8b52..037f2f509a 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.14.txt
-sha1  41536d8ba1fc977d0832b509af6ea65056c6fe1d  wireshark-4.4.14.tar.xz
-sha256  c9113130bd2b37919fdcf575f710469ce391960baaff31911e3288469e6a8e8d  wireshark-4.4.14.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.15.txt
+sha1  dd591df261c7866e7eaac3f015c904ab21d9d51d  wireshark-4.4.15.tar.xz
+sha256  05e884da8d91929bd1fb6a91c26836d69145ecd439b97c2d82698388de221570  wireshark-4.4.15.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index d58fa7a6c5..1ded080906 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.14
+WIRESHARK_VERSION = 4.4.15
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
