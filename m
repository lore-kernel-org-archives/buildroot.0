Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3B7C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BC0280D64;
	Mon, 19 Aug 2024 20:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4612w5HBKh3t; Mon, 19 Aug 2024 20:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22A9F80D6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A9F80D6A;
	Mon, 19 Aug 2024 20:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17D041BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 052FE80D6A
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCMqDnH6CEVP for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 093A980D64
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 093A980D64
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:08:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EED88860AF; Mon, 19 Aug 2024 20:08:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 22:01:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5bdac82ee057131e4c7747296f8423fd96ac4981
X-Git-Newrev: 6877647e8aff18a697d49015dd6273a9886db17e
X-Patchwork-Hint: ignore
Message-Id: <20240819200816.EED88860AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: security update to 20.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6877647e8aff18a697d49015dd6273a9886db17e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for a changelog:
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-20.9.2.md

And here for the security advisory:
https://github.com/asterisk/asterisk/security/advisories/GHSA-c4cg-9275-6w44

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index ee21d88d98..9889a18c9d 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  c928c715dc5ff783ea6cf62cca3eebdc1dc9c5d40ce9b37b0213c0eac7f4090f  asterisk-20.9.1.tar.gz
+sha256  6bc4d982a238397bf6b3bfa523f63a75a2d9b19edd6f33f79264f2385d05bc42  asterisk-20.9.2.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 64ec740d46..9d44782a08 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.9.1
+ASTERISK_VERSION = 20.9.2
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
