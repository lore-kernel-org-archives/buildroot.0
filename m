Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43463CEFD1A
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C42560C27;
	Tue,  6 Jan 2026 22:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bJfDYucja7q; Tue,  6 Jan 2026 22:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED17560C2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737779;
	bh=WafJv9WzzCUtK6qJUZqL2bVf1jMBL3FBJaHqYToCbhg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GqwPPOG06UoOThQ8XGO4Y+PF/r6sU8imAiM3MBUhrUb/QkIhJog810+twEsCRHKSp
	 qiHInCLzQ0poV2Xyb/QLDktRGGVzis/ODr9GXnzBtQloqUiAfekQr/O1XB1GCrtJQt
	 B4tp9CnGJK9hgekoQozA79gA5a5+fmxqojCy8p8KEs+FEDOaS4u6V8w4B4Vez5RfIf
	 4DvO7XBQRT8l8RrpYfP+EFrU51Jee7Vd46HbDrQm2GJtKgZVkQWwzOWsd78ue1Pv5E
	 evEBwDFzzp9GHLuc6gF6gtRU+gsekay1OOJF8210uuLyJMG43cw4aNB0GtNXEdJuFq
	 cG90Lc5e8UJrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED17560C2A;
	Tue,  6 Jan 2026 22:16:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BF7F970
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81EED60C21
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 046ZTI8_NsIJ for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE9160BE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFE9160BE6
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B122488349; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 23:13:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 746dd2ad2ba4acda80f4572a5082c4f8d4b2f9c6
X-Git-Newrev: 83d0ba5faf990b556fc638edd34e1be971ba7338
X-Patchwork-Hint: ignore
Message-Id: <20260106221613.B122488349@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: fix build failure due
 to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

commit: https://git.buildroot.net/buildroot/commit/?id=83d0ba5faf990b556fc638edd34e1be971ba7338
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package nfs-utils requires libtirpc rpcdb option enabled. Package
libtirpc with commit [1] disabled rpcdb functions by default so let's
select it by default to enable rpcdb functions required.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.org/results/29adf2d04cf4c46e492af95edaa96983985d6b57/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nfs-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 02cc7e78cc..419b605667 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
+	select BR2_PACKAGE_LIBTIRPC_RPCDB
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
