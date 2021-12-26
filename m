Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489D9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 18:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E79AE60E11;
	Sun, 26 Dec 2021 18:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXuQPsaJPhGq; Sun, 26 Dec 2021 18:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36AD260E0B;
	Sun, 26 Dec 2021 18:50:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 337E31BF391
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22D7260E0D
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5MkkVsybvkU for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 18:50:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F4BE60E0B
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 18:50:15 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id f138so12770334qke.10
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QrA9gq5B5Q2f9iZYWGyVwtycJejz0ZUmQpZakOwyUmY=;
 b=onHpAaBVoZhQd972sHHGH2ENPR56vWcVzyUjEZTzCCqMNsCrVBRe1yU7hpTPMA+SLK
 lLJwL9+cMMOtnZ1JyT2cUb8rOPXJ+vA8dJB02ibVLuPFeIzi6+NlZ5LRSy2dUOe0FyEH
 pHGSz+RXPfowQBhCU65qgvGNurDFXVte4aRVzg2WK/axHnm977bmFJpZXomuG83v0/2d
 EGTUMNyUnLwcENNZ9WmFSNFPAiWAO64xkuRVt+50e37rHno8dbzG5W7DYqpoy223o5CU
 zXkt7cIams3Kx+5yMoXcQi5hMU0p2uIgfnrO6jhW9+nQC8JvuGOl3HT64bJfDAERUWQA
 CpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QrA9gq5B5Q2f9iZYWGyVwtycJejz0ZUmQpZakOwyUmY=;
 b=WPyXnRpPoPTZIyfMOxy6lbgVaJylOx08Ems8VgzJotksQo1xoNNek6QHzNlX6Fg4Sy
 t0qNhEHwj0HchZaaL8S6JF6+m4qLaFzdFx1GU5loLDQ9yWp5DEKAqMhZFoFMztpjBr/9
 mlJe6Z1cTmIPgaMQRXlSgGiNl0e4mUUMyf9pJuhHrwrRiJTe6ALXegWM1g7j/cNdY7Il
 Dm/4NAJWpf5oAr0mEElUtSvUhBqqOJp3tBUQUVoC/0K5HrdMh1XFKv5lHgpBNK2P4kLS
 U/2W65ijKUg1ujJX/WcRvCPxNHXWNf0slajtCEh+s6CP6ONXwj7hs/HDZ2CALvarwjvr
 peiw==
X-Gm-Message-State: AOAM533Ihri5U1Sjn3Th8RHlhplLe+b3qO9bX7Q+RmDyNPEmuT0gFqzR
 FAO+3rhYqja+gHtv1drpeTTYYYeqD/4=
X-Google-Smtp-Source: ABdhPJyyyIPl1HbUeqtwD/pKpBOhGoipZzytbRcxKSYUV3NV+woVx2JUCUK6sdNFm/Xhl73CJmxX6g==
X-Received: by 2002:a05:620a:21d1:: with SMTP id
 h17mr10339255qka.495.1640544614021; 
 Sun, 26 Dec 2021 10:50:14 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id j22sm12349717qko.68.2021.12.26.10.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 10:50:13 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 15:49:16 -0300
Message-Id: <20211226184919.2753591-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
References: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] utils/checkpackagelib: warn about
 executable files
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

Currently there are no .mk, Config.in, .patch or .hash files with
executable permissions in the tree.
But we don't want to have that.

So warn when a file checked by check-package has executable permission.

This check will be reused when testing SysV init scripts in the tree.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Please read the cover letter before applying.
---
 utils/checkpackagelib/lib_config.py |  1 +
 utils/checkpackagelib/lib_hash.py   |  1 +
 utils/checkpackagelib/lib_mk.py     |  1 +
 utils/checkpackagelib/lib_patch.py  |  1 +
 utils/checkpackagelib/test_tool.py  | 41 +++++++++++++++++++++++++++++
 utils/checkpackagelib/tool.py       |  8 ++++++
 6 files changed, 53 insertions(+)
 create mode 100644 utils/checkpackagelib/test_tool.py
 create mode 100644 utils/checkpackagelib/tool.py

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index c348eec399..b05831f2c3 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -10,6 +10,7 @@ from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
 from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
+from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 
 def _empty_or_comment(text):
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 3e381119a5..c67046e16d 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -10,6 +10,7 @@ from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
 from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
+from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 
 def _empty_line_or_comment(text):
diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 88e4b15c7c..153754b6f1 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -13,6 +13,7 @@ from checkpackagelib.lib import EmptyLastLine          # noqa: F401
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
 from checkpackagelib.lib import TrailingSpace          # noqa: F401
 from checkpackagelib.lib import Utf8Characters         # noqa: F401
+from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 # used in more than one check
 start_conditional = ["ifdef", "ifeq", "ifndef", "ifneq"]
diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index e4e914b7f0..caee36158f 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -8,6 +8,7 @@ import re
 
 from checkpackagelib.base import _CheckFunction
 from checkpackagelib.lib import NewlineAtEof           # noqa: F401
+from checkpackagelib.tool import NotExecutable         # noqa: F401
 
 
 class ApplyOrder(_CheckFunction):
diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
new file mode 100644
index 0000000000..e9e0838103
--- /dev/null
+++ b/utils/checkpackagelib/test_tool.py
@@ -0,0 +1,41 @@
+import os
+import pytest
+import re
+import tempfile
+import checkpackagelib.tool as m
+
+workdir = os.path.join(tempfile.mkdtemp(suffix='-checkpackagelib-test-tool'))
+workdir_regex = re.compile(r'/tmp/tmp[^/]*-checkpackagelib-test-tool')
+
+
+def check_file(tool, filename, string, permissions=None):
+    script = os.path.join(workdir, filename)
+    with open(script, 'wb') as f:
+        f.write(string.encode())
+    if permissions:
+        os.chmod(script, permissions)
+    obj = tool(script)
+    result = obj.run()
+    if result is None:
+        return []
+    return [workdir_regex.sub('dir', r) for r in result]
+
+
+NotExecutable = [
+    ('664',
+     'package.mk',
+     0o664,
+     '',
+     []),
+    ('775',
+     'package.mk',
+     0o775,
+     '',
+     ["dir/package.mk:0: This file does not need to be executable"]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,permissions,string,expected', NotExecutable)
+def test_NotExecutable(testname, filename, permissions, string, expected):
+    warnings = check_file(m.NotExecutable, filename, string, permissions)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
new file mode 100644
index 0000000000..f2007be1ff
--- /dev/null
+++ b/utils/checkpackagelib/tool.py
@@ -0,0 +1,8 @@
+import os
+from checkpackagelib.base import _Tool
+
+
+class NotExecutable(_Tool):
+    def run(self):
+        if os.access(self.filename, os.X_OK):
+            return ["{}:0: This file does not need to be executable".format(self.filename)]
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
