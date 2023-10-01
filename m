Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDBBE748EE
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF0982198;
	Sun,  1 Oct 2023 16:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF0982198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXL0HBdNitwI; Sun,  1 Oct 2023 16:32:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033E881E2F;
	Sun,  1 Oct 2023 16:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 033E881E2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A07CF1BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CD81417D3
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD81417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjgpatm8Oc-Z for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3727D418DF
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3727D418DF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C71A83DB7; Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 18:31:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a01085abeb7d8a097cb68b9f7f4faec7711543c
X-Git-Newrev: 93a981cd9db69c0cdb18d15c92ee01eb58ca1941
X-Patchwork-Hint: ignore
Message-Id: <20231001163134.1C71A83DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-headers: add host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=93a981cd9db69c0cdb18d15c92ee01eb58ca1941
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We discovered that the existing host-spirv-llvm-translator package
downloads the spirv-headers during its build process, which of course
is very wrong. In order to fix this, we first introduce a host variant
of the spirv-headers.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spirv-headers/spirv-headers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index ff43dfd8e9..9f84c42b2d 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -14,3 +14,4 @@ SPIRV_HEADERS_INSTALL_STAGING = YES
 SPIRV_HEADERS_INSTALL_TARGET = NO
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
