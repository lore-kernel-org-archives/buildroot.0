Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C07CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 18:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBE3A814B4;
	Sun, 26 Dec 2021 18:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpIXVsdjIpfd; Sun, 26 Dec 2021 18:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3465081495;
	Sun, 26 Dec 2021 18:50:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0461BF391
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C1BB60E0B
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mb1VRy5NABWf for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 18:50:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3197660E0A
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 18:50:14 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id bp39so11622891qtb.6
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOU4wlND2qyCJMFMiALWDpi2fW5jGX6NJbpRPcI8gnM=;
 b=G4SaJVAdIVm9nr/Ig7aMmj+xKH/jUdYamZYiOFyk0r9TV5S2R11E0LLgiWhrnw/jvC
 gMHqt6nTtTvncVcfwoTeqEgZ5/foQfiWTxS7lBhT3zV8Ml22ASxtMZqc+I3weWLurlwF
 lXNEzhWr9JQ/aMVBVb0V3EffE4XnYpgQJCvnhrI+5xRsZ1MZUJ+FJbaGoNEuYDb9wLOE
 6z4cckSnawvPS0duXWZxeLp8JF/6ILpIA6eJxbPo5OYMPRLX8CTyo48LSm5Gp8MoG881
 P6j3adDCNyti4JybQHsO6YQ32X5sA+JgHFhh40lGy9WWw7ivpxFR4a3uYefWCoE7vBig
 qBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOU4wlND2qyCJMFMiALWDpi2fW5jGX6NJbpRPcI8gnM=;
 b=LOf5UeQhoBObE9CkljwQ8bfE9k3IA9Yn47EMumesF2yBtazt08BjifcoQoeNeJ4t5C
 mXv53OiqToezVqIV3/6ES16N19UPFRTnA+ENkh1GtYQWwqAdEHxkSWjS4UAdkYyC+qeo
 tURveQ61i0qVtTP2swU+X1XpHnrnUMMgEkKYorN+mXBlXDu9t+ssLVQTkE7Qu9ZCZ9hb
 ZjHTQHaVBSP/e5yGU/fdT6Daopd3TYeA0JXhFAc9W46eMLVAtUmp+4QM4W7QCvnV4gcm
 1YxV0TBT50HR9SR3j142XFIq+YvRF/R09DSxP+8ybaC10W3oS8D2SzIwBpi6ndl6rz9T
 glCg==
X-Gm-Message-State: AOAM530qH03qmbfdjnmYo4UaCchiUmgk07HoFIwL1ZsVDcUOmI37nMuw
 M169qhbGbgiTqshL/XKM5zJOewulc5g=
X-Google-Smtp-Source: ABdhPJy9UqX21IwTFWbo+eRyN0yQ1kgC0jWeURaL13mxDakxudcMPLNxcCfb4hutzKu61vhA6cBx+Q==
X-Received: by 2002:ac8:5fcc:: with SMTP id k12mr12874799qta.217.1640544612486; 
 Sun, 26 Dec 2021 10:50:12 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id j22sm12349717qko.68.2021.12.26.10.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 10:50:12 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 15:49:15 -0300
Message-Id: <20211226184919.2753591-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
References: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] utils/check-package: prepare to run
 external tools
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some file formats have well-established syntax checkers.
One example of this is the tool 'shellcheck' that can analyse shell
scripts for common mistakes.

There is no reason to reimplement such tools in check-package, when we
can just call them.

Add the ability to check-package to call external tools that will run
once for each file to be analysed.
For simplicity, when the tool generated one or more warnings, count it
as a single warning from check-package, that can display something like
this:

|$ ./utils/check-package  package/unscd/S46unscd
|package/unscd/S46unscd:0: run 'shellcheck' and fix the warnings
|25 lines processed
|1 warnings generated

