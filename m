Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F68C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 14:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E140F60614;
	Sat,  5 Sep 2026 14:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 877nSEHqiTEY; Sat,  5 Sep 2026 14:46:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8902C6060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788619567;
	b=cFlADiQBGEV7/988PjMAV+S1upX9HTKPQcgQixvs43twVFrP6WrwshQwIQ5DayTw6zmF
	 UtzRHHxVgjE4yhTE8xOC1W40IiSH44NxTaPuOJ6J2dnxnBYhmNTFkwFep25EWk7s1i8y2
	 S+fqEOQWWjQB5NIlfBV0GuFMNTh4IibflDtZVC6hJ/vtDCisNHfHmwMdN/MRkCqXb5dMo
	 qLNAhwxmzgSYzOGBsoY3YCHRtuAanTeflkRfjPBy5FU3AZGqIsLtzq3V65cKZ5MudAPmH
	 pwvWC9c8cGdqiyDXTL1cSk0m1avmsnyc33pjz/raDMWrDyC6F9pRWLQh5PRlWIvvmQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788619567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ej1B0mDGK6LMKNndnUWV5uKpLNvCgfe1Rr5My5alw+I=;
	b=MuYHE7/mWiy4TJJ9BAcL3pKm51TEQ7M5wbQLqpX+pb/mxLNT6PpWXAHEKDoNsVLOEJEl
	 7Fbh8zLDLEtDmvY5NKLBAVwdfIV3hg75rJ1tGy2V3Hy06P2ycXV+3gRF83sgyccM85kdg
	 5nVK3xORX5eqadsv9wNhy8GI/tUWz7JbeUFH0VbVQ5KZea5j9pPnJrFpgITT88N1KJcTF
	 31kb3903W1y4NmhqUlq3Yg5yHADw4lS5MAZ5J8RueN+lYMVi62eA1LjaY7rbx82l0xDK/
	 gUT5Lk4bgDpcQpKEQlK8sbADtIXmP5ezwgjsetJSYJD7B//lnMM1r613iPjD1O6TBdg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788619567;
	bh=Ej1B0mDGK6LMKNndnUWV5uKpLNvCgfe1Rr5My5alw+I=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MOu1ljbOmUyvVKRZ3QZ6PQ33VIJ3UHdvHdq5zjKV4ERJ2gW5a3RcOFxvALWX5Fi3r
	 cMrNn9DrDX2bSunfGLLCSQYiMGdA3wzPPNZs2SLitSNDfKofJN6/k85AxqPWzOlp4e
	 q4OAuAR8AzcQHNuhF+KxKuuBm86qOlwq5WjSvrG9lXRacvbAFyPXr3wipIuBCQfAiw
	 QJJu55kCj8RqYVqZiKXQFSCavaHVvL8vpKbRLEx3EzZy9COUJ7mmrmZcW3KkBBbS4g
	 OXlc/SWs1Pb6EA4eLiJaFjnwiqdUGRbHnceA2Jq6a8W9XuhYmKeXPOQkpTK1U3V0bQ
	 TJba3P7rLKZ9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8902C6060D;
	Sat,  5 Sep 2026 14:46:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B9FE118
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5D8640051
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNlpV_MwkYWq for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 14:46:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B215C4004C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788619563;
 b=OMV58MUMPTxHvA9brDOaX9vReaWsgZmvZh//mZkUX+dVFW85pXfb1diPtHoA6T8/NS/O
 Ckp9b0PXBVLpuKorZ4s4pkXvpqj/feqSJkeuNviz0MbfRMMVle4jFd0XbeVP6JRE0P8Ci
 82lNMcwnWmLX7eGNLWLveEP3qc3iUNQSP0azn44sLeW8ijceQUax0KjIXkEOa8lE7aC+B
 +aFPDWYEuVFgBB8YFavvBtC3L2G4nBdm48P3Hfepqe5M3Nv/ccfAigZ6f6YREH3juoQyW
 RooiEdK/w2VZK5OFmejA3lOJh1zkyHP1uS7vcEeq9QshNIADGDC0Nj/pkFha09G0lsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788619563;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=qOYgOLYTHEyPrad0abmv1tiKlA66uCyx2QMjLFOoeCg=;
 b=aYulS3LFUjILU2HcL8n/fpBelldBB5+wKOF+qtihi5RttP179rVzHxmtTPkctvE1sB15
 GtNna11LScSsv+lL1b2t3FUpt+JjYKzwiT3TXAKrjmrbyraa9vYqA9tcJlZHCaVV845ls
 ytL2ihMNylFmKt3xZel+8tcB2bJ6Z5ZbN/0D9YszkHeevFmtSzK8W5fA+GsGV382JbSSh
 Q45jDrx6ly1MVoyBXX6/lwBPPAppQHVM3Cl6vFsPrZgDKkUBAEABtlT+l6Ey+9RANPhTI
 xtemBBAOcCfW4WMq9fhNfTl8Rh6Zfyvdik8AxrjpW67AbiRD6uYQ/Yti1krwxpGRI1g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=c7nQA1c9; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B215C4004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 14:46:00 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BAB2B6013A;
 Sat,  5 Sep 2026 16:45:57 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat,  5 Sep 2026 16:45:48 +0200
Message-ID: <20260905144548.61238-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: test_erlang: new runtime
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
https://gitlab.com/jolivain/buildroot/-/jobs/16325100707
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_erlang.py | 48 ++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 support/testing/tests/package/test_erlang.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fd93b1de5..4b8d8155b8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1903,6 +1903,7 @@ F:	support/testing/tests/package/test_dosfstools.py
 F:	support/testing/tests/package/test_dosfstools/
 F:	support/testing/tests/package/test_dpdk.py
 F:	support/testing/tests/package/test_ed.py
+F:	support/testing/tests/package/test_erlang.py
 F:	support/testing/tests/package/test_ethtool.py
 F:	support/testing/tests/package/test_ethtool/
 F:	support/testing/tests/package/test_exfatprogs.py
diff --git a/support/testing/tests/package/test_erlang.py b/support/testing/tests/package/test_erlang.py
new file mode 100644
index 0000000000..a765cec843
--- /dev/null
+++ b/support/testing/tests/package/test_erlang.py
@@ -0,0 +1,48 @@
+import os
+
+import infra.basetest
+
+
+class TestErlang(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ERLANG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("erl -version")
+
+        # We check can print a message from the command line.
+        msg = "Hello Buildroot!"
+        erl_expr = f"io:format(\"{msg}~n\"), halt()."
+        cmd = f"erl -noshell -eval '{erl_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We check we can exit with a specific code.
+        exit_code = 123
+        erl_expr = f"halt({exit_code})."
+        cmd = f"erl -noshell -eval '{erl_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, exit_code)
+        self.assertEqual(len(out), 0)
+
+        # We check we can do basic arithmetic.
+        val1 = 1234
+        val2 = 5678
+        erl_expr = f"X = {val1} * {val2}, io:format(\"~p~n\", [X]), halt()."
+        cmd = f"erl -noshell -eval '{erl_expr}'"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        expected_result = val1 * val2
+        self.assertEqual(int(out[0]), expected_result)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
