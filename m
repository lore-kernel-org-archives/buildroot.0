Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C37606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N4rbfZKn
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25C9340D82;
	Fri, 30 Oct 2026 14:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ez5617YYDcTm; Fri, 30 Oct 2026 14:19:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 35FC840D6E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369986;
	b=UFOYDSakXxRnKm4D9dz/4TTzBuNXv8Qxc1+0GbmYHdAMNbrsJIW7jgXfBc+IwcVAZArU
	 6caYAR63Zl/a8eENi1YbGyqChIpjDpw5ti3x71WeDKpg4HAu7reGaFh8bbClEcRAZVS9U
	 ot8sGo+2GXO+LgsWenkIMsUEOF9wadRxbjkhsIfcsi3xlMrCJWZytxAFnhuzQFa1jjfuh
	 0d3zB/Q8fTRSmYlc7uWHTDFTRblLOB6GpcFKVWFuCCpE6hovrds7iXj2qxKVdqm7uW9+J
	 L86pXaVrCd7GOa+U3SSuNSIO9O4+iD79x6KMQWlPdXuibNyve5JrGCLmhcfG/Rf5K7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369986;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2rQnX/rvbhQP97AyDdHm8HcOrVRkOlBbPuhld97/aLE=;
	b=ZPv2T0XBazCEIlvqX9elxxXC+1w/vGEKWPnYjhBefs0I9Q4oYu3G7bnwmlOed8ZdtSbm
	 SHN3ZdaWwOtYF6rHsgxpXinm4GDTlOcX3oMQKKDqN8PEO5rIk6j4v0EWke+RKIm5tt6Vh
	 PQuYYLVkSqgcw04WHKXeu8ozngVFEOes8sGPdKOmBoknMu/tj47Ap9uSg4c/dgfXCwPtY
	 z9w2mP9GcIB4TqPgliWogyBWM2q5yzRWNClnQ84+VDrCSdM5osuhaJBrgnLXyfcxoP1vF
	 Lt0qKGYSKUhCljK43ylorJD6WRaEUUp3fga/5/fZ7F8CCjdk6B7oaOzmK2KM/TMQ10A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369986;
	bh=2rQnX/rvbhQP97AyDdHm8HcOrVRkOlBbPuhld97/aLE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N4rbfZKnP/4RVnju9CnElbWrbCAKi69kLmDvYCXKh5jBbDmxAngPlcxuD/CHQHFdQ
	 JrsqlvsDmQZx/EZUCMeaRFpDFeA/6RgQ3+5gfPYzjPMie/Bux0ZOKA6YvhPyTUCX1/
	 k96CLuFbcR70dL96xyhySHCXCnt2RK39IGdDK9Ts56JCy7/lN9+NbelFico9a1XNz+
	 jhJgbcegCou20WoEAy7ibqpNq7zEHinVlvI5DhCcpFv7tR1N5XMBEpdtpyEaLIxu0W
	 0bMGjjcPFZXQ+YxNeM/WFKfxu32VJdg8vNvaZSA03JxF+1PDex0KSNRDLtAobm2vRH
	 IVvfcnII/07Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FC840D6E;
	Fri, 30 Oct 2026 14:19:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 552B7712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 469FF40C30
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USmmfgtVnDMU for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C67DC40C06
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369892;
 b=eKfdT73arRSO9k2xQNlzG77cAmTg9+PYHXhV/MF24eU5lQF4WamsL6MNjp7X5ArDgs3I
 /4fIRhg5ctd3NRU/xTYsF5KPIOpF9SBhY22inWvJWeSlPV1vLIbfM3CYJSq33a5ITENBy
 5Jh+ne9tXTe8WNyh6VEr5aisCDmu3wF/2/i5Q+mhm3P9FwmXj/yJgFc/YincxUGQlqe6t
 NUySU0nJwWQgVgAj2MwdA36i8ww8IRPukZw3G1GhVO0tMFWZaASaub4p4afosdJg0LJWj
 AiyuJJW2NZshrw0JG7EyVyvfW9OrjxxG6SiVOTz5QNveS4ZyD5j4gZUJSIhJqqsp6JQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369892;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=faAr3FE91UM83UwO429ent1c3tkZYiggFwzCqtQ5yuM=;
 b=nViL6pzOihgwzgNFJxP6CyyS1jctkrWjr6Fkss23aEA/ztSA3tYSy5vp0qGM1c2iu6Pl
 xMRPlGC2yKakIHU7xGxC7fgYvcUNWNGAnJ19gK3v9vcD/AMoyU+abKHGIkGHNMmK8J50i
 SoVRpjlhQ6QsSP0dJy4LCH6hSXNPb5M+KIp0bWHOj/c4Dzmv1kSAm7FZisbM9PM86HCEJ
 YBULhIwDrpVLMOgwFzGm8W8wry7YgMpuRGpEo+/TRQG2t/Q+J1xvn1pRyeyQHnQEywgDY
 fgmMXgGM+MAZC93H/ZVTGGkDF/CKNxvNRZTr4mYOW9nbba3DbQM1H06SPoIOq9UEo/g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C67DC40C06
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D69639D388; Fri, 30 Oct 2026 14:16:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:08 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d55adba6e1b3a5d1b759c55505885e44b6635861
X-Git-Newrev: d46b61c25af9900450839cf8b266f144c53e81ca
X-Patchwork-Hint: ignore
Message-Id: <20261030141644.D69639D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
 support/testing/tests/package/test_fluent_bit.py: new runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0573011336623031997=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NUMERIC_HTTP_ADDR,PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,WEIRD_PORT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0573011336623031997==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d46b61c25af9900450839cf8b266f144c53e81ca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c30740a15b9cf72e70de56fbc7ee9ef42a5cee20)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                       |  1 +
 support/testing/tests/package/test_fluent_bit.py | 46 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0db657b308..626a2787b4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3222,6 +3222,7 @@ N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
 F:	package/libsoup3/
 F:	package/yq/
+F:	support/testing/tests/package/test_fluent_bit.py
 
 N:	Thomas Huth <th.huth+br@posteo.eu>
 F:	package/ascii-invaders/
diff --git a/support/testing/tests/package/test_fluent_bit.py b/support/testing/tests/package/test_fluent_bit.py
new file mode 100644
index 0000000000..825e4ec6d2
--- /dev/null
+++ b/support/testing/tests/package/test_fluent_bit.py
@@ -0,0 +1,46 @@
+import os
+import json
+import time
+
+import infra.basetest
+
+
+class TestFluentBit(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_FLUENT_BIT=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Enable the http server
+        cmd = ("sed -i 's/http_server  Off/http_server  On/g' "
+               "/etc/fluent-bit/fluent-bit.conf && "
+               "/etc/init.d/S99fluent-bit restart")
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        # Give some runtime
+        time.sleep(5)
+
+        # Check the uptime
+        cmd = "wget -qO- http://127.0.0.1:2020/api/v1/uptime"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        uptime = json.loads(output[0])
+        self.assertGreater(uptime["uptime_sec"], 3)
+
+        # Check the metrics
+        cmd = "wget -qO- http://127.0.0.1:2020/api/v1/metrics"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        metrics = json.loads(output[0])
+        self.assertGreater(metrics["input"]["cpu.0"]["records"], 0)
+        self.assertGreater(metrics["output"]["stdout.0"]["proc_records"], 0)

--===============0573011336623031997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0573011336623031997==--
