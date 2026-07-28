Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453ECC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F262B812DD;
	Fri, 31 Jul 2026 11:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMLheoKfkSQr; Fri, 31 Jul 2026 11:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BFDE812D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499112;
	bh=LrsOycX31JIdwkvVvmWaF42ugNXNu8BD6GOwXOU0fpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JcCMDJNWkyIUFjb/z7Ps6ja+8ZdK9sEu9TbXeq8jsfO5pWqhR/8pk7jEwXIS9IFim
	 kCECG+Wc88KXwRY46PlnWP232xqlwdjRaHsYtkRb0tlh1VlgtiF+jGalNslmVRfd6I
	 ML0CetkdRHV8fSLa47V1KdDn+I+B3Y5YHXIvJpn9TJ0yFHsCS91O+PB6XfDVJQXOHZ
	 oOv0jf40GchBMfkmX9gDx47uaKPVPFCPocQbDKgwilJ1z3EFpzGzJKKkqKS8eMyNIH
	 ZF7hJcHOqbGQ+nPjmNLl+20XIFpzNHW1yYNu5v0umje84EG0GIs9XOG+bxovVjpHjY
	 niD6goUzBQYHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BFDE812D1;
	Fri, 31 Jul 2026 11:58:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE1E523F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4F1640F85
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaPHaFdR2Ctt for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA96340FA3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA96340FA3
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB57C8B746; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:47:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dd8481e7672b343d8c01540ff5687d33e2c09df8
X-Git-Newrev: 21053fd5085c58eed8a4d69775c7a568055ed042
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.BB57C8B746@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openssh: fix
 build for powerpc64le
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21053fd5085c58eed8a4d69775c7a568055ed042
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes:
https://autobuild.buildroot.org/results/ee9/ee9329461cc36650416013216cac15820ceb7174/
https://gitlab.com/buildroot.org/buildroot/-/work_items/79

packet.c: In function 'ssh_packet_log_type':
packet.c:1219:1: sorry, unimplemented: argument 'used' is not supported
 for '-fzero-call-used-regs' on this target

Upstream bug report: https://bugzilla.mindrot.org/show_bug.cgi?id=3673

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a44b18837dc54504f25139d7a3e571cb67cbc9c4)
[Thomas: point to 2025.02 autobuild failure, and use the fix in the
issue comment that work on 9.9]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openssh/openssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index a7f13429f2..136dc08d36 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -56,6 +56,10 @@ define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
 
+ifeq ($(BR2_powerpc64le),y)
+OPENSSH_CONF_OPTS += --with-cflags-after="-fzero-call-used-regs=skip"
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_110934),y)
 OPENSSH_CONF_OPTS += --without-hardening
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
