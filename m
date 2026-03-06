Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD56EFCC076
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 21:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F4F40C47;
	Fri,  6 Mar 2026 21:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msYWVZtANeE1; Fri,  6 Mar 2026 21:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77619417BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772834157;
	bh=8P4+H5ot8aO7ZJN6da0h2YapHgAY0Uw5uUboHF/fd4M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=s7Rp5WbigcYAU4ZxWTYKYz/653o+gMnys9iQJVnbRTHxG6tQTpNp8lQeP/fOav3dm
	 FPsz8OQ3MemW0ZBKV2J39wGb3Yj8yQ07zIByKU2SFAcrrQJ7PzW/y/iNKQfSSDRgmT
	 I+ICEsOyzvRU30ck5NHCWYKywZdye4QSZGRsfvvkuVEruVxrrOeQ+8b8upjsV+jtB+
	 fqR3PMaCDpQjIhLFw4AMD3N+5QoUZpY3qi4Yq1H2v8lkvoYL0sIT1yQ7xvf2B070CO
	 WwC1eU9jbKj3UFunMvyEn4QY9GjRU8TGitDevqDCy2KIdp8cBQmleiaQSH5qWQnu06
	 8oJqJFf6/Pylg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77619417BB;
	Fri,  6 Mar 2026 21:55:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA6A25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 21:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 835C1417BB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 21:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JsAVLEgm0lH for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 21:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D043140C47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D043140C47
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D043140C47
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 21:55:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Msq24-1vetMs3LMu-017Xsy; Fri, 06
 Mar 2026 22:55:42 +0100
To: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 22:55:39 +0100
Message-ID: <20260306215539.510232-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:s2WmHRL+PlJBGL4ecfkXDfuin46bBnFWFstKEzEpM/m4jwSNp/+
 Jaeq138mtZUiaNJQLmhXn8phTI+9QwPYynOxDG7paS00H4b+WileuFnJ1TWZG1TvRi+9mCb
 Zc3SiRNXzoGG9EzU/0VWHXLKbCzBCJsssR3Gd9tpxiIIIUL0BHF1K781HeQs4jwdvzWWuD+
 4eCA0ZfbDTve3n+epwnbA==
UI-OutboundReport: notjunk:1;M01:P0:2NpdzaCd0as=;nvVcindfjohmuKFu0tV8UD/NHBH
 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
 rEZhbLTJ6RX
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772834143; x=1773438943; i=fiona.klute@gmx.de;
 bh=oNRVUoVZbDiyyBfX/ZY1fMBjr78uCtvqcavJa5KJwag=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MEyUHqBRkEL/ial3/IqKxlDeEMH0pruuuw/k3R6eylXL2daI9jjpUmhn8lcB6JUW
 SWVAD7VEuyzg/ZhQCYvSd2zdsNCYP/Tf//9ufhKE02Zg5DGnXqOM7Rf4zRakcXlFs
 Vjd8IDp8VavnabLzm9FwxYDS914HQzpqIu0ojxW5qbU9HlmApqLHjeIaI68ukkpua
 YdXA/k9/KhmgqzHiB64aWYsREZJ65mO+XIyvYu5njRpqw8CFLIf1BDP83hi6r9k88
 vilrocDTQUna1QjrMuxb/JErP3qoH3pHJPuQzIVRNsyJE97Gp+M/ES7IijToeM/LU
 PSLkiMr7swBp+y69Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MEyUHqBR
Subject: [Buildroot] [PATCH v2 1/1] support/testing: transfer config in
 environment instead of class variables
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 Julien Olivain <ju.o@free.fr>, guenther.harrasser@mobileye.com,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Passing runtime configuration to tests in BRConfigTest class variables
requires the "fork" start method for multiprocessing. With
"forkserver" (default for POSIX platforms since Python 3.14) class
variables modified in the parent process are lost, because the child
process does not inherit the full Python state. This broke the way
support/testing/run-tests sets configuration for BRConfigTest, so a
start method override was added in commit
3d2141bceefda32bef06ddda594eaf8665913276.

Instead this patch adds a settings dataclass (requires Python >= 3.7)
which is serialized into an environment variable from run-tests and
read during BRConfigTest.__init__(). Reading is skipped if the
environment variable is not set so test discovery (not execution)
works without configuration (e.g. utils/get-developers uses this).

With that, run-tests no longer relies on a specific multiprocessing
start method.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Restructure to use dataclasses, which simplifies the code but
  requires Python 3.7

 support/testing/infra/basetest.py | 37 ++++++++++++++++++++++++++++++
 support/testing/run-tests         | 38 ++++++++++++-------------------
 2 files changed, 52 insertions(+), 23 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 13f9b2d398..5fa902a77f 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -1,6 +1,9 @@
 import unittest
 import os
+import dataclasses
 import datetime
+import json
+from typing import ClassVar
 
 from infra.builder import Builder
 from infra.emulator import Emulator
