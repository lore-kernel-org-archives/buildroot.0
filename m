Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86677606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 21:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LRgF+GTq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B2ED40704;
	Mon,  9 Nov 2026 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CI-K0g9P7Qlo; Mon,  9 Nov 2026 21:03:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6A928406FE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794258194;
	b=UdBxkuchjsGXUleswuy6gAjWeN8io25GSaYcvpUMvylRRkr6D+qa+NkO8mygwe7JSd8m
	 /9Nibv2Fsh7Dbq2s2deG7xMHNIsK2IFiOq2ug4W/H0aPQmgUkU5RIZxqqtNs4feJ/QPgL
	 Zxs5zXvZVMQzme0kLNM6UFw1EbzJGqXYqRWjBSyJkdY/ay8DVI6oRiJkyJvXaaCIQYdJR
	 T5RXVQiaOydBVRDTiQLGA3IC0MXCztpxw7r3V1WqBm/AAGz1+/dWCgbAc7dJ/4Wssqo4w
	 bgHzRynWmOW64UGmxuQNP5aOIZg8tUwMw9cFAeo/RAcVEn2MgNgI1wjRzbmisxF9xzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794258194;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Ptsx6iKUfpezNMkw1uuBsCHnXgMpvhJFT5yjyTsu5WQ=;
	b=R8G83mam4/s47nt3bbrYolwtcnD9pFnMlffFGZ2PwTkpBxEjMCMD/HIZv05/JM6UbH+x
	 nTRtBBBWSOCx7Fd49EHLmbjcqo/Jnq6rLwI26tBYuavAwFiD5JrbTBXOS/m2GzvqZdvdq
	 lRlXYN0eUjHY+z9CmpC6dgIcbrm49YRR7offQL0yiRV8MZ7cvwjCD2xYICeXGojUC61os
	 K+6eOBZ7vULjB4FCYhlw5Nd9R8RNt/rmM594gT5oQkQtibA/F5+phHR+JLOPnGfdqzHP7
	 SfPqfBmRCpPbZKMBGy7tSpmdaSA+9v1a0tf6OrdfNVmEAsQ9V1W35nuX0GmIDyMPqEQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794258194;
	bh=Ptsx6iKUfpezNMkw1uuBsCHnXgMpvhJFT5yjyTsu5WQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LRgF+GTqXmxuEQi/BG9KrkyejNCWdzkI4OTOePDQvDY0PGVYjcp0oMDba6yMGxEUj
	 3SpH3LEVYkD8/m2IUxpVpWIa9XKzw2jFxl18uPIIyMVW5EC9wGJjedmOjgzEwYM4re
	 zVkEB7j5tMxvnrnf1GSvS7UEdW0EGLvvG8QLBQ4vDUKYndFmHnxiy9aABvedABLfe8
	 84g04ewgvogwueWubYfiEsEWUGP+vR9hY8TNvP68QrSmvP8k/SFB2iSM5EylBAS+dw
	 MbMq86cYB29LLEXplVxLrZU7KMk3kAyDU52vOc8pNX62e6th/xSCOxf7sToNCeM5Os
	 NwcYFUowHs8fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A928406FE;
	Mon,  9 Nov 2026 21:03:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46ACE28C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 21:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4320A80D4A
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDiB8sdJOmPi for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 21:03:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7FCF980D74
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FCF980D74
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 21:03:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F00488A32B; Mon,  9 Nov 2026 21:01:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 9 Nov 2026 20:29:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7461a6acea0418f8acb48fcea04394ded540f422
X-Git-Newrev: f753f0980f5952cd57f51081ad09573aa5640aa7
X-Patchwork-Hint: ignore
Message-Id: <20261109210137.F00488A32B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: security bump to
 version 5.15.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7436156122581531954=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7436156122581531954==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f753f0980f5952cd57f51081ad09573aa5640aa7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

