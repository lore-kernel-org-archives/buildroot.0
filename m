Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B908C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3925181760;
	Sun, 11 Dec 2022 13:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3925181760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78blPfDJcMHP; Sun, 11 Dec 2022 13:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E4F8137E;
	Sun, 11 Dec 2022 13:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69E4F8137E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3881F1BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21C634017B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21C634017B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTo9NIpOay90 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:17:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51F3040106
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51F3040106
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 416228623A; Sun, 11 Dec 2022 13:17:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:16:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63b540638c72969bf8c3eb6c06e1c49c4fbcbb9a
X-Git-Newrev: c34e0b1cd5f7e10ce4fc19880e15ba608006ee76
X-Patchwork-Hint: ignore
Message-Id: <20221211131740.416228623A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/asterisk: security bump to version
 16.29.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2992116515061461871=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2992116515061461871==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c34e0b1cd5f7e10ce4fc19880e15ba608006ee76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2022-37325: A zero length Called or Calling Party Number can cause a
  buffer under-run and Asterisk crash.

  https://downloads.asterisk.org/pub/security/AST-2022-007.html

- CVE-2022-42705: Use after free in res_pjsip_pubsub.c may allow a remote
  authenticated attacker to crash Asterisk (denial of service) by performing
  activity on a subscription via a reliable transport at the same time
  Asterisk is also performing activty on that subscription.

  https://downloads.asterisk.org/pub/security/AST-2022-008.html

- CVE-2022-42706: AMI Users with “config” permissions may read files outside
  of Asterisk directory via GetConfig AMI Action even if “live_dangerously"
  is set to "no"

  https://downloads.asterisk.org/pub/security/AST-2022-009.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 9792d82ac5..98ee3bdc71 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  6e9c2f350db018df854b1301687ced8993facb2787698336e55cd19e0ae3ebfe  asterisk-16.28.0.tar.gz
+sha256  9b93006a87be9c29492299118200e4f66c8369851c66a50fdef5b15dfc4eb2c2  asterisk-16.29.1.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index e0f28ae7ee..22ac0334fd 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 16.28.0
+ASTERISK_VERSION = 16.29.1
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))

--===============2992116515061461871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2992116515061461871==--
