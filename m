Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B449CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E87D6152C;
	Thu, 25 Sep 2025 20:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWTdNu7oYvnR; Thu, 25 Sep 2025 20:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4161E6154A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4161E6154A;
	Thu, 25 Sep 2025 20:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB7C12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E846261533
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaLqccFx3g_g for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEE8461516
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEE8461516
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA33786441; Thu, 25 Sep 2025 20:02:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 21:57:35 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: ca3e495b29cec2206ba5509cbc749f72c9c75e2f
X-Git-Newrev: 8273db5669a9ad4ebf7d1eb37cb59e3ce882f7b4
X-Patchwork-Hint: ignore
Message-Id: <20250925200241.BA33786441@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/cjson: security
 bump to version 1.7.19
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8626952414576198108=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8626952414576198108==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8273db5669a9ad4ebf7d1eb37cb59e3ce882f7b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes the following security issue:

CVE-2025-57052: cJSON 1.5.0 through 1.7.18 allows out-of-bounds access via
the decode_array_index_from_pointer function in cJSON_Utils.c, allowing
remote attackers to bypass array bounds checking and access restricted data
via malformed JSON pointer strings containing alphanumeric characters

https://nvd.nist.gov/vuln/detail/CVE-2025-57052
https://x-0r.com/posts/cJSON-Array-Index-Parsing-Vulnerability
https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa4139126967f6d289b675b4b36fef
https://github.com/DaveGamble/cJSON/releases/tag/v1.7.19

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a93602c00b355e54322c8b0ce0a1cea98ea202f9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cjson/0001-make_compatible_with_cmake_4.0.patch | 4 +++-
 package/cjson/cjson.hash                                | 2 +-
 package/cjson/cjson.mk                                  | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/cjson/0001-make_compatible_with_cmake_4.0.patch b/package/cjson/0001-make_compatible_with_cmake_4.0.patch
index 1fe5cd43ef..684773e4da 100644
--- a/package/cjson/0001-make_compatible_with_cmake_4.0.patch
+++ b/package/cjson/0001-make_compatible_with_cmake_4.0.patch
@@ -16,6 +16,8 @@ CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
 This change raises the minimum required CMake version to 3.5 and thus makes the project compatible with CMake 4.0
 
 Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Peter: update for 1.7.19
 Upstream: https://github.com/DaveGamble/cJSON/pull/935
 ---
  CMakeLists.txt | 2 +-
@@ -31,4 +33,4 @@ index 36a6cb57..9428da58 100644
 +cmake_minimum_required(VERSION 3.5)
  
  project(cJSON
-     VERSION 1.7.18
+     VERSION 1.7.19
diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index e07ae0f7bf..a876ffafe8 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  3aa806844a03442c00769b83e99970be70fbef03735ff898f4811dd03b9f5ee5  cjson-1.7.18.tar.gz
+sha256  7fa616e3046edfa7a28a32d5f9eacfd23f92900fe1f8ccd988c1662f30454562  cjson-1.7.19.tar.gz
 sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index b87ce97ca2..cb4525d1a4 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = 1.7.18
+CJSON_VERSION = 1.7.19
 CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT

--===============8626952414576198108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8626952414576198108==--
