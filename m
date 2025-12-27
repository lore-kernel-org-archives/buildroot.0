Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB31AE92710
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 20:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA3F1405C2;
	Sat, 27 Dec 2025 20:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2lyecGoadr9; Sat, 27 Dec 2025 20:54:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 225EB405C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766868888;
	bh=I99pq9Mh+I9gXIFvL1QpSdLFAdxMNtoa44BET/C7aAQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iYqUN/ZEDiK39tSB3dOtDc00XTzKjsPhfUDGmIYOOuRKDplJOpRhPlhfL8p2mMvtx
	 CPnXdk/MUHIwNZ9OOBT+Oe80l8t36hNCdcEYy3Vdp4cLXwVoy+L81sVvRQHe21l14Q
	 MrwVwhMwZvicuXUILstfNcJWj8bxfbDG6Ok0lAECRffB6cX2ir1Tgevi7zIsAgj3eb
	 OOnm3LicyEJfoMawY/tSGsHMS5XreSG3y+WSjdvsNJgyf8cASJtTPyxxPse7eWoDU4
	 UySRFl4YaGeJlyjsyFfSdsc8ssGrsrE+vMMqaT2S2dtVxfcCiPDccnvhDEXbnipaxN
	 Vor8QuCrovx9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 225EB405C9;
	Sat, 27 Dec 2025 20:54:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D784830D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA32F405C9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mN9kNTn6BJDb for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 20:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D97AE405C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D97AE405C2
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 20:54:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9BA687817; Sat, 27 Dec 2025 20:54:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 21:54:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec0872b0e07485703eead4c3febb0402f0d40afe
X-Git-Newrev: 33479613d437a99dd51f9ac53095d168371f0cbd
X-Patchwork-Hint: ignore
Message-Id: <20251227205444.C9BA687817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: python-varlink: new
 runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33479613d437a99dd51f9ac53095d168371f0cbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new runtime test for python-varlink.

As always when we need to start a separate server process inside a test
case this gets slightly fiddly.

We override the test_run() function to first start the varlink example server,
then call the packages cli interface to do a varlink call against the
server. The cli defaults to pretty printing the result, which makes it
more annoying to compare to the expected result in the test case, so we
un-prettyprint it with python's builtin json.tool module.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 .../testing/tests/package/test_python_varlink.py   | 30 ++++++++++++++++++++++
 .../test_python_varlink/org.example.test.varlink   |  5 ++++
 .../test_python_varlink/sample_python_varlink.py   | 24 +++++++++++++++++
 4 files changed, 60 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0451d8341c..5ffd0e5398 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2295,6 +2295,7 @@ F:	support/testing/tests/package/test_python_pydantic_settings.py
 F:	support/testing/tests/package/test_python_ruamel_yaml.py
 F:	support/testing/tests/package/test_python_sdbus_modemmanager.py
 F:	support/testing/tests/package/test_python_tzlocal.py
+F:	support/testing/tests/package/test_python_varlink/
 F:	support/testing/tests/package/test_python_waitress.py
 F:	support/testing/tests/package/test_python_whitenoise.py
 F:	support/testing/tests/package/sample_python_apscheduler.py
diff --git a/support/testing/tests/package/test_python_varlink.py b/support/testing/tests/package/test_python_varlink.py
new file mode 100644
index 0000000000..f8595582f5
--- /dev/null
+++ b/support/testing/tests/package/test_python_varlink.py
@@ -0,0 +1,30 @@
+import os
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Varlink(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_VARLINK=y
+        """
+    sample_scripts = ["tests/package/test_python_varlink/sample_python_varlink.py",
+                      "tests/package/test_python_varlink/org.example.test.varlink"]
+
+    def test_run(self):
+        self.login()
+        self.check_sample_scripts_exist()
+        # we need to supress any output here as otherwise the commnd output parsing
+        # gets confused for the second command
+        cmd = "%s %s  > /dev/null 2>&1 &" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
+
+        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+
+        varlink_cli_call = "-m varlink.cli call 'unix:@test/org.example.test.Ping' '{\"ping\": \"hello\"}'"
+        unprettyprint = "| python -m json.tool --compact"
+        cmd = "%s %s %s" % (self.interpreter, varlink_cli_call, unprettyprint)
+        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], '{"pong":"hello"}')
diff --git a/support/testing/tests/package/test_python_varlink/org.example.test.varlink b/support/testing/tests/package/test_python_varlink/org.example.test.varlink
new file mode 100644
index 0000000000..c199824e6e
--- /dev/null
+++ b/support/testing/tests/package/test_python_varlink/org.example.test.varlink
@@ -0,0 +1,5 @@
+# Example Varlink service
+interface org.example.test
+
+# Returns the same string
+method Ping(ping: string) -> (pong: string)
diff --git a/support/testing/tests/package/test_python_varlink/sample_python_varlink.py b/support/testing/tests/package/test_python_varlink/sample_python_varlink.py
new file mode 100644
index 0000000000..567d95da80
--- /dev/null
+++ b/support/testing/tests/package/test_python_varlink/sample_python_varlink.py
@@ -0,0 +1,24 @@
+import os
+
+import varlink
+
+service = varlink.Service(interface_dir=os.path.dirname(__file__))
+
+
+class ServiceRequestHandler(varlink.RequestHandler):
+    service = service
+
+
+@service.interface("org.example.test")
+class Example:
+    def Ping(self, ping):
+        return {"pong": ping}
+
+
+def run_server(address):
+    with varlink.ThreadingServer(address, ServiceRequestHandler) as server:
+        print("Listening on", server.server_address)
+        server.serve_forever()
+
+
+run_server("unix:@test")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
