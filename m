Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0998606A32A
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 20:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VVuh2qI9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwpF9Cb0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97DB480E3F;
	Sat, 21 Nov 2026 20:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3dK_OYPIeT7; Sat, 21 Nov 2026 20:37:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5FCDF80E45
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795293454;
	b=SyHv8TQh8tv1ynBaclk0LSgDE+hX7D9j9JnrBAgzYnWAI+JHJud7EOaMvhbzCh/s5lpO
	 JJ9syS06MHUGZkLmMTi9nZ162gE3X/y3Idqu6DJOwfzjMWMb/IgMwv3oUK1lS7xrpIWEe
	 tBlxpoIhJ+n0bK+Prrgb8izo+txeNkUGyeuuh+dflFSHrMJ+bQEEQz3IvDe7JRHeQkcG5
	 Jil5JNO5s78ym/OanFLDiVwQLo4p8xqRo3jIYFtzX06UOItpocN+5smUxR3TWGVR6hwFq
	 xINPu7+lCTDKwPajn3puH3nh79zTsV3ILfx7jGRPtw1Pob/l7TkZMTk3wMLS0p7aTQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795293454;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=FnetWXodgu0WojyCpSYYABM7xcUZpPF3ZVLGOC+gKzE=;
	b=AGey7AaX3ysaTRDv3CJywY7Evb9scFW1ewlx3wL8YhxuiFO6XCfRs4SPoDO+1wQ5TH9o
	 yHtA/yRZc1KPLmeq9UlPyDLr1bMdPAxQ52iJRVt6mFdmLUjJz9mflUj49AKavxlaLDB5j
	 bKMc+7E2Z+1CdyymYU2g/NuQg4PLs+YrlZTXlDj1Uy7oCRDTFiP3VlwkX2NPTHUM0sDyc
	 fQEY0qc79pqtTM2tcSc5NSLWTGpv3jvRXhbNeq2vOWipyD3CCJKi+eOuzxGuHTI3bHsVt
	 rcN93N+X7NUBCriV3yIRXJP/5NQp9ukAITMwUgUxEdTwRHYj2/r7ezg4aA4CWIRK+VQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795293454;
	bh=FnetWXodgu0WojyCpSYYABM7xcUZpPF3ZVLGOC+gKzE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VVuh2qI9W3fsOsPHviHS1MPWmvlEoqolXLmgnpRDlrPzJRNuYqr6aix+u20EPSzDR
	 LoPzS7OCoALe1P+w5OBeyCgBsximSnLoT5KePc36R2OZNuqeLPW6Xd+65+65wZV1Zf
	 gGVmGS7yG9KXGx4U13P+uv7NdTHI/CBcdMsyRZsW2rXIM4ilfpbkVcmQaGaTeQ52eF
	 OBxfPEJWCxvhv9b73xPBGt1g4J+jRpre7wnbBVWo3nrxEzON46XSXWlJP0I8cTxnCW
	 w2GyO/PounrEQ8xOB9AGE0oD9GuS2TdUkxLW8dT05GKmMhuW2knmeM+FgoPiiQ4hFn
	 rWoo9ia7sEDtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FCDF80E45;
	Sat, 21 Nov 2026 20:37:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9990B15D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B252406D1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Lbw2j0XlQaJ for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 20:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ECD15406CF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=BwpF9Cb0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECD15406CF
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:37:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4a358881793so1021455f8f.0
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 12:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795293449; x=1795898249; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wK5IusuMCU+/EPFlEy8+uVgQRn1b1SN8L7AEDrHpnyw=;
 b=BwpF9Cb0dy++rldlNrDeQ4HvYDTViSi6b12zxQv+AHG/JGqtOxT39EKKsOf84JdSDb
 CqslzxKlgFcsdVhZ6XYqIXawrP8bBFSg4vWi1s77wyF1M982EGbbpgF9YBQYKVqD6Dqy
 0m48Saq/T/EMR2b3mmdbY9E/v008e4b/4KVbCxPnepaWtsXB7AkZ7QVGwd0bfBbaTzO4
 cyheUwL9ULyD2BMm2tH4cQ2wTMlmizTrbPWxHF1smMZIJorza684nLfoXpoIYW21DjtJ
 v6xH3jJpGb666uD7M/9g8YUpchHThnLUjiM6Fh/zkyueOVCS1Pyy8dDX1LD7CX6eSUN3
 dgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795293449; x=1795898249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wK5IusuMCU+/EPFlEy8+uVgQRn1b1SN8L7AEDrHpnyw=;
 b=vCFEACne8oQ6bDE6Vd9nzISOcBirIN0ciGIBEYofOTVhWGbdQWJEmqQQhnvCn68nR2
 1I81l20H9KYl02veuyJnpKB0SQY2eotKBWQvdKttC+GcZ0b06e6HNqGADb/Qw9jCRaMu
 qkO58tQtb+v1ep3PIiu6+7ils1U2Pctf7C21TwroPD9W8Lk6Ke27+5A8ITaEuNVZah2d
 4Zwx1D3t6ySw6n/joBmzoEII1e5FL7Was86wq8W7JDEW6GvoQ0sK1elyoFxe0MGgQ48y
 czee+kmPWMcp4ehUZVCVupTkmgfXBu55h3upyoKUBaKg0YWIKcsLbZ9xp1v4zNB7v5un
 2sog==
