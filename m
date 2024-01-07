Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCAFC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 22:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0636260672;
	Sun,  7 Jan 2024 22:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0636260672
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZjuDR1n3obT; Sun,  7 Jan 2024 22:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 581656074C;
	Sun,  7 Jan 2024 22:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 581656074C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 062591BF33F
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2CE3404F4
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 22:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2CE3404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBVucYRM4Wcz for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C72F5404B6
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C72F5404B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2E1584A59; Sun,  7 Jan 2024 22:44:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 23:42:28 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1c70425ddb1079c340c54decbd65076087ceed69
X-Git-Newrev: 1c537e0bf22357d043a9c5a7e2b72a4fff2b75e0
X-Patchwork-Hint: ignore
Message-Id: <20240107224412.B2E1584A59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libssh: security
 bump to version 0.10.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c537e0bf22357d043a9c5a7e2b72a4fff2b75e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following security issues:

- CVE-2023-6004: Command Injection using malicious hostname in expanded proxycommand
  https://www.libssh.org/security/advisories/CVE-2023-6004.txt

- CVE-2023-48795: Avoid potential downgrade attacks by implementing strict kex
  https://www.libssh.org/security/advisories/CVE-2023-48795.txt

- CVE-2023-6918: Avoid potential use of weak keys in low memory conditions
  by systematically checking return values of MD functions.
  https://www.libssh.org/security/advisories/CVE-2023-6918.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a8362e5c85973a775a84b3f4ef0b2afb9ff26094)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 0d61191842..e5eba219b5 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.10/libssh-0.10.5.tar.xz.asc
+# https://www.libssh.org/files/0.10/libssh-0.10.6.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256  b60e2ff7f367b9eee2b5634d3a63303ddfede0e6a18dfca88c44a8770e7e4234  libssh-0.10.5.tar.xz
+sha256  1861d498f5b6f1741b6abc73e608478491edcf9c9d4b6630eef6e74596de9dc1  libssh-0.10.6.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index ff4cddaf91..8b995c3555 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.10
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).5
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).6
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
