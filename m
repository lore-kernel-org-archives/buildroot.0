Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDB8606A337
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PDJ2Y2vT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wA3KH6Tc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E4EA40A4B;
	Thu, 19 Nov 2026 09:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqzsTVHyoc8Y; Thu, 19 Nov 2026 09:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9D50140A1D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795082205;
	b=o4dBsukQCMa4CDBcrciQ5YFrh/8z2Gb8Cf72lpAi916geVDbRd/kYwJ2/fnDBElqwTii
	 +pioSK3u5SWqIeMkDmlee1YuVm2nrISGiYGZa+e0jJrHKJXAZRmLrylReQyY0q18JjdHz
	 oiAQi9J5OLPFr149aIjJECuOJjg/cjBx5nNPN04zGM0tqWZkDMS9xGWRDLgHWwEAGoYf2
	 lJqkUjAbeh4kYjRawliIC3ttnMYcv1NqR7KGj/PqI7GFcL+I1S24H0vPZpLTVHEqGzPU1
	 mb8q7FeIcjc6c+iDsFcTRvjhdAFt+SbeGsZt01zZLzpFFtoWLJJIXQEMn1p0AW2qxpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=kHCJqx7VSaHGomoP4sKmzm6eTF3zQhjjFKEgc1vMMls=;
	b=G6c6b6/88QlDEuJq1BA7NqjCKOsCnHPf3nT0Q6592PNVW8htEqmGZ+uwTd0eL0a110M8
	 1uFCvAFMCkAXarj1a7SXzZkF1ICrBRYALvr9X6oLvuxKBgLUiV+G6wNojF+DjWs26r94W
	 +vdF1ycNalam6J6s0UjFpLwNayloAHEk4a4if6a5DKN/H8zlaJjbxjUtXirj69yMhx0fu
	 zd5q12+Eu9V6P9NznhnMl3asi68tutSPCCQu7CLkbJEiwsk+MWsejDBous8LN4giFe23V
	 ygllfxrhzy5SbxUoJtaRq8fVF4TVNqczQ/W9X4NQkxjVB5zW9TzQqTCtWme7lwQ7/6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795082205;
	bh=kHCJqx7VSaHGomoP4sKmzm6eTF3zQhjjFKEgc1vMMls=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PDJ2Y2vTyTOa5vU2MTBX6M5EbGvNd539MH6jyTz3PRObJu0tzPY8zinxuLlipT4Uq
	 NcIP1ZG1fX9ZTfme2dJ2amhTWR3lScsGQIQdlt5cuVk9cG6ErQ7ovOeXrX9K0y2rlo
	 nrfyh3nHynqYtyCETPDqHCFHROdrj1X0KkN1Wv1aJgXDId+3xVvTK4yC3uparCz2DB
	 O45hpCqvjekr6YQkCfMbn9MvL4joEa9ZCvzxuD7tgzTT9wUBV4LyNlN94staVtYT5G
	 ipTsKjBqlvQnrIhTZv/6vRbg08VzN8qXuqNC5sglY2rCK3Wa0W3kIuS1tvjtv4uFP1
	 /htSOMuTZobeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D50140A1D;
	Thu, 19 Nov 2026 09:56:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A0870B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D5D404E5
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mnZ7wzHeqdAc for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 09:56:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C5DAF404E2
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=wA3KH6Tc
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5DAF404E2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 09:56:39 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4bb6adaf0f1so18250935e9.0
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 01:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795082197; x=1795686997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=24Fm5aEAhFCR/6W1ST48+/FPCVrYH1Gop/9JErHwouA=;
 b=wA3KH6TcByo91drR03HhQswqZBHgc4GvFf3aD0WI/gocDFww5mqHmOKc3IwpbiApLa
 94zrYrXmmT4GC0owccTJOdL/haYCymvlvr8SLB1abkWcq6QjsiV0Xklng/sXcqRf/jQA
 fAFxd7K2uq0lrsA8C7xn6GtpQv58KxrFGQb2swcuIvIaaCxt/SIouCHBkeUbMFJSbDUn
 DiDor3i2ClEE1NZPWkJe59NATG5WhEmEJ80q5meVgYWM66Cqt77z2xIHlMklc0D3M8Y4
 LvzuN1gb7XpwuOsViG+rcLttSNxZJylFd/D9csnIEV7uguWqtsf3YWX2SfUNJ6voiaxx
 pMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795082197; x=1795686997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=24Fm5aEAhFCR/6W1ST48+/FPCVrYH1Gop/9JErHwouA=;
 b=Wa8lh3uTlGgzn5zH/p1V1x5gsDXsXxDFldDoQNNK7Z6+OLHetmZroj4VVb+bNAtHx7
 D80uMYr26NYi7WMSNl22/3m6MVzpd6uBMMjq5/vrdA5e00P/ulxKeWpvoG1oHsry736f
 MJZ8Jz9cUJZVZXUxfOAi8Ych2aQN/Rj4Hy3MxuCe8tKlh13RlIOM9pm9FpoVJzO4feQE
 VwaBo8DXZU+0niG+j+uNAONzfdejuypOii0yLktGzwuUl9UOovNvMNbVHuU3aDYGd/H/
 N5ZKrHcXS3+UlJChL4QcBG56HXFiFjdSugg0rOVyz8xL1Bv63XHXWoWugeVDhqtbjMaD
 EbBQ==
X-Gm-Message-State: APuU4Z8BmeQZ0Bl+NCs6Zc6bAXs7aF3QX6kmcCGSIsDRS4hEzVkkXA+S
 lf/I7NM0bv7+No8bCNqJPEOuJ1Gjpihb6YcyiVr/h00vRYbAKT/0Bd3Ft21icA==
