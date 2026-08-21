Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D6FC5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BAE6811E6;
	Fri, 21 Aug 2026 15:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jC0Lon5JFk8f; Fri, 21 Aug 2026 15:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324858;
	bh=RjqHmrSkYoww0odms88+mRrx12v1L2Yvaog1NjvqutM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A4lfRHOA/dy0rMnRf1RUAb/nY6Qn3gUBdczR97B8IE98Ss4Wot5tYycDo9Dl/dZa4
	 VTmHdQoVYGP2jGDU02rc6rff19tFbjBpBnTxs0RDjk18m7qtGb5AFd5Ny3p0Rgyiv9
	 bCPtF2FwCg+alor7aiDZogEPUX+w3GIrg+ioMO/cOoLWHoziv7AK6kmhHY7ckx5+OI
	 frfBKA0hRrwGDWClZNBn2N4+MRqlcnqM/be9JSqeadbDBnhje3WfImTiEozLuh71PS
	 iE7Bvkb5rjkqreX92nu5lerM2wHB8WvdnQDL6GYIDHlhJIAvmYvlfueKxqPO6Apbt9
	 rr1VD3XHJf9HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E44C181199;
	Fri, 21 Aug 2026 15:07:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AAC729B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B309403F6
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxIh6FchXXEy for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6774B400C1
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBD368DE49; Fri, 21 Aug 2026 15:06:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:03:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 92c41f1b183bb6fef1519dc063dc601ca2397706
X-Git-Newrev: ef79489d784f954823727477279d3f22c7951dc2
X-Patchwork-Hint: ignore
Message-Id: <20260821150613.DBD368DE49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/busybox: patch
 CVE-2023-39810
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef79489d784f954823727477279d3f22c7951dc2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Based on the work of the Debian community, this commit patches the
following vulnerability.

- CVE-2023-39810:
    An issue in the CPIO command of Busybox v1.33.2 allows attackers to
    execute a directory traversal.

For more information, see:
  - https://salsa.debian.org/installer-team/busybox/-/blob/master/debian/patches/archival-disallow-path-traversals-CVE-2023-39810.patch
  - https://www.cve.org/CVERecord?id=CVE-2023-39810

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(alternative to commit 5a27004cffb6bb034ff80cfac42a87bbd208755d)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...l-disallow-path-traversals-CVE-2023-39810.patch | 126 +++++++++++++++++++++
 package/busybox/busybox.mk                         |   3 +
 2 files changed, 129 insertions(+)

