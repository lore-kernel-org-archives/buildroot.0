Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB22606A31E
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OUi/t147
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFB46068F;
	Tue, 27 Oct 2026 19:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cqsi-_gjJeGM; Tue, 27 Oct 2026 19:45:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0314E6069C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130312;
	b=l0chF23RRjAC4RqtE/5jLQRXn3kBjVPGleZf98WntT8Os9388yOVD2LuW/QvyHsCn9q6
	 8weGkpzVCY1TbsnTNi346tbUjibNTttvoJx1zhJgJ3Rlo3hjyj1pLXVZ6d3FYbYnHEhqo
	 ddssmCc62fwWOT5qXjcbJhwYKkV+0xgKkj4oYYjMuiFOXLoihtIqSzYojKXoC0bRrUi9R
	 IVWJZD/6UfPAZmDAYusIIJVFC1VAjJbxVjbrd2u2K81iYkO9C/yDAIw5zK6gMt9PoFwBg
	 PlqdbsZDzUkdkKL6VnExYOGR9IGfjY+Sg7g+pSzvLxaJHY7/rcuQlyrgx/zcjFh8Avw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130312;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8kKjnWtju9Bib+8IWk4UFORLpOu1ZagzY1HGqkChvoY=;
	b=VN8lLD6galOCqrE4FRc80zsSvbzui0jnDURnP4T+TioNZrTjah/idq6AaGJWBnIOHmmS
	 mQhQXakG9IfHbWpab0QZI0N0/sqO8dfbKq0mFN/aV/x9uobBrfxA2c7BNEGhlcpboJ5me
	 q8AFVSUdKvWUR4gmQQyKN4js4Fns5rRtAhOJLrGiczlxSsV9tBmIxXflsXdSIF4Zr3wa5
	 /7qMngVFKdCqCkN6E97WLHGB90ieEyG2ozPEQHdva+juFRs+sqV1ZzgO9fXjm0Ma74eSy
	 92ZCBySEn5AMUIHFpa8F351siWQrrZ2vBAWPJzvBZAg2wgUFC6PbR8LiunvNXDF0xvw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130312;
	bh=8kKjnWtju9Bib+8IWk4UFORLpOu1ZagzY1HGqkChvoY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OUi/t147imdEUqtCRwkm1O0NV25NK3CJDyO9UJZc/ylTs2d509RiyM01aBFqKjUlp
	 oHJlnCvt9wqqzcV+ZpRF3jrDAX8bpoT0V5Sg0W21u9HhuYCczdyzQYQL63LICW2F+P
	 mh3Gjlgaa4R0Oy2ZB6wJZXGAu2OeUwFI+Zv1r/qzyuTaDGJjuLgGa7fwraqxnGTmTp
	 wTSpVGM+pF6oWscktU3JIYG08BsjphlNrVadZT4k+jbrpRtcQMRLKUfTMw8dPp/TFB
	 VUPYL7jmGU8NGzkZN9rzaoh5Kl+Q5rR54Gn3eA9rk9+hfLI20Ek2cxQ0+S6RNqbnfo
	 cA7s0lACtdkrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0314E6069C;
	Tue, 27 Oct 2026 19:45:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44254729
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37C866068F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85jLsd1tcko5 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:45:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B8C4660681
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130308;
 b=nHSbMcAWUBKTTxV39qgOONGmDYB1O170IR7MZhuqU4DlKP3wjslGBqZQLBqMvIpSsuYF
 zGQkxMSvzoClW+y1iYmy/d7mOVmqW4pyiqiw5wJOk9dNrAEXOZs94KcmduzpdlM80qZuu
 0ueCTtySZESUPXjUqtWkEC04iq9G6yqV+AeiN+1MQNxy+EZ9YUHpFhTNCbxLCz7l2dC5O
 Pjtj5gBC2GghvY5EKh9L1HaAK0cmL3S/pMwmKaDuYkp/CjtwSdCd/n3LCUWdzEJxH9bCy
 Q+0LtA+1q2D0Qm70EIadTk5VAPAc3ofFrOFrPvMquJQ3TStqJ7gNZ+CzAyIx9ZGR6lQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130308;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=MRoXxewgcyZ9pc0Pn092PXSzq2socf6AwgX7BG6cH9U=;
 b=MqzD4+eCzmnUQcqJ2reK7TwUaIPyCU4ydORNgjL67rqYJGe1RQWvRh1IVJEjpmcrGF0Q
 qd6k2p6Z9+suyGxK3Kb/fUyUzh9pwOTXnzEgKBgXOeVTdjBm9bkVa4FEhASxA8SvKpegq
 0YYdtbIl4LLRr0GotiYEKCVrp+KQEowWkmlHHHrzjg9dEQjts9gJQzgMMe/Y67WlWc63J
 /8WLjz7hxbXMujSmbfvu5Llk+U7FL2lDQ2T8vFyioyJja/WghBgdR5vE0qtthBHcXxBVh
 JrZL0xJGJfAOimjg8LcW0xeuPvVDa5xiaqLAk/BUTs+tmQoPyMO6ZiqeK2aZyeVKQKg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=AKuSbMTm; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8C4660681
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:45:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQic-1xEbJO44HO-00Cwbp; Tue, 27
 Oct 2026 20:45:05 +0100
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Oct 2026 20:45:01 +0100
Message-ID: <20261027194501.2164846-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:49YhuXMXNhyY6sn488XzZdolqVYmelvIbk94Y7Uq3x6bIhHtEwG
 JEbPEfE1Ede+CK8L6pAAXtrBOfFs4ZepBELqMlQ6Wz08wuVelw4sgmjzOUATFgqrk5xytv9
 iKEdNtAfs1k6BZTCu9xw5cOAINMOJohDp47fybP4Cw7YE7A39srW/JPUh2z9WzIA8tj7BaN
 Qx1upIgUyQFHZZNHee3bw==
