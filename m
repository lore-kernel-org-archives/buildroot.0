Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF79BC44529
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 20:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E317406CC;
	Mon, 20 Jul 2026 20:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSJDsrISHGYE; Mon, 20 Jul 2026 20:23:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B723440531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784578981;
	bh=iXt9WXNGe7AS+gTkx1h+gjVd3wK8Jr4+OqGGZ5Qb58o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q4SJUVXwtbrOlBM6QWVn2QdPJ6TuuoNE3+gqKs6AAX4Ju6shTqFwODvN5apSjPNQ2
	 C6ZPjt5IoV+q/CS/ggT9SN2TNxl3ippFdvgfzDaPoVunUnSOh/1VHuSffUi2ofmxRd
	 8PbrVdvR79q28vGfyXiKtkx/5c6e5hHPlYWEY3l+MqCHQUXKpO2YzE0deJGGG6ty7F
	 BLwpuqh9H47yflMG59TAP1NiD/RQ4Xcre26bjVqpdf4a3Pn2rCrTLBO8nEZL1dHv25
	 NljwmVdGWOQiKMEBP4BXBOD/Pua/IaGa8LFzn135C6P1S4ycxS0lTtGzGTTNFE0xWs
	 cBRNqZjNQ5NFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B723440531;
	Mon, 20 Jul 2026 20:23:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BB5D1142
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C9B240531
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPzjD23jFTr6 for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 20:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E70F540524
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E70F540524
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:22:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1340789066; Mon, 20 Jul 2026 20:22:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 22:21:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9687af626abefc7d7d7c81157dbf8997fd31005
X-Git-Newrev: a44b18837dc54504f25139d7a3e571cb67cbc9c4
X-Patchwork-Hint: ignore
Message-Id: <20260720202220.1340789066@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: fix build for powerpc64le
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a44b18837dc54504f25139d7a3e571cb67cbc9c4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/40a/40a26d9831667233944e6aabf2388f02a8cf30ac/
https://gitlab.com/buildroot.org/buildroot/-/work_items/79

packet.c: In function 'ssh_packet_log_type':
packet.c:1219:1: sorry, unimplemented: argument 'used' is not supported
 for '-fzero-call-used-regs' on this target

Upstream bug report: https://bugzilla.mindrot.org/show_bug.cgi?id=3673

Upstream commit
https://github.com/openssh/openssh-portable/commit/29cf521486bf97ab9de5b9b356f812107e0671bc
which was first released with version 10.1 and was added to buildroot
with commit b52b3fd59dc6c86ef51b6cad5b76017f90c83beb introduced cache
variables to disable zero-call-used-regs when needed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openssh/openssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 2f3088defe..5575ba4f97 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -36,6 +36,10 @@ define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
 
+ifeq ($(BR2_powerpc64le),y)
+OPENSSH_CONF_ENV += ossh_cv_cflag__fzero_call_used_regs_used=no
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_110934),y)
 OPENSSH_CONF_OPTS += --without-hardening
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
