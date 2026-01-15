Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AE0CCF2D1
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73C7280534;
	Mon, 19 Jan 2026 09:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVhpnYqnCCW3; Mon, 19 Jan 2026 09:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9025880545
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816762;
	bh=Vzt8nQU7KGjS5Lc/NHLK5DRXXIaaozFDEYPguyqbQmI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ojcVBdR/9l8ELtwBjmEv8Yl6kBjpLHcOpVcfeaYRyZE6hXQ5xaNYnq/zPLH6jdLI/
	 DqjYdWAS5855yZ7s/3PF/ivQ++rZ8Y7+gBYV98tWfseW28mMrB34+66uUnQ+wc6zGW
	 RQpn2WRSVHpW/1mw2QK8um9l7aGJhkDI2AOMx7saY27vtJ8k8oBz47EoyLjwg4C6dv
	 DY2gMDxkK2pECtL0kPlyYdjdYF45kv8bWDPedOkJzRkxiU27s+4g33LSNPa2X4zl2q
	 sXjM1zsG/hegXo9Oo4eVl7i8segWZ4B/j+eL/9mkuw+5XZ/VmkF2ylLVO/KlC7FaW/
	 UxrKnfLA+rHHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9025880545;
	Mon, 19 Jan 2026 09:59:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 947502CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B75C6406D4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hj561rFcJ_es for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA996406CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA996406CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7FB988366; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:16:18 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d8664a88730fecbede86d21fcf556b921439795d
X-Git-Newrev: 1a8b410c63af30927dbc6d94083c682119169e9c
X-Patchwork-Hint: ignore
Message-Id: <20260119095849.D7FB988366@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nfs-utils: fix
 build failure due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a8b410c63af30927dbc6d94083c682119169e9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 83d0ba5faf990b556fc638edd34e1be971ba7338)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