X-Gm-Gg: AYBFou0c1xZ6wgfs/mqndfGjeAxcG8cqBBeq9+tFQAeY7IeoSr+sYmHYBdUKz9AYa48
 ZUnEI4mKNl/amJnhLhg2LKkVoMVfSd6KwyP/rVd/q03hoIITvhbK/lgtv+AS+AfdYPm1tiLHCeA
 MR4wJqPp9nMeLwrerEKm+9VeQs16zlH9+uQH/nLrg09rUi10RY+D9LVHsLRzhoScPfPRHWepnHa
 pDDHx2DOqUQJ5jm4HapEMPjwqf8udJzFXezAhUhOSxBcS6vm8dEtzUNFXuZM+A7B0sfsu7rvQ/C
 1aQAdz0vMPltcF74bh+wJhyY+eqDzG5OEZ/SmM9vUAVqvyG95GieATBv0oakRVehD8wO9AbEjaC
 7kVDev8zU19gLhHNmQE/8ziDxl6RbO7nZHn/DMpa2lvg8aOA7/pKWUJ0kuBveQW46EmQB2O3+ix
 ucy5huOHtAkPwImZTanJFo0GK/lNOgiSzuDZLbZCsw0CDkaYT9FMKgHyDnVK96e/lEoaNPRPEVl
 kj0SrPDK7T/ixrEErKlhurDF8SY8zEFa494PsPWHOP7KWMpr0gh6LGw06cBlRe5jV8ZIlbdaZku
 7OszgX6EwqOR4QDaEh/+s/TUogQu9sTAv6TIrjJPUOD1YlFTVwIFMEd7CkFZeBCFMMZgcMlAw1M
 JiYxSPEI1lFiF9qSEZONjk3U9aA8cmNJMIMluc97u
X-Received: by 2002:a05:600c:a07:b0:4a2:1a:a11d with SMTP id
 5b1f17b1804b1-4bb7d57770fmr111536855e9.0.1795082197051; 
 Thu, 19 Nov 2026 01:56:37 -0800 (PST)
Received: from angelo-Precision-7550.fritz.box
 (host-94-86-174-214.business.telecomitalia.it. [94.86.174.214])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560bd46sm9439635f8f.31.2026.11.19.01.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 01:56:36 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 10:56:29 +0100
Message-ID: <20261119095629.1990220-6-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
References: <20261031143617.445438-1-angelo.compagnucci@gmail.com>
 <20261119095629.1990220-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 6/6] support/testing: add python-web2py
 runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,WEIRD_PORT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The test boots a system where S51web2py starts web2py, then logs in to
the admin application:

- with a wrong password, which must fail;
- with the password set in the configuration, which must succeed: the
  admin application then redirects to its site page.

This checks the admin password generated at build time.

Then it checks the init script: a second start must find the running
server, and nothing must answer once the service is stopped.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch

 DEVELOPERS                                    |  1 +
 .../tests/package/test_python_web2py.py       | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 support/testing/tests/package/test_python_web2py.py

diff --git a/DEVELOPERS b/DEVELOPERS
index e4c7e494cd..4e267125b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -266,6 +266,7 @@ F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
 F:	package/uthash/
+F:	support/testing/tests/package/test_python_web2py.py
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
diff --git a/support/testing/tests/package/test_python_web2py.py b/support/testing/tests/package/test_python_web2py.py
new file mode 100644
index 0000000000..f6f65c8cf7
--- /dev/null
+++ b/support/testing/tests/package/test_python_web2py.py
@@ -0,0 +1,61 @@
+import os
+import time
+
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Web2py(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_WEB2PY=y
+        BR2_PACKAGE_PYTHON_WEB2PY_PASSWORD="buildroot"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+        """
+    timeout = 120
+
+    # The root filesystem is too big for an initramfs
+    def login(self):
+        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-drive", "file=%s,if=scsi,format=raw" % ext2_file],
+                           kernel_cmdline=["rootwait", "root=/dev/sda"])
+        self.emulator.login()
+
+    # The admin application redirects to its site page once logged in.
+    def login_admin(self, password):
+        cmd = "wget -S -O /dev/null --post-data 'password=%s' " % password
+        cmd += "http://127.0.0.1:8000/admin/default/index 2>&1"
+        output, _ = self.emulator.run(cmd, timeout=self.timeout)
+        return any("Location: /admin/default/site" in line for line in output)
+
+    def test_run(self):
+        self.login()
+
+        # S51web2py starts web2py at boot: wait for it to answer.
+        for attempt in range(60):
+            cmd = "wget -q -O /dev/null http://127.0.0.1:8000/admin/default/index"
+            _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+            if exit_code == 0:
+                break
+            time.sleep(2)
+        else:
+            self.fail("Timeout while waiting for web2py")
+
+        self.assertFalse(self.login_admin("wrong"))
+        self.assertTrue(self.login_admin("buildroot"))
+
+        # A second start must find the running server.
+        _, exit_code = self.emulator.run("/etc/init.d/S51web2py start")
+        self.assertNotEqual(exit_code, 0)
+
+        # Stop the service: nothing answers anymore.
+        _, exit_code = self.emulator.run("/etc/init.d/S51web2py stop",
+                                         timeout=self.timeout)
+        self.assertEqual(exit_code, 0)
+        cmd = "wget -q -O /dev/null http://127.0.0.1:8000/admin/default/index"
+        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+        self.assertNotEqual(exit_code, 0)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
