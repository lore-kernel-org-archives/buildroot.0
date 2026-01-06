Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE606CEFD18
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA5960D4B;
	Tue,  6 Jan 2026 22:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCCzZmfJm737; Tue,  6 Jan 2026 22:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA05F60C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737777;
	bh=FSNc7UlDpdkF4eXc9M8xRPOPqmqLUAEZW+8DzyeE/c8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q1nFl5FnvszXMNc0jLTHfnHBstneQPPii350w3EwA9qZ/QPF3QGxjH0JIhyTiLQIO
	 4QCy1tHXCyblgfT9nItK/xTa8Yl8aABSne0gohDx9IH73aEDCVaHpAZOFBsveiXwH1
	 esVFj7aqvnWgSsL98E8q/v28d7uD4RJVGUAR4J5wOywXRzDBpeDSRyZi5lxpO/oPd8
	 vX3ZGvp+sgFDiXY06ClaWcst6N/K3tJGG4m4vSASsH2OvOq6VE9dMI7l2IeK+pOylo
	 7LOs9r6EnEQchdheM4rO3CgNCrMauYY7uCYIkLleWDocAkoWoFOLl04h4SNXsxgkZm
	 kXd8wdI9I0s5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA05F60C27;
	Tue,  6 Jan 2026 22:16:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94D8A249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BD4640753
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H78oBx-Nipvf for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D440D400E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D440D400E3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C406487CE3; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 23:14:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2159c80b51a4f8606e382c180bdeca8f92e9705
X-Git-Newrev: 417d2cd64a67c32a8a5be57b04d759da787a0a7d
X-Patchwork-Hint: ignore
Message-Id: <20260106221613.C406487CE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quota: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

commit: https://git.buildroot.net/buildroot/commit/?id=417d2cd64a67c32a8a5be57b04d759da787a0a7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package quota requires libtirpc rpcdb option enabled with non-glibc
toolchains since the bump of libtirpc to version 1.3.7 with buildroot
commit 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream
commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

These build errors, caused by the forementioned upstream commit, only
occur with non-glibc toolchains:
https://patchwork.yoctoproject.org/comment/30091/
"but I believe it breaks the build with musl"
as shown by our autobuilders:

https://autobuild.buildroot.net/?reason=quota-4.10

Fixes:
https://autobuild.buildroot.net/results/fb0/fb0adbb7687d8db4228e2fc1ce7a7272486fd3ef/
"svc_socket.c:(.text+0x2c): undefined reference to `getrpcbynumber'"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quota/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index 051a765570..0b7b5b8946 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	help
 	  Implementation of the disk quota system.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
