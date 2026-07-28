Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6C3C55172
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F31A260ADF;
	Fri, 31 Jul 2026 11:57:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VuKGOyxh-V7h; Fri, 31 Jul 2026 11:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1852060AEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499020;
	bh=1dm1fLGT6HmLEfc1bv2V82FjgbASEsOYJelpRK4kQ4w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sdoewly6dixHOHxjU2Fbhlgiugrh6O+6FS+0F+azxoHwqo48BFMiMxJMrM3BEbE08
	 hUX6vB93j04qNnma+eOgZkb12Rda9qeFd91QnHB2JBRY/ChnghFubXnLHoaiwaY0vB
	 gJSF8rAtov3E+SgNBRnnl5hvkX+3VQ8KpGVKusf1JYlBwQfMjd3SN5XpDKXYNPwySm
	 67t0XdOFHzbtwmAcGDc05kEUEpTlzEf+O+zzMv0Id+JRusIhz+PU3+T80Cwh0jcisX
	 i8MlLsIIW5j+ruHrGClqYMhq7b+bf1A4Q+O2rhI6ltUJPY17usV0Gd1LnuTMtYlxNO
	 b1S9EL/KTsNbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1852060AEC;
	Fri, 31 Jul 2026 11:57:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 183A737F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC20E40463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0-vm6kbx_Mx for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A40F5400DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A40F5400DA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89B848B742; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:44:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: cb55591ab5ba00b9872f8c5d60152473662e4121
X-Git-Newrev: 377bd40298eed7134ba39002e046bbf2455147ac
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.89B848B742@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/openssh: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/377bd40298eed7134ba39002e046bbf2455147ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit a44b18837dc54504f25139d7a3e571cb67cbc9c4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
