Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FDC60A2607
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hTK7sZuj
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDFCD8165F;
	Fri, 20 Nov 2026 09:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDFxDTfniBO3; Fri, 20 Nov 2026 09:51:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C5C928165C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168265;
	b=LGfaP+OxDEPXE8btysKoL5axUG/RcFNiWEuKw87kPXyC65ofaaycDvA2PjBJcr2L5FGl
	 fu+fzxiGmo14J3+BH+tyfO4OsdTRIfNAl++xIBzIFWDocENpVjXrEybbQYrTkQgXjndqW
	 w65z1LOqEgv/0Hkx5GrmW2Dy+qdStytIZDgLazaYFHiwPY9SYBcUYUJAhgbWGgJcV/yL5
	 MXnXrZzzmnhohiU1UshZ49NfrztrFpOhp++AblH2AJ5kGkwdAJHxKwuXqCXE6oeqSaeFC
	 3X7wbpjXXXtuTdgKhCYGHGpZvNSO7P0CXiqQWxvyY487ZxKMoxpMWHufsntcTMLfxWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168265;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2O6v+LKKlDddqUDLrWNL0Ff9RMu68nKQ2nYG7L9idUU=;
	b=SYqCT1AF/OtoC5j2l3/wW32vDe345AH9gi/AjbQZEmtTZuxidGAFB+Mtqk0WJf2AVD6+
	 yFay8OioGS+eE9KIB0mNqnw262YbeCf/X5in7Gl2dkRJ5nzcZduEVt1PBfh1iIC8CQXsx
	 u8ASQdNJ/DrYot4OLj6s9q/AVSlab821DJv3RSgtrGWNCwIUTR6zQfB8houwhJs/8AxfD
	 QZ/QXHwhnmPYWvGhhRjtz5JbwwJ0Hh3uN+ZErG+bNQD3WbeotOrry8S/feUki9+rFiOkz
	 2O2HnnxJXy2KaK5mUKjve4r3fgG9u1uVPKJLXj02V1auvVo0qZFCky5+9iqnhyB24lw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168265;
	bh=2O6v+LKKlDddqUDLrWNL0Ff9RMu68nKQ2nYG7L9idUU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hTK7sZujcrEBsfByjgGpz3S1U7vsKXk4KG+5BQZhxFij3S2YznF/Q2LwlfM4ft6o5
	 TBqVoIYI29Rgayn/T+6RWL1Yn+fGukE/Y1dJCQxaUlgr22XbvPKY7iJV1YZdJXlQzN
	 a0wSyHDyYnnMvC1e9rkn3Zb8mSXR6XUkaw+SfyD4VKMmrCM8YMjPnoLmrZ9J1T3T/9
	 WbawVuJWxk2pIKjz+d+iRvJIigiinZ9vHed5oCLD5TDtvLymkSgnOjnXYj5vEnNl/x
	 B8fRv93Z0CRpN4b0+DSUURI6lqz7XEqnJYHuIh+OcGy/t7kPPGpl9LYEt+JKe2VBx9
	 AF3k1HI07p5ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C928165C;
	Fri, 20 Nov 2026 09:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B907EE22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E0268165C
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkYJUvY7g6ow for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 10EA7815FA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10EA7815FA
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:51:02 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795168260; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:XXO1FaaQh3mHciwYxpwVTT7hg9ew
 qn/jJytAOZeP2eIipepYEKEJHrIuJ3oEYeLlOYrCJZDlA9fYYNLLL49twHhm0pfyROWsOkKdaWf
 4UTGBHWM4ULxrYB8y5gpzvflKeOv3AO9m4NlQNGxhBJBrKe54YVa8yGszlSYN+BKvamrscc60hA
 6KliLFxKK5PoBKyEUcU1MhQGt6I+5UzIIrHQBSYFfMtZzqAxKUviXfP2/RJ6LI8NQYekoi284sl
 V4h13Jm/gnlFd37qonqRbkTuPKSlzVLi2wbZLS0z333aCWJsazFaUB8QWYfE1MRAjRyxKv9TJXQ
 XZ6C3QqXnL1R2g==;
