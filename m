Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA53C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D95ED60D87;
	Sat, 11 Dec 2021 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvutvOTxUxJi; Sat, 11 Dec 2021 20:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3686560D74;
	Sat, 11 Dec 2021 20:55:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 283891BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51E87809F6
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKnGK0uG4Twc for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 135B684F35
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D3DA682965; Sat, 11 Dec 2021 20:48:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 21:00:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29bb478a49712dfa8ec25262cac77b7c8ff1e51f
X-Git-Newrev: 32cdb03640d05f7cf1e0984ed40c70defde38185
X-Patchwork-Hint: ignore
Message-Id: <20211211204814.D3DA682965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: update inadyn.conf example
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

commit: https://git.buildroot.net/buildroot/commit/?id=32cdb03640d05f7cf1e0984ed40c70defde38185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Comment out iface setting, usually not what you want
 - Update DynDNS example, show use of multiple hostnames
 - Add FreeDNS sample config, free and stable service
 - Add link to syntax and examples

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/inadyn/inadyn.conf | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
index 1b29027606..3328ee2218 100644
--- a/package/inadyn/inadyn.conf
+++ b/package/inadyn/inadyn.conf
@@ -1,11 +1,26 @@
-# Basic configuration file for inadyn
+# Example /etc/inadyn.conf
 #
-# /etc/inadyn.conf
-iface    = eth0
+# Remember to change this file to match your provider and credentials
+# Username and password can be included from another file.  For more
+# info, see https://man.troglobit.com/man5/inadyn.conf.5.html
+
+# Use IP address of interface instead of external checkip server.
+# Useful when you want to register internal IP addresses
+#iface    = eth0
+
+# IP address change check interval
 period   = 300
 
-provider default@dyndns.org {
+# Remove of change to match your Dyn account
+provider dyndns.org {
 	username    = test
 	password    = test
-	hostname    = test
+	hostname    = { "my.example.com", "other.example.org" }
+}
+
+# Remove or change to match your FreeDNS account
+provider freedns {
+     username   = lower-case-username
+     password   = case-sensitive-pwd
+     hostname   = some.example.com
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
