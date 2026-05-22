Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2D8CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37E2285841;
	Tue,  9 Jun 2026 13:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bz_6cj9HUjC0; Tue,  9 Jun 2026 13:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11DAA8583C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010161;
	bh=61tajGs+0uFSV7oJDGn1CtfgZftL3RAvOzMmmt4fM8Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pd3Ei8u4y/Mb7yEB2VBGpQlAyzXTXePOUGKmVYNAHz4raXtTBk3QZI20u6tnN/JKg
	 uyyttrLQa2nFTZ5knrdIN7g9/8A8oC+W8Kja7FcuRUXBgTzcUt4U5iiVexQJcq6YV5
	 FvBuVwl1XBIeJmM+Cs1KzZgirw+Zpphy9GlS4lpReu90euTNOx5uH6u/56Y1Z5nZkX
	 lXGKdV35OY3i51ylSk86usnmiU+lZ6VSmvM+xQT4Qow/h5qQE/ONbXroSc1a9aLsOo
	 gQq8tWamgME86mny0drN1folt9veop5yXOMaKu8sMnqSnu+KkTfbIo/vJuRjbyxYiq
	 qrGj8YAKBoqlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11DAA8583C;
	Tue,  9 Jun 2026 13:02:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FC7F190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54752411FA
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YILolNuBsdHN for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B00842126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B00842126
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D641A87E8D; Tue,  9 Jun 2026 13:01:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 May 2026 21:24:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10bead0096ce55b5520f34d29427c56ef19cc98a
X-Git-Newrev: 2f0bd4cdfa4e276a167dee6e39c7c1a032eafa6a
X-Patchwork-Hint: ignore
Message-Id: <20260609130117.D641A87E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/utfcpp: bump version to 4.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2f0bd4cdfa4e276a167dee6e39c7c1a032eafa6a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/nemtrif/utfcpp/releases/tag/v4.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/utfcpp/utfcpp.hash | 2 +-
 package/utfcpp/utfcpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
index bde4a223f4..779bd2d282 100644
--- a/package/utfcpp/utfcpp.hash
+++ b/package/utfcpp/utfcpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9a45cbeefacf512879971eaf57fe52133b73a0152d5354f3adeaf8d103cff0f3  utfcpp-4.1.0.tar.gz
+sha256  1ca68016f0abc24172998e39ce0d8f8e2b7a26f7579a0ff85d4e1b9a7aea56f8  utfcpp-4.1.1.tar.gz
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
index de6d6f6f86..0ec08bd54e 100644
--- a/package/utfcpp/utfcpp.mk
+++ b/package/utfcpp/utfcpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UTFCPP_VERSION = 4.1.0
+UTFCPP_VERSION = 4.1.1
 UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
 UTFCPP_LICENSE = BSL-1.0
 UTFCPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
