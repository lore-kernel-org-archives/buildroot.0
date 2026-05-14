Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFE0CD4F25
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 15:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B20998234B;
	Thu, 14 May 2026 15:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpP19h9mkeHT; Thu, 14 May 2026 15:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E6A8234D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778770928;
	bh=eb9khQLK9AveCrTlEkveWEKHCnkCH6g0pKT2iKznEOU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZS+qOBYIVuaUifN3vN5nCHKVizNxeA8HT50Vbl5oF3lwlsTMmBu27SO6Zm0Vvyu7y
	 qzK4bZgrAal9lyVzEu3acm0FdmbQz1rqWHIbTS8dQjvreJVn9XBmVDujkc6Bx1XtFJ
	 fJmEpET4bLDerhyw8oZrE58xQXC5YJp2cJYqFXlSTQBIVvhtBTfAc1UEYMzilmkrzC
	 +EC/tcSZORBm6g1EXEuyxVBAcrpAA95WWK9DTDOSChIDHwaBDxAMdJDH8EPgmRrUSC
	 cfg1bf40NxUVkx2lGnL3D4hMEH9edMN45tubtUwPhstV7Z3NioZejKHf+hrJ2fa5HS
	 wGCLTAJHWWpVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0E6A8234D;
	Thu, 14 May 2026 15:02:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52F4E37F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C80F40F60
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWIOgPVl4XoI for <buildroot@buildroot.org>;
 Thu, 14 May 2026 15:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E86940F56
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E86940F56
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ED2B8622D; Thu, 14 May 2026 15:02:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:44:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 768f16502ad42b0b4496c8df1605173deeb50ff9
X-Git-Newrev: a9b08e522c6641cc9bf18d054a88c9641fbd41b6
X-Patchwork-Hint: ignore
Message-Id: <20260514150201.4ED2B8622D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/checkpolicy: bump
 version to 3.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9b08e522c6641cc9bf18d054a88c9641fbd41b6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/SELinuxProject/selinux/releases/tag/3.10

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 442ac883ee..302122426b 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  dd85b0173ca6e96b22ebf472bcbccf04eb10e1aa07add8f1b7e0e9e8e995e027  checkpolicy-3.9.tar.gz
+sha256  2d92951dfcb090d6179e7a23856622e0fcbc32be03bf1e60ace9dc9cbda11e59  checkpolicy-3.10.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index df3da2efdd..abeeed1033 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.9
+CHECKPOLICY_VERSION = 3.10
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
