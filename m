Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83700606D80C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=feAMmXHm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6465B608ED;
	Fri,  6 Nov 2026 16:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtBcBeTEj2i0; Fri,  6 Nov 2026 16:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 83FE060901
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981325;
	b=G4H8nBMN57Bv8gfZkpMCqCLVk/aF+JXeQNPGXWUWaS9ngZSOr9RHVRVZE7nvGdpNhgYC
	 ial2j6AlFjfth8QDvLyw2KkhnF729p71M8UU5bdZSqT9uMO8YLUuwIm3eCVzXoF9SdGip
	 +pHi9G/YWycsurjwClm/sXsg78hxQFtdrZuJ9KOYsh/b5NnD6LbY4Txlvx17u3eCVIXxA
	 5ht1FAB4pPlOyFhTLBaW4qLEwIfoY7HRRmN6SbA5wK5CE4ggqz5XR0RQM30Ql8rwP3f9p
	 prJLwMpVSw0Bb5cpdJY6Va7v9JCkz2ubDaEsCqbTLaI0goB5ZPmwQnwKpilmxnnhFqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981325;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+r80IXwLqIYnXE63GLY9Az4FD9VapUoDI0k5eO1f3/E=;
	b=EUx/9SKQZPOHb2eI5M849LA+KW9BRx65pK/FoLTh71EzR7jAM4HD9mmKqHqtedOc/tEv
	 JlE7BLcT2QDWxR0Zu61hfKac9xye6x0bByR1yZAxVRx6cvajCKu9CEmQLlYze4YoYEYIt
	 0Et2ZXLByGdhi26OCY9MCdiaYhBD0RZB672Zwn9l/djKkxOlfgZllc3nnylPV6PZWrlIA
	 KXsiFVJ2nOb0AaPgOt0aGEDGzhGgpv0X9Jug7i+AfAuyaJnS+bhmzTCiMDwJcZkfXaDMV
	 wr5Jm+SHOQTvMghK+2EqwWAaIilC2sjUZwAf5QHv3sHzmLcEj+fgBtY1+ScNRjrZ/cQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981325;
	bh=+r80IXwLqIYnXE63GLY9Az4FD9VapUoDI0k5eO1f3/E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=feAMmXHms4gCnddr8HM8pTbLgRcg4A2Wre9FXJlRlz6YjeOwldXKEFUgjR78eZJQF
	 emr64vPmqOJsDpQDx+Yrt5pj2rCkGfmy2hwwCx4NShpZ2U4AtJW1sAEOIUNomw9+0O
	 pxoHW13Xlyb2Ezw1GG0L4C14gtxIDqX8yfETnxiK+PjKIPVnFi5jQHrlIhN6uX1jOJ
	 j7UuKi3NyAONxb87J1rve7rfOUedNJdBl5dENKDCqZbd82uP2tRP80XaV7naGvcWet
	 kHs72zuVGzEULGh65dvtg6dJRWPgFYslylp/Kd83kq+t4A9mUQ0+oKKN1DdYC0hDYv
	 2t9+ctQ3kRFGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83FE060901;
	Fri,  6 Nov 2026 16:08:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15AD92E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0716E40913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKbxqO6o3v5Z for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6DCF440911
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DCF440911
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 963CC9E09B; Fri,  6 Nov 2026 16:06:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:57 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ec7d86289529c6b9add8352b4e72f6dd8700a481
X-Git-Newrev: 606696492331577e201889857e5f769972db8ad3
X-Patchwork-Hint: ignore
Message-Id: <20261106160653.963CC9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/patch: security
 bump version to 2.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6746599561893088228=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6746599561893088228==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/606696492331577e201889857e5f769972db8ad3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
[4] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=b5a91a01e5d0897facdd0f49d64b76b0f02b43e1
[5] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=123eaff0d5d1aebe128295959435b9ca5909c26d
[6] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0
[7] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a
[8] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=9c986353e420ead6e706262bf204d6e03322c300
[9] https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 302f5b6a2fc54ff49a6eb90b6daa24f39c8fec43)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore                                |   1 -
 ...01-Fix-segfault-with-mangled-rename-patch.patch |  33 -----
 ...-files-to-be-missing-for-ed-style-patches.patch |  37 -----
 ...ry-command-execution-in-ed-style-patches-.patch | 157 ---------------------
 ...ke-ed-directly-instead-of-using-the-shell.patch |  43 ------
 ...symlinks-unless--follow-symlinks-is-given.patch | 112 ---------------
 .../0006-Fix-swapping-fake-lines-in-pch-swap.patch |  33 -----
 ...lid-memory-access-in-context-format-diffs.patch |  30 ----
 package/patch/patch.hash                           |   2 +-
 package/patch/patch.mk                             |  20 +--
 10 files changed, 2 insertions(+), 466 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 60b3f676ad..08d2edde21 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -701,7 +701,6 @@ package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch li
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

--===============6746599561893088228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6746599561893088228==--
