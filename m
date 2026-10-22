Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DCD606A31E
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 22:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SN0YFTKV
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9C156069A;
	Thu, 22 Oct 2026 22:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1LvwUS6CgVm; Thu, 22 Oct 2026 22:07:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3533608AB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792706822;
	b=n26HoKyPXBgXNxo1xuyyrRNXGXtQQzpkIrXzPj5jLW+dXKMfhO04Ij3vQfujSPAJ/D+o
	 Ybm01sZcn9Xb4rEfXdWfw2fEdKf81nMTq9+IhEmHJ0px5Xh0RO+W7yNC+2pdd/SjacWEl
	 1wA23ZszvccKRP2LTpNcTKHqqve2t5VMKc6X3bYM2I7nAECufMjLZqJhDsxsWd81quDUW
	 JOmQcT/9mz10xKFLRWVy3efCQGJI53KtGRG2Aq4yK1e3+o7iKzpNXKAtuiA7osQQZe+2v
	 ov9TMX3btqw5Be/o42ALMtUXwNz1RYX7iz34TUufgZq1DYyEjbKnEi7AK9KGEHTzAPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792706822;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BbCaspd1nk6Y5RQAKLHxkcSm7jxLVFzVJkLKp0t7Va8=;
	b=FUnBD+lql8QvrR/76TqZh0pXwqqEp6d+BVYcSJSHzNaqa3CN374fi+7FyX+9+eqX0WEX
	 p2RCTJN1y6Y8fgGNW+Y0oaqMSqfXKh4CD5xiM9sKv9vRdQZ6KAtGoJu4IkbKJjIOfnGQc
	 4ZlqmjPbG1+Gfv2yIV43hJuJciUnio6QeLqwp0Rq1IT3ixIbAkw7e+6bZdYQdE9xOEypS
	 l8sJEPs3DCf6C7Qntx/EqTPzVYOjAjsAZKtBQEuWWJfYdQ6sadnpFDjcXAEIurJEgcOpu
	 sWl4Zf+HLSTaJNWbM/CFJZ4OBr4UUjT+Tsn+f/hsTXOAiDH0ewXgGsBBMcEBYesqqrQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792706822;
	bh=BbCaspd1nk6Y5RQAKLHxkcSm7jxLVFzVJkLKp0t7Va8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SN0YFTKVgTgEQ/hiPIVUfbs5V6v/L7t9c31gfTY1UL3GI+OgkVo7dbn8Uet/FUmkN
	 mm/Grb9CpKodpZDuIp7RjeGl0l/m+2XYkjbQz27lZXAjt64bIwUSZgkgcLmFC2EUW0
	 D0INyqN1eU7UZp/3xR4oe8k3nDMdfbJb4MimZ3nYCWWu+VaH7JaJ2GAS/gAWbQQE4V
	 vKQ8NoA33ozT9r9onNG+ZEVV8cFI/bXGxvV85hGszU38FwqtIzVDHez3YJFWwFAYHq
	 CGLN8x1DIdg/KwyOJHeTXxyrcSlCMSlyZnE4hRkQwtDEtEsvhBeIXRnW+1009fm4c+
	 6Nqeuf7V687Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3533608AB;
	Thu, 22 Oct 2026 22:07:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C904E3C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF493811D8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoktxD6aUkCx for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 22:07:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 98FD980DBD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792706820;
 b=Q81P2CjQ4jtZJDyIbP9rpTcOmrVo9qrWFhbvGlVtbJowsQHgwDwnxg9Zh4a+5ncKKc0c
 UpUmEeLFYuLprkPXTcDDXNpdoW6kFyXi9mFxy1X5Et8urj0ys1Fyinali5j+CYsDBg7Zt
 wV2q6J7l0baqP9udzRYAVFPOWpYqOM9SVrTN8quL///FK4fhBo27imRnLkTCxjObTgwGL
 qYVthX0CZiNU+JObAk28HfvqJjUAs5zhaujET91Qr+GnS3WHKbXPL3x4T8HP0VK8KgZ81
 V8ScG5UA84QagBuZKxsZ4NsLj9hWfcmn4BqhTJwq5e/LDviiNJfSV6tjpvcOZdirhQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792706820;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=k9zwAmAtbva0SPBHeAAxuErdlSQ80q4RzB/qS/9qNAY=;
 b=E+pJmCY4tZKeA9du2GJm73UTKjcSol30vkvEv4hNJQi7VqifG60KQuBDMvkBt+LM253Z
 cqbFDZsRGcfDA5MKCzrThNWtU0KZpGcG4v0b1A9rV0bHgA0478zjqPVWaJo5z9XJHsScV
 9dohbFkV/cDs9+STyR8bO9xIcb6iNJ0OQPjeiM5ZkO7Q4RmppQjLcCAYTYlPzxqnH/lKt
 jas7dB//RZgNVJ0afUjIWZmqh+DjmG/aTbv8+ov6H/OpvYf2iwXoNpr63JZHrU2kdV3Cl
 LtlgtcISjqwHyHiOldhxt/2/PwmMPF8oN3g7/3zpSdBjXtb+h993axyX9KM14qzQPiA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98FD980DBD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:07:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 622BF9BA5D; Thu, 22 Oct 2026 22:05:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:59:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02a4df08f99fa4ce205b5dfe510f20a6d3b8bfd8
