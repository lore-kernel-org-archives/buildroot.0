Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92C8CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 20:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 630EA414F8;
	Thu, 19 Sep 2024 20:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDoX8hhAeDmE; Thu, 19 Sep 2024 20:01:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2A25432DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2A25432DE;
	Thu, 19 Sep 2024 20:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 740F21BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A9A642B2C
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hk-GMH3hUkSf for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:59:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FECA42B25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FECA42B25
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:59:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFAD683D7F; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:57:03 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 1b6e22b6a4d47a67762e6c57260fd6a9d4b8fbfb
X-Git-Newrev: 66425c8e1485b83551bb0d8704a01521ed5309e9
X-Patchwork-Hint: ignore
Message-Id: <20240919195949.EFAD683D7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/go: security bump
 to version 1.22.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=66425c8e1485b83551bb0d8704a01521ed5309e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Fixes the following CVEs:

CVE-2024-34155: go/parser: stack exhaustion in all Parse* functions
CVE-2024-34156: encoding/gob: stack exhaustion in Decoder.Decode
CVE-2024-34158: go/build/constraint: stack exhaustion in Parse

https://go.dev/doc/devel/release#go1.22.7

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8d371dbe55ea641f7afa3c00ea6475012b8e84fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go-src/go-src.hash | 2 +-
 package/go/go.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index d300f6e2c9..f5727390f7 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  ac9c723f224969aee624bc34fd34c9e13f2a212d75c71c807de644bb46e112f6  go1.22.5.src.tar.gz
+sha256  66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f  go1.22.7.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 91aa31f76c..dd3650e3e5 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.5
+GO_VERSION = 1.22.7
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
