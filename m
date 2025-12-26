Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73493E8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A5D6403D4;
	Fri, 26 Dec 2025 18:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAYEwwkVEpoB; Fri, 26 Dec 2025 18:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1C104076F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773262;
	bh=gDUku/LTtjmT/gNkoz0Zt93KFOkkK93qFuulu8OK8+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZMfEHRpt9J0fm12CicZ85E1I6Eg8alA3k7GVmF6ymsOPN0j3lCziXzyXDCu0DkaBo
	 5/UpExhsbLlIT36Exm7ghmh8VzrDxUFb8khJT38PbY8l4X7MMuWGhB2RCavESGdk/7
	 bmyeyu57VaPF/wSqIXcf3HH6ZxWlq3vZvkdZr5O6sFDHcKTJOJzi+ICFT3xTNtqsIj
	 6cxu1yfRBnxa9GEmTacWlvAqI/gKeHE2OUoBfALaCtDDzvBG25R+m/X721wpSikLC0
	 00v/Y51dAZAu18FbQSy5fEz7hQeKHfgVdZPIZ1sGmM/GM6J60o8EgBsF+xSS4hOXDk
	 gQvdhSQGkJq6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C104076F;
	Fri, 26 Dec 2025 18:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 282E5B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D8B080BA3
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 98S_CY9gkAFI for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C376280AFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C376280AFA
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1C558768F; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86aed531452f885bb91787e2ae70b7bc227d1dbf
X-Git-Newrev: bdccb251a2d6c45e1faf113580ec819b63fc509e
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.C1C558768F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openfpgaloader: bump version to
 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdccb251a2d6c45e1faf113580ec819b63fc509e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/trabucayre/openFPGALoader/releases/tag/v0.12.0
https://github.com/trabucayre/openFPGALoader/releases/tag/v0.12.1
https://github.com/trabucayre/openFPGALoader/releases/tag/v0.13.0
https://github.com/trabucayre/openFPGALoader/releases/tag/v0.13.1
https://github.com/trabucayre/openFPGALoader/releases/tag/v1.0.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openfpgaloader/openfpgaloader.hash | 2 +-
 package/openfpgaloader/openfpgaloader.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
index 6fa81a98a2..33f798b7d4 100644
--- a/package/openfpgaloader/openfpgaloader.hash
+++ b/package/openfpgaloader/openfpgaloader.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a463690358d2510919472c2f460039a304d016a08a45970821e667eea1c48cc8  openfpgaloader-0.11.0.tar.gz
+sha256  cf19b596e5dea21891b1be3cb9a04be7a1501926ee0919dcc5c9f1b6d3bd0a96  openfpgaloader-1.0.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 0fd172b532..06c8b2face 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENFPGALOADER_VERSION = 0.11.0
+OPENFPGALOADER_VERSION = 1.0.0
 OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,v$(OPENFPGALOADER_VERSION))
 OPENFPGALOADER_LICENSE = Apache-2.0
 OPENFPGALOADER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
