Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC69EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C32660A7B;
	Sun, 18 Jun 2023 13:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C32660A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exjE7gOJscGD; Sun, 18 Jun 2023 13:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E12260F97;
	Sun, 18 Jun 2023 13:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E12260F97
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D4B31BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB8E781E9B
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB8E781E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNab1HCsg0Zc for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:31:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35A2381E9A
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35A2381E9A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 232F483FD2; Sun, 18 Jun 2023 13:31:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:28:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 049adbb6073f3f8b08c04df231565f8661f29c16
X-Git-Newrev: 7faf0389fd6a999f877b037e1bbbd1b04c36fa49
X-Patchwork-Hint: ignore
Message-Id: <20230618133126.232F483FD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: bump to v2.11.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7faf0389fd6a999f877b037e1bbbd1b04c36fa49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream ChageLog, summary:

 - Add wildcard support for Cloudflare
 - New DDNS providers from DD-WRT;
     - goip.de
     - myonlineportal.net
     - desec.io (a.k.a. dedyn.io)
     - domaindiscount24.com
     - dy.fi
     - do.de (Domain-Offensive)
     - Domopoli.de
     - inwx
     - It's DNS
     - Joker.com
     - all-inkl.com
     - core-networks.de
     - dnsever.com
     - dnshome.de
     - dnsmadeeasy.com
     - dnsmax.com
     - schokokeks.org
     - variomedia.de
     - udmedia.de
     - moniker.com
     - dyndns.it
     - infomaniak.com
     - oray.com
     - simply.com
     - mydns.jp
     - myonlineportal.net
     - namecheap.com
     - regfish.de
     - twodns.de
 - Support for updating both ipv4 and ipv6 address for same provider
 - Add new command line options -L and -S NAME to list supported
   providers and their respective details
 - Add 'success' as a valid generic response to DNS update
 - Fix use after free in logger at inadyn exit
 - Use dynv6 'auto' IP only if we have not detected an address
 - Replace unstable api.ipify.org with http://ifconfig.me
 - Fix default checkip server for dnsexit.com
 - Fix easydns response code problem

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 2c0995babf..94af9f87b7 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  1727b6aae6727f99eba584e46950369d7b259d2ef09e5bc02566e9c3c1d6daf6  inadyn-2.10.0.tar.gz
+sha256  9ddac7b6b0a1ed372c6cb5afaec6bea927ab539db02c8536dd10d73bd1d37c95  inadyn-2.11.0.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 5a24c1eced..3e346fd769 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.10.0
+INADYN_VERSION = 2.11.0
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
