Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B35FCC056
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E65F83CEF;
	Fri,  6 Mar 2026 18:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-jSubfY3I2P; Fri,  6 Mar 2026 18:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D01083CF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822433;
	bh=YvWK6dosXQNhAE1hWuH65WCxl54qCK+AK4m7aWIXeQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HTrRmzcQhIBnxNh6a8ExgvU/VxQZw2ihsUw8+PuVtjDs5yI3AJVy1QJ/ZjOsZ28s8
	 9b2yLH0WS9u+8FPzEiNMG9wwTaKA3oe/mWRFa2tU98TvLOwFz+z1AUPeValWX0ijrt
	 /nkIsEhry56/CdYe/eMTdL7hNTmRwUSxPw9ayad0sa/7jk/tUk8fq6c8gEF509wTIe
	 rrarlGieH5gdeEW58mxFbnt93gq+2u8sQANe+7Kh7IdEiWYzhNjL/uTSkV1Ny+BRpI
	 Gjb3gEQvC2qWsNzJdO56V2y6nZynJ2zMuOPV5xZ3+R5/WL7mBxK3YiLSvS6aQybhW8
	 oeMVWhT8Cvddg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D01083CF2;
	Fri,  6 Mar 2026 18:40:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3136339B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17149613A2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXKb66pzgVzN for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5071560BF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5071560BF2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 580BC867A3; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3da8f8c054b6b238be7227998497e93cd9826799
X-Git-Newrev: 2115e079efbf53bf20f48f281586a8f69174f921
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.580BC867A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/foot: bump version to 1.26.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2115e079efbf53bf20f48f281586a8f69174f921
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://codeberg.org/dnkl/foot/src/tag/1.26.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/foot/foot.hash | 2 +-
 package/foot/foot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index fe058c05be..a95da3e6b8 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6fb18d482e2ac6a1d8ec293bbdd144e4f7f3bbd0302e9a8b60141cdb02b1aa6f  foot-1.24.0-git4.tar.gz
+sha256  043fc0d4ad609c1585837e0341dc2127f4077000589dea6a32aa8ab069946862  foot-1.26.0-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index 055adf8bce..3e37d41557 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FOOT_VERSION = 1.24.0
+FOOT_VERSION = 1.26.0
 FOOT_SITE = https://codeberg.org/dnkl/foot.git
 FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
