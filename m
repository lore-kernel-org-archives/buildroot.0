Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B63EEA84E
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 20:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 629C060BC0;
	Thu, 12 Feb 2026 20:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TOdD6zndsmt; Thu, 12 Feb 2026 20:43:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1680460BCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770929003;
	bh=vMg4rm0EcFYfLfG40euH1drH5jDNa4QH5K1umPt/bIs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A3MS9snt5uv8Ggu7v5KqEQzwxHx5+I582gAdp2vejOkTMCxPlrYvq4JXYqdqIdRy/
	 ML3AAZ8rx51/VlBTEz5FG8BVFGoPtNLDzqYnHL7AC0KJFgmrbqjOhgG62RnVGJ6rvM
	 13JXiHNcVf2BiZM8pEjuFDmItgNQ2/dlNW8giFkxL0jjDp/trBfuZxPqZET5QpUYu6
	 pnz5GRXqMgHSi5XuoGrsBgNFFp+dE88iLQrMdpJkkedYgfA71JGJpGSHPdCp4hpIMT
	 /4ujEzPR7pNb1xC211ISph2WWUykFeUlEqo6ALd5t/zCHEVILau9s2K0ghMvbsD7wL
	 Tgc6FJC07kKKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1680460BCC;
	Thu, 12 Feb 2026 20:43:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78BF51D6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AB6F4072F
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUTGG0P-xO0m for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 20:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A164D4071F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A164D4071F
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:43:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D63781686; Thu, 12 Feb 2026 20:43:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 21:08:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d39f112b0059dda2f6740a7eb2c3ec4f72bb9c5
X-Git-Newrev: 03d5b45653fdd39a4c739c3fc26b041544b20115
X-Patchwork-Hint: ignore
Message-Id: <20260212204319.7D63781686@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: bump to version
 20260107.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03d5b45653fdd39a4c739c3fc26b041544b20115
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/abseil/abseil-cpp/releases/tag/20260107.1
https://github.com/abseil/abseil-cpp/releases/tag/20260107.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index e1b8763e2a..2c3e702743 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1692f77d1739bacf3f94337188b78583cf09bab7e420d2dc6c5605a4f86785a1  libabseil-cpp-20250814.1.tar.gz
+sha256  4314e2a7cbac89cac25a2f2322870f343d81579756ceff7f431803c2c9090195  libabseil-cpp-20260107.1.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index fe97c1c2f3..2fdccee280 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20250814.1
+LIBABSEIL_CPP_VERSION = 20260107.1
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
