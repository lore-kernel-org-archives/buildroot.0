Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43184C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 19:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B261E60E2C;
	Tue,  8 Nov 2022 19:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B261E60E2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6Ge_0EtTDEW; Tue,  8 Nov 2022 19:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD6A160BA8;
	Tue,  8 Nov 2022 19:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD6A160BA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7A181BF422
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9279581E4D
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 19:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9279581E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDwGwsEkzQYM for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 19:27:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C277F81E49
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 19:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C277F81E49
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B096588228; Tue,  8 Nov 2022 19:27:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Nov 2022 14:04:20 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7dfe00c8d346233280fbd877540e01f3749ea7a9
X-Git-Newrev: 1529c26f60c9edc45447a6852daac26c17736c25
X-Patchwork-Hint: ignore
Message-Id: <20221108192719.B096588228@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libfribidi:
 security bump to version 1.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=1529c26f60c9edc45447a6852daac26c17736c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- CVE-2022-25308: A stack-based buffer overflow flaw was found in the
  Fribidi package.  This flaw allows an attacker to pass a specially crafted
  file to the Fribidi application, which leads to a possible memory leak or
  a denial of service.

- CVE-2022-25309: A heap-based buffer overflow flaw was found in the Fribidi
  package and affects the fribidi_cap_rtl_to_unicode() function of the
  fribidi-char-sets-cap-rtl.c file.  This flaw allows an attacker to pass a
  specially crafted file to the Fribidi application with the '--caprtl'
  option, leading to a crash and causing a denial of service

- CVE-2022-25310: A segmentation fault (SEGV) flaw was found in the Fribidi
  package and affects the fribidi_remove_bidi_marks() function of the
  lib/fribidi.c file.  This flaw allows an attacker to pass a specially
  crafted file to Fribidi, leading to a crash and causing a denial of
  service.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0f42b67077a8f620f66c654c92518cf53efb9a92)
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfribidi/libfribidi.hash | 2 +-
 package/libfribidi/libfribidi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index da25b2d24d..7e5df98112 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30f93e9c63ee627d1a2cedcf59ac34d45bf30240982f99e44c6e015466b4e73d  fribidi-1.0.11.tar.xz
+sha256  0cd233f97fc8c67bb3ac27ce8440def5d3ffacf516765b91c2cc654498293495  fribidi-1.0.12.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index adbd786db1..ec86f468a4 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.11
+LIBFRIBIDI_VERSION = 1.0.12
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
