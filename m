Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70DEC636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 09:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FFFF8139C;
	Wed, 15 Feb 2023 09:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FFFF8139C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKsmdEyiTcGV; Wed, 15 Feb 2023 09:24:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ABA781ED1;
	Wed, 15 Feb 2023 09:24:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ABA781ED1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15A471BF94D
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E385781E4F
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E385781E4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cbS20ZE9c4AP for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 09:24:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF6C881291
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 09:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF6C881291
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC00585541; Wed, 15 Feb 2023 09:24:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 10:13:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efdcc850be902de2596412dbf0f142c3f679ce35
X-Git-Newrev: 98e0452ebb7cb25311d4f615e07df89a5776268b
X-Patchwork-Hint: ignore
Message-Id: <20230215092413.DC00585541@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.19.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=98e0452ebb7cb25311d4f615e07df89a5776268b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.19.6 (released 2023-02-14) includes security fixes to the crypto/tls,
mime/multipart, net/http, and path/filepath packages, as well as bug fixes to
the go command, the linker, the runtime, and the crypto/x509, net/http, and time
packages. See the Go 1.19.6 milestone on the Go issue tracker for details.

CVE-2022-41725: net/http, mime/multipart: denial of service from excessive resource consumption
CVE-2022-41724: crypto/tls: large handshake records may cause panics
CVE-2022-41723: net/http: avoid quadratic complexity in HPACK decoding

https://go.dev/doc/devel/release#go1.19.minor

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 4c22f0f274..8254a91524 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  8e486e8e85a281fc5ce3f0bedc5b9d2dbf6276d7db0b25d3ec034f313da0375f  go1.19.5.src.tar.gz
+sha256  d7f0013f82e6d7f862cc6cb5c8cdb48eef5f2e239b35baa97e2f1a7466043767  go1.19.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index c38ae0b99c..a9056da47b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.5
+GO_VERSION = 1.19.6
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
