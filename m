Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667B6CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F37F48053D;
	Fri, 15 May 2026 17:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEmebFASwiJU; Fri, 15 May 2026 17:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE23814DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867259;
	bh=ITA4RRdqVcI0Ucuk1oR6t5Ha8DmEJHTA1i2rN/kfB6Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DcEHCs5iC1zNifPzCSIUPPfpGhsfjUj4EyWT5HngZ5V0WTt1cwRlsknBQFxLuLIIL
	 0MUlRhgHpdBOmNQjL+PdqgRGIJosuuBcKQZnyh6yXzz9gjUctD5pe9OlqzteS8QA6l
	 EfHdDOUmr1IQ+caHHNiC7Wy7YssQrGXPEtOzDWfe2C//PC/4X0zaSmLvVquGXoAniD
	 BTA8VWm6+TT4uEtsrnsP95l/4SecjcBVRsDl0iOXXOToCb+YVOTBJtmZwZaDaKvTem
	 RbT4MuA+7ropeBSK7ok1OnyxRIrP9jBZHNNPpEVQyIfbkm0eerSjBcsbnDDHv+ZDXx
	 4v+/ibQv2GPJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE23814DB;
	Fri, 15 May 2026 17:47:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BB46545B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB6BD40FA4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39cqdJcXomUo for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75ED040FA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75ED040FA9
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A70E786334; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:18:15 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ce4d425a53fa6a0e2980deaf8abe181820817fb1
X-Git-Newrev: c7e20789e8e302de7b0bff3f670032fcb21370c5
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.A70E786334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/openssh:
 explicitly configure PID file directory
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7e20789e8e302de7b0bff3f670032fcb21370c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

OpenSSH checks during ./configure if the default location /var/run
exists on the build host, and defaults to ${sysconfdir} (/etc/ssh in
Buildroot) if not. This can break e.g. in a sandbox with its own mount
namespace where there is no reason to create a /var.

On the target this leads to errors when starting/stopping the service
from the init script, which expects the PID file at /var/run/sshd.pid if
sshd is running. A "stop" (including as part of "restart") or "reload"
will always fail with

    no /usr/sbin/sshd found; none killed

from start-stop-daemon, even though sshd is running (because the PID
file doesn't exist where start-stop-daemon tries to read it).

On the other hand, a "start" command will try to start sshd even if it
is already running, because it cannot detect the running instance.
Unfortunately sshd does not fail directly in that situation (so the init
script completes), but something like the following appears in the log:

    [May 04 14:48:05] auth sshd[4592]: error: Bind to port 22 on 0.0.0.0
    failed: Address in use.
    [May 04 14:48:05] auth sshd[4592]: error: Bind to port 22 on :: failed:
    Address in use.
    [May 04 14:48:05] auth sshd[4592]: fatal: Cannot bind any address.

Explicitly setting --with-pid-dir=/var/run overrides either default,
and only logs a warning if /var/run does not exist.

[1] https://github.com/openssh/openssh-portable/blob/5fa60ae0d2ed3fc441f54c9349afbd63b6301929/configure.ac#L5568-L5576

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Marcus: expand commit message after discussion on ML]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit c09bec68f14f39e99b40eda89e538a6f4075fe98)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openssh/openssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index bcbfc39755..3ba7a41cc7 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -20,6 +20,7 @@ OPENSSH_CONF_ENV = \
 OPENSSH_CPE_ID_VENDOR = openbsd
 OPENSSH_CONF_OPTS = \
 	--sysconfdir=/etc/ssh \
+	--with-pid-dir=/var/run \
 	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
 	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \
 	--disable-lastlog \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
