Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66085C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 16:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E371260F51;
	Tue, 13 Sep 2022 16:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E371260F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9UbmSgoZDmT; Tue, 13 Sep 2022 16:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 070CA60F47;
	Tue, 13 Sep 2022 16:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 070CA60F47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 529811BF4E7
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 16:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D373415EA
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 16:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D373415EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fd_RQbNeh3wV for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 16:05:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03BA540883
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 16:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03BA540883
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E76CB83850; Tue, 13 Sep 2022 16:05:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 18:03:05 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: e0bbcf78ff1a694657c3fa582a3cff7202df9416
X-Git-Newrev: ea0207e54ec0622c1e267bedcf6f3d669ef5c3e1
X-Patchwork-Hint: ignore
Message-Id: <20220913160514.E76CB83850@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/clamav: security
 bump version to 0.103.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea0207e54ec0622c1e267bedcf6f3d669ef5c3e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Release notes:
https://blog.clamav.net/2022/07/clamav-01037-01041-and-01051-patch.html

By bumping the vendored UnRAR library to version 6.1.7 in commit
https://github.com/Cisco-Talos/clamav/commit/b709eac4003ad01b609615cbbb86c7d5b3821d92

CVE-2022-30333 was fixed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fe6aa1f5c91ba33d71b8d43ddfa2b485542a04ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 579b0ec89e..60439400ee 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  aaa12e3dc19f1d323b1c50d7a10fa8af557e4390149e864d59bde39b6ad9ba33  clamav-0.103.6.tar.gz
+sha256  1e34c31f600cb3b5bd1bf76690590cdeebe9409b330959b1c0f77d421bb17e50  clamav-0.103.7.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index bb95cb8d2b..dfdc416601 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.6
+CLAMAV_VERSION = 0.103.7
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