X-Gm-Message-State: APuU4Z96xXn7/UqWDmHfS3uZHfBbs3h5nM1sJpCmFkbQnuhwjX7qwZI7
 fsMGsOozMeCdrRblx980Qd0i7ahRq0okzW59edR0PnsfBPa32CI7dZmlV1qUUQeP
X-Gm-Gg: AZFdTZdKqgDfbd9e4m+RC0qZULcKwQkS/XqtExHMVT/2HufT0bnX4zbQWLq8rtlmj/g
 gVz8i3VDLUMm3aruJtLu6SEDxol+dsQmNA31I6PFZ6qz4vVbDQf6I7Y5xVl8cZFj6GcMQVwP614
 gnBibDwOLbyIIq5an+jiT2/zPzsBL0mElFoaLgDrbViCFfZwlvSBF1kIzImcIwICn0sRGSZo9aH
 Kcnd/hFVcPVr6yLaS5lzcYj2jMjNvJ/N3UdS2ESYmMJy8fHIf0Dkw1ujzR7sTiF3L2TzdTbxWND
 dOqNtlqsXjFaqZg5es5cIXpCGnslG5vZrWuFpHDvC5Co5nMOie4rACWkkfs3cZ3yILk0dthJfRE
 zhwLV1zUOardrJ46e1tJuOM6XnfCHhOmuIsmjVPtGVpFBq6JqKKTil/wHq7xs5THUTaE79CcMG8
 6ElQPJCF7xQ5zQySVHCA6zX9OHIzLIB0Sh+Zn1jFYUtGOWeE3ja1tRibD50azNyp2AuPCa7iQX2
 RstyRImXbeLFHZk9YBuUlt+UouDRnnTfBy7OFrtJksxOtH8FxKkIELUtN0Ro8xXOVLqUg/D8vr5
 HHlAN1Ydl/YDvG68z1r2UBfICPrDj+H4DnKLqKg9tddlUjyk79H9PDJw6lxbonxw4waIgy69
X-Received: by 2002:a05:6000:470c:b0:4a7:593a:f421 with SMTP id
 ffacd0b85a97d-4abb73b557amr13454651f8f.47.1795293448973; 
 Sat, 21 Nov 2026 12:37:28 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b9abf15sm12758939f8f.43.2026.11.21.12.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 12:37:28 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 Colin Foster <colin.foster@in-advantage.com>
Date: Sat, 21 Nov 2026 21:37:26 +0100
Message-ID: <20261121203726.3858693-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240103002810.1055951-1-colin.foster@in-advantage.com>
References: <20240103002810.1055951-1-colin.foster@in-advantage.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] support/testing/run-tests: add ability to
 run tests from external
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Colin Foster <colin.foster@in-advantage.com>

The BR2_EXTERNAL variable can be used to keep customizations outside of
Buildroot. There was no support for writing tests in those external
environments.

When the BR2_EXTERNAL environment variable is set, run-tests now also
finds the tests in the support/testing/tests folder of each
br2-external:

- The support/testing folders of the br2-externals are added to the
  Python path, and the tests package of Buildroot and its subpackages
  use pkgutil.extend_path(). So the tests of the br2-externals merge in
  the tests package: they are named and run like the Buildroot ones,
  e.g. tests.package.test_foo.TestFoo.
- PYTHONPATH passes these folders to the nose2 workers.
- nose2 only discovers the tests of one folder, so run-tests gives the
  names of the external tests to nose2, for -l and for --all.

Document it in the manual, with the two things to know:
infra.filepath() points to the Buildroot tree, and the build of a test
case does not use the BR2_EXTERNAL environment variable. So a test case
that builds packages of its br2-external lists it in its br2_external
member.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new approach: instead of copying all the tests to a temporary
    folder, merge the tests of the br2-externals in the tests package
    with pkgutil.extend_path(). Nothing is copied, and infra stays the
    one of Buildroot.
  - drop patch 1/3 (try block) and patch 2/3 (temporary folder), not
    needed anymore
  - list and run the external tests with -l and --all too: nose2 only
    discovers the tests of one folder
  - the build failure in the v2 cover letter came from the build of the
    test case: it does not use the BR2_EXTERNAL environment variable.
    Document the br2_external member of the test class, which does it.
  - document the feature in the manual
  - rebase on master, drop RFC

