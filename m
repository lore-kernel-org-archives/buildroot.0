Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E77EC54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 15:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E90608B5;
	Sat, 28 Jun 2025 15:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7i8VYJu41njD; Sat, 28 Jun 2025 15:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E519C60AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E519C60AFD;
	Sat, 28 Jun 2025 15:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76951154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 15:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B2BE418A3
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 15:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9aEu--RB_IL for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 15:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66C0A418A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66C0A418A4
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 15:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54AED847A0; Sat, 28 Jun 2025 15:24:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 15:34:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e106d8412e35b26a7cfa5c76a264cd8ef9cb325
X-Git-Newrev: da23be6338c1e82f39475d166407f97511e0b666
X-Patchwork-Hint: ignore
Message-Id: <20250628152425.54AED847A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new runtime test for
 gumbo-parser
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0438593468240631017=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0438593468240631017==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=da23be6338c1e82f39475d166407f97511e0b666
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new test requires a br2-external directory because we compile a
small test program on the host and install it on the target, but it's
not useful to have it in the main Buildroot package tree.

The test program loads and parses a sample HTML document. Taking
inspiration from 'examples/get_title.c' in gumbo-parser, it also
searches for the title of the document just to check that we can do
more than the parsing.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../package/br2-external/gumbo-parser/Config.in    |  1 +
 .../br2-external/gumbo-parser/external.desc        |  1 +
 .../package/br2-external/gumbo-parser/external.mk  |  1 +
 .../package/gumbo-parser-test/Config.in            |  7 ++++
 .../package/gumbo-parser-test/gumbo-parser-test.mk | 19 ++++++++++
 .../package/gumbo-parser-test/gumbo_test.c         | 40 ++++++++++++++++++++++
 support/testing/tests/package/test_gumbo_parser.py | 27 +++++++++++++++
 7 files changed, 96 insertions(+)

diff --git a/support/testing/tests/package/br2-external/gumbo-parser/Config.in b/support/testing/tests/package/br2-external/gumbo-parser/Config.in
new file mode 100644
index 0000000000..28a97c1dfe
--- /dev/null
+++ b/support/testing/tests/package/br2-external/gumbo-parser/Config.in
@@ -0,0 +1 @@
+source "$BR2_EXTERNAL_GUMBO_PARSER_PATH/package/gumbo-parser-test/Config.in"
diff --git a/support/testing/tests/package/br2-external/gumbo-parser/external.desc b/support/testing/tests/package/br2-external/gumbo-parser/external.desc
new file mode 100644
index 0000000000..4bda9627e9
--- /dev/null
+++ b/support/testing/tests/package/br2-external/gumbo-parser/external.desc
@@ -0,0 +1 @@
+name: GUMBO_PARSER
diff --git a/support/testing/tests/package/br2-external/gumbo-parser/external.mk b/support/testing/tests/package/br2-external/gumbo-parser/external.mk
new file mode 100644
index 0000000000..bdc8b2fc79
--- /dev/null
+++ b/support/testing/tests/package/br2-external/gumbo-parser/external.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard $(BR2_EXTERNAL_GUMBO_PARSER_PATH)/package/*/*.mk))
diff --git a/support/testing/tests/package/br2-external/gumbo-parser/package/gumbo-parser-test/Config.in b/support/testing/tests/package/br2-external/gumbo-parser/package/gumbo-parser-test/Config.in
new file mode 100644
index 0000000000..714d3e0198
--- /dev/null
+++ b/support/testing/tests/package/br2-external/gumbo-parser/package/gumbo-parser-test/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GUMBO_PARSER_TEST
+	bool "gumbo-parser-test"
+	depends on BR2_PACKAGE_GUMBO_PARSER
+	help
+	  Test program for gumbo-parser library.
+	  This package builds a simple test program that demonstrates
+	  basic HTML parsing functionality using gumbo-parser.
diff --git a/support/testing/tests/package/br2-external/gumbo-parser/package/gumbo-parser-test/gumbo-parser-test.mk b/support/testing/tests/package/br2-external/gumbo-parser/package/gumbo-parser-test/gumbo-parser-test.mk
new file mode 100644
index 0000000000..111f1977bf
--- /dev/null
+++ b/support/testing/tests/package/br2-external/gumbo-parser/package/gumbo-parser-test/gumbo-parser-test.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# gumbo-parser-test
+#
+################################################################################
+
+GUMBO_PARSER_TEST_DEPENDENCIES = gumbo-parser
+
+define GUMBO_PARSER_TEST_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) -o $(@D)/gumbo_test \
+		$(GUMBO_PARSER_TEST_PKGDIR)/gumbo_test.c \
+		$(TARGET_LDFLAGS) -lgumbo
+endef
+
+define GUMBO_PARSER_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/gumbo_test $(TARGET_DIR)/usr/bin/gumbo_test
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/br2-external/gumbo-parser/package/gumbo-parser-test/gumbo_test.c b/support/testing/tests/package/br2-external/gumbo-parser/package/gumbo-parser-test/gumbo_test.c
new file mode 100644
index 0000000000..f9c9ca4a91
--- /dev/null
+++ b/support/testing/tests/package/br2-external/gumbo-parser/package/gumbo-parser-test/gumbo_test.c
@@ -0,0 +1,40 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <gumbo.h>
+
+static void search_for_title(GumboNode* node) {
+    if (node->type != GUMBO_NODE_ELEMENT) {
+        return;
+    }
+
+    if (node->v.element.tag == GUMBO_TAG_TITLE) {
+        GumboNode* text = node->v.element.children.data[0];
+        if (text->type == GUMBO_NODE_TEXT) {
+            printf("Found title: %s\n", text->v.text.text);
+        }
+        return;
+    }
+
+    GumboVector* children = &node->v.element.children;
+    for (unsigned int i = 0; i < children->length; ++i) {
+        search_for_title(children->data[i]);
+    }
+}
+
+int main() {
+    const char* html = "<html><head><title>Test HTML</title></head><body><p>Hello World</p></body></html>";
+
+    GumboOutput* output = gumbo_parse(html);
+
+    if (output == NULL) {
+        printf("HTML parsing failed\n");
+        return 1;
+    }
+
+    printf("HTML parsing successful\n");
+    search_for_title(output->root);
+
+    gumbo_destroy_output(&kGumboDefaultOptions, output);
+    return 0;
+}
diff --git a/support/testing/tests/package/test_gumbo_parser.py b/support/testing/tests/package/test_gumbo_parser.py
new file mode 100644
index 0000000000..efa8ec91a7
--- /dev/null
+++ b/support/testing/tests/package/test_gumbo_parser.py
@@ -0,0 +1,27 @@
+import os
+
+import infra.basetest
+
+
+class TestGumboParser(infra.basetest.BRTest):
+    br2_external = [infra.filepath("tests/package/br2-external/gumbo-parser")]
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_GUMBO_PARSER=y
+        BR2_PACKAGE_GUMBO_PARSER_TEST=y
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
+        # Run the test program and check output
+        out, ret = self.emulator.run("/usr/bin/gumbo_test")
+        self.assertEqual(ret, 0)
+        self.assertIn("HTML parsing successful", "\n".join(out))
+        self.assertIn("Found title: Test HTML", "\n".join(out))

--===============0438593468240631017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0438593468240631017==--
