Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5ABD743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A699160B91;
	Wed, 20 Nov 2024 21:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AeuTOmcYvx3; Wed, 20 Nov 2024 21:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F688606AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F688606AE;
	Wed, 20 Nov 2024 21:30:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF961970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A01FD606AE
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2BtaxnNUaId for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C86860617
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C86860617
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:30:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 814A58650E; Wed, 20 Nov 2024 21:30:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 22:12:45 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8a50eb162b4c339ccb5b310bf65c790973cf98e8
X-Git-Newrev: 17555734e88938afae7d0a332b17d04e384d4397
X-Patchwork-Hint: ignore
Message-Id: <20241120213033.814A58650E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add
 rrdtool runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=17555734e88938afae7d0a332b17d04e384d4397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8756b76a0f8d4844c7389c7fc45dbbfc880ebae1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |   1 +
 support/testing/tests/package/test_rrdtool.py | 100 ++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0cbcac4c8b..badb72007b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1864,6 +1864,7 @@ F:	support/testing/tests/package/test_python_pyqt5/
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
+F:	support/testing/tests/package/test_rrdtool.py
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
 F:	support/testing/tests/package/test_socat.py
diff --git a/support/testing/tests/package/test_rrdtool.py b/support/testing/tests/package/test_rrdtool.py
new file mode 100644
index 0000000000..431a867bf2
--- /dev/null
+++ b/support/testing/tests/package/test_rrdtool.py
@@ -0,0 +1,100 @@
+import os
+
+import infra.basetest
+
+
+class TestRRDTool(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_RRDTOOL=y
+        BR2_PACKAGE_RRDTOOL_RRDGRAPH=y
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
+        # We check the program can run.
+        self.assertRunOk("rrdtool --version")
+
+        # This test sequence is inspired from parts of the RRDTool
+        # tutorial:
+        # https://oss.oetiker.ch/rrdtool/tut/rrdtutorial.en.html
+
+        rrd_file = "test.rrd"
+        data_source = "speed"
+
+        cmd = f"rrdtool create {rrd_file}"
+        cmd += " --start 920804400"
+        cmd += f" DS:{data_source}:COUNTER:600:U:U"
+        cmd += " RRA:AVERAGE:0.5:1:24"
+        cmd += " RRA:AVERAGE:0.5:6:10"
+        self.assertRunOk(cmd)
+
+        # Some data to fill in our database, from the tutorial page.
+        data = [12345, 12357, 12363, 12363, 12363,
+                12373, 12383, 12393, 12399, 12405,
+                12411, 12415, 12420, 12422, 12423]
+        timestamp = 920804700  # timestamp of: Sun Mar  7 12:05:00 PM CET 1999
+
+        # We check we can put our data in the database. We start at
+        # our timestamp, then increase by 5 minutes.
+        for d in data:
+            cmd = f"rrdtool update {rrd_file} {timestamp}:{d}"
+            timestamp += 300
+            self.assertRunOk(cmd)
+
+        # We check we can read back our data.
+        cmd = f"rrdtool fetch {rrd_file}"
+        cmd += " AVERAGE --start 920804400 --end 920809200"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0].strip(), data_source)
+        # We check that at time=920805600 we have speed=0.
+        data_line = next(ln for ln in out if ln.strip().startswith('920805600:'))
+        speed = float(data_line.split(':')[1])
+        self.assertAlmostEqual(speed, 0.)
+
+        # We generate a first simple image graph.
+        cmd = "rrdtool graph speed.png"
+        cmd += " --start 920804400 --end 920808000"
+        cmd += f" DEF:myspeed={rrd_file}:{data_source}:AVERAGE"
+        cmd += " LINE2:myspeed#FF0000"
+        self.assertRunOk(cmd, timeout=20)
+
+        # We check the output file exists and has a size
+        # greater than zero.
+        self.assertRunOk("test -s speed.png")
+
+        # We generate a slightly more complex graph.
+        cmd = "rrdtool graph speed2.png"
+        cmd += " --start 920804400 --end 920808000"
+        cmd += " --vertical-label m/s"
+        cmd += f" DEF:myspeed={rrd_file}:{data_source}:AVERAGE"
+        cmd += " CDEF:realspeed=myspeed,1000,\\*"
+        cmd += " LINE2:realspeed#FF0000"
+        self.assertRunOk(cmd, timeout=20)
+
+        # Again, we check the output file exists.
+        self.assertRunOk("test -s speed2.png")
+
+        # Finally, we generate the last graph, with some rules.
+        cmd = "rrdtool graph speed3.png"
+        cmd += " --start 920804400 --end 920808000"
+        cmd += " --vertical-label km/h"
+        cmd += f" DEF:myspeed={rrd_file}:{data_source}:AVERAGE"
+        cmd += " \"CDEF:kmh=myspeed,3600,*\""
+        cmd += " CDEF:fast=kmh,100,GT,kmh,0,IF"
+        cmd += " CDEF:good=kmh,100,GT,0,kmh,IF"
+        cmd += " HRULE:100#0000FF:\"Maximum allowed\""
+        cmd += " AREA:good#00FF00:\"Good speed\""
+        cmd += " AREA:fast#FF0000:\"Too fast\""
+        self.assertRunOk(cmd, timeout=20)
+
+        # And again, we check the output file exists.
+        self.assertRunOk("test -s speed3.png")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