Message-Instance: m=1; h=sha256: HcCVKXGP1/PwtZmyzFnsBL916YgGXr912RmNwsfL2ig=:
 rhhIcpd8vGy7EDRcZZkBFTeKo883AqyHh8gdIbwoFgU=, sha512:
 ht0OEIT0R3k3JdCWeMv7ryxtx+2sqg55aJVEZjafKZfQQ5h25NQOe6lfJzzT2i2D71EjkV+KM4v2JY/385BueQ==:
 2kBOMnZXfZUmn/zjzSqyqWnt88zZFwl5IpjxXqg0ZEskv5T623PSEW+WvdEoeZyd64HoWrHgbQPYtiugcU6v9w==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3ir-1xxrah2fSF-00Wp29; Fri, 20
 Nov 2026 10:51:00 +0100
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Peter Seiderer <ps.report@gmx.net>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 20 Nov 2026 10:50:44 +0100
Message-ID: <20261120095044.535382-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Yc5SojBmDG5jUUU1rZBkt9R06WjEoJrgteLpTmUPDMaBLqoKC1i
 VJIGJ6btOiY7uGnR2gKrhdS7eEnOqxWDksNi5SyIGW09+ljv0a8vlBWB3LQV3i0YjpjjYEo
 R9ts1iIcik2QrCf/UaG9yolgatRBbWCsHfmxAxwxgVTDAlhPWcAut7QPX8VUOquN0+IvfnA
 KQ30DBdo8TXgAmMBwCusw==
UI-OutboundReport: notjunk:1;M01:P0:UJI9loMWwB4=;weonehzGEiZSxpBBrZFze3Qxh7j
 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
 vBIdH0iIC/aFNIglZd9Hg79q9rSlbU=
Subject: [Buildroot] [PATCH v2 1/1] support/testing: test_usbip: fix with
 eudev 3.2.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the update to eudev 3.2.15 the QEMU USB keyboard and mouse both
show up as "QEMU Tablet" in lsusb output due to hwdb changes [1],
causing the test to fail because it expects to find exactly one
keyboard by name initially.

Make the test identify the device by its ID (vendor:product) instead
so hwdb changed make no difference. The unused USB mouse shares the
same ID, remove it so there is only one device with that ID.

[1] https://github.com/eudev-project/eudev/commit/27542cfe3c5f0f9e71d9e3be1f9430d00d7c8551

Fixes: f6c2c6a086ae1a5857f99514324ebf4038dab31a ("package/eudev: bump version to 3.2.15")

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Identify keyboard by ID instead of changing the expected name to match

 support/testing/tests/package/test_usbip.py | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
index 62c7b59814..7b0c26b43d 100644
--- a/support/testing/tests/package/test_usbip.py
+++ b/support/testing/tests/package/test_usbip.py
@@ -35,24 +35,24 @@ class TestUsbIp(infra.basetest.BRTest):
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
         kern = os.path.join(self.builddir, "images", "Image")
-        # We add a USB keyboard and mouse devices for the test.
+        # We add a USB keyboard for the test, which has ID 0627:0001
+        # and shows up in "lsusb" as "QEMU Tablet".
         self.emulator.boot(arch="aarch64",
                            kernel=kern,
                            kernel_cmdline=["console=ttyAMA0"],
                            options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
                                     "-initrd", img,
                                     "-device", "usb-ehci,id=ehci",
-                                    "-device", "usb-kbd,bus=ehci.0",
-                                    "-device", "usb-mouse,bus=ehci.0"])
+                                    "-device", "usb-kbd,bus=ehci.0"])
         self.emulator.login()
 
         # We check the program can execute.
         self.assertRunOk("usbipd --version")
 
-        # We check "lsusb" sees exactly one QEMU USB Keyboard.
+        # We check "lsusb" sees exactly one device with ID 0627:0001.
         out, ret = self.emulator.run("lsusb")
         self.assertEqual(ret, 0)
-        kbd_count = "\n".join(out).count("QEMU USB Keyboard")
+        kbd_count = "\n".join(out).count("ID 0627:0001")
         self.assertEqual(kbd_count, 1)
 
         # The daemon is not running yet. Listing remote devices is
@@ -64,7 +64,7 @@ class TestUsbIp(infra.basetest.BRTest):
 
         # The daemon is started. Listing remote devices is now
         # expected to succeed, but with an empty list (since we did
-        # not exported any device yet).
+        # not export any device yet).
         out, ret = self.emulator.run("usbip list --remote=127.0.0.1")
         self.assertEqual(ret, 0)
         self.assertIn("no exportable devices found", "\n".join(out))
@@ -95,9 +95,10 @@ class TestUsbIp(infra.basetest.BRTest):
         # Wait a bit, to let the new keyboard be detected.
         time.sleep(1)
 
-        # We check "lsusb" now sees exactly two QEMU USB Keyboards
-        # (the original one, and a second one created by usbip).
+        # We check "lsusb" now sees exactly two devices with ID
+        # 0627:0001 (the original one, and a second one created by
+        # usbip).
         out, ret = self.emulator.run("lsusb")
         self.assertEqual(ret, 0)
-        kbd_count = "\n".join(out).count("QEMU USB Keyboard")
+        kbd_count = "\n".join(out).count("ID 0627:0001")
         self.assertEqual(kbd_count, 2)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
