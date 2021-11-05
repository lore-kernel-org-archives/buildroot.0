Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF20C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 14:49:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D045C6120E
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 14:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D045C6120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EB024018B;
	Fri,  5 Nov 2021 14:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oVw_lgOXa1Pj; Fri,  5 Nov 2021 14:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96AE8401D9;
	Fri,  5 Nov 2021 14:49:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55ADE1BF2F8
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 14:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 526934074D
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 14:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7pJPnZnaE5z for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 14:49:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A6B240754
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 14:49:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 857FD8A61D; Fri,  5 Nov 2021 14:45:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 14:41:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd1412c06072705398a44688c43b15687775fe76
X-Git-Newrev: 700ecefcc580729069dbbe19b64774550cfd24a3
X-Patchwork-Hint: ignore
Message-Id: <20211105144538.857FD8A61D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to 1.17.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=700ecefcc580729069dbbe19b64774550cfd24a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.17.3 (released 2021-11-04) includes security fixes to the archive/zip and
debug/macho packages, as well as bug fixes to the compiler, linker, runtime, the
go command, the misc/wasm directory, and to the net/http and syscall packages.

https://golang.org/doc/devel/release#go1.17.minor

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index f5e6492da7..9031c33d8a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  2255eb3e4e824dd7d5fcdc2e7f84534371c186312e546fb1086a34c17752f431  go1.17.2.src.tar.gz
+sha256  705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0  go1.17.3.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f8bea45c08..59177e54db 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.2
+GO_VERSION = 1.17.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
