Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C4E60A261B
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LYuy7rAJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pnJ5hs7m
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138E2406CF;
	Sat, 21 Nov 2026 22:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBw7pMQqgINJ; Sat, 21 Nov 2026 22:38:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 07EAA40654
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795300714;
	b=PM0rcaOLldITt1s72Jyibo3ZEDSDdHgFqzLL67YBxPjT0uTowzo11wUHWBASDQumUCT8
	 8pq7GJ1vi4GpW55kca6KMbKw799tav1MYfpE2EmRNCUAOMQieNcUZIdbrf3meVDOMdyTh
	 /dUVf0lca4iSz7BEVxzpEwMnDF0MI4usjeQpE1eBuLoD/RAw4GrIlAWZZCyAwrrf/Q5Q2
	 IxkwDWaqFwKZbol346vIzLbZ6BsjdgqbtKmdoaGTHBpInmZlKosDyn/QZik8EL7UGmk0a
	 yG743xutupg6/ak1+3YxKUF+Z5gGxCE6KXMbzD6M7R4qB6510V0yZY3IyrOTJbtvW9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795300714;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ijIsKeLOvm9Rr8fiWvY0xgwkaC+r3g0VyHpR5wtti9A=;
	b=h2ud1tdHOboZXLbED1wrXc1KzEQtWJwB3hLffJPq8dpu3S57jqRIZG1NYmnLUVtHsMhg
	 r1ACCSRLJzaTBHUcg4/OQd9eimd4nMePLhKkq/Wwt45hwglZjJm26neb1J9jJw3LjsaoH
	 eOc2bQpLC5b+1c+eUhAZ+lTmYswwGjIuNKsGfhaEWihCfM8x0bzXmFqZSdKlY0qEOO9NZ
	 L07Mj5WQTnI5oLfqXEZEqz26L0RUwYIyOT6lpC4JNW9BBr8G2pcF+pCYlCQuSs2LOB1TC
	 xJSrhYjljlyu+gfXkBBMmwHTpzXmdvKq861dAU3GKWoAVm3nnt+6yZYYKSbpZx6Poqg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795300714;
	bh=ijIsKeLOvm9Rr8fiWvY0xgwkaC+r3g0VyHpR5wtti9A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYuy7rAJXfrK+pMuypYwdPCic9ntVhxw69L70QbqjT59GZb/DekVvdp/gN2zfzRwP
	 +HqkAXxgoMplSQp/jr3oyltSq87zg+pugDM6hBZmjZzVE4MLikJZngndwqFTRF2i+J
	 VLynoGlQVouiJoKn8TEi+HNJRNZk7JvmMgrZVv/NdpgFqlveIomOoqF7FfhE5zXS80
	 IqSCqCq+zByegtVlhyZ3YIIi6vi+xbX2iRfta/TnlcN3Y27SPKpHqpaphtirLPsA7r
	 nGEO/x9cZTfZIsFSjiSZ0dWuu5F5WQwZPfxaAsr9/vTloMHhFavFXUH3mZzA7Iv1RM
	 jkv/QMbZmb2FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07EAA40654;
	Sat, 21 Nov 2026 22:38:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81DB979D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BF014007B
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZwoet58rAOF for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 22:38:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5F4504010C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=pnJ5hs7m
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F4504010C
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 22:38:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-498f5fa4f70so1646203f8f.0
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 14:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795300709; x=1795905509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Fp/lWfmydUBm0mz6vqVgYJ2+nUbQGDskGCfbuGiSZ8Q=;
 b=pnJ5hs7mcrsf3Ft+2lwfmaL13WAQevBRO4nCD8G/duVu038eJVKrrjtqfge3dXZPxq
 XOZES26svFzp+2GF6Pkydml9hgcBd39JoNqqrND1KwOwPNWOMkvKOLN71caD/DrQ0+eW
 Q8c+8OOL1YebqeaymMoTMMCQPtc/5zp1VBTWlQczbqA3O2tybvL/I0ftSWs+ufxoGeG+
 VxdcHGrRGN++ULubbp9r8ddw9JooOh2NDnx1L0DQRwyyGajn9HDO/HdjlMd+p0Mzb2B+
 sGSAqDmtQ+Lq62XG7iHSftEahwmHhUuM7gTyYXvjqSfg6Af8U0lpPSTMVXw/ZvapBF+b
 cXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795300709; x=1795905509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Fp/lWfmydUBm0mz6vqVgYJ2+nUbQGDskGCfbuGiSZ8Q=;
 b=khlUT7w9fWKPZwsn2lOmNrNik6E4ogGDNZUD6p0NeHOLf/j8uRBtV2Duanj5ZaRaaw
 K/4LyWy79ClRU3ahlyRsFkfiN8lqMRHY1Z9YE6TT6vuJfZxFRrbOhEkrKFaHRZPbvBMk
 mheMz9fUJ/sBIJ4hOck5R4uKU6bBXG+XRTxQQnT6ijUAZNI63pm34a2DTzgF4eJjAiwr
 wMpZ6bVbnXQy9IX6f+3Vnc9HKO1zYKcGuk8RdkuzNAQ13kfGdDIv02NEMEn1eMjgaJzm
 RToEYmvTQvQ5c/GWohpkz5egOZcfbIvbgRr7dXouh1tdt/TrWQgjpBYdAhbyrIUU0clh
 q3Pg==
