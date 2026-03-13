Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06BD107BCEB
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6286B81D34;
	Fri, 13 Mar 2026 22:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3qEM8vPtH7V; Fri, 13 Mar 2026 22:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D44E81D68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442248;
	bh=+peIIBKaoz8PYmC8VokzWlfK+A+kOIL5tJmHduDQ24g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iMvw37dI/UOsPEORlqw50unDb04PnBVuJphU0ec6ZYB3qn1iL8rSLgUcYG6LWpieh
	 HjLZtQtib6RoH6f7dRcOYPyOQfBHpBkvD93rLmwwrGWJwuYNMlPvyDhkbzVXY2rBra
	 oD6TDjzdPqYnqkauIZ5fTvqJrxT7lH+w678W4lHqruKuB0WnGpKCVbtrOwQ4oe4svA
	 9TScFmF7qYLB6/vxdFUv88ine+3skaCiptG1CRs797d1EgPbCKO4nqmQltZeHF0Oyd
	 TksSJDj2+3K8+dFSx5h2hArAim2ZpW7XtEYayxYMpQ1QRpjZLhFn6bvuWjPzjYG1NC
	 vRyuwp1kzP+IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D44E81D68;
	Fri, 13 Mar 2026 22:50:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 37F97786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 359DD60E68
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Po5d5POOuTCL for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 826D960AA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 826D960AA5
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A94A587398; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 23:29:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ce11070cb42f1819d1ff296a4600d314bdc126d
X-Git-Newrev: 5e0ab7e9eb4409e32a09c7fd258d9fe48477d283
X-Patchwork-Hint: ignore
Message-Id: <20260313225044.A94A587398@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inih: enable host package variant
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e0ab7e9eb4409e32a09c7fd258d9fe48477d283
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

host-inih is needed for host-xfsprogs.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/inih/inih.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index 4d9a8c03ab..c4a897604b 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -18,3 +18,4 @@ INIH_CONF_OPTS += -Dwith_INIReader=false
 endif
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