- CVE-2024-10229: inappropriate implementation in Extensions
- CVE-2024-10827: use after free in Serial
- CVE-2024-12694: use after free in Compositing
- CVE-2025-0436: integer overflow in Skia
- CVE-2024-11477: issue in the LZMA SDK
- CVE-2025-0996: inappropriate implementation in Browser UI
- CVE-2025-1426: heap buffer overflow in GPU
- CVE-2025-0762: use after free in DevTools
- CVE-2025-0999: heap buffer overflow in V8
- CVE-2024-55549: use after free related to excluded namespaces in
  libxslt
- CVE-2025-24855: use after free of XPath context node in libxslt
- CVE-2025-1919: issue in Chromium
- CVE-2025-2783: incorrect handle provided in unspecified circumstances
  in Mojo on Windows
- CVE-2025-24201: issue in ANGLE
- CVE-2025-2136: issue in Chromium
- CVE-2025-3619: issue in Chromium

Bump qt5webengine to the v5.15.19-lts tag, following QT5_VERSION again,
and qt5webengine-chromium to the submodule version of this tag.

For qt5webengine-chromium, the Python 3.12/3.13 fixes backported by Qt
make some of our patches obsolete:
- 0002-Remove-unused-python-import.patch is dropped, merged upstream in
  cd438f6f3546 ("[backport] Fix builds with pyhton 3.12");
- 0004-tools-grit-grit-util.py-fix-Python-3.12-build-issue.patch is
  dropped, as e78dbf724ae0 ("[backport] Fixes for python 3.12") fixes
  the same imports;
- 0008-Shorted-printed-cmd-when-long-commands-fail.patch is dropped, as
  480e246dfe9d ("Fix build with python 3.12/3.13") already removes the
  pipes module, which is what we needed it for;
- 0006-protobuf-python-google-protobuf-internal-python_mess.patch is
  refreshed: its first hunk is dropped, as 480e246dfe9d removes the
  six.moves import itself, and keeps the six import that new code uses.
The remaining patches are renumbered.

The LICENSE hash of the LZMA SDK changed in qt5webengine-chromium: a
paragraph detailing the public domain terms was added to it with the
update of the LZMA SDK.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...tch => 0002-Migrate-presubmit-to-python3.patch} |  0
 .../0002-Remove-unused-python-import.patch         | 47 ---------------
 ...Fix-build-in-Python-3.11-invalid-mode-rU.patch} |  0
 ...hon-google-protobuf-internal-python_mess.patch} | 14 +----
 ...-grit-util.py-fix-Python-3.12-build-issue.patch | 70 ----------------------
 ...-command_buffer-service-program_manager..patch} |  0
 ...nclude-cstdint-for-uintptr_t-uint8_t-etc.patch} |  0
 ...0007-Fix-build-with-glibc-2.43-and-above.patch} |  0
 ...orted-printed-cmd-when-long-commands-fail.patch | 57 ------------------
 .../qt5webengine-chromium.hash                     |  4 +-
 .../qt5webengine-chromium/qt5webengine-chromium.mk |  2 +-
 package/qt5/qt5webengine/qt5webengine.hash         |  2 +-
 package/qt5/qt5webengine/qt5webengine.mk           |  2 +-
 13 files changed, 7 insertions(+), 191 deletions(-)

