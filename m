Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFC3ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 09:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4362D8187F;
	Wed, 14 Sep 2022 09:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4362D8187F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fJKBy4OIF0e; Wed, 14 Sep 2022 09:14:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D96581865;
	Wed, 14 Sep 2022 09:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D96581865
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51D671BF355
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BBC7401FF
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 09:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BBC7401FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvwDnmlwlueh for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 09:14:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03DCA400EC
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 09:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03DCA400EC
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E4CB0838DB; Wed, 14 Sep 2022 09:14:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 11:03:49 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 8a9e0d650f4a8ddd1a85ac44ce502f9ab0af4f99
X-Git-Newrev: ff3b466025c0f1d508eadeac1d43a14f8027978d
X-Patchwork-Hint: ignore
Message-Id: <20220914091447.E4CB0838DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/go: security bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff3b466025c0f1d508eadeac1d43a14f8027978d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
