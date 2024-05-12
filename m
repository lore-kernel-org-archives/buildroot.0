Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED27C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A1CD400D8;
	Sun, 12 May 2024 10:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfehA40Rfpmt; Sun, 12 May 2024 10:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8458A40217
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8458A40217;
	Sun, 12 May 2024 10:23:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2418A1BF290
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D77540217
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOHW-A3KEamO for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331D7400D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 331D7400D8
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BF018709F; Sun, 12 May 2024 10:23:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:23:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b6384bfd43a5cd5af959e65424704a4b92ceff1
X-Git-Newrev: dc3464c4b6da12c9d8809ada5bf7b26de0f7414c
X-Patchwork-Hint: ignore
Message-Id: <20240512102311.1BF018709F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: only install fsidd
 binary and unit file with enabled nfsd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: multipart/mixed; boundary="===============2042798035895041357=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2042798035895041357==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dc3464c4b6da12c9d8809ada5bf7b26de0f7414c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FSID daemon and its systemd unit file both depend on
BR2_PACKAGE_NFS_UTILS_RPC_NFSD but they're now always installed. Remove them
both if BR2_PACKAGE_NFS_UTILS_RPC_NFSD is disabled.

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jan Čermák <sairon@sairon.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nfs-utils/nfs-utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 4f2b41c782..b757e3e51d 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -42,7 +42,8 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_NFSD) += usr/sbin/exportfs \
-	usr/sbin/rpc.mountd usr/sbin/rpc.nfsd usr/lib/systemd/system/nfs-server.service
+	usr/sbin/rpc.mountd usr/sbin/rpc.nfsd usr/lib/systemd/system/nfs-server.service \
+	usr/sbin/fsidd usr/lib/systemd/system/fsidd.service
 
 ifeq ($(BR2_PACKAGE_NFS_UTILS_NFSV4),y)
 NFS_UTILS_CONF_OPTS += --enable-nfsv4 --enable-nfsv41

--===============2042798035895041357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2042798035895041357==--
