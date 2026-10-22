Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986DC606A31E
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 22:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z4PMoyIy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CC2B81403;
	Thu, 22 Oct 2026 22:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwFJbBTE5FbP; Thu, 22 Oct 2026 22:30:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3CC3D81328
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792708251;
	b=oqTlsPd8h9LUhT8X/oWDjjUKQvepAir+dQM860YkH7szio788M2gnpiEqSDppKcIVfIQ
	 KJB5oSOWKdMA9YLk5HhlPljqdr22A8PlmwfOrL67X4vVPPaxNLhhnJzkt0S/FYwOMBobm
	 Grm1puk8bQI5C3DgxoxWGtS9rL9xgJ8x6xMc3LRcpDzSIhUQ07MJvQbTSy62+8cEx8Wf7
	 bvMiW7BMIi5j2Y585DdU2vXXQMZDmm3Jdn2nxbDxfNrRjOzqSdgUA9fzwZOiZP5svFo/a
	 nWhV2xl8uwF1WfSPEIHFaFZTMghAphPjPhJfZileBOlwmKBFSFSudz+s/wQWmXiuCBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792708251;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bhVr/It+CppsA8Q/5bMz/GUFmzGUCw2B+200EknMlaM=;
	b=JyesLZ4WlsbyGBpsyieb3qiPeAYLnN+/VqQS0BTKfCZdbpJ+ognAlBQ+poeqZwOkWZNO
	 FQ5Jauv0Knvk8vDUjsh2jBHaiQaw4tQG3zH3mwrl2kQz6g3ytjW1jKjUKWyZJh3w3fOOv
	 9aNa7YmCUhdfogKR/aMLByaavpT8WSOk7EQW66y7eZgukzSL0syT9eSevjIQEKTMpKGYz
	 tFoy/hazs+Y+oAsCSLMMo38/fwdZUQ7YvEiLkZFX+YK741vhg/QCzTpJre0AtoN30gr96
	 SdrP1EJDlLrm5d9oSCOcvPH/cEZXC0hpHA4tD/EUbkUyJ/CF4UVzUOPUcw5uv1VhdfA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792708251;
	bh=bhVr/It+CppsA8Q/5bMz/GUFmzGUCw2B+200EknMlaM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z4PMoyIyBAhLr5V6uY8faB+qa4/LMOl9672jOK2FAOliaE2iwy6I+DLsrjBThksVX
	 RBNLCSqeBRQ6lrPgNHz9AGdqP4oekvZCe5sMPw0UMqWQRl9VBWMjRRrp6O5AhU+62Z
	 g1IPwQU7g6h8VJKp/nFsSeBgoswKU7z2VGKiSSWhfrjYSVu5BA6NonIAPFQI5WAD33
	 QqHay4Euyed7OPwdk+wcAfHyjjRD99D/uw/f8jblybo604tqfoQ6BZ+f55RanwU+/E
	 IYl9tl0hX7C5rlJSmGwqG8c1jpS0n2YaoqXx19F/iNOmapbhLZ3hfanGu1RaCUZZBf
	 Z8chLgkQfuKXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CC3D81328;
	Thu, 22 Oct 2026 22:30:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 050F53C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAC054040D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTZkKNhdVSps for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 22:30:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5274E401DE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792708249;
 b=RPLVPWXwKcISdTpka3I1nxhf+wiIbtarwO36D4WyOMki8an9hYNSnapDZyvJmC0e59rb
 Ly17BFXZQQuYblXnOcKIQHEDpabcbRSHQ9RFIW83el2whMmH2bn68Nc6nv6qDXfsNWu6k
 oFekuauzteW4cu7D4KmD6qKJwmi6DSz+kcrTfi/opKrOOKutTTXS/oVG35pt1l7q0HMku
 /1wFzDZ1x1xl6pEYxmvGcQIOkwKckkBavQWkn1k7qPU+BQQVWwBxDP21Sr9n6nkGUqP7C
 REuYIEioXLSLQmeKb784IiL3+8VSLo1anBWtgbZYpER43lHN1wi0RAnGrK29imwSVxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792708249;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vOes4S5y+RLLATyL0hF6UkFIbzPXpwwOQL+rtNpLcGI=;
 b=Njx3d1PrTf8UbI6OX53Nbc0wW9/RGi8Y0dc/aWnFlFSQajOZSJSmv1ypMryDjGAkzhcE
 2T1dHb6+m/RC1eTLJCAOJFZYEIgyO3zv9Kb+EjnuVqx5/exQEtpZv8/UP7fRPMt8BKwyn
 JdrrCl55eFSVUIKCNw+oe2wQLEJLEK/UUUQDf+MwncKSrWrWn0heToAPbjSZw+5EerT0A
 Cl1HCx0vkLwXG18/4X3e+rjoLhJ+pNlZb1znEQtOjbV7tBHtrvbA5HTyfod9QJ6IrtGMp
 fVborRiNtcE+lByet+t4x20F00lQThAb5PemangiSrrXVNoQtKM5fsY8In32IOogm+g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5274E401DE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:30:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29E6C9C607; Thu, 22 Oct 2026 22:29:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 00:30:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93722ec4fabdc4678447371e2eb64ca8c8b10470
X-Git-Newrev: c30740a15b9cf72e70de56fbc7ee9ef42a5cee20
X-Patchwork-Hint: ignore
Message-Id: <20261022222925.29E6C9C607@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,WEIRD_PORT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c30740a15b9cf72e70de56fbc7ee9ef42a5cee20
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 support/testing/tests/package/test_fluent_bit.py | 46 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 38c45e65c8..352308b082 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3248,6 +3248,7 @@ F:	package/fluent-bit/
 F:	package/librdkafka/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
