Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DEAC83F09
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D30E283DE9;
	Fri,  4 Jul 2025 06:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMQZTN06Qb6e; Fri,  4 Jul 2025 06:25:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5E6683E63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5E6683E63;
	Fri,  4 Jul 2025 06:25:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1A21EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFBF54105C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLAIF7SoZbNv for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E096641044
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E096641044
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE8F285E09; Fri,  4 Jul 2025 06:24:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 10:57:34 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: fdd08f7308d4e94bb6fa99841d8f5eed90307b2d
X-Git-Newrev: 418051aeb2c0d91c40137efdf178f59e31c2b9dc
X-Patchwork-Hint: ignore
Message-Id: <20250704062432.DE8F285E09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] support/testing: new
 runtime test for gumbo-parser
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9146772300640530751=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9146772300640530751==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=418051aeb2c0d91c40137efdf178f59e31c2b9dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The new test requires a br2-external directory because we compile a
small test program on the host and install it on the target, but it's
not useful to have it in the main Buildroot package tree.

The test program loads and parses a sample HTML document. Taking
inspiration from 'examples/get_title.c' in gumbo-parser, it also
searches for the title of the document just to check that we can do
more than the parsing.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit da23be6338c1e82f39475d166407f97511e0b666)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============9146772300640530751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9146772300640530751==--
