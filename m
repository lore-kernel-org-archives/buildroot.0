Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F1DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 18:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5353B400A2;
	Sun, 26 Dec 2021 18:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZeUmPJoPAOR; Sun, 26 Dec 2021 18:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5456940319;
	Sun, 26 Dec 2021 18:51:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CCB81BF391
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 372BE400A2
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iU3enTXXs-Hd for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 18:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30D934008D
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 18:50:19 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id kj16so12257533qvb.2
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9SbSoISW1t9JVlQNrERd6V0Q0nr69DsIuXXXA6/DWcc=;
 b=UpXksEHMP399In94OXjgFNyhDOVWqiDjmYixCQYLxgj2a6+xTELQW6VvQF69blUbv8
 0Ek4S87UUh4oDxEFFRrR+tG+ZcPMuxw4HyL4Jl9KCyo6eQc5v6y7FrslbdnTzGAhGKe6
 SF7tKC+oyzC1RsaAoM2DPlExsfa0VI9LCJOsRBtMy7nlqQnAm/xFLvFl3y5w64OGR0FY
 jQyvcztIpmIICfVYwgIkQopqo3NhbrXB9EkmFOCApuddZkO/e+JW/dSBJpO3F562myYS
 wOZJld4dlHA0K1ZBMxZI1s1b7ot1Zlsfdcse9xNrMBQBo6l9fZ6RHNp+iACfS0Q+6oo2
 ZKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9SbSoISW1t9JVlQNrERd6V0Q0nr69DsIuXXXA6/DWcc=;
 b=UW5fAQGjRBV3+YjjkrpyKakoCdbtJCEvMMZWZ6iqGt+NnXshswL3y1X+djC4CMQbpk
 MguWJOxFsXQ/VXPJg4J5FTvipByG7Q9gLth5vQrU280BQymcC2oSF6BkMe5VTYzUYB1E
 mNTwFmbjH0Qr+/3P0LGwOA5Z2YjFCEJ4o4XT1E56C0g2m9eEW2NU+DfZy9DNz7q56drn
 SXz2tO0JsREa7vd7hBWUFz4iBzIlhEudt5LZ9MCftXlUPMyFB+/fGGdIWCXUwRWmfNQC
 v0ZihAK2oFgASgc3yGFByu8N8Bm6j3Fz/kBMcE7o8lSffHBSCd+kMutdwUCYTW+bgzXf
 zvOA==
X-Gm-Message-State: AOAM531S+QsJAsP4r1sW0ynsA9+AgkSmzldrlysLs7f1JMn3YyGIvOLT
 VbfMV87SUujqsZ76/tNzGGtiyYib6Xk=
X-Google-Smtp-Source: ABdhPJzatpqsyjgFQ2z+2wFkmLkGfEHcaS2ReelZb6GtFL4UqrxuMFxoGiFt8s1BBa7cp5Lvy/v10g==
X-Received: by 2002:a05:6214:e63:: with SMTP id
 jz3mr12719400qvb.65.1640544618964; 
 Sun, 26 Dec 2021 10:50:18 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id j22sm12349717qko.68.2021.12.26.10.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 10:50:18 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 15:49:19 -0300
Message-Id: <20211226184919.2753591-6-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
References: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] utils/checkpackagelib/lib_sysv: run
 shellcheck
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

For simplicity, when shellcheck returns one or more warnings, count it
as a single check-package warning.
The developer can get the full output either by running shellcheck
directly or by calling check-package with enough -v.

Examples:

|$ ./utils/docker-run utils/check-package --include Shellcheck package/polkit/S50polkit
|package/polkit/S50polkit:0: run 'shellcheck' and fix the warnings
|51 lines processed
|1 warnings generated

|$ ./utils/docker-run utils/check-package --include Shellcheck -vvvvvvvvvvv package/polkit/S50polkit
|package/polkit/S50polkit:0: run 'shellcheck' and fix the warnings
|In package/polkit/S50polkit line 43:
|< tab  >start|stop|restart|reload)
|                           ^----^ SC2221: This pattern always overrides a later one on line 45.
|In package/polkit/S50polkit line 45:
|< tab  >reload)
|        ^----^ SC2222: This pattern never matches because of a previous pattern on line 43.
|For more information:
|  https://www.shellcheck.net/wiki/SC2221 -- This pattern always overrides a l...
|  https://www.shellcheck.net/wiki/SC2222 -- This pattern never matches becaus...
|51 lines processed
|1 warnings generated

