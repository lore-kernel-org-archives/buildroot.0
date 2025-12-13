Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AA0D5B15E
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 18:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 359B5607EB;
	Sat, 13 Dec 2025 18:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hKIlGghPc06; Sat, 13 Dec 2025 18:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8792160698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765649602;
	bh=myCdtcjkabuxWYZSmuYOLDD3kP/DatBUVXEg+/MJROE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iRMSWKcv4eu3tGnUvF5rWXHWJKWFytqdS4ChC/hcXyvTY+tdNlkJwKEP6zyjoXVwY
	 3VsNj6e41NBCyQI48EdVAlPGkuHe4zyP8rnzUcvkmMskhAgAwY8XW+JuqGuJgvcwKl
	 vDN5sScAOnEJkRfHM+PJotVUy0n4xCndq+BvP3ui+fE2o030cJendYywL5OZTxpUuD
	 4sAeHwGng/mYRg1KovKynknG/QzKS0owpmJeNHhgtm28jUmapozyX1lP06fBgYGa8k
	 0l/Z5o7njZM1VaRBt8PIfbuQbXf7JniPWGbxlS4WRygk9VASgfxSCIytZyDL5dgAUw
	 p8fH5Rr+cXCqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8792160698;
	Sat, 13 Dec 2025 18:13:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C8213D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D0078224A
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tem9MVuBFyR for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 18:13:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C59281F06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C59281F06
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 18:13:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 979ED86A8A; Sat, 13 Dec 2025 18:13:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 19:06:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74d7259a33f0d094556405239106e637db9ff71b
X-Git-Newrev: 14f279184e85d44ecd71c797d09b53fa8c296214
X-Patchwork-Hint: ignore
Message-Id: <20251213181320.979ED86A8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pocketpy: bump to version 2.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=14f279184e85d44ecd71c797d09b53fa8c296214
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.5

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pocketpy/pocketpy.hash | 2 +-
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index 51d7f9c0b8..2541e845a9 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  3edf11645867fd41cf2e3cff24e3131a9ed9f6ccf8ada806dc2429f817e01f71  pocketpy-2.1.4.tar.gz
+sha256  eb7e8d9285d3848c2bc108b41fed4c49ea47df6b0018362319d2736a6f5821e1  pocketpy-2.1.5.tar.gz
 sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index c4a9aea8d2..b171840890 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.4
+POCKETPY_VERSION = 2.1.5
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
