Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2BEC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 21:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45F0B41C03;
	Sat,  6 May 2023 21:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F0B41C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9bJs08LU_7O; Sat,  6 May 2023 21:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D19ED41B31;
	Sat,  6 May 2023 21:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19ED41B31
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCC021BF355
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 21:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B121E41B31
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 21:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B121E41B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rx16ATZEGHFY for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 21:25:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B3C418ED
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71B3C418ED
 for <buildroot@buildroot.org>; Sat,  6 May 2023 21:25:34 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d4so5752185e9.1
 for <buildroot@buildroot.org>; Sat, 06 May 2023 14:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683408332; x=1686000332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C447N/u1KtAG1hsZNRUVplXCRHfNytPyaTuUPsFLJLo=;
 b=geBdxhIDRyvEL/DL3DKhywsmv5D3q6TJVWJBQyoDNzGe1XrBAKdvJwIsSsswSrH6wZ
 7ucMBrRAKYVTx7Qn09uRRbg/VjnDBBKDQYls0xubplROKPCQ3zRnDEfj1QNbo0GQAdxC
 8J5/Pr+pmhhjw1+IAKf03rF7ETj2TE/FAdyYXw+nwMk424uTxOgJssB1SfwKMWQzJN51
 rxk+w3tTBR8/1txEx73BT+rBXeTK5ndaTBajhAy4aARAQqrQGNaAb10y+x03RIJhtwNr
 QhOfniPnBiZDJmLaI7JszQG1jpfs3ZYXjq9YggluJm208lp/fr9GFnKDYNroA47w8PxP
 OXeA==
X-Gm-Message-State: AC+VfDx5AmGjOrwGOG7XGSg3cfiYbsGSi+g6AuvF/pm1sIGpw4bjfbVm
 GSI1So7AwtyW4U2qMuCfe26ESwkCedE=
X-Google-Smtp-Source: ACHHUZ5DoZOSwbCFmObEcA3oD8K3rFPBb6f5SKVpFXvflrz2rgxhNwnkfeq3y3/Qb850ndXZbvG1xQ==
X-Received: by 2002:a1c:7c03:0:b0:3ee:3e07:5d26 with SMTP id
 x3-20020a1c7c03000000b003ee3e075d26mr3749341wmc.24.1683408332294; 
 Sat, 06 May 2023 14:25:32 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b003f193d7c6b7sm11724223wme.41.2023.05.06.14.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 14:25:31 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 23:25:31 +0200
Message-Id: <20230506212531.365446-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683408332; x=1686000332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=C447N/u1KtAG1hsZNRUVplXCRHfNytPyaTuUPsFLJLo=;
 b=OhzZvVN3stJ5F5E9DhJ9lZvsFEIfIUEX0ItOD925I+FH0pQBSLtw5qIlhWDUYcw0ez
 CEnZcDGiH1mN4zoI0GA/G2kLNLg6XplUa31nc95zDdwMMvRuONOpTtLWshPd7nOhA/eM
 bQ90ohszK8LOApR1HJzzISFMQtKZy+MvxilmhVwEOwUjjmF3jyMX3675un4o5V976EvC
 llMg1YV9UuTXm00qn3Ym3F/S2UTNSJE/OpJXnfzTobUsAnJ8SfvZk1imxXnprw31WOsX
 6ZSDHwadIjR7vbfuxCnpNNMKBi3CpRjjeck/FZw7FcEW3UKVSNaFamHIqIH5wGggpPVr
 fguQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=OhzZvVN3
Subject: [Buildroot] [PATCH] utils/check-package: check ignored files exist
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When an ignored file is removed (e.g. a package patch is no longer
needed after a version bump), the corresponding entry in the ignore list
is no longer needed.

However, we currently only validate that an ignored *test* still fails,
not that a ignore files is now missing.

Add a new test to check-package that does that check, and add a
test-case for that check.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/check-package                      |  4 ++++
 utils/checkpackagelib/lib_ignore.py      | 14 ++++++++++++++
 utils/checkpackagelib/test_lib_ignore.py | 18 ++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 utils/checkpackagelib/lib_ignore.py
 create mode 100644 utils/checkpackagelib/test_lib_ignore.py

diff --git a/utils/check-package b/utils/check-package
index 83b9750f5a..3de3a72e0c 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -11,6 +11,7 @@ import sys
 import checkpackagelib.base
 import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
+import checkpackagelib.lib_ignore
 import checkpackagelib.lib_mk
 import checkpackagelib.lib_patch
 import checkpackagelib.lib_python
@@ -107,6 +108,7 @@ def get_lib_from_filetype(fname):
 
 CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
 DO_CHECK_INTREE = re.compile(r"|".join([
+    r".checkpackageignore",
     r"Config.in",
     r"arch/",
     r"board/",
@@ -146,6 +148,8 @@ def get_lib_from_filename(fname):
         if os.path.basename(fname) == "external.mk" and \
            os.path.exists(fname[:-2] + "desc"):
             return None
+    if fname == ".checkpackageignore":
+        return checkpackagelib.lib_ignore
     if CONFIG_IN_FILENAME.search(fname):
         return checkpackagelib.lib_config
     if fname.endswith(".hash"):
diff --git a/utils/checkpackagelib/lib_ignore.py b/utils/checkpackagelib/lib_ignore.py
new file mode 100644
index 0000000000..f3698fc3b4
--- /dev/null
+++ b/utils/checkpackagelib/lib_ignore.py
@@ -0,0 +1,14 @@
+# See utils/checkpackagelib/readme.txt before editing this file.
+
+import os
+
+from checkpackagelib.base import _CheckFunction
+
+
+class IgnoreMissingFile(_CheckFunction):
+    def check_line(self, lineno, text):
+        fields = text.split()
+        if not os.path.exists(fields[0]):
+            return ["{}:{}: ignored file {} is missing"
+                    .format(self.filename, lineno, fields[0]),
+                    text]
diff --git a/utils/checkpackagelib/test_lib_ignore.py b/utils/checkpackagelib/test_lib_ignore.py
new file mode 100644
index 0000000000..6cd856d669
--- /dev/null
+++ b/utils/checkpackagelib/test_lib_ignore.py
@@ -0,0 +1,18 @@
+import pytest
+import checkpackagelib.test_util as util
+import checkpackagelib.lib_ignore as m
+
+
+IgnoreMissingFile = [
+    ('missing ignored file',
+     '.checkpackageignore',
+     'this-file-does-not-exist SomeTest',
+     [['.checkpackageignore:1: ignored file this-file-does-not-exist is missing',
+       'this-file-does-not-exist SomeTest']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', IgnoreMissingFile)
+def test_IgnoreMissingFile(testname, filename, string, expected):
+    warnings = util.check_file(m.IgnoreMissingFile, filename, string)
+    assert warnings == expected
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