diff --git a/package/busybox/0016-archival-disallow-path-traversals-CVE-2023-39810.patch b/package/busybox/0016-archival-disallow-path-traversals-CVE-2023-39810.patch
new file mode 100644
index 0000000000..cea4e7de9a
--- /dev/null
+++ b/package/busybox/0016-archival-disallow-path-traversals-CVE-2023-39810.patch
@@ -0,0 +1,126 @@
+Commit-ID: 9a8796436b9b0641e13480811902ea2ac57881d3
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 2 Oct 2024 10:12:05 +0200
+Subject: archival: disallow path traversals (CVE-2023-39810)
+Origin: upstream, https://git.busybox.net/busybox/commit/?id=9a8796436b9b0641e13480811902ea2ac57881d3
+Forwarded: not-needed
+Bug-Debian: https://bugs.debian.org/1055307
+
+Create new configure option for archival/libarchive based extractions to
+disallow path traversals.
+As this is a paranoid option and might introduce backward
+incompatibility, default it to no.
+
+Based on the patch by Peter Kaestle <peter.kaestle@nokia.com>
+
+function                                             old     new   delta
+data_extract_all                                     921     945     +24
+strip_unsafe_prefix                                  101     102      +1
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 25/0)               Total: 25 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+CVE: CVE-2023-39810
+Upstream: https://salsa.debian.org/installer-team/busybox/-/blob/master/debian/patches/archival-disallow-path-traversals-CVE-2023-39810.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ archival/Config.src                        | 11 +++++++++++
+ archival/libarchive/data_extract_all.c     |  8 ++++++++
+ archival/libarchive/unsafe_prefix.c        |  6 +++++-
+ scripts/kconfig/lxdialog/check-lxdialog.sh |  2 +-
+ testsuite/cpio.tests                       | 23 ++++++++++++++++++++++
+ 5 files changed, 48 insertions(+), 2 deletions(-)
+
+diff --git a/archival/Config.src b/archival/Config.src
+index 6f4f30c43..cbcd7217c 100644
+--- a/archival/Config.src
++++ b/archival/Config.src
+@@ -35,4 +35,15 @@ config FEATURE_LZMA_FAST
+ 	This option reduces decompression time by about 25% at the cost of
+ 	a 1K bigger binary.
+ 
++config FEATURE_PATH_TRAVERSAL_PROTECTION
++	bool "Prevent extraction of filenames with /../ path component"
++	default n
++	help
++	busybox tar and unzip remove "PREFIX/../" (if it exists)
++	from extracted names.
++	This option enables this behavior for all other unpacking applets,
++	such as cpio, ar, rpm.
++	GNU cpio 2.15 has NO such sanity check.
++# try other archivers and document their behavior?
++
+ endmenu
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 049c2c156..8a69711c1 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -65,6 +65,14 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 		} while (--n != 0);
+ 	}
+ #endif
++#if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
++	/* Strip leading "/" and up to last "/../" path component */
++	dst_name = (char *)strip_unsafe_prefix(dst_name);
++#endif
++// ^^^ This may be a problem if some applets do need to extract absolute names.
++// (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
++// You might think that rpm needs it, but in my tests rpm's internal cpio
++// archive has names like "./usr/bin/FOO", not "/usr/bin/FOO".
+ 
+ 	if (archive_handle->ah_flags & ARCHIVE_CREATE_LEADING_DIRS) {
+ 		char *slash = strrchr(dst_name, '/');
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 33e487bf9..667081195 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -14,7 +14,11 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp++;
+ 			continue;
+ 		}
+-		if (is_prefixed_with(cp, "/../"+1)) {
++		/* We are called lots of times.
++		 * is_prefixed_with(cp, "../") is slower than open-coding it,
++		 * with minimal code growth (~few bytes).
++		 */
++		if (cp[0] == '.' && cp[1] == '.' && cp[2] == '/') {
+ 			cp += 3;
+ 			continue;
+ 		}
+diff --git a/testsuite/cpio.tests b/testsuite/cpio.tests
+index 85e746589..a4462c53e 100755
+--- a/testsuite/cpio.tests
++++ b/testsuite/cpio.tests
+@@ -154,6 +154,29 @@ testing "cpio -R with extract" \
+ " "" ""
+ SKIP=
+ 
++# Create an archive containing a file with "../dont_write" filename.
++# See that it will not be allowed to unpack.
++# NB: GNU cpio 2.15 DOES NOT do such checks.
++optional FEATURE_PATH_TRAVERSAL_PROTECTION
++rm -rf cpio.testdir
++mkdir -p cpio.testdir/prepare/inner
++echo "file outside of destination was written" > cpio.testdir/prepare/dont_write
++echo "data" > cpio.testdir/prepare/inner/to_extract
++mkdir -p cpio.testdir/extract
++testing "cpio extract file outside of destination" "\
++(cd cpio.testdir/prepare/inner && $ECHO -e '../dont_write\nto_extract' | cpio -o -H newc) | (cd cpio.testdir/extract && cpio -vi 2>&1)
++echo \$?
++ls cpio.testdir/dont_write 2>&1" \
++"\
++cpio: removing leading '../' from member names
++../dont_write
++to_extract
++1 blocks
++0
++ls: cpio.testdir/dont_write: No such file or directory
++" "" ""
++SKIP=
++
+ # Clean up
+ rm -rf cpio.testdir cpio.testdir2 2>/dev/null
+ 
+-- 
+2.47.2
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 0488518086..91d3b69139 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -19,6 +19,9 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
 # 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
 BUSYBOX_IGNORE_CVES += CVE-2023-42366
 
+# 0016-archival-disallow-path-traversals-CVE-2023-39810.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-39810
+
 # 0015-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
 BUSYBOX_IGNORE_CVES += CVE-2024-58251
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
