Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9575FC43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63FAA60F34;
	Fri, 26 Jun 2026 14:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJGcsFK_9UCX; Fri, 26 Jun 2026 14:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 969E260F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485396;
	bh=shiCxSnEQ+MR7s7+93/dLdCIw8YSA5QIwPsF8Wp3L2M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eBOBQdK/LJagojbooGrQHnbws9a0o0NNiIr48reNh/D+949jmBTyaZCCXYcuEqKJe
	 Nb2ExEgaApV/R2xLZDiHAlo9rAqYnDj4xtFOFuHkCjD43Xliy0ajavstsUUAHZ/OLZ
	 OrBgLz4AjnmbaYCCKQ1v1jHxXypgBfrbpHEkIKhJv7MGQ46gRjTn+icqUJ+VwyLrvM
	 AGZfckePRzFXDm+E25c5CPyLvf51lye+1O6dm0/i5wX4Erl3qY/zHlC4tZCiTtilPb
	 unulLMxS3JWiK1uqYINPNf4Z0WngWKBm8tjtG4aLQyPs+sUdlwM36N9zWWUycwRm8M
	 Z7cULnBOWgJlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 969E260F31;
	Fri, 26 Jun 2026 14:49:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA1C13A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B006A8222D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ngpgkzl11zjW for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1667F8215C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1667F8215C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17F4C864AD; Fri, 26 Jun 2026 14:49:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:28:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f825a5d00a4e4dc834fb95cc70ba4b28fb168809
X-Git-Newrev: 55bbadc01c1251897c20a7fb39d262b21187030a
X-Patchwork-Hint: ignore
Message-Id: <20260626144920.17F4C864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openrc/sysv-rcs:
 fix shellcheck 0.10 warnings
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55bbadc01c1251897c20a7fb39d262b21187030a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

* Explicitly set shell type. Shellcheck doesn't know OpenRC, but the
  script as such is POSIX shell.
* Override warnings not applicable in context.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 3e2cc4e46ffd0d3a6a3ffa14bbe0645e7336933f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openrc/sysv-rcs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openrc/sysv-rcs b/package/openrc/sysv-rcs
index 1564cbe603..1b24cc3e1a 100755
--- a/package/openrc/sysv-rcs
+++ b/package/openrc/sysv-rcs
@@ -1,5 +1,7 @@
 #!/sbin/openrc-run
+# shellcheck shell=sh
 
+# shellcheck disable=SC2034 # definition for OpenRC
 description="start or stop sysv rc[S,K] scripts"
 
 depend() {
@@ -17,6 +19,8 @@ start() {
 }
 
 stop() {
+    # we need to reverse the order here, sort -r would be no less fragile
+    # shellcheck disable=SC2045
     for i in $(ls -r /etc/init.d/S??*); do
         # Ignore dangling symlinks (if any).
         [ -e "$i" ] || continue
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
