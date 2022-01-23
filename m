Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE95FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 16:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A637400FF;
	Sun, 23 Jan 2022 16:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4uverbEVQa3; Sun, 23 Jan 2022 16:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E763B4059E;
	Sun, 23 Jan 2022 16:09:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12F701BF3F0
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 16:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DD3A40535
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 16:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOIoUvgSo4L9 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 16:09:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 864CA400FF
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 16:09:19 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id bx18so21549273oib.7
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 08:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0jSycdfZ1cwjJMRupdPDJ0JDlAQfZ9OfPV5uptN978c=;
 b=qEf68FiXj9oXeOxAsaPHDmGfcKVm9xusiA8dUEI0XVSWr3x+DCy4yvTjTtW0Dqd1I5
 QKnOmGfgkq/l1rdeipnVvCpvH0MY9JUqOUs2g5tSpHAMiKAeE8W6M8AHjVYHDOafxRe/
 1DjD/Oi5yDmv5awHi+X2sfm6t3AsyrcDlQ+H3lxUlTGKXmo/tldKsEroD+kOMOOP8azc
 ++j+NzWbAeJYrCEI5dTW4u94GRRoQjOF57UZ+upeVH1svV2ESlgfMX4e3ojN4p4RISRA
 2wUyz1HnNMYFyNdN8y6MrFczPsij1PUpfwSUAzr4Krgl2xQ9e5YVTu7P6JvHYKx4u3jr
 R0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0jSycdfZ1cwjJMRupdPDJ0JDlAQfZ9OfPV5uptN978c=;
 b=A9n5gP+vYOU7/4BDel7tNvgDHLog36KgppzArrtV6LGUKJ+f0G3mL4FNDGQeylgtIl
 luqbCMrgM07klZdvSk0F+MAMJFJ+RAot+eFHHgk76joYGPiPFiYus3Guh1OaMCKOOJLx
 pPHFbzGMgLZq3/HAP1zkL2BWJqMrabBAnABfSFPEvOCh8wyAjrZYhhOh6HnuMjiCV6kd
 wYGU9ruoOptPbMNW+ICUNjAEyl0AWevMOHPaWbaFuZwtRHslLnzhc5f5npiTcTNxULnw
 lP05pGPiK/b/k4S5FyN/AZMyPzVN8jD6Gw7mwhpBy+7Y1d8Bg6nNQmsKXJJYxhMb3ZqB
 HYcw==
X-Gm-Message-State: AOAM532j53iNZK/up5lHT35jxaS6xSdABbfOtO6w3pl9CjX7wZu+x9I0
 EmyU5VZGf7eB2a9k/4lj0ckdTisS0so=
X-Google-Smtp-Source: ABdhPJzq+03dVq7n57GTqJr/02wLAwteRD9ldCzlkruB3QFYKg/6JEVBY5yALz3jWtccOM79e4bZiQ==
X-Received: by 2002:aca:dac3:: with SMTP id r186mr6889960oig.163.1642954158198; 
 Sun, 23 Jan 2022 08:09:18 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id f2sm4282763oiw.50.2022.01.23.08.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 08:09:17 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 13:08:43 -0300
Message-Id: <20220123160847.2653086-1-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/4] utils/checkpackagelib: add unit tests
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

So anyone willing to contribute to check-package can run all tests in
less than 1 second by using:
$ python3 -m pytest -v utils/checkpackagelib/

Most test cases are in the form:
@pytest.mark.parametrize('testname,filename,string,expected', function)
 - testname: a short description of the scenario tested, added in order
   to improve readability of the log when some tests fail
 - filename: the filename the check-package function being tested thinks
   it is testing
 - string: the content of the file being sent to the function under test
 - expected: all expected warnings that a given function from
   check-package should generate for a given file named filename and
   with string as its content.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@gmail.com>
---
Changes v1 -> v2:
  - fix small typo in the commit log expect -> expected
  - do not test 'none' type for hash (after
    "5da8218184 support/download: drop support for the 'none' hash");
  - use the new spacing convention by default in this testsuite
    (suggested by Romain Naour)
    After seeing how the patch was applied at "f35a4b4ae2
    utils/check-package: add a check for the new spacing convention",
    moving it to a new function, it seems more logical to me to keep the
    test for HashType as-is on v1, and create a new test for HashSpaces.
    If you or others disagree, I can rework, no problem. It could also
    be reworked when applying, since now the only change needed is to
    remove some test cases from the table.

Sample run in the GitLab CI:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/2004909364

