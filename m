Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197F2C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 18:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A20E4415A9;
	Fri, 21 Oct 2022 18:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A20E4415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-vYnJecrhp2; Fri, 21 Oct 2022 18:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4BE6415AD;
	Fri, 21 Oct 2022 18:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4BE6415AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A18B1BF863
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4175D40104
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 18:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4175D40104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hvo3aH72dxtw for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 18:52:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 814F84018F
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 18:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 814F84018F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6958D86F46; Fri, 21 Oct 2022 18:52:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 21 Oct 2022 20:50:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86de66e444cda40e8d65cc401229628b48fe410a
X-Git-Newrev: 72e8471b5cf4a011cd87692719bd4f69d9cc526c
X-Patchwork-Hint: ignore
Message-Id: <20221021185221.6958D86F46@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump to version
 3.10.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=72e8471b5cf4a011cd87692719bd4f69d9cc526c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index b7df26781a..4131941e11 100644
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
