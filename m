Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31360C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6267405A0;
	Sun, 13 Nov 2022 16:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6267405A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yszJkIYopRpZ; Sun, 13 Nov 2022 16:34:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E65594059E;
	Sun, 13 Nov 2022 16:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E65594059E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7421BF86D
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75547401A1
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75547401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mqKI_zNYZ-RM for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:33:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4983140176
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4983140176
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3577283718; Sun, 13 Nov 2022 16:33:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 17:27:14 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: ed4ee39fd2b0ab9d4f8bb55b4832e0c9ac69746b
X-Git-Newrev: 028abcc68fbd7c8df8743f3b7d612fd60228d03a
X-Patchwork-Hint: ignore
Message-Id: <20221113163331.3577283718@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/msmtp: security
 bump to version 1.8.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=028abcc68fbd7c8df8743f3b7d612fd60228d03a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

- Fixed a security problem in msmtpd: mail addresses starting with '-' could be
  interpreted as options of the pipe command.

https://github.com/marlam/msmtp-mirror/blob/msmtp-1.8.22/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9a294be424a4f78e1a54e3df7a706181fa287793)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 1e73d92470..c5571f2fb3 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.14.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.22.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  d56f065d711486e9c234618515a02a48a48dab4051b34f3e108fbecb6fb773b4  msmtp-1.8.14.tar.xz
+sha256  1b04206286a5b82622335e4eb09e17074368b7288e53d134543cbbc6b79ea3e7  msmtp-1.8.22.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 3db36f4cd0..c3928ffcbb 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.14
+MSMTP_VERSION = 1.8.22
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