X-Gm-Message-State: APuU4Z+9fnSHtM/JHyJYTmcD63Z62FK8HZTFTxb0YgEGbXA0lAEk4jRV
 rsjzkFoPeqSIVO8lik5EeCM4htTtuhFxIdoWF7YgT7pXXxLICZjzSYUkoUmnw6RE
X-Gm-Gg: AZFdTZdAFMPyNM0xXFBgrsGsvRkIwKvs027ldTAhdL/OzFBjL4mCmvfKY3X1p6fyyLf
 yWELyC8btJPRTvVPxUJGYyjYOOW6CwvzrGUidWi1aERzAt5illhqDNVaNEcHZ0ODZwMdZKNWTfj
 P0WVajH8tjH+cwv5ld+NZTXeiX8/w3thRysRm1v40K8XpgB3YJwfNTNAz1BA7/+0oQJx45Irfb5
 WKTorW5hUY+nX8sTr8IN56IxTOgPVkFknAcP5/7+hn+nhy0WdtPxib7HVwRDRluOuqlvYfLpHxW
 9Eb7gig7O0xkjDF/5GDiRdQnqOo1jo/CivaTK38zO4YyfRZ2PBCJQnB7OCvqOwXf+KuBQfIXLt7
 diQjzuNbRTBgo1z++swqIbk5ETXt/+kug8HJzWAetS5qNCUiSMoCSSwZpr5O3i9jvhcb695l7eU
 8WjnihZM+aGAl355zpy9ij3pCWOkEEdnztv3vZnZXecV+V2N64VqSMRKO35tGbE49+mKwnfsQTk
 1SJh+rspmpVHLe3oo7EExHGKbVWBBcu6mYkOmYT+oGo0cWx8cvgrxXiRHensoTjYmf76T+gEi6r
 V2U3iTYGrRNK5bTKuij8/+fwoXKPu9LvOtf4xagMr05F9BAugrw=
X-Received: by 2002:a5d:64c8:0:b0:4a6:c5f4:cdf7 with SMTP id
 ffacd0b85a97d-4abaa976b7fmr13316696f8f.5.1795300709036; 
 Sat, 21 Nov 2026 14:38:29 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf61ddsm12319634f8f.12.2026.11.21.14.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 14:38:27 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Chris Packham <judge.packham@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Abilio Marques <abiliojr@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Sat, 21 Nov 2026 23:38:24 +0100
Message-ID: <20261121223824.420727-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121223824.420727-1-angelo.compagnucci@gmail.com>
References: <20240212021255.246556-1-abiliojr@gmail.com>
 <20261121223824.420727-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] support/testing: add micropython
 manifest test
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Test BR2_PACKAGE_MICROPYTHON_MANIFEST with a manifest that freezes:

- a module next to the manifest;
- a micropython-lib module (base64);
- the default modules of the unix port, kept with include().

micropython-lib is not installed in the image, so the modules can only
be imported from the frozen bytecode.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - new patch

 .../testing/tests/package/test_micropython.py | 33 +++++++++++++++++++
 .../test_micropython/manifest/frozen_hello.py |  1 +
 .../test_micropython/manifest/manifest.py     |  6 ++++
 3 files changed, 40 insertions(+)
 create mode 100644 support/testing/tests/package/test_micropython/manifest/frozen_hello.py
 create mode 100644 support/testing/tests/package/test_micropython/manifest/manifest.py

diff --git a/support/testing/tests/package/test_micropython.py b/support/testing/tests/package/test_micropython.py
index cc0e5854c8..fc061345f3 100644
--- a/support/testing/tests/package/test_micropython.py
+++ b/support/testing/tests/package/test_micropython.py
@@ -77,3 +77,36 @@ class TestMicroPython(infra.basetest.BRTest):
         out, ret = self.emulator.run(f"/root/zcat.py {gz_filename}")
         self.assertEqual(ret, 0)
         self.assertEqual(out[0], msg)
+
+
+class TestMicroPythonManifest(infra.basetest.BRTest):
+    # micropython-lib is not installed: the modules can only be frozen
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_MICROPYTHON=y
+        BR2_PACKAGE_MICROPYTHON_MANIFEST="{infra.filepath("tests/package/test_micropython/manifest/manifest.py")}"
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
+        # A module next to the manifest
+        out, ret = self.emulator.run(
+            'micropython -c "import frozen_hello; print(frozen_hello.MSG)"')
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello from a frozen module")
+
+        # A micropython-lib module
+        out, ret = self.emulator.run(
+            'micropython -c "import base64; print(base64.b64encode(b\'br\'))"')
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "b'YnI='")
+
+        # A module of the default manifest, kept by include()
+        self.assertRunOk('micropython -c "import asyncio"')
diff --git a/support/testing/tests/package/test_micropython/manifest/frozen_hello.py b/support/testing/tests/package/test_micropython/manifest/frozen_hello.py
new file mode 100644
index 0000000000..3f6516857a
--- /dev/null
+++ b/support/testing/tests/package/test_micropython/manifest/frozen_hello.py
@@ -0,0 +1 @@
+MSG = "Hello from a frozen module"
diff --git a/support/testing/tests/package/test_micropython/manifest/manifest.py b/support/testing/tests/package/test_micropython/manifest/manifest.py
new file mode 100644
index 0000000000..0bd5911fe5
--- /dev/null
+++ b/support/testing/tests/package/test_micropython/manifest/manifest.py
@@ -0,0 +1,6 @@
+# Keep the frozen modules of the default unix manifest
+include("$(PORT_DIR)/variants/standard/manifest.py")
+# A module next to this manifest
+module("frozen_hello.py")
+# A micropython-lib module
+require("base64")
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
