Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15DAC79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 21:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259FE40564;
	Sun,  6 Sep 2026 21:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yED50386z9Tb; Sun,  6 Sep 2026 21:53:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 14BF04056A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788731606;
	b=hX+FBcdzYQ6xDKsuFGyXR04LA0arHBEx40jXk7SeuMvJ/7OOnb6zzQhYjEgyXJOZJunc
	 haJ+wX5GeOtQ/aa2cqd4ppseUvytT+OqeAt6T4tSpHa+76pnXWasHhSnVPEgbd4pgXBM4
	 IjwkSwe1rsIjuA4/B5/JlZJw2hFlVWVVbadWVAtkc59UbV2/kzmGk5twM8sQU3bPALpOV
	 6ti3JwTdGVnrhiqiRvtnhZtuomY7lYVy0KcPbZ64hG0ant1KqFm12+9WFRC050gDIGG1n
	 IR5gALn8YZqbxc9ylEVy7y6CKuG7XIQ/GSZLY7qL8cToiVFv+3hGtDMqHvSw7JN55YQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788731606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3c4KUexvLtO2CYFCPRaFKy0jUQRZVUJdCJxErybcqZY=;
	b=e6/kbNCbnXrEa1EDmtXUUlcUBAn/a10dZo5nx1L69fqw7/N2Xvxmhh9ep4xkVOXKGK0C
	 EnUFRVUuCEYSo9wDSOek2ESjTyHM8DyiDwLi4e0oScpx3cF72GeyGcni9ftmUHnFQCmpO
	 MFcyNjhYep755ZOT85spVHTls+FqVUpqcQ44YdPtsdJD4Kfq6y/Rdawhrn3Fkh8DkrvH9
	 Kie24bWe6HLgI7ujbfLD5v/OkTJS4cuV2e9hNTK2HDoWfIMB/+91yzgJ7Z6cmxIXzeMIb
	 To+K2khdN5jD/i7szG0hAAkSTJ4HdBAYIsaR2S2chawEoGIZVoX4WD1RhvKXLc5cQRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788731606;
	bh=3c4KUexvLtO2CYFCPRaFKy0jUQRZVUJdCJxErybcqZY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=EIaJT9Ikio6svOPdkVEOBxDOFYE3xj9zmP8nUwrFxD7cXEAfASCdCHLphqnHvf0d1
	 BK7dJm0AQu/Skfje7KXnLHCYZMzVENidYQ4EXwlGXPZ5yHPZ6oSX1K+I/25THQdG+f
	 b1TNyT3xbjqGNGXnS3L63dDkJjXHfeEpdoTuEtuZQqvkS+QG/rYAj78VrEF8lhX4nV
	 s2vxlhulVogiXjmOo2jIvKijr+jwFI1eMGe7CIXdWXp8uFkAGOzbTStA3S4lwafOs/
	 MYPO0fzXkm8dm9t3sfIg1sLSiojQwdokUXflQnZ+Ppy2+2vUWLJeL5872ZPg0eeqxW
	 0YkxeshYrAHgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14BF04056A;
	Sun,  6 Sep 2026 21:53:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C59DB118
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 21:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD90A60608
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 21:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZykBKbFD3eL4 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 21:53:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 30CC8605E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788731587;
 b=jfIf+wR6+c/WFUqRwhMukuPGTpiQYN4Ct1I+ojnlp8KLp4qH5gOi0S/+M94Ta/mIkGdr
 qnoyFWAGzlrJWNcvzAR+VDMCeqE0zEPaAWDCJMywnL83TYUYDl36c2Wsx7eCD/RnKHDiV
 mUmPgG+eQ1vYMQUFlnr1OkluHV96gWeGzZI4GGHwKDuNYaER9/mntsjNuveB4koB4EFgy
 nz8TQQGkS4vHZTy1ad4OCiL2RD37vMMXJH5Wud/VQ18ALzgE8d+4jouEMzAUyEiG7cjFh
 X6pQkZeh1UNrvpn4ux2WlQXRH+jez4OdAgqUonV0OG3tOM9g8t2fTtEapa8KFimTiMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788731587;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ioSftGC+VuDsCptVY9vZLwWrPTEdzkKxVgfOSjl5Psk=;
 b=bokEarSqf4SxyQ6M0GWcjkzQykADRsLYJAaE6YIqqyOnZ5MMOmdi2UNwjzw/oYeJ/8LS
 LBW6N7NuqUR5SOnomwyrYdruRCFDEEVY9QYPuLaC6e3/B2kvh0zwgzujZnrH5qVlhZsoR
 R1NqRvTCLclGnnAROS/pnYbJRhYa+1AOhXz7If3yi0slrIscv0Bm6xXAYfm0qzMNaU3Ps
 OKmoIiLRsBqwKLaLlfcfHdRYuhblJNLFVvaDBb5tJkEFLo9z0SPFM4Iq5G2p8D4Q2cU3j
 wxcRYok9gscUO4W69hO3XQlp+qrqX/AL8+p32S6/zEOJ3uG4Mk6tQI18O46zlVQ+5kw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Qdb4WNg+; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30CC8605E9
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 21:53:04 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1E8A15FF95;
 Sun,  6 Sep 2026 23:53:01 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun,  6 Sep 2026 23:52:52 +0200
Message-ID: <20260906215252.499931-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: test_squid: new runtime
 test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/16334532501
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_squid.py | 66 +++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 support/testing/tests/package/test_squid.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fd93b1de5..5b88bb445a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2042,6 +2042,7 @@ F:	support/testing/tests/package/test_sed.py
 F:	support/testing/tests/package/test_socat.py
 F:	support/testing/tests/package/test_sox.py
 F:	support/testing/tests/package/test_sqlite.py
+F:	support/testing/tests/package/test_squid.py
 F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_swipl.py
diff --git a/support/testing/tests/package/test_squid.py b/support/testing/tests/package/test_squid.py
new file mode 100644
index 0000000000..02593b13e9
--- /dev/null
+++ b/support/testing/tests/package/test_squid.py
@@ -0,0 +1,66 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestSquid(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_LIGHTTPD=y
+        BR2_PACKAGE_SQUID=y
+        BR2_PACKAGE_WGET=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        msg = "Hello Buildroot!"
+        fname = "file.txt"
+
+        # We check the program can run.
+        self.assertRunOk("squid --version")
+
+        # We create a file to serve over http.
+        self.assertRunOk(f"echo '{msg}' > /var/www/{fname}")
+
+        # We download the test file through the proxy.
+        proxy = "http://127.0.0.1:3128"
+        url = f"http://localhost/{fname}"
+        cmd = f"wget --progress=dot -e http_proxy={proxy} {url}"
+        # The squid server can take some time to start. Depending the
+        # load of the test controller, this can take a variable amount
+        # of time. We attempt several time before failing.
+        for attempt in range(15):
+            time.sleep(5)
+
+            _, ret = self.emulator.run(cmd)
+            if ret == 0:
+                break
+            # wget exit with status code 4 in case of a network error.
+            # Since we are waiting for the proxy server to be ready,
+            # we only expect this kind of error. We fail for other
+            # types of error.
+            self.assertEqual(ret, 4)
+        else:
+            self.fail("Timeout while waiting for squid to be ready.")
+
+        # We check the downloaded file has the expected content.
+        cmd = f"cat {fname}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We also check the squid proxy logged the access.
+        cmd = "cat /var/log/squid/access.log"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        log_str = f"GET {url}"
+        self.assertIn(log_str, "\n".join(out))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
