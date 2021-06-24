Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677EFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:39:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E204604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E204604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B0183A9D;
	Tue,  3 Aug 2021 21:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvrrfROdOx98; Tue,  3 Aug 2021 21:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53C99838ED;
	Tue,  3 Aug 2021 21:39:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3EA1BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1808835A6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uifNTUZ6giQy for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 416D5835B1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8B7648670E; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 24 Jun 2021 23:42:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c2767180bde9c45ba33e49e8509e1720d87f44f5
X-Git-Newrev: 6a92726981877b845e311fa8dd95bc7576720244
X-Patchwork-Hint: ignore
Message-Id: <20210803210955.8B7648670E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/package/test_python_augeas: new test
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6a92726981877b845e311fa8dd95bc7576720244
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                            |  4 ++++
 support/testing/tests/package/sample_python_augeas.py |  9 +++++++++
 support/testing/tests/package/test_python_augeas.py   | 13 +++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 06d311a085..9ff590978c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1987,6 +1987,8 @@ F:	configs/galileo_defconfig
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/php-xdebug/
 F:	package/python-augeas/
+F:	support/testing/tests/package/sample_python_augeas.py
+F:	support/testing/tests/package/test_python_augeas.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
@@ -2687,6 +2689,8 @@ F:	package/squashfs/
 F:	package/wayland/
 F:	package/weston/
 F:	support/testing/tests/boot/test_syslinux.py
+F:	support/testing/tests/package/sample_python_augeas.py
+F:	support/testing/tests/package/test_python_augeas.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/support/testing/tests/package/sample_python_augeas.py b/support/testing/tests/package/sample_python_augeas.py
new file mode 100644
index 0000000000..d62afa564e
--- /dev/null
+++ b/support/testing/tests/package/sample_python_augeas.py
@@ -0,0 +1,9 @@
+import augeas
+
+a = augeas.Augeas(root="/")
+hosts = a.match("/files/etc/hosts/*")
+assert(hosts is not None)
+assert(len(hosts) == 2)
+
+assert(a.get("/files/etc/hosts/1/ipaddr") == "127.0.0.1")
+assert(a.get("/files/etc/hosts/1/canonical") == "localhost")
diff --git a/support/testing/tests/package/test_python_augeas.py b/support/testing/tests/package/test_python_augeas.py
new file mode 100644
index 0000000000..c1424668d6
--- /dev/null
+++ b/support/testing/tests/package/test_python_augeas.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonAugeas(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_AUGEAS=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_AUGEAS=y
+        """
+    sample_scripts = ["tests/package/sample_python_augeas.py"]
+    timeout = 60
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
