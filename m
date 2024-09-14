Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB30C02185
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3766841A6;
	Sat, 14 Sep 2024 08:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUzWTBNH-zug; Sat, 14 Sep 2024 08:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E32FC8424B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E32FC8424B;
	Sat, 14 Sep 2024 08:59:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 802091BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E38C40524
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1c6SdkV_N_k for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6220A40303
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6220A40303
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4961986F76; Sat, 14 Sep 2024 08:58:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:57:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 893602e69d1cd728a24c2cad6b877cb0c3da51cd
X-Git-Newrev: 8d371dbe55ea641f7afa3c00ea6475012b8e84fc
X-Patchwork-Hint: ignore
Message-Id: <20240914085858.4961986F76@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.22.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d371dbe55ea641f7afa3c00ea6475012b8e84fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following CVEs:

CVE-2024-34155: go/parser: stack exhaustion in all Parse* functions
CVE-2024-34156: encoding/gob: stack exhaustion in Decoder.Decode
CVE-2024-34158: go/build/constraint: stack exhaustion in Parse

https://go.dev/doc/devel/release#go1.22.7

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index 4c56660651..8b9651d7a1 100644
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
