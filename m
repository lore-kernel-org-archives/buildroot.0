Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE5BFD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D126064C;
	Thu, 26 Feb 2026 20:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Trn9sdipbYow; Thu, 26 Feb 2026 20:44:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00EA260719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138641;
	bh=oCTepYZsu45ygb6D8GZpmv1DvbTWpumOPE9Zk+P7K/U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C5GlWH8V5qOEmB64MR1pNs+/EXiZKM6VuvBYLYNjsp8PMNGYTywWQomdSAihpvgJ4
	 vT45TBaF6UsYz8gTyWJqMp4Sp5FMDhl+5FObHQPbKL9molWGI4SeTsprMoPwmlsh1l
	 1zOh+KkPZOyl1J/3YjMvZSPeXco74pJv5NCozptJ/qU5ejjUHIQ++UeSnByrlOm1KN
	 c9VASMWlxJY/oUWdpLxMfQN1EPcoE3CZSc/1ddluZyXbrK7tFmIkNfbMqomETPZkpt
	 pQ9H2XFXYqsZfgNxr6R41psQCRHKeUYv6SO4u2pOAmupWfAyMFfOeVSrp2zZZJ4Ywe
	 IAQ9F25xYK9og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00EA260719;
	Thu, 26 Feb 2026 20:44:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C934FA48
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4AA580E00
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KKTepxfA6DZ for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA54780DFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA54780DFC
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFDA187506; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:26:03 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0f33d01f0f76baa0587e656169beb5c235d72c46
X-Git-Newrev: 071216c81d8612516e3304b41273437df45a1451
X-Patchwork-Hint: ignore
Message-Id: <20260226204356.CFDA187506@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wmctrl: fix
 tarball URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/071216c81d8612516e3304b41273437df45a1451
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Current site is down, switch to Debian.

Fixes:
https://autobuild.buildroot.net/results/679/679a9f6224d1771ec2ab52e45fd74af8d03c1604/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f90d38dafcadf959e6a0383376639a137a8bae4d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wmctrl/wmctrl.hash | 2 +-
 package/wmctrl/wmctrl.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wmctrl/wmctrl.hash b/package/wmctrl/wmctrl.hash
index 531f64a0d8..86b04d0c01 100644
--- a/package/wmctrl/wmctrl.hash
+++ b/package/wmctrl/wmctrl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl-1.07.tar.gz
+sha256  d78a1efdb62f18674298ad039c5cbdb1edb6e8e149bb3a8e3a01a4750aa3cca9  wmctrl_1.07.orig.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
index 36ad3513ff..e948f7a939 100644
--- a/package/wmctrl/wmctrl.mk
+++ b/package/wmctrl/wmctrl.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 WMCTRL_VERSION = 1.07
-WMCTRL_SITE = https://sites.google.com/site/tstyblo/wmctrl
+WMCTRL_SOURCE = wmctrl_$(WMCTRL_VERSION).orig.tar.gz
+WMCTRL_SITE = https://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/w/wmctrl
 WMCTRL_LICENSE = GPL-2.0+
 WMCTRL_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