diff --git a/package/qt5/qt5webengine-chromium/0003-Migrate-presubmit-to-python3.patch b/package/qt5/qt5webengine-chromium/0002-Migrate-presubmit-to-python3.patch
similarity index 100%
rename from package/qt5/qt5webengine-chromium/0003-Migrate-presubmit-to-python3.patch
rename to package/qt5/qt5webengine-chromium/0002-Migrate-presubmit-to-python3.patch
diff --git a/package/qt5/qt5webengine-chromium/0002-Remove-unused-python-import.patch b/package/qt5/qt5webengine-chromium/0002-Remove-unused-python-import.patch
deleted file mode 100644
index df9e9cfe24..0000000000
--- a/package/qt5/qt5webengine-chromium/0002-Remove-unused-python-import.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From f684c6fb3532138e3408fa17d4b6610162647365 Mon Sep 17 00:00:00 2001
-From: Bruno Pitrus <brunopitrus@hotmail.com>
-Date: Tue, 25 Jul 2023 18:34:09 +0000
-Subject: [PATCH] Remove unused python import
-
-The `imp` module has been removed in Python 3.12 causing these scripts to error out.
-
-Change-Id: Ic7c038d21b86052bdda13015f80934db52a2143e
-Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/4714859
-Auto-Submit: Bruno Pitrus <brunopitrus@hotmail.com>
-Reviewed-by: Ken Rockot <rockot@google.com>
-Commit-Queue: Ken Rockot <rockot@google.com>
-Cr-Commit-Position: refs/heads/main@{#1174966}
-Upstream: https://github.com/chromium/chromium/commit/f5f6e361d037c31630661186e7bd7b31d2784cb8
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- chromium/mojo/public/tools/mojom/mojom/fileutil.py    | 1 -
- chromium/mojo/public/tools/mojom/mojom/parse/lexer.py | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/chromium/mojo/public/tools/mojom/mojom/fileutil.py b/chromium/mojo/public/tools/mojom/mojom/fileutil.py
-index bf626f54798..e1c823daa3c 100644
---- a/chromium/mojo/public/tools/mojom/mojom/fileutil.py
-+++ b/chromium/mojo/public/tools/mojom/mojom/fileutil.py
-@@ -3,7 +3,6 @@
- # found in the LICENSE file.
- 
- import errno
--import imp
- import os.path
- import sys
- 
-diff --git a/chromium/mojo/public/tools/mojom/mojom/parse/lexer.py b/chromium/mojo/public/tools/mojom/mojom/parse/lexer.py
-index 3e084bbf22b..1e8b49f245f 100644
---- a/chromium/mojo/public/tools/mojom/mojom/parse/lexer.py
-+++ b/chromium/mojo/public/tools/mojom/mojom/parse/lexer.py
-@@ -2,7 +2,6 @@
- # Use of this source code is governed by a BSD-style license that can be
- # found in the LICENSE file.
- 
--import imp
- import os.path
- import sys
- 
--- 
-2.25.1
-
diff --git a/package/qt5/qt5webengine-chromium/0005-Fix-build-in-Python-3.11-invalid-mode-rU.patch b/package/qt5/qt5webengine-chromium/0003-Fix-build-in-Python-3.11-invalid-mode-rU.patch
similarity index 100%
rename from package/qt5/qt5webengine-chromium/0005-Fix-build-in-Python-3.11-invalid-mode-rU.patch
rename to package/qt5/qt5webengine-chromium/0003-Fix-build-in-Python-3.11-invalid-mode-rU.patch
diff --git a/package/qt5/qt5webengine-chromium/0006-protobuf-python-google-protobuf-internal-python_mess.patch b/package/qt5/qt5webengine-chromium/0004-protobuf-python-google-protobuf-internal-python_mess.patch
similarity index 81%
rename from package/qt5/qt5webengine-chromium/0006-protobuf-python-google-protobuf-internal-python_mess.patch
rename to package/qt5/qt5webengine-chromium/0004-protobuf-python-google-protobuf-internal-python_mess.patch
index 810e71475a..f2e72f5e95 100644
--- a/package/qt5/qt5webengine-chromium/0006-protobuf-python-google-protobuf-internal-python_mess.patch
+++ b/package/qt5/qt5webengine-chromium/0004-protobuf-python-google-protobuf-internal-python_mess.patch
@@ -18,17 +18,7 @@ diff --git a/chromium/third_party/protobuf/python/google/protobuf/internal/pytho
 index 803ae848493..a1954ce88c9 100755
 --- a/chromium/third_party/protobuf/python/google/protobuf/internal/python_message.py
 +++ b/chromium/third_party/protobuf/python/google/protobuf/internal/python_message.py
-@@ -55,9 +55,6 @@ import struct
- import sys
- import weakref
- 
--import six
--from six.moves import range
--
- # We use "as" to avoid name collisions with variables.
- from google.protobuf.internal import api_implementation
- from google.protobuf.internal import containers
-@@ -467,7 +464,7 @@ def _ReraiseTypeErrorWithFieldName(message_name, field_name):
+@@ -466,7 +466,7 @@ def _ReraiseTypeErrorWithFieldName(message_name, field_name):
      exc = TypeError('%s for field %s.%s' % (str(exc), message_name, field_name))
  
    # re-raise possibly-amended exception with original traceback:
@@ -37,7 +27,7 @@ index 803ae848493..a1954ce88c9 100755
  
  
  def _AddInitMethod(message_descriptor, cls):
-@@ -480,7 +477,7 @@ def _AddInitMethod(message_descriptor, cls):
+@@ -479,7 +479,7 @@ def _AddInitMethod(message_descriptor, cls):
      enum_type with the same name.  If the value is not a string, it's
      returned as-is.  (No conversion or bounds-checking is done.)
      """
diff --git a/package/qt5/qt5webengine-chromium/0004-tools-grit-grit-util.py-fix-Python-3.12-build-issue.patch b/package/qt5/qt5webengine-chromium/0004-tools-grit-grit-util.py-fix-Python-3.12-build-issue.patch
deleted file mode 100644
index f08f6467e2..0000000000
--- a/package/qt5/qt5webengine-chromium/0004-tools-grit-grit-util.py-fix-Python-3.12-build-issue.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 5201c34a4c0f2fed56f6cff3acada3da2405a363 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 13 Jul 2024 16:02:38 +0200
-Subject: [PATCH] tools/grit/grit/util.py: fix Python 3.12 build issue
-
-This commit is an extract from upstream commit
-https://github.com/chromium/chromium/commit/b3abd7e4c9467415da3a5e13d9500d2ab3abc2ec
-which is too large to be backported.
-
-It fixes:
-
-Traceback (most recent call last):
-  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/core/release/../../3rdparty/chromium/tools/grit/grit.py", line 14, in <module>
-    import grit.grit_runner
-  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/grit_runner.py", line 19, in <module>
-    from grit import util
-  File "/home/thomas/buildroot/buildroot/output/build/qt5webengine-5.15.14/src/3rdparty/chromium/tools/grit/grit/util.py", line 21, in <module>
-    from six.moves import html_entities as entities
-ModuleNotFoundError: No module named 'six.moves'
-
-Upstream: https://github.com/chromium/chromium/commit/b3abd7e4c9467415da3a5e13d9500d2ab3abc2ec (part of)
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- chromium/tools/grit/grit/util.py | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/chromium/tools/grit/grit/util.py b/chromium/tools/grit/grit/util.py
-index 528d766ad6b..77db06adffb 100644
---- a/chromium/tools/grit/grit/util.py
-+++ b/chromium/tools/grit/grit/util.py
-@@ -8,6 +8,7 @@
- from __future__ import print_function
- 
- import codecs
-+import html.entities
- import io
- import os
- import re
-@@ -17,8 +18,6 @@ import tempfile
- from xml.sax import saxutils
- 
- import six
--from six import StringIO
--from six.moves import html_entities as entities
- 
- from grit import lazy_re
- 
-@@ -226,7 +225,7 @@ def WrapOutputStream(stream, encoding = 'utf-8'):
- def ChangeStdoutEncoding(encoding = 'utf-8'):
-   '''Changes STDOUT to print characters using the specified encoding.'''
-   # If we're unittesting, don't reconfigure.
--  if isinstance(sys.stdout, StringIO):
-+  if isinstance(sys.stdout, io.StringIO):
-     return
- 
-   if sys.version_info.major < 3:
-@@ -280,8 +279,8 @@ def UnescapeHtml(text, replace_nbsp=True):
-       if name == 'nbsp' and not replace_nbsp:
-         return match.group()  # Don't replace &nbsp;
-       assert name != None
--      if name in entities.name2codepoint:
--        return six.unichr(entities.name2codepoint[name])
-+      if name in html.entities.name2codepoint:
-+        return six.unichr(html.entities.name2codepoint[name])
-       else:
-         return match.group()  # Unknown HTML character entity - don't replace
- 
--- 
-2.25.1
-
diff --git a/package/qt5/qt5webengine-chromium/0007-chromium-gpu-command_buffer-service-program_manager..patch b/package/qt5/qt5webengine-chromium/0005-chromium-gpu-command_buffer-service-program_manager..patch
similarity index 100%
rename from package/qt5/qt5webengine-chromium/0007-chromium-gpu-command_buffer-service-program_manager..patch
rename to package/qt5/qt5webengine-chromium/0005-chromium-gpu-command_buffer-service-program_manager..patch
diff --git a/package/qt5/qt5webengine-chromium/0009-Include-cstdint-for-uintptr_t-uint8_t-etc.patch b/package/qt5/qt5webengine-chromium/0006-Include-cstdint-for-uintptr_t-uint8_t-etc.patch
similarity index 100%
rename from package/qt5/qt5webengine-chromium/0009-Include-cstdint-for-uintptr_t-uint8_t-etc.patch
rename to package/qt5/qt5webengine-chromium/0006-Include-cstdint-for-uintptr_t-uint8_t-etc.patch
diff --git a/package/qt5/qt5webengine-chromium/0010-Fix-build-with-glibc-2.43-and-above.patch b/package/qt5/qt5webengine-chromium/0007-Fix-build-with-glibc-2.43-and-above.patch
similarity index 100%
rename from package/qt5/qt5webengine-chromium/0010-Fix-build-with-glibc-2.43-and-above.patch
rename to package/qt5/qt5webengine-chromium/0007-Fix-build-with-glibc-2.43-and-above.patch
diff --git a/package/qt5/qt5webengine-chromium/0008-Shorted-printed-cmd-when-long-commands-fail.patch b/package/qt5/qt5webengine-chromium/0008-Shorted-printed-cmd-when-long-commands-fail.patch
deleted file mode 100644
index 46349abc50..0000000000
--- a/package/qt5/qt5webengine-chromium/0008-Shorted-printed-cmd-when-long-commands-fail.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 1a713c6e4861f0672252425a1ccbfa9f45834d5d Mon Sep 17 00:00:00 2001
-From: Mohamed Heikal <mheikal@chromium.org>
-Date: Tue, 4 Apr 2023 17:04:04 +0000
-Subject: [PATCH] Shorted printed cmd when long commands fail
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Some commands (eg: javac) are very long and when they fail most of the
-screen/log is filled with the actual cmd vs the error message output.
-Shorten printed CMDs to 200 chars unless an environment variable is set.
-
-Bug: None
-Change-Id: I92809a7e4a2b1204931a74fd6239803feddd430e
-Reviewed-on: https://chromium-review.googlesource.com/c/chromium/src/+/4395905
-Reviewed-by: Andrew Grieve <agrieve@chromium.org>
-Commit-Queue: Mohamed Heikal <mheikal@chromium.org>
-Cr-Commit-Position: refs/heads/main@{#1126065}
-Upstream: Backport [https://github.com/chromium/chromium/commit/4c6fc1984970af4b2b1765014c9ddcd957ad7dda]
-Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
-[gportay: remove import pipes]
----
- chromium/build/android/gyp/util/build_utils.py | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/chromium/build/android/gyp/util/build_utils.py b/chromium/build/android/gyp/util/build_utils.py
-index 02298051702..5fa753af459 100644
---- a/chromium/build/android/gyp/util/build_utils.py
-+++ b/chromium/build/android/gyp/util/build_utils.py
-@@ -12,7 +12,6 @@ import fnmatch
- import json
- import logging
- import os
--import pipes
- import re
- import shutil
- import stat
-@@ -196,9 +195,14 @@ class CalledProcessError(Exception):
- 
-   def __str__(self):
-     # A user should be able to simply copy and paste the command that failed
--    # into their shell.
-+    # into their shell (unless it is more than 200 chars).
-+    # User can set PRINT_FULL_COMMAND=1 to always print the full command.
-+    print_full = os.environ.get('PRINT_FULL_COMMAND', '0') != '0'
-+    full_cmd = shlex.join(self.args)
-+    short_cmd = textwrap.shorten(full_cmd, width=200)
-+    printed_cmd = full_cmd if print_full else short_cmd
-     copyable_command = '( cd {}; {} )'.format(os.path.abspath(self.cwd),
--        ' '.join(map(pipes.quote, self.args)))
-+                                              printed_cmd)
-     return 'Command failed: {}\n{}'.format(copyable_command, self.output)
- 
- 
--- 
-2.39.5
-
diff --git a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
index 63df676a9d..8c536c1c16 100644
--- a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
+++ b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c1c73b6b72a90bb345e0d4365b9e69ce05e898d1c4480a4e9444e39a1c2801da  qtwebengine-chromium-85337c28bae7d7d2c79282c4f4c92435cd7649b8.tar.bz2
+sha256  a1a41e5bb70594081c475af697abc4121df5a504815b99da9bbe66dd99604271  qtwebengine-chromium-6d29e9cfcfffa7632cc3858ceaf8940677ba9c91.tar.bz2
 
 # Locally calculated with:
 # for i in $(find * -type f \( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) -a -not -name '*.cc' -not -name '*.py' -not -name '*.pyc' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before' -not -path 'chromium/third_party/catapult/*') ; do echo -n "sha256  " ; sha256sum $i ; done | sort --key=3
@@ -1055,7 +1055,7 @@ sha256  31346421254a3e6e12687cf17f19f6357ee73a617fa7b3d3ccefdcbabe49bdd3  chromi
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  chromium/third_party/libxslt/src/Copyright
 sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  chromium/third_party/libyuv/LICENSE
 sha256  0d4077a7055ead389c4c5a9a6ac4bb8b784fc6e9e37be2caf544fcceed26cb16  chromium/third_party/lottie/LICENSE
-sha256  6e3e0a978f1e136cb3efb89702f4314671581a0c70c9a52447669e00f7b129e8  chromium/third_party/lzma_sdk/LICENSE
+sha256  7de6196d9c03ec05e626d4fe7ab86a9c900f11d73176a816423fc14e0a1ee0de  chromium/third_party/lzma_sdk/LICENSE
 sha256  c3b124673c93872156757a934c75b498d68eec09510e25e549d9dc2013776499  chromium/third_party/mako/LICENSE
 sha256  0bbe88228fd63d20ec097f64e58d5a0a465123ae139140a18d406c60b48824b5  chromium/third_party/markupsafe/LICENSE
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  chromium/third_party/material_design_icons/LICENSE
diff --git a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
index ce1f204b3d..e9a10ddf97 100644
--- a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
+++ b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBENGINE_CHROMIUM_VERSION = 85337c28bae7d7d2c79282c4f4c92435cd7649b8
+QT5WEBENGINE_CHROMIUM_VERSION = 6d29e9cfcfffa7632cc3858ceaf8940677ba9c91
 QT5WEBENGINE_CHROMIUM_SITE = $(QT5_SITE)/qtwebengine-chromium/-/archive/$(QT5WEBENGINE_CHROMIUM_VERSION)
 QT5WEBENGINE_CHROMIUM_SOURCE = qtwebengine-chromium-$(QT5WEBENGINE_CHROMIUM_VERSION).tar.bz2
 QT5WEBENGINE_CHROMIUM_PATCH_DEPENDENCIES = qt5webengine-chromium-catapult
diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
index fe140df9ae..bbe84ff047 100644
--- a/package/qt5/qt5webengine/qt5webengine.hash
+++ b/package/qt5/qt5webengine/qt5webengine.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8fa9d026fe0d04cb436ab7a66cdf249d189a91b61c565a1564a9bf05c7c73f7a  qtwebengine-v5.15.18-lts.tar.bz2
+sha256  0d11c3ca5bf6f23d9d77fc43c53afad5b0deed6909f3a84b6ee7ed5790222393  qtwebengine-v5.15.19-lts.tar.bz2
 
 # Locally calculated
 sha256  f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 3390e4d86b..00df7e1ede 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBENGINE_VERSION = 5.15.18
+QT5WEBENGINE_VERSION = $(QT5_VERSION)
 QT5WEBENGINE_SITE = $(QT5_SITE)/qtwebengine/-/archive/v$(QT5WEBENGINE_VERSION)-lts
 QT5WEBENGINE_SOURCE = qtwebengine-v$(QT5WEBENGINE_VERSION)-lts.tar.bz2
 QT5WEBENGINE_DEPENDENCIES = qt5declarative qt5webchannel

--===============7436156122581531954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7436156122581531954==--
