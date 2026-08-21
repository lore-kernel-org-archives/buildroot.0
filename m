Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E75BC5DF8C
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 19:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B98BC81157;
	Fri, 21 Aug 2026 19:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umozS352mhq6; Fri, 21 Aug 2026 19:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787341551;
	bh=BGitodKyioO3SdL64baJ31ctY6pmis1d0rwyJaILnmg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q9DOF3OXBLr9cZXi8/MxKzyZbYOHZbnQdmgQYSky5AXUzc3/0ihhTon9hGRqXDOSb
	 /2i5FBQUw4WWtEpfYSzG9/dUeV3LY9mbhQjsRNLb8Qqx/dYCi0Mycl5DUW9I6xicJ2
	 5YnYKfaJa5eal1tMy1wKgnJOtjQg8r8pIfjPePnPhiSMZEr1skMjoXD7s6EjJZTcOe
	 iIp5ZI2R77v2O2I/brmae19L174Vw4A1wVKZ7ieOywSPIeOuC51WCWp6AQWJpqLw8R
	 6HMTxsnclIpU+ITr1Jgz/vOZAberIyoFePHE2NtV5XNCjFhfm+uwYHfJb89OijUHiJ
	 9iaSRbM1fkkkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000E581167;
	Fri, 21 Aug 2026 19:45:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A58BF336
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A296240995
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpJ4u3kGmRWW for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 19:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C28F04098E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 19:45:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C37F8E1C7; Fri, 21 Aug 2026 19:44:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 21:37:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f6b34f8519ad7f47814edbf3c49869213aef423
X-Git-Newrev: 7eb4a552c4037581144b1cbcce69daded51f24f1
X-Patchwork-Hint: ignore
Message-Id: <20260821194455.1C37F8E1C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: fix gdb default version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7eb4a552c4037581144b1cbcce69daded51f24f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

We need to select one of the 3 gdb versions available when host-gdb is
not selected but the condition was removed while removing gdb 14.x
in commit [1], so gdb package fail to download the archive.

Select BR2_GDB_VERSION_16 when !BR2_PACKAGE_HOST_GDB.

[1] 6737c90bc6f89cf0c702707933207dd7c5e3398a

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219536 (TestGdbFullTarget)
https://gitlab.com/buildroot.org/buildroot/-/jobs/15969219539 (TestGdbserverOnly)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gdb/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 93f174db99..2e1eed6f50 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,6 +67,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "15.2"	   if BR2_GDB_VERSION_15
-	default "16.3"	   if BR2_GDB_VERSION_16
+	default "16.3"	   if BR2_GDB_VERSION_16 || !BR2_PACKAGE_HOST_GDB
 	default "17.1"	   if BR2_GDB_VERSION_17
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
