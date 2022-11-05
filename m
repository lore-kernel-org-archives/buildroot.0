Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66FDC433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 21:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B03981926;
	Sat,  5 Nov 2022 21:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B03981926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uDcuIpp9v5NG; Sat,  5 Nov 2022 21:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F2F381E39;
	Sat,  5 Nov 2022 21:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F2F381E39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 085061BF8A8
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8B08605A9
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8B08605A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gglaztol5KBK for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 21:40:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03E08605A6
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 21:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03E08605A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E750387E78; Sat,  5 Nov 2022 21:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:35:31 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4c3b867a17b3797cbd54ea8cbd2e1910af0ad67b
X-Git-Newrev: 0fed5ae029881b7092110b51147d93030309e909
X-Patchwork-Hint: ignore
Message-Id: <20221105214006.E750387E78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/go: security bump
 to 1.18.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fed5ae029881b7092110b51147d93030309e909
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

go1.18.4 includes security fixes to the compress/gzip, encoding/gob,
encoding/xml, go/parser, io/fs, net/http, and path/filepath packages, as well as
bug fixes to the compiler, the go command, the linker, the runtime, and the
runtime/metrics package.

go1.18.5 includes security fixes to the encoding/gob and math/big packages, as
well as bug fixes to the compiler, the go command, the runtime, and the testing
package.

https://go.dev/doc/devel/release#go1.18.minor

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 417eb476fd180659e5b1cc8e16fe8ac95f1f391a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 4 ++--
 package/go/go.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 45af1fc06f..2a0f02abfd 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
-# From https://golang.org/dl/
-sha256  0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d  go1.18.3.src.tar.gz
+# From https://go.dev/dl
+sha256  9920d3306a1ac536cdd2c796d6cb3c54bc559c226fc3cc39c32f1e0bd7f50d2a  go1.18.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 6767b1481d..83498823b1 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.3
+GO_VERSION = 1.18.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
