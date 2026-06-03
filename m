Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629C9CD6E69
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 08:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF74A615FC;
	Wed,  3 Jun 2026 08:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZWQPKYENLcT; Wed,  3 Jun 2026 08:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8786F61441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780474101;
	bh=U4eVyO///wBKa+rpWYx8hvbdLiVtWJGcYyPnlrZtyZE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CLCF80QslHBXOTCT/Pg9Ndf7KUOOx29dh0XMPyeyuure7tLCDZHgxDbRCT6/VI5ex
	 peDT8jnRUnEptJGY16SAY0/aPUw/jdVrawZxo0q5y733CVmS7d5FRDBFjyHCcptyub
	 HJK5s1PtpkXI6gM0gAQnqTRl/rwpEMIA3WpTNpd7NV9VoL0j9a5FjILV+Gy/YZdD3V
	 GnRTjz6Euq7bQFu6tVGN7II7qMnpIvnC3tByx9VVn6UsK/X8kz/sEIvYYNlyqRDGbL
	 c+sWmmOIfcNE3DY4+VUWjVSbU3d466y6J7db4CJgN3rxO0yHc9jfBEG/Lx9meC4SGx
	 2Sn62Vr/P6+7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8786F61441;
	Wed,  3 Jun 2026 08:08:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 037D7192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B51E8613E5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPv7It9CTET9 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 08:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA1AA613F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA1AA613F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 08:08:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15DF187939; Wed,  3 Jun 2026 08:07:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 09:58:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 061d6b121b116fff494901a964c813b68dc6d0de
X-Git-Newrev: 4e73a15a7b64c409f91e1660d283965c2a3a3fd2
X-Patchwork-Hint: ignore
Message-Id: <20260603080758.15DF187939@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unzip: patch CVE-2021-4217
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e73a15a7b64c409f91e1660d283965c2a3a3fd2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch is provided thanks to the Ubuntu community.

- CVE-2021-4217:
    A flaw was found in unzip. The vulnerability occurs due to improper
    handling of Unicode strings, which can lead to a null pointer
    dereference. This flaw allows an attacker to input a specially crafted
    zip file, leading to a crash or code execution.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2021-4217
 - https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
 - https://bugs.launchpad.net/ubuntu/+source/unzip/+bug/1957077

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Peter: correct _IGNORE_CVES entry]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...dereference-and-use-of-uninitialized-data.patch | 57 ++++++++++++++++++++++
 package/unzip/unzip.mk                             |  3 ++
 2 files changed, 60 insertions(+)

diff --git a/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch b/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
new file mode 100644
index 0000000000..4f9c4c1858
--- /dev/null
+++ b/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
@@ -0,0 +1,57 @@
+From 731d698377dbd1f5b1b90efeb8094602ed59fc40 Mon Sep 17 00:00:00 2001
+From: Nils Bars <nils.bars@t-online.de>
+Date: Mon, 17 Jan 2022 16:53:16 +0000
+Subject: [PATCH] Fix null pointer dereference and use of uninitialized data
+
+This fixes a bug that causes use of uninitialized heap data if `readbuf` fails
+to read as many bytes as indicated by the extra field length attribute.
+Furthermore, this fixes a null pointer dereference if an archive contains an
+`EF_UNIPATH` extra field but does not have a filename set.
+
+Upstream: https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
+CVE: CVE-2021-4217
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ fileio.c  | 5 ++++-
+ process.c | 6 +++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-) 
+ 
+diff --git a/fileio.c b/fileio.c
+index 14460f3..1dc319e 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -2310,8 +2310,11 @@ int do_string(__G__ length, option)   /* return PK-type error code */
+             seek_zipf(__G__ G.cur_zipfile_bufstart - G.extra_bytes +
+                       (G.inptr-G.inbuf) + length);
+         } else {
+-            if (readbuf(__G__ (char *)G.extra_field, length) == 0)
++            unsigned bytes_read = readbuf(__G__ (char *)G.extra_field, length);
++            if (bytes_read == 0)
+                 return PK_EOF;
++            if (bytes_read != length)
++                return PK_ERR;
+             /* Looks like here is where extra fields are read */
+             if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
+             {
+diff --git a/process.c b/process.c
+index 5f8f6c6..de843a5 100644
+--- a/process.c
++++ b/process.c
+@@ -2067,10 +2067,14 @@ int getUnicodeData(__G__ ef_buf, ef_len)
+           G.unipath_checksum = makelong(offset + ef_buf);
+           offset += 4;
+ 
++          if (!G.filename_full) {
++            /* Check if we have a unicode extra section but no filename set */
++            return PK_ERR;
++          }
++
+           /*
+            * Compute 32-bit crc
+            */
+-
+           chksum = crc32(chksum, (uch *)(G.filename_full),
+                          strlen(G.filename_full));
+ 
+-- 
+2.25.1
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 5436c7a46c..c362e6561f 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -51,6 +51,9 @@ UNZIP_IGNORE_CVES += CVE-2019-13232
 # 0028-cve-2022-0529-and-cve-2022-0530.patch
 UNZIP_IGNORE_CVES += CVE-2022-0529 CVE-2022-0530
 
+# 0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
+UNZIP_IGNORE_CVES += CVE-2021-4217
+
 # unzip already defines _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE when
 # necessary, redefining it on the command line causes some warnings.
 UNZIP_TARGET_CFLAGS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
