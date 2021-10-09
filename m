Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C15BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:08:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4738E60EE7
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 09:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4738E60EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03C5C40275;
	Sat,  9 Oct 2021 09:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A2Vp-64DSAmq; Sat,  9 Oct 2021 09:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18F10401AD;
	Sat,  9 Oct 2021 09:08:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0B9D1BF328
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D05A160B53
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 09:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBqNrNi_Sc3z for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 09:08:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3509560ADB
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 09:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AF03187C36; Sat,  9 Oct 2021 09:05:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 09:18:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95f3fc514c30626fa02b457423231d16db416612
X-Git-Newrev: 3ae98bed0a1b81531643669261b3f1223c2e8789
X-Patchwork-Hint: ignore
Message-Id: <20211009090543.AF03187C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to 1.17.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ae98bed0a1b81531643669261b3f1223c2e8789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.17.2 (released 2021-10-07) includes a security fix to the linker and
misc/wasm directory, as well as bug fixes to the compiler, the runtime, the go
command, and to the time and text/template packages.

https://golang.org/doc/devel/release#go1.17.minor

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9560eae30b..f5e6492da7 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  49dc08339770acd5613312db8c141eaf61779995577b89d93b541ef83067e5b1  go1.17.1.src.tar.gz
+sha256  2255eb3e4e824dd7d5fcdc2e7f84534371c186312e546fb1086a34c17752f431  go1.17.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 8e68dc3711..f8bea45c08 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.1
+GO_VERSION = 1.17.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