NOTICE: shellcheck results depends on the version of the tool.
This is why the examples above run inside the docker image.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Please read the cover letter before applying.
---
 utils/checkpackagelib/lib_sysv.py  |  1 +
 utils/checkpackagelib/test_tool.py | 46 ++++++++++++++++++++++++++++++
 utils/checkpackagelib/tool.py      | 15 ++++++++++
 3 files changed, 62 insertions(+)

diff --git a/utils/checkpackagelib/lib_sysv.py b/utils/checkpackagelib/lib_sysv.py
index 77e6283b25..786510badf 100644
--- a/utils/checkpackagelib/lib_sysv.py
+++ b/utils/checkpackagelib/lib_sysv.py
@@ -7,6 +7,7 @@ from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
 from checkpackagelib.tool import NotExecutable as NotExecutable_base
+from checkpackagelib.tool import Shellcheck            # noqa: F401
 
 
 class Indent(_CheckFunction):
diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
index aab7cb51c9..c5c1d48dfe 100644
--- a/utils/checkpackagelib/test_tool.py
+++ b/utils/checkpackagelib/test_tool.py
@@ -64,3 +64,49 @@ def test_NotExecutable_hint(testname, hint, filename, permissions, string, expec
             return hint
     warnings = check_file(NotExecutable, filename, string, permissions)
     assert warnings == expected
+
+
+Shellcheck = [
+    ('missing shebang',
+     'empty.sh',
+     '',
+     ["dir/empty.sh:0: run 'shellcheck' and fix the warnings",
+      "In dir/empty.sh line 1:",
+      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.",
+      "For more information:",
+      "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y..."]),
+    ('sh shebang',
+     'sh-shebang.sh',
+     '#!/bin/sh',
+     []),
+    ('bash shebang',
+     'bash-shebang.sh',
+     '#!/bin/bash',
+     []),
+    ('2 warnings',
+     'unused.sh',
+     'unused=""',
+     ["dir/unused.sh:0: run 'shellcheck' and fix the warnings",
+      "In dir/unused.sh line 1:",
+      'unused=""',
+      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.",
+      "^----^ SC2034: unused appears unused. Verify use (or export if used externally).",
+      "For more information:",
+      "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y...",
+      "  https://www.shellcheck.net/wiki/SC2034 -- unused appears unused. Verify use..."]),
+    ('tab',
+     'tab.sh',
+     '\t#!/bin/sh',
+     ["dir/tab.sh:0: run 'shellcheck' and fix the warnings",
+      "In dir/tab.sh line 1:",
+      '\t#!/bin/sh',
+      "^-- SC1114: Remove leading spaces before the shebang.",
+      "For more information:",
+      "  https://www.shellcheck.net/wiki/SC1114 -- Remove leading spaces before the ..."]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Shellcheck)
+def test_Shellcheck(testname, filename, string, expected):
+    warnings = check_file(m.Shellcheck, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
index e931272554..47f9634486 100644
--- a/utils/checkpackagelib/tool.py
+++ b/utils/checkpackagelib/tool.py
@@ -1,4 +1,5 @@
 import os
+import subprocess
 from checkpackagelib.base import _Tool
 
 
@@ -6,3 +7,17 @@ class NotExecutable(_Tool):
     def run(self):
         if os.access(self.filename, os.X_OK):
             return ["{}:0: This file does not need to be executable{}".format(self.filename, self.hint())]
+
+
+class Shellcheck(_Tool):
+    def run(self):
+        cmd = ['shellcheck', self.filename]
+        try:
+            p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+            stdout = p.communicate()[0]
+            processed_output = [str(line.decode().rstrip()) for line in stdout.splitlines() if line]
+            if p.returncode == 0:
+                return
+            return ["{}:0: run 'shellcheck' and fix the warnings".format(self.filename)] + processed_output
+        except FileNotFoundError:
+            return ["{}:0: failed to call 'shellcheck'".format(self.filename)]
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
