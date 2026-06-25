Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A2BC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C41A040FC1;
	Fri, 26 Jun 2026 14:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2lcjKFCSKor; Fri, 26 Jun 2026 14:51:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2E0340FC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485503;
	bh=ZySvIkjdWsc5JEqodElexmdhTSRMRTaegNVhc90eTZk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jJ4/3tORwrAY/hE9cuEakpqKqE3kkolaBFZ156XpbZvuTHWlTZSgc7eWVXI5ECCyw
	 SKO7v0oy4lMQEXLgp6skFMHyJl0vCKNf13KzwK9sdD+7BXL6Kh0IeN4ahDiHUOL2A5
	 03iOVytb2KLkK31CEN/LvIY/v+16hqTkbUTdcUD/PbJPbbRymgQIk4nLdzLElH9tFK
	 UvP64ouz9qUi1o0DY07b4/wqrfnpF3qT6ZwI/OzhT9J8viyBiTl7MtmjRXq05ccfuR
	 rh75lqYt6PVQHV49IuYYTAsMLKnNPQZfbaLYk3MOw9xJDRIPBPIDhGQJffFba6QX5w
	 QMvV3WumOhmjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E0340FC4;
	Fri, 26 Jun 2026 14:51:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 375913A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2840840AB0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLTMz34Yvg-a for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3F4440F2C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3F4440F2C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCD638649C; Fri, 26 Jun 2026 14:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:28:43 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 11bcf5f5f658923f0ade30d9ae00d9c299a54276
X-Git-Newrev: b7ab3f2a18df7ed729739cc49d95e4db7260244a
X-Patchwork-Hint: ignore
Message-Id: <20260626145107.BCD638649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/openrc/sysv-rcs:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7ab3f2a18df7ed729739cc49d95e4db7260244a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
