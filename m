Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212D1CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C526E8550A;
	Tue,  9 Jun 2026 13:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SN4LG002Rx0n; Tue,  9 Jun 2026 13:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75A6B85520
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010075;
	bh=Hx++XI0j5RxiMwCUbF06ywcxhjhy/eF0FqaKLMP1jY8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gEndv9keGmLIx9bGk1G/tBiafD23QoaWIkbRENTlv5jL78ACTZvya7hw65Rem65m9
	 rSum/FNocGmQ2ctx8RI2LUm0MWv7pxuxXOUKmqSYtVH05QvN3q6hH/jEiG/xILGfTf
	 eDd/SjT+w0iGEFja6N0XDnWcgS0832Rf2W9rCiXNb+8XjVIru0aKcDykxSBy391C8k
	 PPrcJNkiz6lhAutLe4iCtvHWS/6vS+v4K7dRKcQoCB5lc8Nd6Fu2w069cDLM3f6E5E
	 kIRYX5rwiqx4XjOQHonZL2EZncFd6vp6mwMpwWxX+4NLH+Bz+4V2OYRdPSqlCcN0kv
	 tiJjPwYZDnQbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A6B85520;
	Tue,  9 Jun 2026 13:01:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A7E2196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BF56423C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZezQwqDTZLcc for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5515F423C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5515F423C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 852E2879C4; Tue,  9 Jun 2026 13:00:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 10:40:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6be4815e494aae813124db54f6ba2fab555a372
X-Git-Newrev: e27d105dde16ffb1962edbfe5edf059d55ec7f2a
X-Patchwork-Hint: ignore
Message-Id: <20260609130053.852E2879C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zfs: bump version to 2.4.2
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
Content-Type: multipart/mixed; boundary="===============2389116355847102330=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2389116355847102330==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e27d105dde16ffb1962edbfe5edf059d55ec7f2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release note, see:
https://github.com/openzfs/zfs/releases/tag/zfs-2.4.2

Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/zfs/zfs.hash | 4 ++--
 package/zfs/zfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zfs/zfs.hash b/package/zfs/zfs.hash
index 6e47f07ead..507de484c1 100644
--- a/package/zfs/zfs.hash
+++ b/package/zfs/zfs.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.1/zfs-2.4.1.sha256.asc
-sha256  c17b69770f0023154f578eb8c7536a70f07d6a3bb0bd38f04fa0e8811c3c1390  zfs-2.4.1.tar.gz
+# From https://github.com/openzfs/zfs/releases/download/zfs-2.4.2/zfs-2.4.2.sha256.asc
+sha256  7e260d0e6af295bea4c5e241cac0a1aef07b58d8dd8035f7898ade3b1bbec78f  zfs-2.4.2.tar.gz
 
 # Hash for license files:
 sha256  1ffb70c33c4f79f04e947facc5c7851f289609256aacb47fc115f700427d9520  LICENSE
diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 0ecc9eee2d..040a6869d8 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZFS_VERSION = 2.4.1
+ZFS_VERSION = 2.4.2
 ZFS_SITE = https://github.com/openzfs/zfs/releases/download/zfs-$(ZFS_VERSION)
 ZFS_SELINUX_MODULES = zfs
 ZFS_LICENSE = CDDL

--===============2389116355847102330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2389116355847102330==--
