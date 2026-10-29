Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ADF606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pUC3nJ1b
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1FD440BBC;
	Fri, 30 Oct 2026 14:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4H-3zQ8BeaLn; Fri, 30 Oct 2026 14:06:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DED8340B41
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369219;
	b=aj494B4DgrEE0UcfqPaPZWHKUHMHlPKBCB3BWT9H9e51TfXPZWAvhQPtKG3ubGoVrIMV
	 6FPxRCfM60/yEXn8r1+ivcEDuyIJ0L4JL2S8x04Ya2vpiXB1exLKFMonRNGShqT5uGbEj
	 a9S9V9HW8SWS3bOoNV8gjzaj5cLouah6wjQ46Os25BOxBFKN6BTbOucCetUr7TUMM5pJt
	 eG7J/DwyhsQXQHtTNwyvk8cxRw0fd21fsXHTT++h8VCMJdO7t50w0408anV8I0N3wYlI7
	 xW242wGIkggqNuaKO6LjLtiLUlKNinyjW+3IUr7juC/Yt9L3X3dCIbBJe3SdBcSF09A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369219;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+o+xWgnj7CgUNZcfvlNV6DBOvmuMZo4g87K1SfqS1oI=;
	b=YOrwJ6jz12KJ0j2UNrg3qx12f6k15n0kAuV3QBM7FtiD6v6dq6dJeY+4szZK8q3dVw3H
	 Zv13+oOF7Jpt63UXDtYZxEzgGyzISiw6kQN6Qb/rstZVfJtsfPWmPGcj1wC2HVOJpbdGl
	 pSbVdUccsPvt6SJ66K2AsY7G3kXo6IUHJvSA0z0dN4JB1p7VeFOciRSIgOtpYCZ5lqjnt
	 VuRThPBZeV6SykBrBuwktDwGr6/tCkPUgJ5JY52AONmnu3lyzArkQRtQMs9hZBhv929fJ
	 54JDs5EZUNbeVQxk9Ju4nDKWQ7j2pFmxnQzLnVKiPsOfA5yOpDi/NcrroNmreDnk+ug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369219;
	bh=+o+xWgnj7CgUNZcfvlNV6DBOvmuMZo4g87K1SfqS1oI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pUC3nJ1boFdBUf81FnkJnKG8lp+JqEpcB6GACbsN7w13qRmtLEP0sHaFNWxXZByaM
	 VZxfK20l+P8VegL/pt5DSDHdVi0KqkPr5wAODcJtHMxVMmnZlqlo/X23POPqF0+0lA
	 F8lmx2drOq20eomQ9LmmRkdmPUgbnpaTnfRD5zse+KLkqOBzBswUXh+gJMC1r9DMh7
	 6wU8DwqHNIVZgXFUXqM814w9tfCe5ZEUL+VoNWmN1jZINwLf3GiI1OXWq/880tbYnh
	 KCuYzLDfQr7j0ZgHS5F4XQZjaIIlOsyHO5R+d9qpFunnqn4Xi9mmizZdaq+Wx92v4J
	 IYT7uPyHZ5oxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED8340B41;
	Fri, 30 Oct 2026 14:06:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBD5CD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6E46400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dfPw72it4jTJ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2361240243
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369164;
 b=g75gnbd1DvIp0+Cas+iCdjUy6goJCjgpKhdszrneAske6jKXIXESMMEdt4eBZzrJknK1
 UHnstSLwraMsgjeiJR2sSW+e78V+pr4ixi9c2jwrMWx+N32LtFKmOazr5HoVBWHCbQLnu
 JQRhce6uzGFO6cWWK4zSgeCKr6ODQNuyHUHFf/RqZVkUUqiBLsLXcUveg7co8TgQ+46RC
 cDh4Cg3tmUwzbVqLUYTWsCNu6EottofG8bhXtgSqIWddxsKepG2HkVuKzgactDBbKCnT8
 N4HMab/jXG318+q6q1V1GzmnlsZ7yKyJ6Bx8bB9h4x41H8oWtPnmhBoSSG46Kts+Sig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369164;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eApmDAA55gwW+gqGpqy1LfJ8IjtsP1jbzg1YoLka4Oo=;
 b=o4sXPABXxkc+8jBgtP0UQ3kLriysXchUWmkrvoxoUnTpXzj76xJUYHpG4BV8BJ5auIWS
 ZlhbXFi575VB6twD+KiRGMu2B06jGwC+xph5nKGL+6zJgftrw1KxbYaHqEB3MP1eKfjRp
 EMhyAAI078OzHmo0R1TV7BLmtYCPr5W61rLEUDv7G+QtJWy+FYI/cNGhCBCHP7cHV7pnW
 WvRGVRnT1o4F4CFhwtop+AatQY8mK4IJ9zFqqK3nn9S3bbbdfqQHpqhjmBya510sNeYcU
 bFDXgiJKu5xVcI38qaxZUWCuttUCd6Iey5HLJTHlYpCd4MHgjTUyxqD4i84XLnGMo9g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2361240243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35D479D388; Fri, 30 Oct 2026 14:04:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fcd8af927c954aa963a812fefb874bc8143ed8c4
X-Git-Newrev: fcec79d24dddeac6fd1b5d30082c13a0ef9fa41e
X-Patchwork-Hint: ignore
Message-Id: <20261030140436.35D479D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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
Content-Type: multipart/mixed; boundary="===============8868294081017549180=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NUMERIC_HTTP_ADDR,PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE,WEIRD_PORT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8868294081017549180==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fcec79d24dddeac6fd1b5d30082c13a0ef9fa41e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c30740a15b9cf72e70de56fbc7ee9ef42a5cee20)
[Raphaël: fix conflict in DEVELOPERS]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                       |  1 +
 support/testing/tests/package/test_fluent_bit.py | 46 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2b630def79..f7b2d6859f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3107,6 +3107,7 @@ F:	package/vuejs-router/
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
 F:	package/libsoup3/
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

--===============8868294081017549180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8868294081017549180==--
