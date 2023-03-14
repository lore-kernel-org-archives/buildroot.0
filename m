Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1860AC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEBFB41869;
	Tue, 14 Mar 2023 08:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEBFB41869
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMA4yonAvIo4; Tue, 14 Mar 2023 08:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFEA41864;
	Tue, 14 Mar 2023 08:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CFEA41864
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E70B31BF95E
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF2684011F
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF2684011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id am-mzFmmXcpg for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:50:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED42D400D7
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED42D400D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB4AB87144; Tue, 14 Mar 2023 08:50:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 09:50:22 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 44f5d8aff75f45d9c8d0831a37a97d4e22ea3fd0
X-Git-Newrev: 40bfe7d7152c89ece8a2b90110d0b4f01958ae1e
X-Patchwork-Hint: ignore
Message-Id: <20230314085047.DB4AB87144@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bind: security
 bump to version 9.16.38
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

commit: https://git.buildroot.net/buildroot/commit/?id=40bfe7d7152c89ece8a2b90110d0b4f01958ae1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Fix CVE-2022-3094, CVE-2022-3736 and CVE-2022-3924
- Update hash of COPYRIGHT (year updated with
  https://gitlab.isc.org/isc-projects/bind9/-/commit/1a5d707f52282117c9912a27dcc89f2ec412577a)

https://downloads.isc.org/isc/bind9/9.16.38/doc/arm/html/notes.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7abc9a0554cc1c1bbc1ad4273622024020fa2c7e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash | 6 +++---
 package/bind/bind.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index d41a9bbc5e..32804b5ce0 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.33/bind-9.16.33.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.38/bind-9.16.38.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  ec4fbea4b2e368d1824971509e33fa159224ad14b436034c6bcd46104c328d91  bind-9.16.33.tar.xz
-sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
+sha256  8df44c9d9a84a28ab8b49d55f3c33b624b90ef8f6a8b9ee6a4c33cc17c14c50f  bind-9.16.38.tar.xz
+sha256  13491a682dc0f5ee2273cebd3949e2be62f9470fe659419a03a308d4f444773b  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index cfacf0e56b..2af6096fad 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.33
+BIND_VERSION = 9.16.38
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