Supersedes v2:
https://patchwork.buildroot.org/project/buildroot/patch/20240103002810.1055951-2-colin.foster@in-advantage.com/
https://patchwork.buildroot.org/project/buildroot/patch/20240103002810.1055951-3-colin.foster@in-advantage.com/
https://patchwork.buildroot.org/project/buildroot/patch/20240103002810.1055951-4-colin.foster@in-advantage.com/

 docs/manual/contribute.adoc                 | 29 +++++++++++++++
 support/testing/run-tests                   | 39 ++++++++++++++++++++-
 support/testing/tests/__init__.py           |  2 ++
 support/testing/tests/boot/__init__.py      |  2 ++
 support/testing/tests/core/__init__.py      |  2 ++
 support/testing/tests/download/__init__.py  |  2 ++
 support/testing/tests/fs/__init__.py        |  2 ++
 support/testing/tests/init/__init__.py      |  2 ++
 support/testing/tests/package/__init__.py   |  2 ++
 support/testing/tests/toolchain/__init__.py |  2 ++
 support/testing/tests/utils/__init__.py     |  2 ++
 11 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 6ac75fb66a..653be26543 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -683,6 +683,35 @@ Creating a basic test case involves:
 After creating the test script, add yourself to the +DEVELOPERS+ file to
 be the maintainer of that test case.
 
+==== Test cases in a br2-external
+
+Test cases can also live in a br2-external tree, in its
++support/testing/tests/+ folder, organized like the one of Buildroot,
+e.g. +support/testing/tests/package/test_foo.py+.
+
+When the +BR2_EXTERNAL+ environment variable is set, +run-tests+ finds
+these test cases too: +run-tests -l+ lists them, and they run like the
+Buildroot ones:
+
+----
+$ BR2_EXTERNAL=/path/to/my-external support/testing/run-tests -d dl -o output_folder tests.package.test_foo.TestFoo
+----
+
+These test cases use the +infra+ of Buildroot, so:
+
+* +infra.filepath()+ points to the Buildroot tree. To find its own
+  files, a test case uses paths relative to its own file, e.g.
+  +os.path.dirname(__file__)+.
+
+* The build of a test case does not use the +BR2_EXTERNAL+ environment
+  variable. To build the packages of its br2-external, the test class
+  lists it in its +br2_external+ member:
+
+----
+class TestFoo(infra.basetest.BRTest):
+    br2_external = [os.path.join(os.path.dirname(__file__), "../../../..")]
+----
+
 ==== Debugging a test case
 
 When a test case runs, the +output_folder+ will contain the following:
diff --git a/support/testing/run-tests b/support/testing/run-tests
index f0c1cc782a..90f564da0a 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -11,6 +11,30 @@ from infra.basetest import BRTestSettings
 import infra
 
 
+def external_tests():
+    """Find the tests of the br2-externals, in their support/testing/tests
+
+    The directories are added to the Python path, so that their tests merge
+    in the tests package. PYTHONPATH passes them to the nose2 workers.
+    nose2 only discovers the tests of one directory, so return the names
+    of the external tests, to give them to nose2.
+    """
+    tests = []
+    for external in os.getenv("BR2_EXTERNAL", "").replace(":", " ").split():
+        testing_dir = os.path.join(os.path.abspath(external), "support", "testing")
+        if not os.path.isdir(os.path.join(testing_dir, "tests")):
+            continue
+        sys.path.append(testing_dir)
+        os.environ["PYTHONPATH"] = os.pathsep.join(
+            filter(None, [os.getenv("PYTHONPATH"), testing_dir]))
+        for root, _, files in os.walk(os.path.join(testing_dir, "tests")):
+            for f in sorted(files):
+                if f.startswith("test_") and f.endswith(".py"):
+                    module = os.path.relpath(os.path.join(root, f[:-3]), testing_dir)
+                    tests.append(module.replace(os.sep, "."))
+    return tests
+
+
 def main():
     parser = argparse.ArgumentParser(description='Run Buildroot tests')
     parser.add_argument('testname', nargs='*',
@@ -43,6 +67,7 @@ def main():
 
     script_path = os.path.realpath(__file__)
     test_dir = os.path.dirname(script_path)
+    ext_tests = external_tests()
 
     if args.list:
         print("List of tests")
@@ -55,7 +80,12 @@ def main():
         if args.debug:
             nose2_args += ["--log-level", "debug"]
         nose2.discover(argv=nose2_args,
-                       plugins=["nose2.plugins.collect"])
+                       plugins=["nose2.plugins.collect"],
+                       exit=False)
+        if ext_tests:
+            nose2.discover(argv=nose2_args + ext_tests,
+                           plugins=["nose2.plugins.collect"],
+                           exit=False)
         return 0
 
     if args.download is None:
@@ -140,6 +170,13 @@ def main():
 
     if args.testname:
         nose2_args += args.testname
+    elif ext_tests:
+        # Run all the tests: first the ones of Buildroot, then the ones of
+        # the br2-externals
+        ok = nose2.discover(argv=nose2_args, exit=False).result.wasSuccessful()
+        ok &= nose2.discover(argv=nose2_args + ext_tests,
+                             exit=False).result.wasSuccessful()
+        return 0 if ok else 1
 
     nose2.discover(argv=nose2_args)
 
diff --git a/support/testing/tests/__init__.py b/support/testing/tests/__init__.py
index e69de29bb2..a220f8c5ba 100644
--- a/support/testing/tests/__init__.py
+++ b/support/testing/tests/__init__.py
@@ -0,0 +1,2 @@
+# Merge the tests of the br2-externals in this package, see run-tests
+__path__ = __import__("pkgutil").extend_path(__path__, __name__)
diff --git a/support/testing/tests/boot/__init__.py b/support/testing/tests/boot/__init__.py
index e69de29bb2..a220f8c5ba 100644
--- a/support/testing/tests/boot/__init__.py
+++ b/support/testing/tests/boot/__init__.py
@@ -0,0 +1,2 @@
+# Merge the tests of the br2-externals in this package, see run-tests
+__path__ = __import__("pkgutil").extend_path(__path__, __name__)
diff --git a/support/testing/tests/core/__init__.py b/support/testing/tests/core/__init__.py
index e69de29bb2..a220f8c5ba 100644
--- a/support/testing/tests/core/__init__.py
+++ b/support/testing/tests/core/__init__.py
@@ -0,0 +1,2 @@
+# Merge the tests of the br2-externals in this package, see run-tests
+__path__ = __import__("pkgutil").extend_path(__path__, __name__)
diff --git a/support/testing/tests/download/__init__.py b/support/testing/tests/download/__init__.py
index e69de29bb2..a220f8c5ba 100644
--- a/support/testing/tests/download/__init__.py
+++ b/support/testing/tests/download/__init__.py
@@ -0,0 +1,2 @@
+# Merge the tests of the br2-externals in this package, see run-tests
+__path__ = __import__("pkgutil").extend_path(__path__, __name__)
diff --git a/support/testing/tests/fs/__init__.py b/support/testing/tests/fs/__init__.py
index e69de29bb2..a220f8c5ba 100644
--- a/support/testing/tests/fs/__init__.py
+++ b/support/testing/tests/fs/__init__.py
@@ -0,0 +1,2 @@
+# Merge the tests of the br2-externals in this package, see run-tests
+__path__ = __import__("pkgutil").extend_path(__path__, __name__)
diff --git a/support/testing/tests/init/__init__.py b/support/testing/tests/init/__init__.py
index e69de29bb2..a220f8c5ba 100644
--- a/support/testing/tests/init/__init__.py
+++ b/support/testing/tests/init/__init__.py
@@ -0,0 +1,2 @@
+# Merge the tests of the br2-externals in this package, see run-tests
+__path__ = __import__("pkgutil").extend_path(__path__, __name__)
diff --git a/support/testing/tests/package/__init__.py b/support/testing/tests/package/__init__.py
index e69de29bb2..a220f8c5ba 100644
--- a/support/testing/tests/package/__init__.py
+++ b/support/testing/tests/package/__init__.py
@@ -0,0 +1,2 @@
+# Merge the tests of the br2-externals in this package, see run-tests
+__path__ = __import__("pkgutil").extend_path(__path__, __name__)
diff --git a/support/testing/tests/toolchain/__init__.py b/support/testing/tests/toolchain/__init__.py
index e69de29bb2..a220f8c5ba 100644
--- a/support/testing/tests/toolchain/__init__.py
+++ b/support/testing/tests/toolchain/__init__.py
@@ -0,0 +1,2 @@
+# Merge the tests of the br2-externals in this package, see run-tests
+__path__ = __import__("pkgutil").extend_path(__path__, __name__)
diff --git a/support/testing/tests/utils/__init__.py b/support/testing/tests/utils/__init__.py
index e69de29bb2..a220f8c5ba 100644
--- a/support/testing/tests/utils/__init__.py
+++ b/support/testing/tests/utils/__init__.py
@@ -0,0 +1,2 @@
+# Merge the tests of the br2-externals in this package, see run-tests
+__path__ = __import__("pkgutil").extend_path(__path__, __name__)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
