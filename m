Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA0EC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 20:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7779260D59;
	Tue,  6 Feb 2024 20:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgWP3CNpMgBu; Tue,  6 Feb 2024 20:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92CB1612D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92CB1612D2;
	Tue,  6 Feb 2024 20:52:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C48A81BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9C54612B4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIHyP94xEfIv for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 20:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60EF611F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C60EF611F5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 20:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C146A873D9; Tue,  6 Feb 2024 20:52:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 21:51:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09cc83df9f75cc378e1f2acd418dda50aa0db294
X-Git-Newrev: 1e472e0872a71395cf8a3541b5883081e929bc11
X-Patchwork-Hint: ignore
Message-Id: <20240206205253.C146A873D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netatalk: security bump to version
 3.1.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e472e0872a71395cf8a3541b5883081e929bc11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-22995: The combination of primitives offered by SMB and AFP
in their default configuration allows the arbitrary writing of files. By
exploiting these combination of primitives, an attacker can execute
arbitrary code.

https://netatalk.io/CVE-2022-22995
https://netatalk.io/3.1/ReleaseNotes3.1.18

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netatalk/netatalk.hash | 8 ++++----
 package/netatalk/netatalk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index a35e6bc36c..9ab5d604a8 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.17/
-md5  a6429a28948f85b69c9012fb437dd9c2  netatalk-3.1.17.tar.xz
-sha1  bc6578d9fa874b3816fd4ddd60a30a8f3aadc71d  netatalk-3.1.17.tar.xz
+# From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.18/
+md5  b1caff4e1da534d8ca57d688c7fa3ce1  netatalk-3.1.18.tar.xz
+sha1  cbd92c95d04cfd4a9f49977970501a623310c2d9  netatalk-3.1.18.tar.xz
 # Locally computed
-sha256  8c208e2c94bf3047db33cdbc3ce4325d2b80db61d6cc527f18f9dbd8e95b5cff  netatalk-3.1.17.tar.xz
+sha256  3941effcc2c4e0dceecabc763fbb8478a2f2fbe0af4a6314983cfea452df8d47  netatalk-3.1.18.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 40e64dabeb..53cd53876a 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETATALK_VERSION = 3.1.17
+NETATALK_VERSION = 3.1.18
 NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk-$(subst .,-,$(NETATALK_VERSION))
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.xz
 NETATALK_CONFIG_SCRIPTS = netatalk-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
