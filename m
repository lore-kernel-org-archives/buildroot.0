Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8D9CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6FC41242;
	Fri, 12 Jun 2026 11:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMSo1JgyXXTX; Fri, 12 Jun 2026 11:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5B2F4122E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263471;
	bh=ExGE68BUqKhjWHwq/9FSJzxBRmpjKHi2etGGHa46DjY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GPtH3PqwjwMxSbqPbqaQ97USWob6n4y9InEc3SYaPHy51VHYqnWUGIuINxTbk2aJd
	 +4vydm+EgSpwxs03f0/V191f8swdXKg6BfGo2jsNDKPemTvgXBB6J5WfAS/HsM8Jzt
	 thGg8KSDQjM7RD1Ml44PsnyUh2WSU2fyO3zjFZ+9sJth6b92GS2RF4u6rOp2XCaFle
	 bxdH/3d4q3WNcSoT4jDUGKXPJm3IK3NJq1ACYQUINhtykfhNOMiCcPt6wL3QpZvakK
	 9FWE8dLoaJXFdmufAF4a9HU9PefMeAuuAFYSENYNkTuSIleTWAhHqwjJghfMWKyrYj
	 yVWP5VnwRWRDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5B2F4122E;
	Fri, 12 Jun 2026 11:24:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E1A0F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 483FC60FA9
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7LB-8jRJ4ax for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56B760F20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C56B760F20
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F0A0880E8; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:33:15 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b19ea523d64619112e6a98d14434fe3cb29621cf
X-Git-Newrev: ceffff2e53d811c940434db7fd1112fac2e7f1a7
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.9F0A0880E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/unzip: patch
 CVE-2021-4217
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ceffff2e53d811c940434db7fd1112fac2e7f1a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 4e73a15a7b64c409f91e1660d283965c2a3a3fd2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
