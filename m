Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0802E8FDD8
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 14:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E9D280DEC;
	Sat, 27 Dec 2025 14:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awrMEFKgynJj; Sat, 27 Dec 2025 14:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F28880D74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766847524;
	bh=MPCFWAefMxuwSgTVr7DbUy96VBMUzTJa1EetUqQd6Vo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=enzthYiznT8SkxaFPd36BHibmxgeEOrnoRXVoL8T/K9NIGofHd8Ia6HNshtNQ+sH5
	 vesN97FA4eio8FojqORJD3GEnqm+bHbJ4R2bQ89e3JVRTFVTcmcwSa7tE6GCZBBf5B
	 kZRBrTI59FjemdzFAwpyXRXU6fSrHh6UzKU7BvmmCo9OqeiWeEE5WRKmKjbfZOvVbF
	 JrVSrZHIwX0YsRves+yeABB1qHjyfqU10Gbh9BaLIrF88RTGrXy0wm+Q7MzpxQQXiu
	 VfQD6p0YuDFsqj7oyQvoaNTBQ5S0WZ9u0irPgCwlJ3/Uqhii9B2sNc0QoUL02Ixu5d
	 KBGRNzsyLmEhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F28880D74;
	Sat, 27 Dec 2025 14:58:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1C4B119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2D1F40612
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwEtbEroWkZz for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 14:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11DD1405FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11DD1405FF
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:58:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 018DC87755; Sat, 27 Dec 2025 14:58:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 15:58:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2668d121e5add1f999206b5c43fa325587de81b7
X-Git-Newrev: 55d84aa4bdfecd8453b16f5693f36e383b955b10
X-Patchwork-Hint: ignore
Message-Id: <20251227145842.018DC87755@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/libselinux: host-python3
 needs SSL support"
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55d84aa4bdfecd8453b16f5693f36e383b955b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit fd991649d39c143fa60419691d01ffb816b39bf0, which
isn't the correct fix: indeed, host-libselinux can be built without
BR2_PACKAGE_PYTHON3 being enabled. And also having to use the network
during the build is anyway not correct.

A follow-up commit will fix this issue in a proper way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libselinux/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index db5694e7bd..bc40e32a46 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -7,7 +7,6 @@ config BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_HOST_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
