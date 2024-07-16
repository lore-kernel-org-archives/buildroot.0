Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD6EC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55C5F40B9D;
	Tue, 16 Jul 2024 12:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YELDlPqS1RIL; Tue, 16 Jul 2024 12:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 945F940BE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 945F940BE3;
	Tue, 16 Jul 2024 12:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A031F1BF3E3
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99F7D40B9D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwcENd5XftiV for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7074240B94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7074240B94
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A32E86BA6; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 14:42:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4a1e36e1a085ce589c112c0ce089bf129633808
X-Git-Newrev: bffb6a2339bbfe28a0ca2399716c3966af4a623c
X-Patchwork-Hint: ignore
Message-Id: <20240716124308.5A32E86BA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: security bump to v20.15.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bffb6a2339bbfe28a0ca2399716c3966af4a623c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes: https://nodejs.org/en/blog/release/v20.15.1

Fixes the following CVE's:

CVE-2024-36138 - Bypass incomplete fix of CVE-2024-27980 (High)
CVE-2024-22020 - Bypass network import restriction via data URL (Medium)
CVE-2024-22018 - fs.lstat bypasses permission model (Low)
CVE-2024-36137 - fs.fchown/fchmod bypasses permission model (Low)
CVE-2024-37372 - Permission model improperly processes UNC paths (Low)

Also these additional CVE's were fixed in the v20.12.1 and v20.12.2 releases [1][2]:

CVE-2024-27983 - Assertion failed in node::http2::Http2Session::~Http2Session() leads to HTTP/2 server crash- (High)
CVE-2024-27982 - HTTP Request Smuggling via Content Length Obfuscation - (Medium)
CVE-2024-27980 - Command injection via args parameter of child_process.spawn without shell option enabled on Windows

NodeJS tests are passing:
$ ./support/testing/run-tests -o ./outputs/ -k tests.package.test_nodejs -d dl
12:02:58 TestNodeJSModuleHostSrc                  Starting
12:02:58 TestNodeJSModuleHostSrc                  Building
13:17:15 TestNodeJSModuleHostSrc                  Building done
13:17:23 TestNodeJSModuleHostSrc                  Cleaning up
.13:17:23 TestNodeJSModuleHostBin                  Starting
13:17:23 TestNodeJSModuleHostBin                  Building
14:06:15 TestNodeJSModuleHostBin                  Building done
14:06:20 TestNodeJSModuleHostBin                  Cleaning up
.14:06:20 TestNodeJSBasic                          Starting
14:06:20 TestNodeJSBasic                          Building
14:55:40 TestNodeJSBasic                          Building done
14:55:45 TestNodeJSBasic                          Cleaning up

LICENSE hash changed due to changes in vendored components:

* copyright year update and adding spdx identifier [1]

[1] https://nodejs.org/en/blog/release/v20.12.1
[2] https://nodejs.org/en/blog/release/v20.12.2
[3] https://github.com/nodejs/node/commit/d5a316f5ea3fade3140c2ae35c144b500fb5d758

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 2cbbf766f5..61bda55098 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v20.12.0/SHASUMS256.txt.asc
-sha256  007ca2699cf6e84290e5bed844ed66ef9d707d23561dfaf117212b7dce216ba7  node-v20.12.0-linux-arm64.tar.xz
-sha256  668fb421a24be596c98f00a31049fbf6ada14d221b7382e0f1caa55ab421431a  node-v20.12.0-linux-armv7l.tar.xz
-sha256  78dc3b7ad993c332684802e35c1f0de2b76193d13394bc89e3bab216828587c7  node-v20.12.0-linux-ppc64le.tar.xz
-sha256  0a126adf5b6a5eb11a37bad76a0c626a18f20b6811322e68aae0e3cf9bf580bd  node-v20.12.0-linux-x64.tar.xz
-sha256  76e5346cebfd581528f699f764f4d1a6e87cb818b696708f235ddcb625a0f78d  node-v20.12.0.tar.xz
+# From https://nodejs.org/dist/v20.15.1/SHASUMS256.txt.asc
+sha256  10d47a46ef208b3e4b226e4d595a82659123b22397ed77b7975d989114ec317e  node-v20.15.1-linux-arm64.tar.xz
+sha256  7bc120efdd8018f6915471b963d9b80adf4ed406d6dc9edb4ae944b85f505c4c  node-v20.15.1-linux-armv7l.tar.xz
+sha256  b33e684802251397ad62ad3f8a1836267ee8b7723f87f669470018ad0035287b  node-v20.15.1-linux-ppc64le.tar.xz
+sha256  26700f8d3e78112ad4a2618a9c8e2816e38a49ecf0213ece80e54c38cb02563f  node-v20.15.1-linux-x64.tar.xz
+sha256  fdd53a5729d936691a2a1151046fb4897721cb8b0fca2af957823a9b40fe0c34  node-v20.15.1.tar.xz
 # Locally calculated
-sha256  d3a9fbfe0a1fb78627ee296cd5ca5b498822d4d1c5da3b8e8100c41bd7b791fd  LICENSE
+sha256  49cd410e0fe6a8879a40d0764092d1e6114cc85fe41d4efed990d028eec25582  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 9ed51fbe9b..104d2cf258 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 20.12.0
+NODEJS_COMMON_VERSION = 20.15.1
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
