Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03DDCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8406147D;
	Fri, 29 May 2026 08:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfPFCDPXFxN8; Fri, 29 May 2026 08:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93AD261497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044471;
	bh=padopUnBpZHMGQIGmBIg2EeMs/IDRzQocpR9GsLSbUc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i9aZePl1LZod+8suKN8h2ih3p+UZLix5Mk1pJT08w6O9mGbGMI2ev4hN8o8/idOog
	 y1AnOdFeJZjEBn0hhJrIKc2wwRd4hlzdpDdQftizIzrwFmDZ6SWPmCI6QiDnbS267o
	 VnT7uAGYw6tfpKvYqIqTc5fLtaLg87FPOysYE9j7f//LELoJldSbLvy/tdiDNjG+82
	 zzc/jprpyqoJCKYO5RFbJd3ND9J94b/NJnOeUSJpt3fBzK6dpvWvT8EW6d7TZo82ZK
	 sLK/op9f5pXrmFHIFb9Rebam9yN12UWWATTjkl4v3lSyEtDr035bwy07Jk5YFTiLN8
	 CQtoWTdOBXAmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93AD261497;
	Fri, 29 May 2026 08:47:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5BF22E9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B680D6146A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_LvamrJyZmg for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D535261475
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D535261475
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62C23873AC; Fri, 29 May 2026 08:47:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:40:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c45594868330134a4515819e48fff70225be0722
X-Git-Newrev: fd0751a86ca3860992e00164ee3fb4cd41664eb1
X-Patchwork-Hint: ignore
Message-Id: <20260529084734.62C23873AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/docker-engine: remove
 lvm2 !BR2_STATIC_LIBS entry
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd0751a86ca3860992e00164ee3fb4cd41664eb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Remove lvm2 !BR2_STATIC_LIBS dependency

(It still depends on !BR2_STATIC_LIBS by BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS)

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/docker-engine/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index ae07b5e19d..541472d957 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -30,7 +30,6 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	bool "devicemapper filesystem driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
 	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_STATIC_LIBS # lvm2
 	select BR2_PACKAGE_LVM2
 	help
 	  Build the devicemapper filesystem driver for Docker.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
