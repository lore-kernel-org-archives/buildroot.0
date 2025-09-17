Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00A3CAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 19:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5275661728;
	Wed, 17 Sep 2025 19:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZvpaUoiC-JB; Wed, 17 Sep 2025 19:53:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5900261722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5900261722;
	Wed, 17 Sep 2025 19:53:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2923FAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17C6F42718
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUU7Zuf_VK7d for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 19:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3EB942710
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3EB942710
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF5D885A56; Wed, 17 Sep 2025 19:53:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 21:45:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2c906ee3b6b9057ea2c83987ddac9b7971cebd2
X-Git-Newrev: 860c35d1ac7ce3377b9ec9788c0fa9ad1c4c642b
X-Patchwork-Hint: ignore
Message-Id: <20250917195351.DF5D885A56@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jasper: add patch for
 CVE-2023-51257
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=860c35d1ac7ce3377b9ec9788c0fa9ad1c4c642b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following vulnerability:

- CVE-2023-51257:

An invalid memory write issue in Jasper-Software Jasper v.4.1.1 and
before allows a local attacker to execute arbitrary code.

For more information see:
  - https://nvd.nist.gov//vuln/detail/CVE-2023-51257
  - https://github.com/jasper-software/jasper/commit/aeef5293c978158255ad4f127089644745602f2a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
