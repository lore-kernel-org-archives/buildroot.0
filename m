Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9F606D802
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=emWhky7M;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=WnyvLA2n
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F3C6077A;
	Mon,  9 Nov 2026 13:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9KCAaDk5PGFp; Mon,  9 Nov 2026 13:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 161B5607B0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794232604;
	b=YxtnEyqZJlyY63nlD4QiRjkbPekQnSP6AZ7bNrpA6tTPaET8Q2y7yXLUbYNRJ0b3KM5e
	 XfyARkQJY3yE021hKeRkK5kgR33UeFLyqyxW+BHiTeGMnbTqkTgpkULWnQysnd1vYE+JG
	 N2Wed1ibIXF3XyEIVhjAcYyd7mfO7R8IS4eEUhFAOKmFgr1B5jA7Oegwway/mY3ZHSmNI
	 RT7aYNaayft9iWFqtFzvh6NCkObBsgUnJ/k2JOJ5iZO1H9fu8VdgzzaXL7PbWLak3qoqa
	 y8vAbqo3e4rhhho3ZQhU/dx0AAeogYaC/ZrO5/522eEXJtYs+YwmsVuZNCN93kFdbcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794232604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CFBx+Ae/xBAheCZK023jWrI8LLd2Xd+kn5HSnsjWIYA=;
	b=aIE26E6BlER5mUjyCL9VGNz5OhF5VOh6qv8+FLb5h23y4MdRRY62HahjB5uTbOAqh1qe
	 SuiH3sU2YJdtzvRqqS98SqxLDf9vXjbG178CUeooJ0Nr5V6iy3tuDSP/6aAM1BZTvN40C
	 v6hZdHkx/FlnAYYWJwtXk+Tn7bPuZ8/S3aGT22EnZpfUysG0Ue2f2TIzPzG0mXNBhEHsW
	 w1cS6FvoQR5ijFtHV9F1hWJIuj21jgCGewXYpVlfnKFbt96V8Rhknbs3hkpW8W65XbsE0
	 PrlBYyNar8LVR8E90EJ9T1OQeT7nqOxgsWjm1pC5K3f4HnGHmSzV0iQVxOp0Bd2R5Mg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794232604;
	bh=CFBx+Ae/xBAheCZK023jWrI8LLd2Xd+kn5HSnsjWIYA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=emWhky7M5IFN0VSKQkwPCEO8ucVB6Ltmr17rGuFHVuqv8CoLNNjHcsV4+GdhfTTY/
	 q9iQo9QRDdJ0KDPd7aYgt8yeN9hjK6Zo9Lvy5oRTH5BFghDMY43vi3/UQ+3IkUJFNL
	 NrmcUoAyGJST4BRepGt+6b4U7lcIW4GTu8NpJCYJ3Ya4jLZNBLmJaYHVQCXqUJ6CHs
	 isYt2EVl1oRVhkDtDtxy3dyGNlzSoSl2+2kIGtG7NKYkMgWEb8lUXkV+CVVW5M1nzx
	 /JwNRZX36QWgakliYDhYao2saZR2aCX3G5kn/aWTgseKLAYyrn+9PZcKLUpo2oCZkF
	 YrzK/p5gWKdjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161B5607B0;
	Mon,  9 Nov 2026 13:56:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F087F361
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E15F180F91
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITSG9D1B52Po for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 13:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C5C3180F90
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.146
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=WnyvLA2n
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5C3180F90
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 13:56:39 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id QPrQxuKOuyeI3QPrQxN7at; Mon, 09 Nov 2026 14:56:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794232597; bh=S7dsf7uW+AbkpCNeajhtFQ0NQ5TWV/zK+TivuIjCRzo=;
 h=From:To:Subject:Date:MIME-Version;
 b=WnyvLA2n7f3q060Qzt+lbtBlJvniK6A4aRVYb+TJRvxjo3GlJ37kALD9zMvXpUOPE
 nkjWaOISk4O272XesBKgp0trGuoOHSNXqKhcjC2VEnTImqR5EftKxSvRLBZ1YQXgZY
 S6a5xpPCQrm4TO0LTy5ONDdowL9fAEj3AvuFgZrrHVLPRQP4MwSfArlpQMJjSE+WGS
 EjLt8rTT5Q9fEHUJLF9FHIrJkxEEdeTqYoAP/hjGg9kKEZMrFs2eTTZrfqI4vkbgLI
 1MsLTZibC4L9p2c27gRUal3aigEZ2BELTH3NVjgOTNj2NA+Fc8mm+aMkAzn5hdUGQo
 JK4LeVK9PW2YQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Romain Naour <romain.naour@smile.fr>,
	buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Mon,  9 Nov 2026 14:56:35 +0100
Message-ID: <20261109135635.2181005-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGNaB91uA4xN8Q9T/ppDzxxPsKEX//Ao2H7obXxVuXxkgd/oar2LfeTtTdjILdWqmounRcv3xcNH55rxO8PHbSWtMWK0kssewuSWv7871tNYzuc/yZDE
 MsXvcHOHPdn+tu/mUULBOoEYpAq6JK1wi5oCVgajdSK6qBQihvvw/w1SowgRRd8YEhdXE4Y3EO0wEeUHgnFQbmIR2lxZRnNM/BF2ZRdRNKPFznw4i4jhjJ4q
 DtCm0efAg3HU5cPVVL7zuPbrXwsRjQ/xYDNaOCT4dBATqZTvxerCuyxBcLaAMc5uUILdgttGnUyVVtT1Xei2dV9SWxFTWNUPDTR/YsVJ6VdJXczGUhB0syUZ
 oifehFpfn7zQvSjGKMr7speC8CKheA==
