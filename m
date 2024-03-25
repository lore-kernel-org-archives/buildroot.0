Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2F4C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 18:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D317407D6;
	Mon, 25 Mar 2024 18:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUo0mOAa67yt; Mon, 25 Mar 2024 18:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E79A1407CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E79A1407CB;
	Mon, 25 Mar 2024 18:17:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 903F51BF263
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9101281975
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 18:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlnMT74AbjQN for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 18:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADBCB81A16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADBCB81A16
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 18:16:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8301837AA; Mon, 25 Mar 2024 18:16:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 19:14:53 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 456b9b3fd7f7c17fe76133a06f8724da3ec891de
X-Git-Newrev: d6b70f009a87ca539de0bfa1ce42f0da122bc06b
X-Patchwork-Hint: ignore
Message-Id: <20240325181656.A8301837AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/busybox: remove
 tc from default config
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6b70f009a87ca539de0bfa1ce42f0da122bc06b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Busybox tc fails to build with kernel >= 6.8
For details see https://bugs.busybox.net/show_bug.cgi?id=15934

In addition, tc is a very rarely used tool, so not something that you
expect to be available in busybox by default.

Therefore, remove it from the default config.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 44c221c856a473179daeb9e49bcb89af2b1b1405)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox-minimal.config | 3 +--
 package/busybox/busybox.config         | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 1e7ad1d357..5d2a30806a 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -955,8 +955,7 @@ CONFIG_PING=y
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
-CONFIG_TC=y
-CONFIG_FEATURE_TC_INGRESS=y
+# CONFIG_TC is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 6e8bd2799d..cfd16172fa 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -968,8 +968,7 @@ CONFIG_FEATURE_FANCY_PING=y
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
-CONFIG_TC=y
-CONFIG_FEATURE_TC_INGRESS=y
+# CONFIG_TC is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
