Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1140AC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A74BB83F06;
	Sun, 14 Aug 2022 19:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A74BB83F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAWW0E2LTa3L; Sun, 14 Aug 2022 19:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F0E83EE3;
	Sun, 14 Aug 2022 19:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F0E83EE3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7961BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E92AE83EE3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E92AE83EE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3XNrWIduXGt for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3125083ECC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3125083ECC
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 84FDB87546; Sun, 14 Aug 2022 19:06:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:59:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: acf885f9f7147ad24e398487e5e2ddf5ae7746e5
X-Git-Newrev: 1123b04f0220eebdd8f73658c542ca014e69c4fd
X-Patchwork-Hint: ignore
Message-Id: <20220814190648.84FDB87546@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/protobuf-c:
 security bump to version 1.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1123b04f0220eebdd8f73658c542ca014e69c4fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Fix CVE-2022-33070: Protobuf-c v1.4.0 was discovered to contain an
  invalid arithmetic shift via the function parse_tag_and_wiretype in
  protobuf-c/protobuf-c.c. This vulnerability allows attackers to cause
  a Denial of Service (DoS) via unspecified vectors.
- Use official tarball (and so drop autoreconf)
- Update hash of COPYING (year updated with
  https://github.com/protobuf-c/protobuf-c/commit/471aaa5f6d54406c6c17bf3179d5aea18f15073b)

https://github.com/protobuf-c/protobuf-c/releases/tag/v1.4.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit cbbd2dae9e8cbe839352730fd407269863dd3d18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf-c/protobuf-c.hash | 4 ++--
 package/protobuf-c/protobuf-c.mk   | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index 13e1b474bc..ec00442277 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1068bca1e9870e9492096f97c409cd15f10c5019c183e52ec6d53e8d18630cbf  protobuf-c-1.4.0.tar.gz
-sha256  20e800cad4550f4b19bb37fc9577dac21de13333ae66497c4c45ae489c35c34a  LICENSE
+sha256  4cc4facd508172f3e0a4d3a8736225d472418aee35b4ad053384b137b220339f  protobuf-c-1.4.1.tar.gz
+sha256  b8999cb392cc5bbe8cd679de59584ad8d2f26033123e76f1d662fa14b9d4f287  LICENSE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 7dd3b09a6c..0742a33db2 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1.4.0
-PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,v$(PROTOBUF_C_VERSION))
+PROTOBUF_C_VERSION = 1.4.1
+PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
 PROTOBUF_C_MAKE = $(MAKE1)
@@ -14,8 +14,6 @@ PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-2-Clause
 PROTOBUF_C_LICENSE_FILES = LICENSE
 PROTOBUF_C_CPE_ID_VENDOR = protobuf-c_project
-PROTOBUF_C_AUTORECONF = YES
-HOST_PROTOBUF_C_AUTORECONF = YES
 
 # host-protobuf needs c++11 (since 3.6.0)
 HOST_PROTOBUF_C_CONF_ENV += CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