X-Git-Newrev: 2fe27d55f1ea340584ccbb9654fa2b2ae711d901
X-Patchwork-Hint: ignore
Message-Id: <20261022220536.622BF9BA5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-questionary: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2fe27d55f1ea340584ccbb9654fa2b2ae711d901
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  2 ++
 package/Config.in                                    |  1 +
 package/python-questionary/Config.in                 |  8 ++++++++
 package/python-questionary/python-questionary.hash   |  5 +++++
 package/python-questionary/python-questionary.mk     | 14 ++++++++++++++
 .../tests/package/sample_python_questionary.py       | 16 ++++++++++++++++
 .../testing/tests/package/test_python_questionary.py | 20 ++++++++++++++++++++
 7 files changed, 66 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4339b37f11..8f87003097 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2273,6 +2273,7 @@ F:	package/python-log-rate-limit/
 F:	package/python-pydantic/
 F:	package/python-pydantic-core/
 F:	package/python-pydantic-settings/
+F:	package/python-questionary/
 F:	package/python-typing-inspection/
 F:	package/python-tzlocal/
 F:	package/python-sdbus-modemmanager/
@@ -2280,6 +2281,7 @@ F:	package/python-sdbus-systemd/
 F:	package/python-varlink/
 F:	package/python-waitress/
 F:	package/python-whitenoise/
+F:	support/testing/tests/package/test_python_questionary.py
 
 N:	Marcin Bis <marcin@bis.org.pl>
 F:	package/bluez5_utils/
diff --git a/package/Config.in b/package/Config.in
index a2be273dea..28e948e3a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1390,6 +1390,7 @@ menu "External python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-qrcode/Config.in"
+	source "package/python-questionary/Config.in"
 	source "package/python-raven/Config.in"
 	source "package/python-redis/Config.in"
 	source "package/python-reedsolo/Config.in"
diff --git a/package/python-questionary/Config.in b/package/python-questionary/Config.in
new file mode 100644
index 0000000000..06bc269b4a
--- /dev/null
+++ b/package/python-questionary/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_QUESTIONARY
+	bool "python-questionary"
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
+	help
+	  Python library for effortlessly building pretty
+	  command line interfaces.
+
+	  https://github.com/tmbo/questionary
diff --git a/package/python-questionary/python-questionary.hash b/package/python-questionary/python-questionary.hash
new file mode 100644
index 0000000000..c350e024ff
--- /dev/null
+++ b/package/python-questionary/python-questionary.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/questionary/json
+md5  0c7b9d9ba6c6b4ba94f5e705850cd0c3  questionary-2.1.1.tar.gz
+sha256  3d7e980292bb0107abaa79c68dd3eee3c561b83a0f89ae482860b181c8bd412d  questionary-2.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  3a492ab6d436c5e75f54a9a556de91c4322c8ad408fe849c7da1f7352721c63a  LICENSE
diff --git a/package/python-questionary/python-questionary.mk b/package/python-questionary/python-questionary.mk
new file mode 100644
index 0000000000..803735d5e5
--- /dev/null
+++ b/package/python-questionary/python-questionary.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-questionary
+#
+################################################################################
+
+PYTHON_QUESTIONARY_VERSION = 2.1.1
+PYTHON_QUESTIONARY_SOURCE = questionary-$(PYTHON_QUESTIONARY_VERSION).tar.gz
+PYTHON_QUESTIONARY_SITE = https://files.pythonhosted.org/packages/f6/45/eafb0bba0f9988f6a2520f9ca2df2c82ddfa8d67c95d6625452e97b204a5
+PYTHON_QUESTIONARY_SETUP_TYPE = poetry
+PYTHON_QUESTIONARY_LICENSE = MIT
+PYTHON_QUESTIONARY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_questionary.py b/support/testing/tests/package/sample_python_questionary.py
new file mode 100644
index 0000000000..de707f1ec3
--- /dev/null
+++ b/support/testing/tests/package/sample_python_questionary.py
@@ -0,0 +1,16 @@
+# questionary is tricky to test as there seems to be no option to pass in stdin.
+# Therefore the ask is going to time out on purpose so the test can check if the ask
+# was successfully written to stdout.
+
+import questionary
+import asyncio
+
+async def main():
+    try:
+        async with asyncio.timeout(5):
+            await questionary.press_any_key_to_continue().ask_async()
+    except:
+        raise
+
+if __name__ == '__main__':
+    asyncio.run(main())
diff --git a/support/testing/tests/package/test_python_questionary.py b/support/testing/tests/package/test_python_questionary.py
new file mode 100644
index 0000000000..3050259296
--- /dev/null
+++ b/support/testing/tests/package/test_python_questionary.py
@@ -0,0 +1,20 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonQuestionary(TestPythonPackageBase):
+    sample_scripts = ["tests/package/sample_python_questionary.py"]
+
+    def run_sample_scripts(self):
+        cmd = self.interpreter + " sample_python_questionary.py"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertIn("Press any key to continue...", output[0])
+        self.assertEqual(exit_code, 1)
+
+
+class TestPythonPy3Questionary(TestPythonQuestionary):
+    __test__ = True
+    config = TestPythonQuestionary.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_QUESTIONARY=y
+        """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
