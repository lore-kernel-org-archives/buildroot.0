Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0A1EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE28844E6;
	Fri, 13 Feb 2026 19:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQ5K9DPqoTCH; Fri, 13 Feb 2026 19:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 677E284550
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011357;
	bh=9FXEOO54zE2bdMcfmxDF3G5OngrDTnpbj+4o0nH6CQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lFsIh3o8CA8DCMKdRlWIbTRZ5N8ACWh9S2vYG+hgCIMAxcsE1iDdv/1Govx2ih+nV
	 s3/+fZZpGi0gnHq+fu2/kTFyJNSNlSjrmfP3LYveHj4VlLNv8lROkvKg/FAP3LRg0k
	 bekauNj+4FXcQ0QgQula9OCoCRsMnODe9k/dzm0Ybn0T2nMRx/cTi9BFT5+Rui6UCD
	 ikbtDnztp9Py4tjJObjpXeWN91jkgqq8TD2mOOCj6NS4/4ZM0cwlBT/2aCjsUNHTcB
	 28s3Q5JGnABrDdfHJF+4f3D4DQMJQlkedkGtBaPqa3oMtjrp9jHL+LdefnmBHo6sHu
	 9FkDePxujPkPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677E284550;
	Fri, 13 Feb 2026 19:35:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EA9C69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 723B041E49
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAImay9qdrnf for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5D3141E21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5D3141E21
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A5ED8268D; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:43:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 573f77a2e280553773f9dd17b8ff33582e45afb6
X-Git-Newrev: 8f68d58d207b7e2ac3df22f17cf7acd377573192
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.9A5ED8268D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/busybox: add
 patch for CVE-2025-46394
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
Content-Type: multipart/mixed; boundary="===============6525459740706253267=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6525459740706253267==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f68d58d207b7e2ac3df22f17cf7acd377573192
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerability:

- CVE-2025-46394

In tar in BusyBox through 1.37.0, a TAR archive can have filenames
hidden from a listing through the use of terminal escape sequences.

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-46394
  - https://git.busybox.net/busybox/commit/?id=f5e1bf966b19ea1821f00a8c9ecd7774598689b4
  - https://patchwork.yoctoproject.org/project/oe-core/patch/20250928221332.1308547-1-peter.marko@siemens.com/#31415
  - https://lists.busybox.net/pipermail/busybox/2025-October/091743.html

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 48b56d61bc49e97a807e808f9fdafccf29c85c5c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...l-libarchive-sanitize-filenames-on-output.patch | 58 ++++++++++++++++++++++
 ...e-tar-tests-fix-test-after-cve-2025-46394.patch | 33 ++++++++++++
 package/busybox/busybox.mk                         |  4 ++
 3 files changed, 95 insertions(+)

diff --git a/package/busybox/0012-archival-libarchive-sanitize-filenames-on-output.patch b/package/busybox/0012-archival-libarchive-sanitize-filenames-on-output.patch
new file mode 100644
index 0000000000..6af55c38c8
--- /dev/null
+++ b/package/busybox/0012-archival-libarchive-sanitize-filenames-on-output.patch
@@ -0,0 +1,58 @@
+From f5e1bf966b19ea1821f00a8c9ecd7774598689b4 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 24 Sep 2025 03:28:47 +0200
+Subject: archival/libarchive: sanitize filenames on output (prevent control
+ sequence attacks
+
+This fixes CVE-2025-46394 (terminal escape sequence injection)
+
+Original credit: Ian.Norton at entrust.com
+
+function                                             old     new   delta
+header_list                                            9      15      +6
+header_verbose_list                                  239     244      +5
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 11/0)               Total: 11 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+CVE: CVE-2025-46394
+Upstream: https://git.busybox.net/busybox/patch/?id=f5e1bf966b19ea1821f00a8c9ecd7774598689b4
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ archival/libarchive/header_list.c         | 2 +-
+ archival/libarchive/header_verbose_list.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/archival/libarchive/header_list.c b/archival/libarchive/header_list.c
+index 0621aa406..9490b3635 100644
+--- a/archival/libarchive/header_list.c
++++ b/archival/libarchive/header_list.c
+@@ -8,5 +8,5 @@
+ void FAST_FUNC header_list(const file_header_t *file_header)
+ {
+ //TODO: cpio -vp DIR should output "DIR/NAME", not just "NAME" */
+-	puts(file_header->name);
++	puts(printable_string(file_header->name));
+ }
+diff --git a/archival/libarchive/header_verbose_list.c b/archival/libarchive/header_verbose_list.c
+index a575a08a0..e7a09430d 100644
+--- a/archival/libarchive/header_verbose_list.c
++++ b/archival/libarchive/header_verbose_list.c
+@@ -57,13 +57,13 @@ void FAST_FUNC header_verbose_list(const file_header_t *file_header)
+ 		ptm->tm_hour,
+ 		ptm->tm_min,
+ 		ptm->tm_sec,
+-		file_header->name);
++		printable_string(file_header->name));
+ 
+ #endif /* FEATURE_TAR_UNAME_GNAME */
+ 
+ 	/* NB: GNU tar shows "->" for symlinks and "link to" for hardlinks */
+ 	if (file_header->link_target) {
+-		printf(" -> %s", file_header->link_target);
++		printf(" -> %s", printable_string(file_header->link_target));
+ 	}
+ 	bb_putchar('\n');
+ }
+-- 
+cgit v1.2.3
diff --git a/package/busybox/0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch b/package/busybox/0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
new file mode 100644
index 0000000000..bb56b846cf
--- /dev/null
+++ b/package/busybox/0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
@@ -0,0 +1,33 @@
+From 7378db981d87b4a2264e14d60340a7fb5c67ae59 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Fri, 3 Oct 2025 16:12:56 +0200
+Subject: [PATCH] testsuite/tar.tests: fix test after CVE-2025-46394
+
+tar now sanitizes output and this test needs to expect that.
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+CVE: CVE-2025-46394
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Upstream: https://lists.busybox.net/pipermail/busybox/2025-October/091743.html
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ testsuite/tar.tests | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testsuite/tar.tests b/testsuite/tar.tests
+index 0f2e89112..48fc38114 100755
+--- a/testsuite/tar.tests
++++ b/testsuite/tar.tests
+@@ -325,9 +325,9 @@ unset LANG
+ rm -rf etc usr
+ ' "\
+ etc/ssl/certs/3b2716e5.0
+-etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
++etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.pem
+ etc/ssl/certs/f80cc7f6.0
+-usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
++usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.crt
+ 0
+ etc/ssl/certs/3b2716e5.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
+ etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem -> /usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 446f93c36c..7ae9c1d41e 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,6 +15,10 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
+# 0012-archival-libarchive-sanitize-filenames-on-output.patch
+# 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
+BUSYBOX_IGNORE_CVES += CVE-2025-46394
+
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 

--===============6525459740706253267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6525459740706253267==--