UI-OutboundReport: notjunk:1;M01:P0:r0NWNwB5EoI=;68Fyp+ydsdfKzUzoN4i/0FVETn9
 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
 ==
Subject: [Buildroot] [PATCH v1] package/patch: security bump version to 2.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 2.8.1 (see [1] and [2] for details)
- fixes CVE-2026-115207
- remove 0001-Fix-segfault-with-mangled-rename-patch.patch
  (from upstream, see [3])
- remove 0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch
  (from upstream, see [4])
- remove 0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
  (from upstream, see [5])
- remove 0004-Invoke-ed-directly-instead-of-using-the-shell.patch
  (from upstream, see [6])
- remove 0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
  (from upstream, see [7])
- remove 0006-Fix-swapping-fake-lines-in-pch-swap.patch
  (from upstream, see [8])
- removed 0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
  (from upstream, see [9])

[1] https://lists.gnu.org/archive/html/bug-patch/2025-03/msg00003.html
[2] https://lists.gnu.org/archive/html/bug-patch/2026-10/msg00014.html
[3] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=f290f48a621867084884bfff87f8093c15195e6a
[4] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=b5a91a01e5d0 b5a91a01e5d0897facdd0f49d64b76b0f02b43e1
[5] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=123eaff0d5d1aebe128295959435b9ca5909c26d
[6] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0
[7] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a
[8] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300
[9] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .checkpackageignore                           |   1 -
 ...x-segfault-with-mangled-rename-patch.patch |  33 ----
 ...s-to-be-missing-for-ed-style-patches.patch |  37 -----
 ...mmand-execution-in-ed-style-patches-.patch | 157 ------------------
 ...-directly-instead-of-using-the-shell.patch |  43 -----
 ...nks-unless--follow-symlinks-is-given.patch | 112 -------------
 ...-Fix-swapping-fake-lines-in-pch-swap.patch |  33 ----
 ...emory-access-in-context-format-diffs.patch |  30 ----
 package/patch/patch.hash                      |   2 +-
 package/patch/patch.mk                        |  20 +--
 10 files changed, 2 insertions(+), 466 deletions(-)
 delete mode 100644 package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
 delete mode 100644 package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch
 delete mode 100644 package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
 delete mode 100644 package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
 delete mode 100644 package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
 delete mode 100644 package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
 delete mode 100644 package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 60516b3098..a8c1baacbd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -693,7 +693,6 @@ package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch li
 package/owfs/S55owserver Shellcheck lib_sysv.Variables
 package/owfs/S60owfs Shellcheck lib_sysv.Variables
 package/owl-linux/0001-fix-for-linux-3.3.x.patch lib_patch.Upstream