Example of a failure, showing enough information to track down the test
that fails (copied from v1, there is no such failure in the master
branch):
|testname = 'immediate assignment inside conditional and unconditional override outside'
|filename = 'any.mk'
|string = 'VAR_1 = VALUE1\nifeq (condition)\nVAR_1 := $(VAR_1), VALUE2\nendif\nVAR_1 := $(VAR_1), VALUE2\n'
|expected = [['any.mk:3: immediate assignment to append to variable VAR_1', 'VAR_1 := $(VAR_1), VALUE2\n'], ['any.mk:5: unconditional override of variable VAR_1', 'VAR_1 := $(VAR_1), VALUE2\n']]
|
|    @pytest.mark.parametrize('testname,filename,string,expected', overridden_variable)
|    def test_overridden_variable(testname, filename, string, expected):
|        warnings = util.check_file(m.OverriddenVariable, filename, string)
|>       assert warnings == expected
|E       AssertionError: assert [['any.mk:3: ...), VALUE2\n']] == [['any.mk:3: i...), VALUE2\n']]
|E         At index 0 diff: ['any.mk:3: conditional override of variable VAR_1', 'VAR_1 := $(VAR_1), VALUE2\n'] != ['any.mk:3: immediate assignment to append to variable VAR_1', 'VAR_1 := $(VAR_1), VALUE2\n']
|E         Full diff:
|E         - [['any.mk:3: conditional override of variable VAR_1',
|E         + [['any.mk:3: immediate assignment to append to variable VAR_1',
|E         'VAR_1 := $(VAR_1), VALUE2\n'],
|E         ['any.mk:5: unconditional override of variable VAR_1',
|E         'VAR_1 := $(VAR_1), VALUE2\n']]
|
|utils/checkpackagelib/test_lib_mk.py:168: AssertionError
|===================== 2 failed, 180 passed in 0.79 seconds =====================
---
 utils/checkpackagelib/test_lib.py        | 212 ++++++++
 utils/checkpackagelib/test_lib_config.py | 387 +++++++++++++++
 utils/checkpackagelib/test_lib_hash.py   | 183 +++++++
 utils/checkpackagelib/test_lib_mk.py     | 590 +++++++++++++++++++++++
 utils/checkpackagelib/test_lib_patch.py  |  96 ++++
 utils/checkpackagelib/test_util.py       |   8 +
 6 files changed, 1476 insertions(+)
 create mode 100644 utils/checkpackagelib/test_lib.py
 create mode 100644 utils/checkpackagelib/test_lib_config.py
 create mode 100644 utils/checkpackagelib/test_lib_hash.py
 create mode 100644 utils/checkpackagelib/test_lib_mk.py
 create mode 100644 utils/checkpackagelib/test_lib_patch.py
 create mode 100644 utils/checkpackagelib/test_util.py

diff --git a/utils/checkpackagelib/test_lib.py b/utils/checkpackagelib/test_lib.py
new file mode 100644
index 0000000000..976a63d84d
--- /dev/null
+++ b/utils/checkpackagelib/test_lib.py
@@ -0,0 +1,212 @@
+import pytest
+import checkpackagelib.test_util as util
+import checkpackagelib.lib as m
+
+
+ConsecutiveEmptyLines = [
+    ('1 line (no newline)',
+     'any',
+     '',
+     []),
+    ('1 line',
+     'any',
+     '\n',
+     []),
+    ('2 lines',
+     'any',
+     '\n'
+     '\n',
+     [['any:2: consecutive empty lines']]),
+    ('more than 2 consecutive',
+     'any',
+     '\n'
+     '\n'
+     '\n',
+     [['any:2: consecutive empty lines'],
+      ['any:3: consecutive empty lines']]),
+    ('ignore whitespace 1',
+     'any',
+     '\n'
+     ' ',
+     [['any:2: consecutive empty lines']]),
+    ('ignore whitespace 2',
+     'any',
+     ' \n'
+     '\t\n',
+     [['any:2: consecutive empty lines']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', ConsecutiveEmptyLines)
+def test_ConsecutiveEmptyLines(testname, filename, string, expected):
+    warnings = util.check_file(m.ConsecutiveEmptyLines, filename, string)
+    assert warnings == expected
+
+
+EmptyLastLine = [
+    ('ignore empty file',
+     'any',
+     '',
+     []),
+    ('empty line (newline)',
+     'any',
+     '\n',
+     [['any:1: empty line at end of file']]),
+    ('empty line (space, newline)',
+     'any',
+     ' \n',
+     [['any:1: empty line at end of file']]),
+    ('empty line (space, no newline)',
+     'any',
+     ' ',
+     [['any:1: empty line at end of file']]),
+    ('warn for the last of 2',
+     'any',
+     '\n'
+     '\n',
+     [['any:2: empty line at end of file']]),
+    ('warn for the last of 3',
+     'any',
+     '\n'
+     '\n'
+     '\n',
+     [['any:3: empty line at end of file']]),
+    ('ignore whitespace',
+     'any',
+     ' \n'
+     '\t\n',
+     [['any:2: empty line at end of file']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', EmptyLastLine)
+def test_EmptyLastLine(testname, filename, string, expected):
+    warnings = util.check_file(m.EmptyLastLine, filename, string)
+    assert warnings == expected
+
+
+NewlineAtEof = [
+    ('good',
+     'any',
+     'text\n',
+     []),
+    ('text (bad)',
+     'any',
+     '\n'
+     'text',
+     [['any:2: missing newline at end of file',
+       'text']]),
+    ('space (bad)',
+     'any',
+     '\n'
+     ' ',
+     [['any:2: missing newline at end of file',
+       ' ']]),
+    ('tab (bad)',
+     'any',
+     '\n'
+     '\t',
+     [['any:2: missing newline at end of file',
+       '\t']]),
+    ('even for file with one line',
+     'any',
+     ' ',
+     [['any:1: missing newline at end of file',
+       ' ']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', NewlineAtEof)
+def test_NewlineAtEof(testname, filename, string, expected):
+    warnings = util.check_file(m.NewlineAtEof, filename, string)
+    assert warnings == expected
+
+
+TrailingSpace = [
+    ('good',
+     'any',
+     'text\n',
+     []),
+    ('ignore missing newline',
+     'any',
+     '\n'
+     'text',
+     []),
+    ('spaces',
+     'any',
+     'text  \n',
+     [['any:1: line contains trailing whitespace',
+       'text  \n']]),
+    ('tabs after text',
+     'any',
+     'text\t\t\n',
+     [['any:1: line contains trailing whitespace',
+       'text\t\t\n']]),
+    ('mix of tabs and spaces',
+     'any',
+     ' \n'
+     ' ',
+     [['any:1: line contains trailing whitespace',
+       ' \n'],
+      ['any:2: line contains trailing whitespace',
+       ' ']]),
+    ('blank line with tabs',
+     'any',
+     '\n'
+     '\t',
+     [['any:2: line contains trailing whitespace',
+       '\t']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', TrailingSpace)
+def test_TrailingSpace(testname, filename, string, expected):
+    warnings = util.check_file(m.TrailingSpace, filename, string)
+    assert warnings == expected
+
+
+Utf8Characters = [
+    ('usual',
+     'any',
+     'text\n',
+     []),
+    ('acceptable character',
+     'any',
+     '\x60',
+     []),
+    ('unacceptable character',
+     'any',
+     '\x81',
+     [['any:1: line contains UTF-8 characters',
+       '\x81']]),
+    ('2 warnings',
+     'any',
+     'text\n'
+     'text \xc8 text\n'
+     '\xc9\n',
+     [['any:2: line contains UTF-8 characters',
+       'text \xc8 text\n'],
+      ['any:3: line contains UTF-8 characters',
+       '\xc9\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Utf8Characters)
+def test_Utf8Characters(testname, filename, string, expected):
+    warnings = util.check_file(m.Utf8Characters, filename, string)
+    assert warnings == expected
+
+
+def test_all_check_functions_are_used():
+    import inspect
+    import checkpackagelib.lib_config as lib_config
+    import checkpackagelib.lib_hash as lib_hash
+    import checkpackagelib.lib_mk as lib_mk
+    import checkpackagelib.lib_patch as lib_patch
+    c_config = [c[0] for c in inspect.getmembers(lib_config, inspect.isclass)]
+    c_hash = [c[0] for c in inspect.getmembers(lib_hash, inspect.isclass)]
+    c_mk = [c[0] for c in inspect.getmembers(lib_mk, inspect.isclass)]
+    c_patch = [c[0] for c in inspect.getmembers(lib_patch, inspect.isclass)]
+    c_all = c_config + c_hash + c_mk + c_patch
+    c_common = [c[0] for c in inspect.getmembers(m, inspect.isclass)]
+    assert set(c_common) <= set(c_all)
diff --git a/utils/checkpackagelib/test_lib_config.py b/utils/checkpackagelib/test_lib_config.py
new file mode 100644
index 0000000000..91a549adf2
--- /dev/null
+++ b/utils/checkpackagelib/test_lib_config.py
@@ -0,0 +1,387 @@
+import pytest
+import checkpackagelib.test_util as util
+import checkpackagelib.lib_config as m
+
+
+AttributesOrder = [
+    ('good example',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'default y\n'
+     'depends on BR2_USE_BAR # runtime\n'
+     'select BR2_PACKAGE_BAZ\n'
+     'help\n'
+     '\t  help text\n',
+     []),
+    ('depends before default',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'depends on BR2_USE_BAR\n'
+     'default y\n',
+     [['any:4: attributes order: type, default, depends on, select, help (url#_config_files)',
+       'default y\n']]),
+    ('select after help',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'help\n'
+     '\t  help text\n'
+     'select BR2_PACKAGE_BAZ\n',
+     [['any:5: attributes order: type, default, depends on, select, help (url#_config_files)',
+       'select BR2_PACKAGE_BAZ\n']]),
+    ('string',
+     'any',
+     'config BR2_PACKAGE_FOO_PLUGINS\n'
+     'string "foo plugins"\n'
+     'default "all"\n',
+     []),
+    ('ignore tabs',
+     'any',
+     'config\tBR2_PACKAGE_FOO_PLUGINS\n'
+     'default\t"all"\n'
+     'string\t"foo plugins"\n',
+     [['any:3: attributes order: type, default, depends on, select, help (url#_config_files)',
+       'string\t"foo plugins"\n']]),
+    ('choice',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'if BR2_PACKAGE_FOO\n'
+     '\n'
+     'choice\n'
+     'prompt "type of foo"\n'
+     'default BR2_PACKAGE_FOO_STRING\n'
+     '\n'
+     'config BR2_PACKAGE_FOO_NONE\n'
+     'bool "none"\n'
+     '\n'
+     'config BR2_PACKAGE_FOO_STRING\n'
+     'bool "string"\n'
+     '\n'
+     'endchoice\n'
+     '\n'
+     'endif\n'
+     '\n',
+     []),
+    ('type after default',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'if BR2_PACKAGE_FOO\n'
+     '\n'
+     'choice\n'
+     'default BR2_PACKAGE_FOO_STRING\n'
+     'prompt "type of foo"\n',
+     [['any:7: attributes order: type, default, depends on, select, help (url#_config_files)',
+       'prompt "type of foo"\n']]),
+    ('menu',
+     'any',
+     'menuconfig BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'help\n'
+     '\t  help text\n'
+     '\t  help text\n'
+     '\n'
+     'if BR2_PACKAGE_FOO\n'
+     '\n'
+     'menu "foo plugins"\n'
+     'config BR2_PACKAGE_FOO_COUNTER\n'
+     'bool "counter"\n'
+     '\n'
+     'endmenu\n'
+     '\n'
+     'endif\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', AttributesOrder)
+def test_AttributesOrder(testname, filename, string, expected):
+    warnings = util.check_file(m.AttributesOrder, filename, string)
+    assert warnings == expected
+
+
+CommentsMenusPackagesOrder = [
+    ('top menu (good)',
+     'package/Config.in',
+     'menu "Target packages"\n'
+     'source "package/busybox/Config.in"\n'
+     'source "package/skeleton/Config.in"\n',
+     []),
+    ('top menu (bad)',
+     'package/Config.in',
+     'source "package/skeleton/Config.in"\n'
+     'source "package/busybox/Config.in"\n',
+     [['package/Config.in:2: Packages in: The top level menu,\n'
+       '                     are not alphabetically ordered;\n'
+       "                     correct order: '-', '_', digits, capitals, lowercase;\n"
+       '                     first incorrect package: busybox',
+       'source "package/busybox/Config.in"\n']]),
+    ('menu (bad)',
+     'package/Config.in',
+     'menu "Target packages"\n'
+     'source "package/skeleton/Config.in"\n'
+     'source "package/busybox/Config.in"\n',
+     [['package/Config.in:3: Packages in: menu "Target packages",\n'
+       '                     are not alphabetically ordered;\n'
+       "                     correct order: '-', '_', digits, capitals, lowercase;\n"
+       '                     first incorrect package: busybox',
+       'source "package/busybox/Config.in"\n']]),
+    ('underscore (good)',
+     'package/Config.in.host',
+     'menu "Hardware handling"\n'
+     'menu "Firmware"\n'
+     'endmenu\n'
+     'source "package/usb_modeswitch/Config.in"\n'
+     'source "package/usbmount/Config.in"\n',
+     []),
+    ('underscore (bad)',
+     'package/Config.in.host',
+     'menu "Hardware handling"\n'
+     'menu "Firmware"\n'
+     'endmenu\n'
+     'source "package/usbmount/Config.in"\n'
+     'source "package/usb_modeswitch/Config.in"\n',
+     [['package/Config.in.host:5: Packages in: menu "Hardware handling",\n'
+       '                          are not alphabetically ordered;\n'
+       "                          correct order: '-', '_', digits, capitals, lowercase;\n"
+       '                          first incorrect package: usb_modeswitch',
+       'source "package/usb_modeswitch/Config.in"\n']]),
+    ('ignore other files',
+     'any other file',
+     'menu "Hardware handling"\n'
+     'source "package/bbb/Config.in"\n'
+     'source "package/aaa/Config.in"\n',
+     []),
+    ('dash (bad)',
+     'package/Config.in',
+     'menu "packages"\n'
+     'source "package/a_a/Config.in"\n'
+     'source "package/a-a/Config.in"\n'
+     'source "package/a1a/Config.in"\n'
+     'source "package/aAa/Config.in"\n'
+     'source "package/aaa/Config.in"\n',
+     [['package/Config.in:3: Packages in: menu "packages",\n'
+       '                     are not alphabetically ordered;\n'
+       "                     correct order: '-', '_', digits, capitals, lowercase;\n"
+       '                     first incorrect package: a-a',
+       'source "package/a-a/Config.in"\n']]),
+    ('underscore (bad)',
+     'package/Config.in',
+     'menu "packages"\n'
+     'source "package/a-a/Config.in"\n'
+     'source "package/a1a/Config.in"\n'
+     'source "package/a_a/Config.in"\n'
+     'source "package/aAa/Config.in"\n'
+     'source "package/aaa/Config.in"\n',
+     [['package/Config.in:4: Packages in: menu "packages",\n'
+       '                     are not alphabetically ordered;\n'
+       "                     correct order: '-', '_', digits, capitals, lowercase;\n"
+       '                     first incorrect package: a_a',
+       'source "package/a_a/Config.in"\n']]),
+    ('digit (bad)',
+     'package/Config.in',
+     'menu "packages"\n'
+     'source "package/a-a/Config.in"\n'
+     'source "package/a_a/Config.in"\n'
+     'source "package/aAa/Config.in"\n'
+     'source "package/a1a/Config.in"\n'
+     'source "package/aaa/Config.in"\n',
+     [['package/Config.in:5: Packages in: menu "packages",\n'
+       '                     are not alphabetically ordered;\n'
+       "                     correct order: '-', '_', digits, capitals, lowercase;\n"
+       '                     first incorrect package: a1a',
+       'source "package/a1a/Config.in"\n']]),
+    ('capitals (bad)',
+     'package/Config.in',
+     'menu "packages"\n'
+     'source "package/a-a/Config.in"\n'
+     'source "package/a_a/Config.in"\n'
+     'source "package/a1a/Config.in"\n'
+     'source "package/aaa/Config.in"\n'
+     'source "package/aAa/Config.in"\n',
+     [['package/Config.in:6: Packages in: menu "packages",\n'
+       '                     are not alphabetically ordered;\n'
+       "                     correct order: '-', '_', digits, capitals, lowercase;\n"
+       '                     first incorrect package: aAa',
+       'source "package/aAa/Config.in"\n']]),
+    ('digits, capitals, underscore (good)',
+     'package/Config.in',
+     'menu "packages"\n'
+     'source "package/a-a/Config.in"\n'
+     'source "package/a_a/Config.in"\n'
+     'source "package/a1a/Config.in"\n'
+     'source "package/aAa/Config.in"\n'
+     'source "package/aaa/Config.in"\n',
+     []),
+    ('conditional menu (good)',
+     'package/Config.in',
+     'menu "Other"\n'
+     'source "package/linux-pam/Config.in"\n'
+     'if BR2_PACKAGE_LINUX_PAM\n'
+     'comment "linux-pam plugins"\n'
+     'source "package/libpam-radius-auth/Config.in"\n'
+     'source "package/libpam-tacplus/Config.in"\n'
+     'endif\n'
+     'source "package/liquid-dsp/Config.in"\n',
+     []),
+    ('conditional menu (bad)',
+     'package/Config.in',
+     'menu "Other"\n'
+     'source "package/linux-pam/Config.in"\n'
+     'if BR2_PACKAGE_LINUX_PAM\n'
+     'comment "linux-pam plugins"\n'
+     'source "package/libpam-tacplus/Config.in"\n'
+     'source "package/libpam-radius-auth/Config.in"\n'
+     'endif\n'
+     'source "package/liquid-dsp/Config.in"\n',
+     [['package/Config.in:6: Packages in: comment "linux-pam plugins",\n'
+       '                     are not alphabetically ordered;\n'
+       "                     correct order: '-', '_', digits, capitals, lowercase;\n"
+       '                     first incorrect package: libpam-radius-auth',
+       'source "package/libpam-radius-auth/Config.in"\n']]),
+    ('no conditional (bad)',
+     'package/Config.in',
+     'menu "Other"\n'
+     'source "package/linux-pam/Config.in"\n'
+     'source "package/libpam-radius-auth/Config.in"\n'
+     'source "package/libpam-tacplus/Config.in"\n'
+     'source "package/liquid-dsp/Config.in"\n',
+     [['package/Config.in:3: Packages in: menu "Other",\n'
+       '                     are not alphabetically ordered;\n'
+       "                     correct order: '-', '_', digits, capitals, lowercase;\n"
+       '                     first incorrect package: libpam-radius-auth',
+       'source "package/libpam-radius-auth/Config.in"\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', CommentsMenusPackagesOrder)
+def test_CommentsMenusPackagesOrder(testname, filename, string, expected):
+    warnings = util.check_file(m.CommentsMenusPackagesOrder, filename, string)
+    assert warnings == expected
+
+
+HelpText = [
+    ('single line',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'bool "foo"\n'
+     'default y\n'
+     'depends on BR2_USE_BAR # runtime\n'
+     'select BR2_PACKAGE_BAZ\n'
+     'help\n'
+     '\t  help text\n',
+     []),
+    ('larger than 72',
+     'any',
+     'help\n'
+     '\t  123456789 123456789 123456789 123456789 123456789 123456789 12\n'
+     '\t  123456789 123456789 123456789 123456789 123456789 123456789 123\n'
+     '\t  help text\n',
+     [['any:3: help text: <tab><2 spaces><62 chars> (url#writing-rules-config-in)',
+       '\t  123456789 123456789 123456789 123456789 123456789 123456789 123\n',
+       '\t  123456789 123456789 123456789 123456789 123456789 123456789 12']]),
+    ('long url at beginning of line',
+     'any',
+     'help\n'
+     '\t  123456789 123456789 123456789 123456789 123456789 123456789 12\n'
+     '\t  http://url.that.is.longer.than.seventy.two.characthers/folder_name\n'
+     '\t  https://url.that.is.longer.than.seventy.two.characthers/folder_name\n'
+     '\t  git://url.that.is.longer.than.seventy.two.characthers/folder_name\n',
+     []),
+    ('long url not at beginning of line',
+     'any',
+     'help\n'
+     '\t  123456789 123456789 123456789 123456789 123456789 123456789 12\n'
+     '\t  refer to http://url.that.is.longer.than.seventy.two.characthers/folder_name\n'
+     '\n'
+     '\t  http://url.that.is.longer.than.seventy.two.characthers/folder_name\n',
+     [['any:3: help text: <tab><2 spaces><62 chars> (url#writing-rules-config-in)',
+       '\t  refer to http://url.that.is.longer.than.seventy.two.characthers/folder_name\n',
+       '\t  123456789 123456789 123456789 123456789 123456789 123456789 12']]),
+    ('allow beautified items',
+     'any',
+     'help\n'
+     '\t  123456789 123456789 123456789 123456789 123456789 123456789 12\n'
+     '\t  summary:\n'
+     '\t    - enable that config\n'
+     '\t    - built it\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', HelpText)
+def test_HelpText(testname, filename, string, expected):
+    warnings = util.check_file(m.HelpText, filename, string)
+    assert warnings == expected
+
+
+Indent = [
+    ('good example',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\tbool "foo"\n'
+     '\tdefault y\n'
+     '\tdepends on BR2_TOOLCHAIN_HAS_THREADS\n'
+     '\tdepends on BR2_INSTALL_LIBSTDCPP\n'
+     '# very useful comment\n'
+     '\tselect BR2_PACKAGE_BAZ\n'
+     '\thelp\n'
+     '\t  help text\n'
+     '\n'
+     'comment "foo needs toolchain w/ C++, threads"\n'
+     '\tdepends on !BR2_INSTALL_LIBSTDCPP || \\\n'
+     '\t\t!BR2_TOOLCHAIN_HAS_THREADS\n'
+     '\n'
+     'source "package/foo/bar/Config.in"\n',
+     []),
+    ('spaces',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '        bool "foo"\n',
+     [['any:2: should be indented with one tab (url#_config_files)',
+       '        bool "foo"\n']]),
+    ('without indent',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     'default y\n',
+     [['any:2: should be indented with one tab (url#_config_files)',
+       'default y\n']]),
+    ('too much tabs',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '\t\tdepends on BR2_TOOLCHAIN_HAS_THREADS\n',
+     [['any:2: should be indented with one tab (url#_config_files)',
+       '\t\tdepends on BR2_TOOLCHAIN_HAS_THREADS\n']]),
+    ('help',
+     'any',
+     'config BR2_PACKAGE_FOO\n'
+     '     help\n',
+     [['any:2: should be indented with one tab (url#_config_files)',
+       '     help\n']]),
+    ('continuation line',
+     'any',
+     'comment "foo needs toolchain w/ C++, threads"\n'
+     '\tdepends on !BR2_INSTALL_LIBSTDCPP || \\\n'
+     '                !BR2_TOOLCHAIN_HAS_THREADS\n',
+     [['any:3: continuation line should be indented using tabs',
+       '                !BR2_TOOLCHAIN_HAS_THREADS\n']]),
+    ('comment with tabs',
+     'any',
+     '\tcomment "foo needs toolchain w/ C++, threads"\n',
+     [['any:1: should not be indented',
+       '\tcomment "foo needs toolchain w/ C++, threads"\n']]),
+    ('comment with spaces',
+     'any',
+     '  comment "foo needs toolchain w/ C++, threads"\n',
+     [['any:1: should not be indented',
+       '  comment "foo needs toolchain w/ C++, threads"\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Indent)
+def test_Indent(testname, filename, string, expected):
+    warnings = util.check_file(m.Indent, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/test_lib_hash.py b/utils/checkpackagelib/test_lib_hash.py
new file mode 100644
index 0000000000..fdc6338189
--- /dev/null
+++ b/utils/checkpackagelib/test_lib_hash.py
@@ -0,0 +1,183 @@
+import pytest
+import checkpackagelib.test_util as util
+import checkpackagelib.lib_hash as m
+
+
+HashNumberOfFields = [
+    ('empty file',
+     'any',
+     '',
+     []),
+    ('empty line',
+     'any',
+     '\n',
+     []),
+    ('ignore whitespace',
+     'any',
+     '\t\n',
+     []),
+    ('ignore comments',
+     'any',
+     '# text\n',
+     []),
+    ('1 field',
+     'any',
+     'field1\n',
+     [['any:1: expected three fields (url#adding-packages-hash)',
+       'field1\n']]),
+    ('2 fields',
+     'any',
+     'field1 field2\n',
+     [['any:1: expected three fields (url#adding-packages-hash)',
+       'field1 field2\n']]),
+    ('4 fields',
+     'any',
+     'field1 field2 field3 field4\n',
+     [['any:1: expected three fields (url#adding-packages-hash)',
+       'field1 field2 field3 field4\n']]),
+    ('with 1 space',
+     'any',
+     'field1 field2 field3\n',
+     []),
+    ('many spaces',
+     'any',
+     '   field1   field2   field3\n',
+     []),
+    ('tabs',
+     'any',
+     'field1\tfield2\tfield3\n',
+     []),
+    ('mix of tabs and spaces',
+     'any',
+     '\tfield1\t field2\t field3 \n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', HashNumberOfFields)
+def test_HashNumberOfFields(testname, filename, string, expected):
+    warnings = util.check_file(m.HashNumberOfFields, filename, string)
+    assert warnings == expected
+
+
+HashType = [
+    ('ignore empty files',
+     'any',
+     '',
+     []),
+    ('ignore 1 field',
+     'any',
+     'text\n',
+     []),
+    ('wrong type',
+     'any',
+     'text text\n',
+     [['any:1: unexpected type of hash (url#adding-packages-hash)',
+       'text text\n']]),
+    ('md5 (good)',
+     'any',
+     'md5 12345678901234567890123456789012\n',
+     []),
+    ('md5 (short)',
+     'any',
+     'md5 123456\n',
+     [['any:1: hash size does not match type (url#adding-packages-hash)',
+       'md5 123456\n',
+       'expected 32 hex digits']]),
+    ('ignore space before',
+     'any',
+     ' md5 12345678901234567890123456789012\n',
+     []),
+    ('2 spaces',
+     'any',
+     'md5  12345678901234567890123456789012\n',
+     []),
+    ('ignore tabs',
+     'any',
+     'md5\t12345678901234567890123456789012\n',
+     []),
+    ('common typo',
+     'any',
+     'md5sum 12345678901234567890123456789012\n',
+     [['any:1: unexpected type of hash (url#adding-packages-hash)',
+       'md5sum 12345678901234567890123456789012\n']]),
+    ('md5 (too long)',
+     'any',
+     'md5 123456789012345678901234567890123\n',
+     [['any:1: hash size does not match type (url#adding-packages-hash)',
+       'md5 123456789012345678901234567890123\n',
+       'expected 32 hex digits']]),
+    ('sha1 (good)',
+     'any',
+     'sha1 1234567890123456789012345678901234567890\n',
+     []),
+    ('sha256',
+     'any',
+     'sha256 1234567890123456789012345678901234567890123456789012345678901234\n',
+     []),
+    ('sha384',
+     'any',
+     'sha384 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456\n',
+     []),
+    ('sha512',
+     'any',
+     'sha512 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678'
+     '9012345678\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', HashType)
+def test_HashType(testname, filename, string, expected):
+    warnings = util.check_file(m.HashType, filename, string)
+    assert warnings == expected
+
+
+HashSpaces = [
+    ('ignore empty files',
+     'any',
+     '',
+     []),
+    ('ignore 1 field',
+     'any',
+     'text\n',
+     []),
+    ('ignore comments',
+     'any',
+     '# type  1234567890123456789012345678901234567890  file\n',
+     []),
+    ('ignore trailing space',
+     'any',
+     'type  1234567890123456789012345678901234567890  file\t \n',
+     []),
+    ('2 spaces',
+     'any',
+     'type  1234567890123456789012345678901234567890  file\n',
+     []),
+    ('1 space',
+     'any',
+     'type 1234567890123456789012345678901234567890 file\n',
+     [['any:1: separation does not match expectation (url#adding-packages-hash)',
+       'type 1234567890123456789012345678901234567890 file\n']]),
+    ('3 spaces',
+     'any',
+     'type   1234567890123456789012345678901234567890   file\n',
+     [['any:1: separation does not match expectation (url#adding-packages-hash)',
+       'type   1234567890123456789012345678901234567890   file\n']]),
+    ('tabs',
+     'any',
+     'type\t1234567890123456789012345678901234567890\tfile\n',
+     [['any:1: separation does not match expectation (url#adding-packages-hash)',
+       'type\t1234567890123456789012345678901234567890\tfile\n']]),
+    ('mixed tabs and spaces',
+     'any',
+     'type\t 1234567890123456789012345678901234567890 \tfile\n',
+     [['any:1: separation does not match expectation (url#adding-packages-hash)',
+       'type\t 1234567890123456789012345678901234567890 \tfile\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', HashSpaces)
+def test_HashSpaces(testname, filename, string, expected):
+    warnings = util.check_file(m.HashSpaces, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
new file mode 100644
index 0000000000..49fa216fcd
--- /dev/null
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -0,0 +1,590 @@
+import pytest
+import checkpackagelib.test_util as util
+import checkpackagelib.lib_mk as m
+
+
+Indent = [
+    ('ignore comment at beginning of line',
+     'any',
+     '# very useful comment\n',
+     []),
+    ('ignore comment at end of line',
+     'any',
+     ' # very useful comment\n',
+     []),
+    ('do not indent on conditional (good)',
+     'any',
+     'ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)\n'
+     'FOO_CONF_OPTS += something\n'
+     'endef\n',
+     []),
+    ('do not indent on conditional (bad)',
+     'any',
+     'ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)\n'
+     '\tFOO_CONF_OPTS += something\n'
+     'endef\n',
+     [['any:2: unexpected indent with tabs',
+       '\tFOO_CONF_OPTS += something\n']]),
+    ('indent after line that ends in backslash (good)',
+     'any',
+     'FOO_CONF_OPTS += \\\n'
+     '\tsomething\n',
+     []),
+    ('indent after line that ends in backslash (bad)',
+     'any',
+     'FOO_CONF_OPTS += \\\n'
+     'something\n',
+     [['any:2: expected indent with tabs',
+       'something\n']]),
+    ('indent after 2 lines that ends in backslash (good)',
+     'any',
+     'FOO_CONF_OPTS += \\\n'
+     '\tsomething \\\n'
+     '\tsomething_else\n',
+     []),
+    ('indent after 2 lines that ends in backslash (bad)',
+     'any',
+     'FOO_CONF_OPTS += \\\n'
+     '\tsomething \\\n'
+     '\tsomething_else \\\n'
+     'FOO_CONF_OPTS += another_thing\n',
+     [['any:4: expected indent with tabs',
+       'FOO_CONF_OPTS += another_thing\n']]),
+    ('indent inside define (good)',
+     'any',
+     'define FOO_SOMETHING\n'
+     '\tcommand\n'
+     '\tcommand \\\n'
+     '\t\targuments\n'
+     'endef\n'
+     'FOO_POST_PATCH_HOOKS += FOO_SOMETHING\n',
+     []),
+    ('indent inside define (bad, no indent)',
+     'any',
+     'define FOO_SOMETHING\n'
+     'command\n'
+     'endef\n',
+     [['any:2: expected indent with tabs',
+       'command\n']]),
+    ('indent inside define (bad, spaces)',
+     'any',
+     'define FOO_SOMETHING\n'
+     '        command\n'
+     'endef\n',
+     [['any:2: expected indent with tabs',
+       '        command\n']]),
+    ('indent make target (good)',
+     'any',
+     'make_target:\n'
+     '\tcommand\n'
+     '\n',
+     []),
+    ('indent make target (bad)',
+     'any',
+     'make_target:\n'
+     '        command\n'
+     '\n',
+     [['any:2: expected indent with tabs',
+       '        command\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Indent)
+def test_Indent(testname, filename, string, expected):
+    warnings = util.check_file(m.Indent, filename, string)
+    assert warnings == expected
+
+
+OverriddenVariable = [
+    ('simple assignment',
+     'any.mk',
+     'VAR_1 = VALUE1\n',
+     []),
+    ('unconditional override (variable without underscore)',
+     'any.mk',
+     'VAR1 = VALUE1\n'
+     'VAR1 = VALUE1\n',
+     [['any.mk:2: unconditional override of variable VAR1',
+       'VAR1 = VALUE1\n']]),
+    ('unconditional override (variable with underscore, same value)',
+     'any.mk',
+     'VAR_1 = VALUE1\n'
+     'VAR_1 = VALUE1\n',
+     [['any.mk:2: unconditional override of variable VAR_1',
+       'VAR_1 = VALUE1\n']]),
+    ('unconditional override (variable with underscore, different value)',
+     'any.mk',
+     'VAR_1 = VALUE1\n'
+     'VAR_1 = VALUE2\n',
+     [['any.mk:2: unconditional override of variable VAR_1',
+       'VAR_1 = VALUE2\n']]),
+    ('warn for unconditional override even with wrong number of spaces',
+     'any.mk',
+     'VAR_1= VALUE1\n'
+     'VAR_1 =VALUE2\n',
+     [['any.mk:2: unconditional override of variable VAR_1',
+       'VAR_1 =VALUE2\n']]),
+    ('warn for := override',
+     'any.mk',
+     'VAR_1 = VALUE1\n'
+     'VAR_1 := VALUE2\n',
+     [['any.mk:2: unconditional override of variable VAR_1',
+       'VAR_1 := VALUE2\n']]),
+    ('append values outside conditional (good)',
+     'any.mk',
+     'VAR_1 = VALUE1\n'
+     'VAR_1 += VALUE2\n',
+     []),
+    ('append values outside conditional (bad)',
+     'any.mk',
+     'VAR_1 = VALUE1\n'
+     'VAR_1 := $(VAR_1), VALUE2\n',
+     [['any.mk:2: unconditional override of variable VAR_1',
+       'VAR_1 := $(VAR_1), VALUE2\n']]),
+    ('immediate assignment inside conditional',
+     'any.mk',
+     'VAR_1 = VALUE1\n'
+     'ifeq (condition)\n'
+     'VAR_1 := $(VAR_1), VALUE2\n',
+     [['any.mk:3: immediate assignment to append to variable VAR_1',
+       'VAR_1 := $(VAR_1), VALUE2\n']]),
+    ('immediate assignment inside conditional and unconditional override outside',
+     'any.mk',
+     'VAR_1 = VALUE1\n'
+     'ifeq (condition)\n'
+     'VAR_1 := $(VAR_1), VALUE2\n'
+     'endif\n'
+     'VAR_1 := $(VAR_1), VALUE2\n',
+     [['any.mk:3: immediate assignment to append to variable VAR_1',
+       'VAR_1 := $(VAR_1), VALUE2\n'],
+      ['any.mk:5: unconditional override of variable VAR_1',
+       'VAR_1 := $(VAR_1), VALUE2\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', OverriddenVariable)
+def test_OverriddenVariable(testname, filename, string, expected):
+    warnings = util.check_file(m.OverriddenVariable, filename, string)
+    assert warnings == expected
+
+
+PackageHeader = [
+    ('first line (good)',
+     'any',
+     80 * '#' + '\n',
+     []),
+    ('first line (bad)',
+     'any',
+     '# very useful comment\n',
+     [['any:1: should be 80 hashes (url#writing-rules-mk)',
+       '# very useful comment\n',
+       80 * '#']]),
+    ('second line (bad)',
+     'any',
+     80 * '#' + '\n'
+     '# package\n',
+     [['any:2: should be 1 hash (url#writing-rules-mk)',
+       '# package\n']]),
+    ('full header (good)',
+     'any',
+     80 * '#' + '\n'
+     '#\n'
+     '# package\n'
+     '#\n' +
+     80 * '#' + '\n'
+     '\n',
+     []),
+    ('blank line after header (good)',
+     'any',
+     80 * '#' + '\n'
+     '#\n'
+     '# package\n'
+     '#\n' +
+     80 * '#' + '\n'
+     '\n'
+     'FOO_VERSION = 1\n',
+     []),
+    ('blank line after header (bad)',
+     'any',
+     80 * '#' + '\n'
+     '#\n'
+     '# package\n'
+     '#\n' +
+     80 * '#' + '\n'
+     'FOO_VERSION = 1\n',
+     [['any:6: should be a blank line (url#writing-rules-mk)',
+       'FOO_VERSION = 1\n']]),
+    ('wrong number of hashes',
+     'any',
+     79 * '#' + '\n'
+     '#\n'
+     '# package\n'
+     '#\n' +
+     81 * '#' + '\n'
+     '\n',
+     [['any:1: should be 80 hashes (url#writing-rules-mk)',
+       79 * '#' + '\n',
+       80 * '#'],
+      ['any:5: should be 80 hashes (url#writing-rules-mk)',
+       81 * '#' + '\n',
+       80 * '#']]),
+    ('allow include without header',
+     'any',
+     'include $(sort $(wildcard package/foo/*/*.mk))\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', PackageHeader)
+def test_PackageHeader(testname, filename, string, expected):
+    warnings = util.check_file(m.PackageHeader, filename, string)
+    assert warnings == expected
+
+
+RemoveDefaultPackageSourceVariable = [
+    ('bad',
+     'any.mk',
+     'ANY_SOURCE = any-$(ANY_VERSION).tar.gz\n',
+     [['any.mk:1: remove default value of _SOURCE variable (url#generic-package-reference)',
+       'ANY_SOURCE = any-$(ANY_VERSION).tar.gz\n']]),
+    ('bad with path',
+     './any.mk',
+     'ANY_SOURCE = any-$(ANY_VERSION).tar.gz\n',
+     [['./any.mk:1: remove default value of _SOURCE variable (url#generic-package-reference)',
+       'ANY_SOURCE = any-$(ANY_VERSION).tar.gz\n']]),
+    ('warn for correct line',
+     './any.mk',
+     '\n'
+     '\n'
+     '\n'
+     'ANY_SOURCE = any-$(ANY_VERSION).tar.gz\n',
+     [['./any.mk:4: remove default value of _SOURCE variable (url#generic-package-reference)',
+       'ANY_SOURCE = any-$(ANY_VERSION).tar.gz\n']]),
+    ('warn ignoring missing spaces',
+     './any.mk',
+     'ANY_SOURCE=any-$(ANY_VERSION).tar.gz\n',
+     [['./any.mk:1: remove default value of _SOURCE variable (url#generic-package-reference)',
+       'ANY_SOURCE=any-$(ANY_VERSION).tar.gz\n']]),
+    ('good',
+     './any.mk',
+     'ANY_SOURCE = aNy-$(ANY_VERSION).tar.gz\n',
+     []),
+    ('gcc exception',
+     'gcc.mk',
+     'GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz\n',
+     []),
+    ('binutils exception',
+     './binutils.mk',
+     'BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz\n',
+     []),
+    ('gdb exception',
+     'gdb/gdb.mk',
+     'GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz\n',
+     []),
+    ('package name with dash',
+     'python-subprocess32.mk',
+     'PYTHON_SUBPROCESS32_SOURCE = python-subprocess32-$(PYTHON_SUBPROCESS32_VERSION).tar.gz\n',
+     [['python-subprocess32.mk:1: remove default value of _SOURCE variable (url#generic-package-reference)',
+       'PYTHON_SUBPROCESS32_SOURCE = python-subprocess32-$(PYTHON_SUBPROCESS32_VERSION).tar.gz\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', RemoveDefaultPackageSourceVariable)
+def test_RemoveDefaultPackageSourceVariable(testname, filename, string, expected):
+    warnings = util.check_file(m.RemoveDefaultPackageSourceVariable, filename, string)
+    assert warnings == expected
+
+
+SpaceBeforeBackslash = [
+    ('no backslash',
+     'any.mk',
+     '\n',
+     []),
+    ('ignore missing indent',
+     'any.mk',
+     'define ANY_SOME_FIXUP\n'
+     'for i in $$(find $(STAGING_DIR)/usr/lib* -name "any*.la"); do \\\n',
+     []),
+    ('ignore missing space',
+     'any.mk',
+     'ANY_CONF_ENV= \\\n'
+     '\tap_cv_void_ptr_lt_long=no \\\n',
+     []),
+    ('variable',
+     'any.mk',
+     '\n'
+     'ANY = \\\n',
+     []),
+    ('2 spaces',
+     'any.mk',
+     'ANY =  \\\n',
+     [['any.mk:1: use only one space before backslash',
+       'ANY =  \\\n']]),
+    ('warn about correct line',
+     'any.mk',
+     '\n'
+     'ANY =  \\\n',
+     [['any.mk:2: use only one space before backslash',
+       'ANY =  \\\n']]),
+    ('tab',
+     'any.mk',
+     'ANY =\t\\\n',
+     [['any.mk:1: use only one space before backslash',
+       'ANY =\t\\\n']]),
+    ('tabs',
+     'any.mk',
+     'ANY =\t\t\\\n',
+     [['any.mk:1: use only one space before backslash',
+       'ANY =\t\t\\\n']]),
+    ('spaces and tabs',
+     'any.mk',
+     'ANY =  \t\t\\\n',
+     [['any.mk:1: use only one space before backslash',
+       'ANY =  \t\t\\\n']]),
+    ('mixed spaces and tabs 1',
+     'any.mk',
+     'ANY = \t \t\\\n',
+     [['any.mk:1: use only one space before backslash',
+       'ANY = \t \t\\\n']]),
+    ('mixed spaces and tabs 2',
+     'any.mk',
+     'ANY = \t  \\\n',
+     [['any.mk:1: use only one space before backslash',
+       'ANY = \t  \\\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', SpaceBeforeBackslash)
+def test_SpaceBeforeBackslash(testname, filename, string, expected):
+    warnings = util.check_file(m.SpaceBeforeBackslash, filename, string)
+    assert warnings == expected
+
+
+TrailingBackslash = [
+    ('no backslash',
+     'any.mk',
+     'ANY = \n',
+     []),
+    ('one line',
+     'any.mk',
+     'ANY = \\\n',
+     []),
+    ('2 lines',
+     'any.mk',
+     'ANY = \\\n'
+     '\\\n',
+     []),
+    ('empty line after',
+     'any.mk',
+     'ANY = \\\n'
+     '\n',
+     [['any.mk:1: remove trailing backslash',
+       'ANY = \\\n']]),
+    ('line with spaces after',
+     'any.mk',
+     'ANY = \\\n'
+     '     \n',
+     [['any.mk:1: remove trailing backslash',
+       'ANY = \\\n']]),
+    ('line with tabs after',
+     'any.mk',
+     'ANY = \\\n'
+     '\t\n',
+     [['any.mk:1: remove trailing backslash',
+       'ANY = \\\n']]),
+    ('ignore if commented',
+     'any.mk',
+     '# ANY = \\\n'
+     '\n',
+     []),
+    ('real example',
+     'any.mk',
+     'ANY_CONF_ENV= \t\\\n'
+     '\tap_cv_void_ptr_lt_long=no  \\\n'
+     '\n',
+     [['any.mk:2: remove trailing backslash',
+       '\tap_cv_void_ptr_lt_long=no  \\\n']]),
+    ('ignore whitespace 1',
+     'any.mk',
+     'ANY =  \t\t\\\n',
+     []),
+    ('ignore whitespace 2',
+     'any.mk',
+     'ANY = \t \t\\\n',
+     []),
+    ('ignore whitespace 3',
+     'any.mk',
+     'ANY = \t  \\\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', TrailingBackslash)
+def test_TrailingBackslash(testname, filename, string, expected):
+    warnings = util.check_file(m.TrailingBackslash, filename, string)
+    assert warnings == expected
+
+
+TypoInPackageVariable = [
+    ('good',
+     'any.mk',
+     'ANY_VAR = \n',
+     []),
+    ('good with path 1',
+     './any.mk',
+     'ANY_VAR += \n',
+     []),
+    ('good with path 2',
+     'any/any.mk',
+     'ANY_VAR = \n',
+     []),
+    ('bad =',
+     'any.mk',
+     'OTHER_VAR = \n',
+     [['any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+       'OTHER_VAR = \n']]),
+    ('bad +=',
+     'any.mk',
+     'OTHER_VAR += \n',
+     [['any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+       'OTHER_VAR += \n']]),
+    ('ignore missing space',
+     'any.mk',
+     'OTHER_VAR= \n',
+     [['any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+       'OTHER_VAR= \n']]),
+    ('use path in the warning',
+     './any.mk',
+     'OTHER_VAR = \n',
+     [['./any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+       'OTHER_VAR = \n']]),
+    ('another name',
+     'other.mk',
+     'ANY_VAR = \n',
+     [['other.mk:1: possible typo: ANY_VAR -> *OTHER*',
+       'ANY_VAR = \n']]),
+    ('libc exception',
+     './any.mk',
+     'BR_LIBC = \n',
+     []),
+    ('rootfs exception',
+     'any.mk',
+     'ROOTFS_ANY_VAR += \n',
+     []),
+    ('host (good)',
+     'any.mk',
+     'HOST_ANY_VAR += \n',
+     []),
+    ('host (bad)',
+     'any.mk',
+     'HOST_OTHER_VAR = \n',
+     [['any.mk:1: possible typo: HOST_OTHER_VAR -> *ANY*',
+       'HOST_OTHER_VAR = \n']]),
+    ('provides',
+     'any.mk',
+     'ANY_PROVIDES = other thing\n'
+     'OTHER_VAR = \n',
+     []),
+    ('ignore space',
+     'any.mk',
+     'ANY_PROVIDES  =  thing  other \n'
+     'OTHER_VAR = \n',
+     []),
+    ('wrong provides',
+     'any.mk',
+     'ANY_PROVIDES = other\n'
+     'OTHERS_VAR = \n',
+     [['any.mk:2: possible typo: OTHERS_VAR -> *ANY*',
+       'OTHERS_VAR = \n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', TypoInPackageVariable)
+def test_TypoInPackageVariable(testname, filename, string, expected):
+    warnings = util.check_file(m.TypoInPackageVariable, filename, string)
+    assert warnings == expected
+
+
+UselessFlag = [
+    ('autoreconf no',
+     'any.mk',
+     'ANY_AUTORECONF=NO\n',
+     [['any.mk:1: useless default value (url#_infrastructure_for_autotools_based_packages)',
+       'ANY_AUTORECONF=NO\n']]),
+    ('host autoreconf no',
+     'any.mk',
+     'HOST_ANY_AUTORECONF\n',
+     []),
+    ('autoreconf yes',
+     'any.mk',
+     'ANY_AUTORECONF=YES\n',
+     []),
+    ('libtool_patch yes',
+     'any.mk',
+     'ANY_LIBTOOL_PATCH\t=  YES\n',
+     [['any.mk:1: useless default value (url#_infrastructure_for_autotools_based_packages)',
+       'ANY_LIBTOOL_PATCH\t=  YES\n']]),
+    ('libtool_patch no',
+     'any.mk',
+     'ANY_LIBTOOL_PATCH= \t NO\n',
+     []),
+    ('generic',
+     'any.mk',
+     'ANY_INSTALL_IMAGES = NO\n'
+     'ANY_INSTALL_REDISTRIBUTE = YES\n'
+     'ANY_INSTALL_STAGING = NO\n'
+     'ANY_INSTALL_TARGET = YES\n',
+     [['any.mk:1: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
+       'ANY_INSTALL_IMAGES = NO\n'],
+      ['any.mk:2: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
+       'ANY_INSTALL_REDISTRIBUTE = YES\n'],
+      ['any.mk:3: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
+       'ANY_INSTALL_STAGING = NO\n'],
+      ['any.mk:4: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
+       'ANY_INSTALL_TARGET = YES\n']]),
+    ('conditional',
+     'any.mk',
+     'ifneq (condition)\n'
+     'ANY_INSTALL_IMAGES = NO\n'
+     'endif\n'
+     'ANY_INSTALL_REDISTRIBUTE = YES\n',
+     [['any.mk:4: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
+       'ANY_INSTALL_REDISTRIBUTE = YES\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', UselessFlag)
+def test_UselessFlag(testname, filename, string, expected):
+    warnings = util.check_file(m.UselessFlag, filename, string)
+    assert warnings == expected
+
+
+VariableWithBraces = [
+    ('good',
+     'xmlstarlet.mk',
+     'XMLSTARLET_CONF_OPTS += \\\n'
+     '\t--with-libxml-prefix=$(STAGING_DIR)/usr \\\n',
+     []),
+    ('bad',
+     'xmlstarlet.mk',
+     'XMLSTARLET_CONF_OPTS += \\\n'
+     '\t--with-libxml-prefix=${STAGING_DIR}/usr \\\n',
+     [['xmlstarlet.mk:2: use $() to delimit variables, not ${}',
+       '\t--with-libxml-prefix=${STAGING_DIR}/usr \\\n']]),
+    ('expanded by the shell',
+     'sg3_utils.mk',
+     '\tfor prog in xcopy zone; do \\\n'
+     '\t\t$(RM) $(TARGET_DIR)/usr/bin/sg_$${prog} ; \\\n'
+     '\tdone\n',
+     []),
+    ('comments',
+     'any.mk',
+     '#\t--with-libxml-prefix=${STAGING_DIR}/usr \\\n',
+     []),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', VariableWithBraces)
+def test_VariableWithBraces(testname, filename, string, expected):
+    warnings = util.check_file(m.VariableWithBraces, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/test_lib_patch.py b/utils/checkpackagelib/test_lib_patch.py
new file mode 100644
index 0000000000..3b6fadf38c
--- /dev/null
+++ b/utils/checkpackagelib/test_lib_patch.py
@@ -0,0 +1,96 @@
+import pytest
+import checkpackagelib.test_util as util
+import checkpackagelib.lib_patch as m
+
+
+ApplyOrder = [
+    ('standard',  # catches https://bugs.busybox.net/show_bug.cgi?id=11271
+     '0001-description.patch',
+     '',
+     []),
+    ('standard with path',
+     'path/0001-description.patch',
+     '',
+     []),
+    ('acceptable format',
+     '1-description.patch',
+     '',
+     []),
+    ('acceptable format with path',
+     'path/1-description.patch',
+     '',
+     []),
+    ('old format',
+     'package-0001-description.patch',
+     '',
+     [['package-0001-description.patch:0: use name <number>-<description>.patch (url#_providing_patches)']]),
+    ('old format with path',
+     'path/package-0001-description.patch',
+     '',
+     [['path/package-0001-description.patch:0: use name <number>-<description>.patch (url#_providing_patches)']]),
+    ('missing number',
+     'description.patch',
+     '',
+     [['description.patch:0: use name <number>-<description>.patch (url#_providing_patches)']]),
+    ('missing number with path',
+     'path/description.patch',
+     '',
+     [['path/description.patch:0: use name <number>-<description>.patch (url#_providing_patches)']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', ApplyOrder)
+def test_ApplyOrder(testname, filename, string, expected):
+    warnings = util.check_file(m.ApplyOrder, filename, string)
+    assert warnings == expected
+
+
+NumberedSubject = [
+    ('no subject',
+     'patch',
+     '',
+     []),
+    ('acceptable because it is not a git patch',
+     'patch',
+     'Subject: [PATCH 24/105] text\n',
+     []),
+    ('good',
+     'patch',
+     'Subject: [PATCH] text\n'
+     'diff --git a/configure.ac b/configure.ac\n',
+     []),
+    ('bad',
+     'patch',
+     'Subject: [PATCH 24/105] text\n'
+     'diff --git a/configure.ac b/configure.ac\n',
+     [["patch:1: generate your patches with 'git format-patch -N'",
+       'Subject: [PATCH 24/105] text\n']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', NumberedSubject)
+def test_NumberedSubject(testname, filename, string, expected):
+    warnings = util.check_file(m.NumberedSubject, filename, string)
+    assert warnings == expected
+
+
+Sob = [
+    ('good',
+     'patch',
+     'Signed-off-by: John Doe <johndoe@example.com>\n',
+     []),
+    ('empty',
+     'patch',
+     '',
+     [['patch:0: missing Signed-off-by in the header (url#_format_and_licensing_of_the_package_patches)']]),
+    ('bad',
+     'patch',
+     'Subject: [PATCH 24/105] text\n',
+     [['patch:0: missing Signed-off-by in the header (url#_format_and_licensing_of_the_package_patches)']]),
+    ]
+
+
+@pytest.mark.parametrize('testname,filename,string,expected', Sob)
+def test_Sob(testname, filename, string, expected):
+    warnings = util.check_file(m.Sob, filename, string)
+    assert warnings == expected
diff --git a/utils/checkpackagelib/test_util.py b/utils/checkpackagelib/test_util.py
new file mode 100644
index 0000000000..23f2995e27
--- /dev/null
+++ b/utils/checkpackagelib/test_util.py
@@ -0,0 +1,8 @@
+def check_file(check_function, filename, string):
+    obj = check_function(filename, 'url')
+    result = []
+    result.append(obj.before())
+    for i, line in enumerate(string.splitlines(True)):
+        result.append(obj.check_line(i + 1, line))
+    result.append(obj.after())
+    return [r for r in result if r is not None]
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
