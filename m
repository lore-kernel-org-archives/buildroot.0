Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3A7C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 23:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A28560F60;
	Wed,  2 Nov 2022 23:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A28560F60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j01pCOr2u9al; Wed,  2 Nov 2022 23:02:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35B6F60AFC;
	Wed,  2 Nov 2022 23:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35B6F60AFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B09E1BF95F
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3729E60BC7
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3729E60BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QxqZmiXp_-Jr for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 23:01:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F8BB60AFC
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 23:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F8BB60AFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E67387B4F; Wed,  2 Nov 2022 23:01:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 00:01:27 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 206b2e1a869a508acce7a8c4532b7654d1ade759
X-Git-Newrev: 2320526f94f2ce7ad39611a16fc3ce53d0cbd0cc
X-Patchwork-Hint: ignore
Message-Id: <20221102230148.3E67387B4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python3: security
 bump to version 3.10.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=2320526f94f2ce7ad39611a16fc3ce53d0cbd0cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- CVE-2022-40674: bundled libexpat was upgraded from 2.4.7 to 2.4.9 which
  fixes a heap use-after-free vulnerability in function doContent

- gh-97616: a fix for a possible buffer overflow in list *= int

- gh-97612: a fix for possible shell injection in the example script
  get-remote-certificate.py(this issue originally had a CVE assigned to it,
  which its author withdrew)

- gh-96577: a fix for a potential buffer overrun in msilib

License hash changed due to links in license text being changed from
http to https:
https://github.com/python/cpython/commit/96f8d3619d839266491b722b943de65892bb0e81

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 72e8471b5cf4a011cd87692719bd4f69d9cc526c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index c625e7a8ea..f9b8e2ec8d 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48  Python-3.10.7.tar.xz
-sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
+sha256  6a30ecde59c47048013eb5a658c9b5dec277203d2793667f578df7671f7f03f3  Python-3.10.8.tar.xz
+sha256  d4a223f033419313218c9b8444167e91e87a5bebdb43fb8490df441df5220a8b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 9fd0777be6..7cea4329e7 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
