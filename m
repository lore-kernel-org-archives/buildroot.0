Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E09C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 539B54013A;
	Sat, 15 Jan 2022 11:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aep6iV3H_xhy; Sat, 15 Jan 2022 11:02:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A55140569;
	Sat, 15 Jan 2022 11:02:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFFB11BF95D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CADC24013A
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vy6HxM8k9ebE for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 098DD40004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 21838829F9; Sat, 15 Jan 2022 10:55:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:55:07 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: dccdddf13ac2106c65ebbfd6e211581e13578517
X-Git-Newrev: 823354d13d9112f83624de9a17c13f5c77f9e1a8
X-Patchwork-Hint: ignore
Message-Id: <20220115105522.21838829F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/go: security bump
 to 1.17.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=823354d13d9112f83624de9a17c13f5c77f9e1a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

go1.17.4 (released 2021-12-02) includes fixes to the compiler, linker, runtime,
and the go/types, net/http, and time packages.

go1.17.5 (released 2021-12-09) includes security fixes to the syscall and
net/http packages:

 - CVE-2021-44716
 - CVE-2021-44717

https://go.dev/doc/devel/release#go1.17

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit eb92bb01b325521e5bd85349ad57281c1e481c33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9031c33d8a..39f8226aae 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0  go1.17.3.src.tar.gz
+sha256  3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d  go1.17.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 59177e54db..0d9ceab2bb 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.3
+GO_VERSION = 1.17.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
