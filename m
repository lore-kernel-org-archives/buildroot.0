Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4831DC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B89B440363;
	Sat,  5 Nov 2022 21:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B89B440363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UbNQgO12OER; Sat,  5 Nov 2022 21:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DCF240286;
	Sat,  5 Nov 2022 21:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DCF240286
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 003541BF42C
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D08EE8140F
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D08EE8140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DhdYedA9IGds for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:40:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C484081301
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C484081301
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEC1487E78; Sat,  5 Nov 2022 21:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:30:50 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f077e469ef78971dddb28a2bc784cdfe03c2fbf9
X-Git-Newrev: e358c238507b1f8a5cbd295f1b9cfb7981348499
X-Patchwork-Hint: ignore
Message-Id: <20221105214006.AEC1487E78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/go: security bump
 to version 1.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e358c238507b1f8a5cbd295f1b9cfb7981348499
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Includes security fixes to the syscall package, as well as bug fixes to the
compiler, runtime, the go command, and the crypto/x509, go/types,
net/http/httptest, reflect, and sync/atomic packages.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[Peter: mark as security fix]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bff7a3f1f219aabf142cf3613039531fbc8e9072)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 37c34b8b64..6a9480ff99 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088  go1.18.1.src.tar.gz
+sha256  2c44d03ea2c34092137ab919ba602f2c261a038d08eb468528a3f3a28e5667e2  go1.18.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index e4daad7cfe..1df52edf91 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.1
+GO_VERSION = 1.18.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
