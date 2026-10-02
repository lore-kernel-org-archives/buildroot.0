Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8882CA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 07:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17A616082E;
	Fri,  2 Oct 2026 07:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkH7Q7s_cx5V; Fri,  2 Oct 2026 07:59:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 036256080A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790927972;
	b=j5POvxXjLAfyCA1gbOiOlPAuWoNnbMbG8eihkRK/Dp5jKsuNCSZag/1RJh6ANqAYt6X4
	 6KGwFclxpH9EowweZS/bu8uKFqZRqMWTrbfVPBoRuTujBXxhvNGZvwTLJtSeVEaxKOlnv
	 9BvDRHoXTMN5pWFtS0D/I8cfm+RNa0baduv6dK/hthh4QngBSGbXKNRgWuM/GIfpy/uZZ
	 XahZEI3d3Zvy6zgJ2O4oQd5H1/f0Ce1178HNvrBBvf5Ufewx10Xd2DKI+Jfd40J59G8Vd
	 aM6KN+BMsBIlyRIFE9Tv3/TgpJPlGN+oBFxQLgNKJ7Eslk9bn1A5univqnfkRM7QezA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790927972;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LHQUui9T0aBYVAr+bdt4fBVWrG6o8spohLeiPQ2o+IY=;
	b=OzrJ6VvfD7EdD8djSX1GBJKGkVEniW6V4VNTiLiwW3ntxA0wxgIIhSoldXtB4TMlS57+
	 ZSsg1EoWjaed8TvMHIIhsTGRpAkXygJdsOyU/DpE5TOSveahVASmxMruIfi4UDMxcwNYG
	 5J6tusS7zhW6I3zUG3O+s2HreCbs4/TtnoLBJHTR3M7TXLBdXCHtWwvwDxH2E1JPNXIMQ
	 98ev9fJ7hr5OAk2u6WEHpBykkfJ4/MsDBjVUVxZuKP2ZYJaP9mwu9R0280rjdK18DErdC
	 HqTZ1hrP+Y6zNP3ikuJ7xk9Qu1xAcbn38VjZWkPl0tJa6jCMN6cm6dvTqP8+r9KSFBw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790927972;
	bh=LHQUui9T0aBYVAr+bdt4fBVWrG6o8spohLeiPQ2o+IY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Kl7GKZCi2kBUbcrFSAujYd0sOVPjyZMB7vi/tkwJ+y0C/7Dtpkv8KBRshCafPPg0l
	 qqPZfjmjTqWvRlaKgONpxT5pE9MkjBC+4RFYRP4g5dp1zURMxsJVNi8NDowUhkWENt
	 WVqf5Mqf3BM/r54pIQA6JNxMbFCHAnj0YLSP/1Q26nhc6jO/+bnLtfddH4yQ8Y1/wo
	 ujbt4yFwXKy/RLwEwYp5iKcwuK7cl10z+KsGtkAaYeJVsfZQrG3URZR9Xf/M9/qMVf
	 LKOJQXNS88l2avqIZX3jDYHUwtEi7DoMiBL5H7L+4mqGn/ULwZRquZf4okm6PQkb71
	 hSI6ionZPRAmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036256080A;
	Fri,  2 Oct 2026 07:59:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E75E1A6
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F39606080A
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyEehHyTra5s for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 07:59:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AF983607FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790927970;
 b=XyLIseWfVLwHcPL53oqCt/EBwirEy1UqU2h0DryQLvbzPuJFNqS3rvb64ESELX1Xf2iO
 v3UAA6gkCdCPrjaWQZFm1AJtQ6fomn/sNP3f2jXbnIDCWE5VI/tMSJs6ionc8RtJRPITz
 Kr1wbNxotHHE1Jn0l7jdKllLKmLOtB72vQwUaqZRZiQupHAhGNgqtpXGKdeEynhYZHW5j
 5PRXGgXx24GLgJPV/fS/OjlAywE697OZpVjKLRWDTQAPnndaMAPXubC+4mdo589eE6DFX
 ybIMIa84F+p3EkHA+n8VZn45u33MzfdS9yQ+IyFNXjmjuS/leT32QDC7sz+nENizREw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790927970;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=gTCXdAdZVRCibj53457LwkpaWJTbVCi0Q2s4YYTcc7M=;
 b=U7oqK/v4EKL6F50XOZo0yiHDtnkzXA8eNwsvVa0SMuC+tDOimPNAKCeR4uwFywxOLSDJ
 J8TIQJjwRL1RBq0vecbeMbbjXyXhmBiQzRls9Yc4OlXQ6KSIIgMvH+bk8YqyCPeq9bsME
 zie+49KYtxtxOb/uRCx+ZU/KuvDhNQfsAyo+L3SYJs6duKm6IvhbrMjEd2ngCzCjBdEVk
 P25wsxLTUAVaVAzWfUsc6ltd77yDaev1xiWOpkVI0koAUItJhxxWAG9fxakerLRGhVRHS
 aWi0cGiAoBA/DREExvvxGgKwC5F6yaeGiQQKV6gGF5Ud2G7+9zS+hL4V6beHBvbPsVw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b="rujpLnA/"; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF983607FF
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:59:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D35EB1814BC; Fri, 02 Oct 2026 09:59:25 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 09:56:30 +0200
Message-ID: <20261002075640.2350126-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 1/4] support/testing: sqlitecpp: new runtime
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

