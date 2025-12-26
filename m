Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D80E8FDA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 12:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C615960821;
	Fri, 26 Dec 2025 12:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1HoimgVMj4K; Fri, 26 Dec 2025 12:45:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE71360852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766753151;
	bh=n3hebnHPI/V60zhj78VHTCgTh+V/F825Y0w7plUUdGs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HaWzs3XJSPO4+vfbZwc7ZiCMgzevoXBq978Us2WUXVWpEofxQVjy1FF67foOwlrF1
	 NSUsg6jEQo/4Ox0Ax3NbZkuENc6JDv4+SHfIyDjcjwIZVaoX529tnFtGJ2v02z4et4
	 SUKStjt+HDSsabUJ4xfakDI1Q/XJMGwvMsGRK7urZbJYDUf6eE5b0a0HeFEpKpYCBc
	 exI6LXsMoZJERZ8/V8RXCxoYf9gIQDQvMD3fueJHjM4gkd8llqgCNrXx1OlS7pUx0c
	 YUCt4R1WmRwe73V7CXJ43pYCSKWS/L9NcTsCQIlfnIs6622fN8fShcV+/VDBjcTKIy
	 KYvibGG8hTokA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE71360852;
	Fri, 26 Dec 2025 12:45:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 038E9EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0178C40377
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1P56jhdxPth for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 12:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A054055D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75A054055D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 12:45:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66B51876E1; Fri, 26 Dec 2025 12:45:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 13:32:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 996613364a3548df27b1446794fc526168df4800
X-Git-Newrev: 61ca67a5b202c3b81089abc30f67aa88edf73dd2
X-Patchwork-Hint: ignore
Message-Id: <20251226124546.66B51876E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fscryptctl: bump version to 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=61ca67a5b202c3b81089abc30f67aa88edf73dd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for hw-wrapped keys:
https://github.com/google/fscryptctl/commit/e9ef4406303c25ec5246ed74adb55349e126a2b0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fscryptctl/fscryptctl.hash | 2 +-
 package/fscryptctl/fscryptctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl.hash
index fb6cc27326..361119ea3f 100644
--- a/package/fscryptctl/fscryptctl.hash
+++ b/package/fscryptctl/fscryptctl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  192e25733006b05592fd87038a3a51a014db22f462ce0b24d47c30e66d03ea2c  fscryptctl-1.2.0.tar.gz
+sha256  d9e2497866da4d0d8eb2dc126a9c18261b6de5aeb73dbccd18d51a6a6fd89b7b  fscryptctl-1.3.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
index d235bf4540..7fcf057267 100644
--- a/package/fscryptctl/fscryptctl.mk
+++ b/package/fscryptctl/fscryptctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FSCRYPTCTL_VERSION = 1.2.0
+FSCRYPTCTL_VERSION = 1.3.0
 FSCRYPTCTL_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_VERSION))
 FSCRYPTCTL_LICENSE = Apache-2.0
 FSCRYPTCTL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
