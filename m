Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698CBE8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A4740903;
	Fri, 26 Dec 2025 18:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DH8HOuqCMyn1; Fri, 26 Dec 2025 18:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00B9F4082B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773271;
	bh=hu7VNrtzYITsmF99sHsvC85lAdaNV8OgqOlE0NxubaQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NKeOzQceA3IJY6z57FO2OfPHI65sv/oZVQ4Ltv4q0+P8iyU/Ch7lxs6jvcq7Dmlxz
	 nAUqwBIjtIOE8sixbVs0c1fzq4qnflasCJQLpAKeTXJdsQH8L3SVoECAtTGrvl9zUb
	 euZYwun9aj2K5XAeG29xIjt3ClFq46662MFz0ts1lrAOKjlMmRvNwXuByAzHep6OUD
	 Ub/WMqqpTmPDlywOImlIrb6Rr8JYBoKvLUitJ5daVS3t9bIdLkMUm2rccmu6dIUEAy
	 fr2ZZ50Yr6ZMI+AFSpfVZ1HDL1/oZ65AGv64qqYm9432tR5kwDwNjuzN/yC96xPGRX
	 +OC+GqZOv6Jxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00B9F4082B;
	Fri, 26 Dec 2025 18:21:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C9272B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D17D780ACF
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRqI54-xFWxx for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1883080B29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1883080B29
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14AE383371; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e1d7e317dcb0825089f2072ed13074a45416f96
X-Git-Newrev: c21dec12130c083d569a499f0badb4084988531e
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.14AE383371@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/supertuxkart: bump version to 1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=c21dec12130c083d569a499f0badb4084988531e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha256 hash provided by upstream.

Added configure option to disable vulkan support:
https://github.com/supertuxkart/stk-code/blob/1.5/CMakeLists.txt#L274

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/supertuxkart/supertuxkart.hash | 3 ++-
 package/supertuxkart/supertuxkart.mk   | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
index 446a9de8ec..38b45f81a7 100644
--- a/package/supertuxkart/supertuxkart.hash
+++ b/package/supertuxkart/supertuxkart.hash
@@ -1,3 +1,4 @@
+# From https://github.com/supertuxkart/stk-code/releases/tag/1.5
+sha256  33cf8841e4ff4082d80b9248014295bbbea61d14683e86dff100e3ab8f7b27cb  SuperTuxKart-1.5-src.tar.gz
 # Locally computed
-sha256  9890392419baf4715313f14d5ad60746f276eed36eb580636caf44e2532c0f03  SuperTuxKart-1.4-src.tar.xz
 sha256  d27207a5213f746aac53893e9ecc18456e9595d3ffa662bd1ec9eb10787c214a  COPYING
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 6bdd512eac..377b9668a1 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUPERTUXKART_VERSION = 1.4
-SUPERTUXKART_SOURCE = SuperTuxKart-$(SUPERTUXKART_VERSION)-src.tar.xz
+SUPERTUXKART_VERSION = 1.5
+SUPERTUXKART_SOURCE = SuperTuxKart-$(SUPERTUXKART_VERSION)-src.tar.gz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
 SUPERTUXKART_SITE = https://github.com/supertuxkart/stk-code/releases/download/$(SUPERTUXKART_VERSION)
@@ -38,6 +38,7 @@ SUPERTUXKART_DEPENDENCIES = \
 # Disable In-game recorder (there is no libopenglrecorder package)
 SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
 	-DBUILD_RECORDER=OFF \
+	-DNO_SHADERC=on \
 	-DUSE_SYSTEM_ENET=ON \
 	-DUSE_SYSTEM_SQUISH=ON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
