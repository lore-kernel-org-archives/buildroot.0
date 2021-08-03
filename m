Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21727C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:51:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACA560EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 15:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CACA560EE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B6FD402CB;
	Tue,  3 Aug 2021 15:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-DdUL9xuGVC; Tue,  3 Aug 2021 15:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A238040206;
	Tue,  3 Aug 2021 15:51:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A00C51BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AF7B82F8B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 15:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Irun4TmvLxyB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 15:51:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFC6183005
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 15:51:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B03608AB46; Tue,  3 Aug 2021 15:50:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 17:49:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff55c323af59bcaee3af949fd126bbec1889d1b2
X-Git-Newrev: 0e8c810431dfedb59205afe3e597680588b4f575
X-Patchwork-Hint: ignore
Message-Id: <20210803155054.B03608AB46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/msgpack: bump to version 3.3.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0e8c810431dfedb59205afe3e597680588b4f575
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/msgpack/msgpack-c/releases/tag/cpp-3.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/msgpack/msgpack.hash | 2 +-
 package/msgpack/msgpack.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
index 3829a70222..5d432ba0ec 100644
--- a/package/msgpack/msgpack.hash
+++ b/package/msgpack/msgpack.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  464f46744a6be778626d11452c4db3c2d09461080c6db42e358e21af19d542f6  msgpack-3.2.1.tar.gz
+sha256  6e114d12a5ddb8cb11f669f83f32246e484a8addd0ce93f274996f1941c1f07b  msgpack-3.3.0.tar.gz
 sha256  664550b43996452a5a2c7471bb0ff77185a58c69ccafa60f983dc4c162e1ee22  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 81670deddc..996b5a2f7c 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MSGPACK_VERSION = 3.2.1
-MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
+MSGPACK_VERSION = 3.3.0
+MSGPACK_SITE = https://github.com/msgpack/msgpack-c/releases/download/cpp-$(MSGPACK_VERSION)
 MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING LICENSE_1_0.txt
 MSGPACK_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
