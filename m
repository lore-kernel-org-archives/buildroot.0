Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62065EEAA5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 116EF41C6C;
	Thu, 14 Sep 2023 18:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 116EF41C6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1naenqmpJsy; Thu, 14 Sep 2023 18:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF86141E83;
	Thu, 14 Sep 2023 18:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF86141E83
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 294BE1BF316
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18495402E0
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 18:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18495402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Flwvn1r2i7tv for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A5864183A
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A5864183A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 286DB86F70; Thu, 14 Sep 2023 18:24:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 20:21:23 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 4fd72a713a96317bf73b9346999891371db8b533
X-Git-Newrev: 2b72f1d1676afc330b4f94431b7914817c796bb3
X-Patchwork-Hint: ignore
Message-Id: <20230914182452.286DB86F70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/go: security bump
 to version 1.20.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b72f1d1676afc330b4f94431b7914817c796bb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

go1.20.8 (released 2023-09-06) includes two security fixes to the html/template
package, as well as bug fixes to the compiler, the go command, the runtime, and
the crypto/tls, go/types, net/http, and path/filepath packages.

CVE-2023-39318: html/template: improper handling of HTML-like comments within script contexts
CVE-2023-39319: html/template: improper handling of special tags within script contexts
CVE-2023-39321: crypto/tls: panic when processing post-handshake message on QUIC connections

https://go.dev/doc/devel/release#go1.20.0

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2298534d91..19405982ba 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597  go1.20.7.src.tar.gz
+sha256  38d71714fa5279f97240451956d8e47e3c1b6a5de7cb84137949d62b5dd3182e  go1.20.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fc1d9ed681..c1e9f2f8f6 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.7
+GO_VERSION = 1.20.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
