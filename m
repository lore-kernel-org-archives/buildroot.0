Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B452CC61CE7
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8167D83D96;
	Wed,  4 Jun 2025 18:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfec18vMpxJL; Wed,  4 Jun 2025 18:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8678C83C90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8678C83C90;
	Wed,  4 Jun 2025 18:28:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 285BBDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C6634014E
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrJ1NGKod4It for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8C8240249
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8C8240249
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6F7D876CD; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:37:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 31b153f0dd3a728f5219a3b40377d18185ed8030
X-Git-Newrev: 11547707dd49782a4b8cea398b7b564b0e15e907
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.B6F7D876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nodejs: security
 bump to version 22.15.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11547707dd49782a4b8cea398b7b564b0e15e907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following security issues:

- CVE-2025-23166: Improper error handling in async cryptographic operations
  crashes process

- CVE-2025-23165: Corrupted pointer in node::fs::ReadFileUtf8(const
  FunctionCallbackInfo<Value>& args) when args[0] is a string

https://nodejs.org/en/blog/vulnerability/may-2025-security-releases

Update the license hash for the addition of zstd 1.5.6 (BSD-3-Clause):
https://github.com/nodejs/node/commit/f9f611fb584ca2ace35df2669204e7de6a92ea26

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c84fcef123b94a2f66226bc946dbe251126393a7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nodejs/nodejs.hash | 14 +++++++-------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 6d2bdfb704..e087d8a7f9 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
-# From https://nodejs.org/dist/v22.13.1/SHASUMS256.txt.asc
-sha256  0a237c413ccbab920640438bf6e1a32edb19845bdc21f0e1cd5b91545ce1c126  node-v22.13.1-linux-arm64.tar.xz
-sha256  f2be8dca2a7a518f6d187aa4b18abbeeafd71096a6d95f73f4d8bc0f8d2394ea  node-v22.13.1-linux-armv7l.tar.xz
-sha256  377a7a1ea66f39251e1657f419e9404d526fcca9910620d0ecf0a870c6308f6b  node-v22.13.1-linux-ppc64le.tar.xz
-sha256  0d2a5af33c7deab5555c8309cd3f373446fe1526c1b95833935ab3f019733b3b  node-v22.13.1-linux-x64.tar.xz
-sha256  cfce282119390f7e0c2220410924428e90dadcb2df1744c0c4a0e7baae387cc2  node-v22.13.1.tar.xz
+# From https://nodejs.org/dist/v22.15.1/SHASUMS256.txt.asc
+sha256  f4ae8ddf7487dfaf7da92fef463ee55cc29d8772d62891361dc3fc8b8e469205  node-v22.15.1-linux-arm64.tar.xz
+sha256  6947386b4c8373b625c6a49b5571bf2226dac7c7b560a9a561a1f81bf71a25ef  node-v22.15.1-linux-armv7l.tar.xz
+sha256  da07858c6404dbe7c627bd7baea33c7825640652ad24468a6feb23c770cf7ce4  node-v22.15.1-linux-ppc64le.tar.xz
+sha256  7dca2ab34ec817aa4781e2e99dfd34d349eff9be86e5d5fbaa7e96cae8ee3179  node-v22.15.1-linux-x64.tar.xz
+sha256  c19f0177d21c621746625e5f37590bd0d79a72043b77b53784cba5f145e7263e  node-v22.15.1.tar.xz
 # Locally calculated
-sha256  9d72cce9b104ecb67feb8af38618511685190ae5a119cc0488ecae66b221000d  LICENSE
+sha256  1ae62e2015784ba438db7b04ebd33f3c4ff3efdb824c111c4ececd99945fd52d  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 752971c4a6..310face2d2 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 22.13.1
+NODEJS_COMMON_VERSION = 22.15.1
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