Subject: [Buildroot] [PATCH] support/testing: add swupdate runtime test
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
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a runtime test for swupdate using the default swupdate
configuration.

An SWU image containing a single file, installed by the "rawfile"
handler, is generated at build time with host-swugenerator. Since the
default configuration has no crypto backend, the image is generated
without hashes.

At runtime, the test checks that:
- the swupdate daemon is started by the init script,
- the embedded webserver serves the default website,
- a dry run through swupdate-client does not install anything,
- the SWU image is correctly installed through swupdate-client,
- an invalid SWU image is rejected and the daemon keeps running.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_swupdate.py    | 46 +++++++++++++++++++
 .../tests/package/test_swupdate/post-build.sh | 14 ++++++
 .../package/test_swupdate/sw-description      | 16 +++++++
 .../package/test_swupdate/swupdate-test.txt   |  1 +
 5 files changed, 79 insertions(+)
 create mode 100644 support/testing/tests/package/test_swupdate.py
 create mode 100755 support/testing/tests/package/test_swupdate/post-build.sh
 create mode 100644 support/testing/tests/package/test_swupdate/sw-description
 create mode 100644 support/testing/tests/package/test_swupdate/swupdate-test.txt

diff --git a/DEVELOPERS b/DEVELOPERS
index 848307a0ba..e1f629ed34 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1373,6 +1373,8 @@ F:	package/wilc-driver/
 F:	package/wireshark/
 F:	package/zlib-ng/
 F:	support/testing/tests/package/test_swugenerator.py
+F:	support/testing/tests/package/test_swupdate.py
+F:	support/testing/tests/package/test_swupdate/
 F:	toolchain/
 
 N:	Graeme Smecher <gsmecher@threespeedlogic.com>
diff --git a/support/testing/tests/package/test_swupdate.py b/support/testing/tests/package/test_swupdate.py
new file mode 100644
index 0000000000..7092cb3309
--- /dev/null
+++ b/support/testing/tests/package/test_swupdate.py
@@ -0,0 +1,46 @@
+import os
+
+import infra.basetest
+
+
+class TestSwupdate(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_SWUPDATE=y
+        BR2_PACKAGE_HOST_SWUGENERATOR=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(infra.filepath("tests/package/test_swupdate/post-build.sh"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the swupdate daemon was started by the init script
+        self.assertRunOk("pidof swupdate")
+
+        # Check the embedded webserver serves the default website
+        self.assertRunOk("wget -q -O - http://127.0.0.1:8080/ | grep -qi swupdate")
+
+        # A dry run must succeed without installing anything
+        self.assertRunOk("swupdate-client -d /root/test.swu", timeout=30)
+        self.assertRunNotOk("test -e /tmp/swupdate-test/swupdate-test.txt")
+
+        # Install the SWU image through the daemon
+        self.assertRunOk("swupdate-client /root/test.swu", timeout=30)
+
+        # Check the file was installed by the rawfile handler
+        out, ret = self.emulator.run("cat /tmp/swupdate-test/swupdate-test.txt")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello from SWUpdate!")
+
+        # An invalid SWU image must be rejected
+        self.assertRunOk("echo garbage > /tmp/bad.swu")
+        self.assertRunNotOk("swupdate-client /tmp/bad.swu", timeout=30)
+
+        # The daemon must still be running after a failed update
+        self.assertRunOk("pidof swupdate")
diff --git a/support/testing/tests/package/test_swupdate/post-build.sh b/support/testing/tests/package/test_swupdate/post-build.sh
new file mode 100755
index 0000000000..ea08c863ae
--- /dev/null
+++ b/support/testing/tests/package/test_swupdate/post-build.sh
@@ -0,0 +1,14 @@
+#!/usr/bin/env bash
+set -e
+
+SWU_SRC_DIR="$(dirname "$0")"
+
+# Generate the SWU image to be installed by the runtime test. The
+# default swupdate configuration has no crypto support, so do not
+# store hashes in sw-description.
+"${HOST_DIR}"/bin/swugenerator \
+	--no-hash \
+	--sw-description "${SWU_SRC_DIR}"/sw-description \
+	--artifactory "${SWU_SRC_DIR}" \
+	--swu-file "${TARGET_DIR}"/root/test.swu \
+	create
diff --git a/support/testing/tests/package/test_swupdate/sw-description b/support/testing/tests/package/test_swupdate/sw-description
new file mode 100644
index 0000000000..b38a04860f
--- /dev/null
+++ b/support/testing/tests/package/test_swupdate/sw-description
@@ -0,0 +1,16 @@
+software =
+{
+	version = "1.0.0";
+	description = "Buildroot runtime test update";
+
+	files: (
+		{
+			filename = "swupdate-test.txt";
+			path = "/tmp/swupdate-test/swupdate-test.txt";
+			type = "rawfile";
+			properties = {
+				create-destination = "true";
+			};
+		}
+	);
+}
diff --git a/support/testing/tests/package/test_swupdate/swupdate-test.txt b/support/testing/tests/package/test_swupdate/swupdate-test.txt
new file mode 100644
index 0000000000..924abe196a
--- /dev/null
+++ b/support/testing/tests/package/test_swupdate/swupdate-test.txt
@@ -0,0 +1 @@
+Hello from SWUpdate!
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
