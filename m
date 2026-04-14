Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A30F9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCABB84DB2;
	Tue, 14 Apr 2026 17:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULqIlc2Ox0O9; Tue, 14 Apr 2026 17:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A2F783D38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188933;
	bh=ftAJZH42o0XwX7X2ntrlA2LJPk/lXKB69Z082DfIcpc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z3aorXiOgZ+JoSawanEPNCosjPwoIKPIbFFeWZdbVWYv11ABXQ3kgJPLr49AQpkKh
	 /Vk+j/jpk5okk+bVPdBZMw8KYyuxNk2bTTBRl0DZVbLAUwhtvAE65gBpiySmqpjQja
	 tTlHJHOTeQZEIS71H8lBgtBJLb/ckILTwdgJCqPhUfR1HwRthKDARA0926P0ik/6cb
	 Vb9m2QPgjniORG2GpiE64OYylQnz8P87mP/V2l+1CiW0noQm5hnsOp2hzVJql5/Jle
	 YkgBnQqeNOMqDOLOqeAsEWMVjzJmIL3QP27NuC5P4E5czrCA/IiYb85FPzcq5J5QB5
	 jYnf6Ru46hnbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A2F783D38;
	Tue, 14 Apr 2026 17:48:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3653394
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B96EC6F4D9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_tSAJXpC1Y8 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D9F96ECE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D9F96ECE9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B36947FB2D; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 492155af6ac957982683c6e95a1701b1aa6b859d
X-Git-Newrev: 6c81798b6828707080c76167789b857b8cf2c357
X-Patchwork-Hint: ignore
Message-Id: <20260414174849.B36947FB2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brltty: remove optional support
 for pcre, keep pcre2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c81798b6828707080c76167789b857b8cf2c357
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/brltty/brltty.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 4952210121..c4bbfc9a40 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -95,9 +95,6 @@ endif
 ifeq ($(BR2_PACKAGE_PCRE2_32),y)
 BRLTTY_DEPENDENCIES += pcre2
 BRLTTY_CONF_OPTS += --with-rgx-package
-else ifeq ($(BR2_PACKAGE_PCRE_32),y)
-BRLTTY_DEPENDENCIES += pcre
-BRLTTY_CONF_OPTS += --with-rgx-package
 else
 BRLTTY_CONF_OPTS += --without-rgx-package
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
