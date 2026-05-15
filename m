Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306DFCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE73484533;
	Fri, 15 May 2026 17:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioZW55vAN_lu; Fri, 15 May 2026 17:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C768584191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867099;
	bh=QsaGohq6MOjzKldxtq0tp2I/Mdrqy1Xv9VQAQnlJ05w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Hk0fbZESzQbNJu6l/xK1VWO2qxXQ+4ZWTNiWkxqvd/X3Yv+i7TM07sk45pgeDupPq
	 9gdudgklVWiElpr3VJ1kVxGMiTzbqp4wFDKKFKbeckEdbdNOzfpuPuK1dCgB5C9rd2
	 6/ImpsQN/Dzenw40WF0tzN/gpeNXY18LI0fRxSHWq3HQngony5XeTfebXACOkL3kPN
	 /FECIhkZsKdKH1bX2eRnMqpUq59si3wbcpse/weQK0KDXjaFQdCTmvglnLPOzxKjlo
	 O1zi1ib3N3cJmhJvBhM8vF+PWjZ+M7AndEVbeKB78eA3X6G81ocDJkuGn2HA/78yvg
	 UYZPoHmRanc4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C768584191;
	Fri, 15 May 2026 17:44:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3AE41295
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5CE140FA4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXktDRaB0x3c for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A78474027F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A78474027F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9847863C7; Fri, 15 May 2026 17:44:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:18:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c237fae2c32ce373eba788712a4a5e034c1b7945
X-Git-Newrev: 4452bdb483efbf9bc623d27a1954ddaa67463680
X-Patchwork-Hint: ignore
Message-Id: <20260515174448.D9847863C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openssh:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4452bdb483efbf9bc623d27a1954ddaa67463680
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index b5e4645b50..f0c542df23 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -23,6 +23,7 @@ OPENSSH_CONF_ENV = \
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
