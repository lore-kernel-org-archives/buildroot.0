Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843A3CD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 11:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6850812AF;
	Sat,  2 May 2026 11:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLaAc-b8wGFk; Sat,  2 May 2026 11:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02BD812A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777722353;
	bh=XYHLSYFPbHJMP0g2zVkFIO0L+cw8ozQXSlrRZEsRMA0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ni40f2GgFXLEnBPus1MLZVmoasLVnk9dn9n+/LFuK0s6Et10hcNelwJDIvaxs22TZ
	 SyIbM3xqIiCNOKwCwlv9TJdSgmVyHiUkAT+2MwzdtXHqbkqk2R1z5YXiyk3AQUQWK5
	 8ElWSTptrUskeN3JKDS3aNo2tzBrQsnEeHN91cIGasuzzdELBzSkHZVdBZGnDo+a1Y
	 DJCv4KvVumUiMSrcRTJI0PIR9VD674Uw+nLlGDGXJNAQbe8cKmrBS0GgEVutbUqTKb
	 ea9+SH9flbI7w/JVXrXFfsFJsGvqrpMFR1Bams2gcBBTg5ZribZsHAdDAJ7u/Xj3hd
	 tX/CuawaYZB3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B02BD812A5;
	Sat,  2 May 2026 11:45:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BF0424E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81B6F60F36
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uj7qka_p2p-R for <buildroot@buildroot.org>;
 Sat,  2 May 2026 11:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC1C260A54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC1C260A54
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 708857FDE7; Sat,  2 May 2026 11:45:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 May 2026 13:33:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6935bc74121967ab6a01950d55c3bb9a14f0f833
X-Git-Newrev: 1880965a3b8dccaaa93dbdc36806c06b90d77eb9
X-Patchwork-Hint: ignore
Message-Id: <20260502114551.708857FDE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireshark: security bump to v4.4.15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1880965a3b8dccaaa93dbdc36806c06b90d77eb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