-package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch lib_patch.Upstream
 package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch lib_patch.Upstream
 package/paxtest/0001-genpaxtest-move-log-location.patch lib_patch.Upstream
 package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch lib_patch.Upstream
diff --git a/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch b/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
deleted file mode 100644
index 1b8d954025..0000000000
--- a/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f290f48a621867084884bfff87f8093c15195e6a Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Mon, 12 Feb 2018 16:48:24 +0100
-Subject: [PATCH] Fix segfault with mangled rename patch
-
-http://savannah.gnu.org/bugs/?53132
-* src/pch.c (intuit_diff_type): Ensure that two filenames are specified
-for renames and copies (fix the existing check).
-
-CVE: CVE-2018-6951
-Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=f290f48a621867084884bfff87f8093c15195e6a
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- src/pch.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/pch.c b/src/pch.c
-index ff9ed2cebb8a..bc6278c4032c 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -974,7 +974,8 @@ intuit_diff_type (bool need_header, mode_t *p_file_type)
-     if ((pch_rename () || pch_copy ())
- 	&& ! inname
- 	&& ! ((i == OLD || i == NEW) &&
--	      p_name[! reverse] &&
-+	      p_name[reverse] && p_name[! reverse] &&
-+	      name_is_valid (p_name[reverse]) &&
- 	      name_is_valid (p_name[! reverse])))
-       {
- 	say ("Cannot %s file without two valid file names\n", pch_rename () ? "rename" : "copy");
--- 
-2.16.1
-
diff --git a/package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch b/package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch
deleted file mode 100644
index 7d5757d1af..0000000000
--- a/package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b5a91a01e5d0897facdd0f49d64b76b0f02b43e1 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Fri, 6 Apr 2018 11:34:51 +0200
-Subject: [PATCH] Allow input files to be missing for ed-style patches
-
-* src/pch.c (do_ed_script): Allow input files to be missing so that new
-files will be created as with non-ed-style patches.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit b5a91a01e5d0
-
- src/pch.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/src/pch.c b/src/pch.c
-index bc6278c4032c..0c5cc2623079 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -2394,9 +2394,11 @@ do_ed_script (char const *inname, char const *outname,
- 
-     if (! dry_run && ! skip_rest_of_patch) {
- 	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
--	assert (! inerrno);
--	*outname_needs_removal = true;
--	copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
-+	if (inerrno != ENOENT)
-+	  {
-+	    *outname_needs_removal = true;
-+	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
-+	  }
- 	sprintf (buf, "%s %s%s", editor_program,
- 		 verbosity == VERBOSE ? "" : "- ",
- 		 outname);
--- 
-2.16.3
-
diff --git a/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch b/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
deleted file mode 100644
index 18497c153b..0000000000
--- a/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From 123eaff0d5d1aebe128295959435b9ca5909c26d Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Fri, 6 Apr 2018 12:14:49 +0200
-Subject: [PATCH] Fix arbitrary command execution in ed-style patches
- (CVE-2018-1000156)
-
-* src/pch.c (do_ed_script): Write ed script to a temporary file instead
-of piping it to ed: this will cause ed to abort on invalid commands
-instead of rejecting them and carrying on.
-* tests/ed-style: New test case.
-* tests/Makefile.am (TESTS): Add test case.
-
-CVE: CVE-2018-1000156
-Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=123eaff0d5d1aebe128295959435b9ca5909c26d
-[baruch: drop test hunks to avoid autoreconf]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- src/pch.c         | 91 ++++++++++++++++++++++++++++++++++++++++---------------
- tests/Makefile.am |  1 +
- tests/ed-style    | 41 +++++++++++++++++++++++++
- 3 files changed, 108 insertions(+), 25 deletions(-)
- create mode 100644 tests/ed-style
-
-diff --git a/src/pch.c b/src/pch.c
-index 0c5cc2623079..4fd5a05a6f5c 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -33,6 +33,7 @@
- # include <io.h>
- #endif
- #include <safe.h>
-+#include <sys/wait.h>
- 
- #define INITHUNKMAX 125			/* initial dynamic allocation size */
- 
-@@ -2389,24 +2390,28 @@ do_ed_script (char const *inname, char const *outname,
-     static char const editor_program[] = EDITOR_PROGRAM;
- 
-     file_offset beginning_of_this_line;
--    FILE *pipefp = 0;
-     size_t chars_read;
-+    FILE *tmpfp = 0;
-+    char const *tmpname;
-+    int tmpfd;
-+    pid_t pid;
-+
-+    if (! dry_run && ! skip_rest_of_patch)
-+      {
-+	/* Write ed script to a temporary file.  This causes ed to abort on
-+	   invalid commands such as when line numbers or ranges exceed the
-+	   number of available lines.  When ed reads from a pipe, it rejects
-+	   invalid commands and treats the next line as a new command, which
-+	   can lead to arbitrary command execution.  */
-+
-+	tmpfd = make_tempfile (&tmpname, 'e', NULL, O_RDWR | O_BINARY, 0);
-+	if (tmpfd == -1)
-+	  pfatal ("Can't create temporary file %s", quotearg (tmpname));
-+	tmpfp = fdopen (tmpfd, "w+b");
-+	if (! tmpfp)
-+	  pfatal ("Can't open stream for file %s", quotearg (tmpname));
-+      }
- 
--    if (! dry_run && ! skip_rest_of_patch) {
--	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
--	if (inerrno != ENOENT)
--	  {
--	    *outname_needs_removal = true;
--	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
--	  }
--	sprintf (buf, "%s %s%s", editor_program,
--		 verbosity == VERBOSE ? "" : "- ",
--		 outname);
--	fflush (stdout);
--	pipefp = popen(buf, binary_transput ? "wb" : "w");
--	if (!pipefp)
--	  pfatal ("Can't open pipe to %s", quotearg (buf));
--    }
-     for (;;) {
- 	char ed_command_letter;
- 	beginning_of_this_line = file_tell (pfp);
-@@ -2417,14 +2422,14 @@ do_ed_script (char const *inname, char const *outname,
- 	}
- 	ed_command_letter = get_ed_command_letter (buf);
- 	if (ed_command_letter) {
--	    if (pipefp)
--		if (! fwrite (buf, sizeof *buf, chars_read, pipefp))
-+	    if (tmpfp)
-+		if (! fwrite (buf, sizeof *buf, chars_read, tmpfp))
- 		    write_fatal ();
- 	    if (ed_command_letter != 'd' && ed_command_letter != 's') {
- 	        p_pass_comments_through = true;
- 		while ((chars_read = get_line ()) != 0) {
--		    if (pipefp)
--			if (! fwrite (buf, sizeof *buf, chars_read, pipefp))
-+		    if (tmpfp)
-+			if (! fwrite (buf, sizeof *buf, chars_read, tmpfp))
- 			    write_fatal ();
- 		    if (chars_read == 2  &&  strEQ (buf, ".\n"))
- 			break;
-@@ -2437,13 +2442,49 @@ do_ed_script (char const *inname, char const *outname,
- 	    break;
- 	}
-     }
--    if (!pipefp)
-+    if (!tmpfp)
-       return;
--    if (fwrite ("w\nq\n", sizeof (char), (size_t) 4, pipefp) == 0
--	|| fflush (pipefp) != 0)
-+    if (fwrite ("w\nq\n", sizeof (char), (size_t) 4, tmpfp) == 0
-+	|| fflush (tmpfp) != 0)
-       write_fatal ();
--    if (pclose (pipefp) != 0)
--      fatal ("%s FAILED", editor_program);
-+
-+    if (lseek (tmpfd, 0, SEEK_SET) == -1)
-+      pfatal ("Can't rewind to the beginning of file %s", quotearg (tmpname));
-+
-+    if (! dry_run && ! skip_rest_of_patch) {
-+	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
-+	*outname_needs_removal = true;
-+	if (inerrno != ENOENT)
-+	  {
-+	    *outname_needs_removal = true;
-+	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
-+	  }
-+	sprintf (buf, "%s %s%s", editor_program,
-+		 verbosity == VERBOSE ? "" : "- ",
-+		 outname);
-+	fflush (stdout);
-+
-+	pid = fork();
-+	if (pid == -1)
-+	  pfatal ("Can't fork");
-+	else if (pid == 0)
-+	  {
-+	    dup2 (tmpfd, 0);
-+	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
-+	    _exit (2);
-+	  }
-+	else
-+	  {
-+	    int wstatus;
-+	    if (waitpid (pid, &wstatus, 0) == -1
-+	        || ! WIFEXITED (wstatus)
-+		|| WEXITSTATUS (wstatus) != 0)
-+	      fatal ("%s FAILED", editor_program);
-+	  }
-+    }
-+
-+    fclose (tmpfp);
-+    safe_unlink (tmpname);
- 
-     if (ofp)
-       {
--- 
-2.16.3
-
diff --git a/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch b/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
deleted file mode 100644
index 7ede9300e4..0000000000
--- a/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3fcd042d26d70856e826a42b5f93dc4854d80bf0 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Fri, 6 Apr 2018 19:36:15 +0200
-Subject: Invoke ed directly instead of using the shell
-
-* src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
-command to avoid quoting vulnerabilities.
-
-CVE: CVE-2018-20969
-CVE: CVE-2019-13638
-Upstream: https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/pch.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/src/pch.c b/src/pch.c
-index 4fd5a05..16e001a 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -2459,9 +2459,6 @@ do_ed_script (char const *inname, char const *outname,
- 	    *outname_needs_removal = true;
- 	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
- 	  }
--	sprintf (buf, "%s %s%s", editor_program,
--		 verbosity == VERBOSE ? "" : "- ",
--		 outname);
- 	fflush (stdout);
- 
- 	pid = fork();
-@@ -2470,7 +2467,8 @@ do_ed_script (char const *inname, char const *outname,
- 	else if (pid == 0)
- 	  {
- 	    dup2 (tmpfd, 0);
--	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
-+	    assert (outname[0] != '!' && outname[0] != '-');
-+	    execlp (editor_program, editor_program, "-", outname, (char  *) NULL);
- 	    _exit (2);
- 	  }
- 	else
--- 
-cgit v1.2.1
-
diff --git a/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch b/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
deleted file mode 100644
index c0e63081e2..0000000000
--- a/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From dce4683cbbe107a95f1f0d45fabc304acfb5d71a Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Mon, 15 Jul 2019 16:21:48 +0200
-Subject: Don't follow symlinks unless --follow-symlinks is given
-
-* src/inp.c (plan_a, plan_b), src/util.c (copy_to_fd, copy_file,
-append_to_file): Unless the --follow-symlinks option is given, open files with
-the O_NOFOLLOW flag to avoid following symlinks.  So far, we were only doing
-that consistently for input files.
-* src/util.c (create_backup): When creating empty backup files, (re)create them
-with O_CREAT | O_EXCL to avoid following symlinks in that case as well.
-
-CVE: CVE-2019-13636
-Upstream: https://git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/inp.c  | 12 ++++++++++--
- src/util.c | 14 +++++++++++---
- 2 files changed, 21 insertions(+), 5 deletions(-)
-
-diff --git a/src/inp.c b/src/inp.c
-index 32d0919..22d7473 100644
---- a/src/inp.c
-+++ b/src/inp.c
-@@ -238,8 +238,13 @@ plan_a (char const *filename)
-     {
-       if (S_ISREG (instat.st_mode))
-         {
--	  int ifd = safe_open (filename, O_RDONLY|binary_transput, 0);
-+	  int flags = O_RDONLY | binary_transput;
- 	  size_t buffered = 0, n;
-+	  int ifd;
-+
-+	  if (! follow_symlinks)
-+	    flags |= O_NOFOLLOW;
-+	  ifd = safe_open (filename, flags, 0);
- 	  if (ifd < 0)
- 	    pfatal ("can't open file %s", quotearg (filename));
- 
-@@ -340,6 +345,7 @@ plan_a (char const *filename)
- static void
- plan_b (char const *filename)
- {
-+  int flags = O_RDONLY | binary_transput;
-   int ifd;
-   FILE *ifp;
-   int c;
-@@ -353,7 +359,9 @@ plan_b (char const *filename)
- 
-   if (instat.st_size == 0)
-     filename = NULL_DEVICE;
--  if ((ifd = safe_open (filename, O_RDONLY | binary_transput, 0)) < 0
-+  if (! follow_symlinks)
-+    flags |= O_NOFOLLOW;
-+  if ((ifd = safe_open (filename, flags, 0)) < 0
-       || ! (ifp = fdopen (ifd, binary_transput ? "rb" : "r")))
-     pfatal ("Can't open file %s", quotearg (filename));
-   if (TMPINNAME_needs_removal)
-diff --git a/src/util.c b/src/util.c
-index 1cc08ba..fb38307 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -388,7 +388,7 @@ create_backup (char const *to, const struct stat *to_st, bool leave_original)
- 
- 	  try_makedirs_errno = ENOENT;
- 	  safe_unlink (bakname);
--	  while ((fd = safe_open (bakname, O_CREAT | O_WRONLY | O_TRUNC, 0666)) < 0)
-+	  while ((fd = safe_open (bakname, O_CREAT | O_EXCL | O_WRONLY | O_TRUNC, 0666)) < 0)
- 	    {
- 	      if (errno != try_makedirs_errno)
- 		pfatal ("Can't create file %s", quotearg (bakname));
-@@ -579,10 +579,13 @@ create_file (char const *file, int open_flags, mode_t mode,
- static void
- copy_to_fd (const char *from, int tofd)
- {
-+  int from_flags = O_RDONLY | O_BINARY;
-   int fromfd;
-   ssize_t i;
- 
--  if ((fromfd = safe_open (from, O_RDONLY | O_BINARY, 0)) < 0)
-+  if (! follow_symlinks)
-+    from_flags |= O_NOFOLLOW;
-+  if ((fromfd = safe_open (from, from_flags, 0)) < 0)
-     pfatal ("Can't reopen file %s", quotearg (from));
-   while ((i = read (fromfd, buf, bufsize)) != 0)
-     {
-@@ -625,6 +628,8 @@ copy_file (char const *from, char const *to, struct stat *tost,
-   else
-     {
-       assert (S_ISREG (mode));
-+      if (! follow_symlinks)
-+	to_flags |= O_NOFOLLOW;
-       tofd = create_file (to, O_WRONLY | O_BINARY | to_flags, mode,
- 			  to_dir_known_to_exist);
-       copy_to_fd (from, tofd);
-@@ -640,9 +645,12 @@ copy_file (char const *from, char const *to, struct stat *tost,
- void
- append_to_file (char const *from, char const *to)
- {
-+  int to_flags = O_WRONLY | O_APPEND | O_BINARY;
-   int tofd;
- 
--  if ((tofd = safe_open (to, O_WRONLY | O_BINARY | O_APPEND, 0)) < 0)
-+  if (! follow_symlinks)
-+    to_flags |= O_NOFOLLOW;
-+  if ((tofd = safe_open (to, to_flags, 0)) < 0)
-     pfatal ("Can't reopen file %s", quotearg (to));
-   copy_to_fd (from, tofd);
-   if (close (tofd) != 0)
--- 
-cgit v1.2.1
-
diff --git a/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch b/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
deleted file mode 100644
index 6fd63dff53..0000000000
--- a/package/patch/0006-Fix-swapping-fake-lines-in-pch-swap.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9c986353e420ead6e706262bf204d6e03322c300 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Fri, 17 Aug 2018 13:35:40 +0200
-Subject: Fix swapping fake lines in pch_swap
-
-* src/pch.c (pch_swap): Fix swapping p_bfake and p_efake when there is a
-blank line in the middle of a context-diff hunk: that empty line stays
-in the middle of the hunk and isn't swapped.
-
-Fixes: https://savannah.gnu.org/bugs/index.php?53133
-CVE: CVE-2018-6952
-Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/pch.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/pch.c b/src/pch.c
-index e92bc64..a500ad9 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -2115,7 +2115,7 @@ pch_swap (void)
-     }
-     if (p_efake >= 0) {			/* fix non-freeable ptr range */
- 	if (p_efake <= i)
--	    n = p_end - i + 1;
-+	    n = p_end - p_ptrn_lines;
- 	else
- 	    n = -i;
- 	p_efake += n;
--- 
-cgit v1.2.3
-
diff --git a/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch b/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
deleted file mode 100644
index 5ffe3699ef..0000000000
--- a/package/patch/0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 15b158db3ae11cb835f2eb8d2eb48e09d1a4af48 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruen@gnu.org>
-Date: Mon, 15 Jul 2019 19:10:02 +0200
-Subject: Avoid invalid memory access in context format diffs
-
-* src/pch.c (another_hunk): Avoid invalid memory access in context format
-diffs.
-
-CVE: CVE-2019-20633
-Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/pch.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/pch.c b/src/pch.c
-index a500ad9..cb54e03 100644
---- a/src/pch.c
-+++ b/src/pch.c
-@@ -1327,6 +1327,7 @@ another_hunk (enum diff difftype, bool rev)
- 		  ptrn_prefix_context = context;
- 		ptrn_suffix_context = context;
- 		if (repl_beginning
-+		    || p_end <= 0
- 		    || (p_end
- 			!= p_ptrn_lines + 1 + (p_Char[p_end - 1] == '\n')))
- 		  {
--- 
-cgit v1.2.3
-
diff --git a/package/patch/patch.hash b/package/patch/patch.hash
index f43400ea71..ee4c07cece 100644
--- a/package/patch/patch.hash
+++ b/package/patch/patch.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  ac610bda97abe0d9f6b7c963255a11dcb196c25e337c61f94e4778d632f1d8fd  patch-2.7.6.tar.xz
+sha256  3240c7959c5347c8ed347e3c4201c0337bf4240d5cf09d68889e58eeaba30e17  patch-2.8.1.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 9272449159..9bfa1983d5 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -4,31 +4,13 @@
 #
 ################################################################################
 
-PATCH_VERSION = 2.7.6
+PATCH_VERSION = 2.8.1
 PATCH_SOURCE = patch-$(PATCH_VERSION).tar.xz
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPL-3.0+
 PATCH_LICENSE_FILES = COPYING
 PATCH_CPE_ID_VENDOR = gnu
 
-# 0001-Fix-segfault-with-mangled-rename-patch.patch
-PATCH_IGNORE_CVES += CVE-2018-6951
-
-# 0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
-PATCH_IGNORE_CVES += CVE-2018-1000156
-
-# 0004-Invoke-ed-directly-instead-of-using-the-shell.patch
-PATCH_IGNORE_CVES += CVE-2018-20969 CVE-2019-13638
-
-# 0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
-PATCH_IGNORE_CVES += CVE-2019-13636
-
-# 0006-Fix-swapping-fake-lines-in-pch-swap.patch
-PATCH_IGNORE_CVES += CVE-2018-6952
-
-# 0007-Avoid-invalid-memory-access-in-context-format-diffs.patch
-PATCH_IGNORE_CVES += CVE-2019-20633
-
 ifeq ($(BR2_PACKAGE_ATTR),y)
 PATCH_CONF_OPTS += --enable-xattr
 PATCH_DEPENDENCIES += attr
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