|$ ./utils/check-package -vvvvvvvvvvvvvvvv package/unscd/S46unscd
|package/unscd/S46unscd:0: run 'shellcheck' and fix the warnings
|In package/unscd/S46unscd line 9:
|        printf "Starting ${NAME}: "
|               ^------------------^ SC2059: Don't use variables in the printf format string. Use printf "..%s.." "$foo".
|In package/unscd/S46unscd line 11:
|        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
|          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.
|In package/unscd/S46unscd line 14:
|        printf "Stopping ${NAME}: "
|               ^------------------^ SC2059: Don't use variables in the printf format string. Use printf "..%s.." "$foo".
|In package/unscd/S46unscd line 16:
|        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
|          ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.
|For more information:
|  https://www.shellcheck.net/wiki/SC2059 -- Don't use variables in the printf...
|  https://www.shellcheck.net/wiki/SC2181 -- Check exit code directly with e.g...
|25 lines processed
|1 warnings generated

In this first commit, add only the ability for check-package to call
external tools and not an example of such tool, as adding each tool to
call may need update to the docker image and can lead to it's own
discussion on how to implement.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Please read the cover letter before applying.
---
 utils/check-package           | 34 ++++++++++++++++++++++++++++------
 utils/checkpackagelib/base.py |  8 ++++++++
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index a959fef079..5fb430902d 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -8,6 +8,7 @@ import re
 import six
 import sys
 
+import checkpackagelib.base
 import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
 import checkpackagelib.lib_mk
@@ -87,9 +88,7 @@ def get_lib_from_filename(fname):
     return None
 
 
-def is_a_check_function(m):
-    if not inspect.isclass(m):
-        return False
+def common_inspect_rules(m):
     # do not call the base class
     if m.__name__.startswith("_"):
         return False
@@ -100,6 +99,22 @@ def is_a_check_function(m):
     return True
 
 
+def is_a_check_function(m):
+    if not inspect.isclass(m):
+        return False
+    if not issubclass(m, checkpackagelib.base._CheckFunction):
+        return False
+    return common_inspect_rules(m)
+
+
+def is_external_tool(m):
+    if not inspect.isclass(m):
+        return False
+    if not issubclass(m, checkpackagelib.base._Tool):
+        return False
+    return common_inspect_rules(m)
+
+
 def print_warnings(warnings):
     # Avoid the need to use 'return []' at the end of every check function.
     if warnings is None:
@@ -121,14 +136,16 @@ def check_file_using_lib(fname):
         if flags.verbose >= VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES:
             print("{}: ignored".format(fname))
         return nwarnings, nlines
-    classes = inspect.getmembers(lib, is_a_check_function)
+    internal_functions = inspect.getmembers(lib, is_a_check_function)
+    external_tools = inspect.getmembers(lib, is_external_tool)
+    all_checks = internal_functions + external_tools
 
     if flags.dry_run:
-        functions_to_run = [c[0] for c in classes]
+        functions_to_run = [c[0] for c in all_checks]
         print("{}: would run: {}".format(fname, functions_to_run))
         return nwarnings, nlines
 
-    objects = [c[1](fname, flags.manual_url) for c in classes]
+    objects = [c[1](fname, flags.manual_url) for c in internal_functions]
 
     for cf in objects:
         nwarnings += print_warnings(cf.before())
@@ -148,6 +165,11 @@ def check_file_using_lib(fname):
     for cf in objects:
         nwarnings += print_warnings(cf.after())
 
+    tools = [c[1](fname) for c in external_tools]
+
+    for tool in tools:
+        nwarnings += print_warnings(tool.run())
+
     return nwarnings, nlines
 
 
diff --git a/utils/checkpackagelib/base.py b/utils/checkpackagelib/base.py
index 9544a64e5a..73da925a03 100644
--- a/utils/checkpackagelib/base.py
+++ b/utils/checkpackagelib/base.py
@@ -16,3 +16,11 @@ class _CheckFunction(object):
 
     def after(self):
         pass
+
+
+class _Tool(object):
+    def __init__(self, filename):
+        self.filename = filename
+
+    def run(self):
+        pass
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