@@ -22,6 +25,33 @@ MINIMAL_CONFIG = \
     """
 
 
+@dataclasses.dataclass
+class BRTestSettings:
+    """support/testing/run-tests stores runtime settings in this
+    object, and serializes it into the environment variable named in
+    CONF_ENV. On instantiation, BRConfigTest loads this
+    configuration. That way configuration can be transferred into
+    multiprocessing worker processes without requiring the "fork"
+    start method.
+
+    """
+    CONF_ENV: ClassVar[str] = 'BR_TEST_CONFIG_JSON'
+
+    downloaddir: str
+    outputdir: str
+    logtofile: bool = True
+    keepbuilds: bool = False
+    jlevel: int = 0
+    timeout_multiplier: int = 1
+
+    def to_env(self) -> None:
+        os.environ[self.CONF_ENV] = json.dumps(dataclasses.asdict(self))
+
+    @classmethod
+    def from_env(cls) -> 'BRTestSettings':
+        return cls(**json.loads(os.environ[cls.CONF_ENV]))
+
+
 class BRConfigTest(unittest.TestCase):
     """Test up to the configure stage."""
     config: str
@@ -35,6 +65,8 @@ class BRConfigTest(unittest.TestCase):
 
     def __init__(self, names):
         super(BRConfigTest, self).__init__(names)
+        if BRTestSettings.CONF_ENV in os.environ:
+            self.conf_from_env()
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
         self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
@@ -44,6 +76,11 @@ class BRConfigTest(unittest.TestCase):
         print("{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
                                     self.testname, msg))
 
+    def conf_from_env(self) -> None:
+        conf = BRTestSettings.from_env()
+        for f in dataclasses.fields(conf):
+            setattr(self, f.name, getattr(conf, f.name))
+
     def setUp(self):
         self.show_msg("Starting")
         self.b = Builder(self.config, self.builddir, self.logtofile, self.jlevel)
diff --git a/support/testing/run-tests b/support/testing/run-tests
index 2c7ce87c96..f0c1cc782a 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -6,7 +6,7 @@ import sys
 
 import nose2
 
-from infra.basetest import BRConfigTest
+from infra.basetest import BRTestSettings
 
 import infra
 
@@ -44,9 +44,6 @@ def main():
     script_path = os.path.realpath(__file__)
     test_dir = os.path.dirname(script_path)
 
-    if args.stdout:
-        BRConfigTest.logtofile = False
-
     if args.list:
         print("List of tests")
         nose2_args = [
@@ -69,7 +66,7 @@ def main():
             parser.print_help()
             return 1
 
-    BRConfigTest.downloaddir = os.path.abspath(args.download)
+    args.download = os.path.abspath(args.download)
 
     if args.prepare_only:
         emulator_builtin_binaries = ["kernel-vexpress-5.10.202",
@@ -78,7 +75,7 @@ def main():
                                      "versatile-pb-5.10.202.dtb"]
         print("Downloading emulator builtin binaries")
         for binary in emulator_builtin_binaries:
-            infra.download(BRConfigTest.downloaddir, binary)
+            infra.download(args.download, binary)
         return 0
 
     if args.output is None:
@@ -90,15 +87,13 @@ def main():
     if not os.path.exists(args.output):
         os.mkdir(args.output)
 
-    BRConfigTest.outputdir = os.path.abspath(args.output)
-
     if args.all is False and not args.testname:
         print("No test selected")
         print("")
         parser.print_help()
         return 1
 
-    BRConfigTest.keepbuilds = args.keep
+    jlevel = 0
 
     if args.testcases != 1:
         if args.testcases < 1:
@@ -109,7 +104,7 @@ def main():
         # same default BR2_JLEVEL as package/Makefile.in
         br2_jlevel = 1 + multiprocessing.cpu_count()
         each_testcase = int((br2_jlevel + args.testcases) / args.testcases)
-        BRConfigTest.jlevel = each_testcase
+        jlevel = each_testcase
 
     if args.jlevel:
         if args.jlevel < 0:
@@ -118,14 +113,22 @@ def main():
             parser.print_help()
             return 1
         # the user can override the auto calculated value
-        BRConfigTest.jlevel = args.jlevel
+        jlevel = args.jlevel
 
     if args.timeout_multiplier < 1:
         print("Invalid multiplier for timeout values")
         print("")
         parser.print_help()
         return 1
-    BRConfigTest.timeout_multiplier = args.timeout_multiplier
+
+    BRTestSettings(
+        logtofile=not args.stdout,
+        downloaddir=args.download,
+        outputdir=os.path.abspath(args.output),
+        keepbuilds=args.keep,
+        jlevel=jlevel,
+        timeout_multiplier=args.timeout_multiplier
+    ).to_env()
 
     nose2_args = ["-v",
                   "-N", str(args.testcases),
@@ -142,15 +145,4 @@ def main():
 
 
 if __name__ == "__main__":
-    # python 3.14 changed default start method from fork to
-    # fork-server, which is not compatible with the nose2 setup
-    if multiprocessing.get_start_method(allow_none=True) != "fork":
-        multiprocessing.set_start_method("fork", force=True)
-        # set_start_method throws a RuntimeError if called more than
-        # once.
-        # Debian python3-nose2 0.15.1-2 includes a patch adding
-        # another set_start_method() call, so monkey patch it out to
-        # get rid of this
-        multiprocessing.set_start_method = lambda *args: None
-
     sys.exit(main())
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
