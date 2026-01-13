Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B190AD30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88CB540C62;
	Tue, 13 Jan 2026 20:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0b8CoGmSAWW; Tue, 13 Jan 2026 20:59:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFD4E40D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337979;
	bh=EpZW+ZdmoOfko8/4lPgVy+JGZWk1tJRA5aNq3z4k2js=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f0gS0hMiv8nwjk6JGm/mz1DyoXpdqn7nQvetVZRy+qDgKskuuVKph9eX+VlS5o28d
	 ubB4CgPTt9ywFd3jwioAB0WBB2mOeH7ZPdAnAuS7ZgI/sBasPEY0UaooSoF3IKHasv
	 xvTwu+ksa6/ZKd2oS6vNd94y89mzX10xE6jlw5buG+erfI/pJVYJ7eVpN0OO3OEyCh
	 fEilYL7WXAF/nlWmm31A1v2dNS9p6tABW2OIyD1iJaFmu0fFdF0dFCY79EzlSkzs4V
	 ALdAMjXEwNY8vCzaUGu/RlbaQxozT7sgUY2m5ah+zdwqlDSABD6QDvXsgRjaXiUxSm
	 OwopotLYeQDUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFD4E40D4E;
	Tue, 13 Jan 2026 20:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9012231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6E30407DD
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDTR6cV6ZvPB for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63E4240788
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63E4240788
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62D8388570; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd738f876cb7a6b426607136cc1180c70d49b931
X-Git-Newrev: 849fa938579f220bdd9bfc8f947cee83db8837bf
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.62D8388570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_smproxy: bump version
 to 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=849fa938579f220bdd9bfc8f947cee83db8837bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-May/003603.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_smproxy/xapp_smproxy.hash | 6 +++---
 package/x11r7/xapp_smproxy/xapp_smproxy.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.hash b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
index 587864baf7..8afb3239d8 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.hash
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003218.html
-sha256  4aa99237cc9dab7d87ce9bc7cca4116674a853b5f08dfe3f9db1bb2b2cf9f305  smproxy-1.0.7.tar.xz
-sha512  cd6a6933b74f76ae65fb16504e57871724bc1102eae1d02e801e99c3fe73fe44e27f87cef3fbf9f75f369d18197b53bb677d637d94cc8185b55acae0cbd44f21  smproxy-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003603.html
+sha256  fee584eae2ec1ce2d178d72d3b484920271ba68a27935769cefbafbc3a2ff6c8  smproxy-1.0.8.tar.xz
+sha512  e930a01c3535050d7d580a93c0b2b7898ff8a8d7ab498215f2d035ab902989497d1fbc70f2939d04b609c980e86d0d4ba7829a98fda3261cb4b159432cd2bc8e  smproxy-1.0.8.tar.xz
 # Locally computed
 sha256  92dce6d8a1fcc0c6b5e56dc44e431e7f73bfa2ed5e83295662aa314067a671d8  COPYING
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index f76752941c..2ecd32e9e1 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SMPROXY_VERSION = 1.0.7
+XAPP_SMPROXY_VERSION = 1.0.8
 XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.xz
 XAPP_SMPROXY_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SMPROXY_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
