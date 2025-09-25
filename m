Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E881FCAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A94814189D;
	Thu, 25 Sep 2025 20:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35doy5R_BEcL; Thu, 25 Sep 2025 20:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A847941717
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A847941717;
	Thu, 25 Sep 2025 20:31:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F01E212D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D118F412C5
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vTr3wYVAjGwy for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA6B412CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FA6B412CC
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DBE586433; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:40:51 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 6726e0347163c7682cbb4bc83ebf0f356357ab4d
X-Git-Newrev: 8b0e1b7a98c5886ec09d0cc2b227bec61bec53e3
X-Patchwork-Hint: ignore
Message-Id: <20250925203022.8DBE586433@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/jasper: add patch
 for CVE-2023-51257
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b0e1b7a98c5886ec09d0cc2b227bec61bec53e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This fixes the following vulnerability:

- CVE-2023-51257:

An invalid memory write issue in Jasper-Software Jasper v.4.1.1 and
before allows a local attacker to execute arbitrary code.

For more information see:
  - https://nvd.nist.gov//vuln/detail/CVE-2023-51257
  - https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 860c35d1ac7ce3377b9ec9788c0fa9ad1c4c642b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jasper/0001-Fixes-367.patch | 46 +++++++++++++++++++++++++++++++++++++
 package/jasper/jasper.mk            |  3 +++
 2 files changed, 49 insertions(+)

diff --git a/package/jasper/0001-Fixes-367.patch b/package/jasper/0001-Fixes-367.patch
new file mode 100644
index 0000000000..11dfb5672f
--- /dev/null
+++ b/package/jasper/0001-Fixes-367.patch
@@ -0,0 +1,46 @@
+From aeef5293c978158255ad4f127089644745602f2a Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Thu, 14 Dec 2023 19:04:19 -0800
+Subject: [PATCH] Fixes #367.
+
+Fixed an integer-overflow bug in the ICC profile parsing code.
+Added another invalid image to the test set.
+
+CVE: CVE-2023-51257
+Upstream: https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libjasper/base/jas_icc.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/libjasper/base/jas_icc.c b/src/libjasper/base/jas_icc.c
+index 905b823..2d1e91e 100644
+--- a/src/libjasper/base/jas_icc.c
++++ b/src/libjasper/base/jas_icc.c
+@@ -1295,10 +1295,22 @@ static int jas_icctxt_input(jas_iccattrval_t *attrval, jas_stream_t *in,
+ {
+ 	jas_icctxt_t *txt = &attrval->data.txt;
+ 	txt->string = 0;
+-	if (!(txt->string = jas_malloc(cnt)))
++	/* The string must at least contain a single null character. */
++	if (cnt < 1) {
+ 		goto error;
+-	if (jas_stream_read(in, txt->string, cnt) != cnt)
++	}
++	if (!(txt->string = jas_malloc(cnt))) {
++		goto error;
++	}
++	if (jas_stream_read(in, txt->string, cnt) != cnt) {
+ 		goto error;
++	}
++	/* Ensure that the string is null terminated. */
++	if (txt->string[cnt - 1] != '\0') {
++		goto error;
++	}
++	/* The following line is redundant, unless we do not enforce that
++	  the last character must be null. */
+ 	txt->string[cnt - 1] = '\0';
+ 	if (strlen(txt->string) + 1 != cnt)
+ 		goto error;
+-- 
+2.39.5
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 45b9c49558..dd0badbc8f 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -15,6 +15,9 @@ JASPER_CONF_OPTS = \
 	-DJAS_ENABLE_DOC=OFF \
 	-DJAS_ENABLE_PROGRAMS=OFF
 
+# 0001-Fixes-367.patch
+JASPER_IGNORE_CVES += CVE-2023-51257
+
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
