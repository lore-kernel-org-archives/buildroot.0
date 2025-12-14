Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31CFD5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 16:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8337140572;
	Sun, 14 Dec 2025 16:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ip2IZInkVQCW; Sun, 14 Dec 2025 16:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2A6B4057C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765730331;
	bh=5apufk0yaqXH0jgp8TSf5PQwtwvjcKabwLLZTCqvxtw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hBgoopXtoJL7CJrEyWrDYguusly3MgzvRRjk5rZCrCg9sTG5QHPtUISHwEc0jI3hX
	 aUpDeD6Xgll221g+fgYeF8YtelmUQ4Pm6KbGQrqaFYebAJMOmsooDaYdsvamcR9KGo
	 Fwesf5tfAkMcFj31c1lToFcw7ywGleOAvtL5t6zvNx4/LHSmap9E98OVglbpi1vjIT
	 0Vb/Rlp3+6xI2u6UEXIHBQBvMm2CUPgh+4vPCQhv/ETeA7D264S8L5O40605QfEFbs
	 DSkfKpv/lED77kW8tOIczFusB64d7CvI+uhZxRDB5nqMWYiGQHgNiy83hkbrJPZ7w+
	 BfSfobVnLCvdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A6B4057C;
	Sun, 14 Dec 2025 16:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 898262ED
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 705588132D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_ISzwFyQs4s for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 16:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA138808A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA138808A6
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 16:38:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BB7386E67; Sun, 14 Dec 2025 16:38:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 17:38:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a67cf2bcaaa98a3648d3ba4a773443a9ef6be34
X-Git-Newrev: e6567407ff163dfd7ab2ffe40e1576dea8c16581
X-Patchwork-Hint: ignore
Message-Id: <20251214163848.9BB7386E67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva-utils: bump version to 2.23.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e6567407ff163dfd7ab2ffe40e1576dea8c16581
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/intel/libva-utils/blob/2.23.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 049781810a..6888647865 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b57615c130427ec134bb5d2b80af516ce5bb19a40e89b1dab46a0d59760d96c  libva-utils-2.22.0.tar.gz
+sha256  fa7ff29847b55010fbbb775b35382f97f29b7b97abe9a2f6fb3e22b36db5440a  libva-utils-2.23.0.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 0536f022d2..3fdb6bcf70 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.22.0
+LIBVA_UTILS_VERSION = 2.23.0
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
