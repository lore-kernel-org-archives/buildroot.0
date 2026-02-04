Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D30E9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06066612C9;
	Wed,  4 Feb 2026 17:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QK13aUmrF-Ro; Wed,  4 Feb 2026 17:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F158A612D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224966;
	bh=BMWjqLHjQ8okc/o9DJi45ZlYrw8H3JNoayLQlJnrM1E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nGMH3C2GUSlkE34g7DnT8/vRHcMRdwZCO3/LVRthJtVwfqn+msOqx/EvUnkw+CASg
	 51cLIWBHFRq/Mt5ISBvkzfcVSw7tQxXjIRslUOvuHmPc1U0GRdkQTsnG7o64iLdiZo
	 dnv5fKP2piz0+MME5oXzBb+Rfht8avuMIos5PzPP/pyG7QpE3ca6PmdcdckYGY594u
	 oIfHJ2q9EKJhFJMtAVscfmiHnP/IEdZqpte5TGa89JTdV0N+QuPsOpBf5epjGL/x4H
	 8SkkA/Dlf1nnkQJWX4r9gnQyhxKazDwn71uzcfZWUYP3FDisYuUGuc4ff6d9QntylX
	 OVZnholnABicw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F158A612D2;
	Wed,  4 Feb 2026 17:09:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 617B7F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0576840571
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qHaF1_SfGee for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 458874057B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 458874057B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A5218697A; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:35:43 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 74822b1db5279cdbf87d176ed5f6ab614b1f58ae
X-Git-Newrev: 5178621ab0b1571f526f90d16019c93b8f3af59c
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.3A5218697A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] system/Config.in: do not
 reference md5 for sha256 option
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5178621ab0b1571f526f90d16019c93b8f3af59c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Commit bf3626002f ("system cfg: remove mkpasswd MD5 format option") dropped
the MD5 option, so stop referring to it from the sha256 one to limit
confusion.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit fdeced6692b12641097864399ab930b88cebff64)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 0652b94a3b..98bbd93092 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -67,7 +67,7 @@ choice
 config BR2_TARGET_GENERIC_PASSWD_SHA256
 	bool "sha-256"
 	help
-	  Use SHA256 to encode passwords which is stronger than MD5.
+	  Use SHA256 to encode passwords.
 
 config BR2_TARGET_GENERIC_PASSWD_SHA512
 	bool "sha-512"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