build and run an SQLiteCpp example to check database writes and queries.

Assisted-by: GitHub Copilot:GPT-6 Sol
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

V2: use correct path(s) in DEVELOPERS

---
 DEVELOPERS                                    |  2 ++
 .../package/br2-external/sqlitecpp/Config.in  |  1 +
 .../br2-external/sqlitecpp/external.desc      |  1 +
 .../br2-external/sqlitecpp/external.mk        |  1 +
 .../package/sqlitecpp-test/Config.in          |  5 ++++
 .../package/sqlitecpp-test/sqlitecpp-test.cpp | 27 +++++++++++++++++++
 .../package/sqlitecpp-test/sqlitecpp-test.mk  | 19 +++++++++++++
 .../testing/tests/package/test_sqlitecpp.py   | 25 +++++++++++++++++
 8 files changed, 81 insertions(+)
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/Config.in
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/external.desc
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/external.mk
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
 create mode 100644 support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
 create mode 100644 support/testing/tests/package/test_sqlitecpp.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d62bfaafb3..db5fe9b5e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2464,6 +2464,8 @@ F:	package/protobuf/
 F:	package/sdbus-cpp/
 F:	package/spdlog/
 F:	package/sqlitecpp/
+F:	support/testing/tests/package/br2-external/sqlitecpp/
+F:	support/testing/tests/package/test_sqlitecpp.py
 
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/Config.in b/support/testing/tests/package/br2-external/sqlitecpp/Config.in
new file mode 100644
index 0000000000..586f1dfa5a
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_SQLITECPP_PATH/package/sqlitecpp-test/Config.in"
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/external.desc b/support/testing/tests/package/br2-external/sqlitecpp/external.desc
new file mode 100644
index 0000000000..003e033127
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/external.desc
@@ -0,0 +1 @@
+name: SQLITECPP
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/external.mk b/support/testing/tests/package/br2-external/sqlitecpp/external.mk
new file mode 100644
index 0000000000..b5db18b281
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_SQLITECPP_PATH)/package/*/*.mk))
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
new file mode 100644
index 0000000000..d83b99bad8
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_SQLITECPP_TEST
+	bool "sqlitecpp-test"
+	depends on BR2_PACKAGE_SQLITECPP
+	help
+	  Test program for the SQLiteCpp library.
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
new file mode 100644
index 0000000000..d888a9a392
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.cpp
@@ -0,0 +1,27 @@
+#include <SQLiteCpp/SQLiteCpp.h>
+
+#include <iostream>
+#include <string>
+
+int main()
+{
+    SQLite::Database db(":memory:", SQLite::OPEN_READWRITE | SQLite::OPEN_CREATE);
+    db.exec("CREATE TABLE fruits (name TEXT, color TEXT)");
+
+    SQLite::Statement insert(db, "INSERT INTO fruits VALUES (?, ?)");
+    insert.bind(1, "Banana");
+    insert.bind(2, "Yellow");
+    insert.exec();
+
+    SQLite::Statement query(db, "SELECT name, color FROM fruits");
+    if (!query.executeStep()) {
+        return 1;
+    }
+    const std::string name = query.getColumn(0).getString();
+    const std::string color = query.getColumn(1).getString();
+    if (name != "Banana" || color != "Yellow" || query.executeStep()) {
+        return 1;
+    }
+    std::cout << name << ": " << color << std::endl;
+    return 0;
+}
\ No newline at end of file
diff --git a/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
new file mode 100644
index 0000000000..da557ad874
--- /dev/null
+++ b/support/testing/tests/package/br2-external/sqlitecpp/package/sqlitecpp-test/sqlitecpp-test.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# sqlitecpp-test
+#
+################################################################################
+
+SQLITECPP_TEST_DEPENDENCIES = sqlitecpp
+
+define SQLITECPP_TEST_BUILD_CMDS
+	$(TARGET_CXX) $(TARGET_CXXFLAGS) -o $(@D)/sqlitecpp-test \
+		$(SQLITECPP_TEST_PKGDIR)/sqlitecpp-test.cpp \
+		$(TARGET_LDFLAGS) -lSQLiteCpp -lsqlite3
+endef
+
+define SQLITECPP_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/sqlitecpp-test $(TARGET_DIR)/usr/bin/sqlitecpp-test
+endef
+
+$(eval $(generic-package))
\ No newline at end of file
diff --git a/support/testing/tests/package/test_sqlitecpp.py b/support/testing/tests/package/test_sqlitecpp.py
new file mode 100644
index 0000000000..59844d4628
--- /dev/null
+++ b/support/testing/tests/package/test_sqlitecpp.py
@@ -0,0 +1,25 @@
+import os
+
+import infra.basetest
+
+
+class TestSQLiteCpp(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/sqlitecpp")]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_SQLITECPP=y
+        BR2_PACKAGE_SQLITECPP_TEST=y
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
+        output, exit_code = self.emulator.run("/usr/bin/sqlitecpp-test")
+        self.assertEqual(exit_code, 0, output)
+        self.assertIn("Banana: Yellow", output)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
