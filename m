Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7436FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA7FD400FB;
	Sun,  9 Jan 2022 22:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pi4v25vTcbvY; Sun,  9 Jan 2022 22:17:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A41E405A1;
	Sun,  9 Jan 2022 22:17:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD4341BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A87AF400FB
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNOP_0nC6pp5 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:17:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A899F4010E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:17:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so6181398wme.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vSKlN41So7u1Ol0VW2bV6npEPc2SNMFglHV9zFOYOYw=;
 b=R0BRTEOL06q8AjY8EBKaTmi/rh2STSryLeQnUd5Umg2RX8KTJ3btR1WJwAiRElqur+
 HDHXeMaTcFTmwHXl594n+qPRseIMyLLRxxiusZtD6NhI/RuLeDCKdzDJCGzxxHQE9CMu
 lqOxdZk2C6/bQjk7f54o4twt2bHnXKnmfVuBRDu2VQLczR+sOiizUS3fAmuEJiM4ACFm
 /XkXQlNlGHEllKZd81ajHFlPFUu4eSeiwv8ymUB4MpAA10lyzP0Dkxjs+yfqpO18i3XU
 h7Gmit0sQsBN3+c5w8la8IX2GjGUA4SRwSJfXiLGaXUXoruRgQcQl6UqgWpKXIhhSXOB
 9Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vSKlN41So7u1Ol0VW2bV6npEPc2SNMFglHV9zFOYOYw=;
 b=cU/jSNe3egFF/YYDkEa66oTimj5vq0GGWZa18F357/SXUtB0uGmoaoQwklJyXSy7qD
 yKwBpFb74+JhhBPb29tO5qhgF0SvQZSCXhv0pBACrjXwgOnBYlc3i6kSbZy+Pk5Zcyyh
 GuylBYmppDcsfqRZuoioKr3TNO3Zzzu/NepUIUhF9CmCMBbkJWWfqRTCwpM8o88MxRdl
 8h3Q1QfZsKHxdVr4i+ADCFSPPUCVtt+Uhfmz3FJBrqhvAE+GuojeqlGJOC+WScmVth2N
 1Md6zV/wY0pDbW0outSLTUr2jhUG5xcapjwedNqBj1HBxqG80L26GF+8xACXH8vSzPJP
 BP5Q==
X-Gm-Message-State: AOAM5326kIOhq2YmLFayI3t4UllZKRQBpLeL2kMTdmSHaQIBFixXUjdM
 9PQaJqeU2Qh8/prnRJzavEI0uwePViQ=
X-Google-Smtp-Source: ABdhPJzxVHLisdDtmpOgT8uIRYHWk3rn7qlF+JwntDUCb1xQH7Z3D77kNEwzF6I+t9bC6mDBHzi/3Q==
X-Received: by 2002:a05:600c:190b:: with SMTP id
 j11mr19133531wmq.182.1641766620897; 
 Sun, 09 Jan 2022 14:17:00 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id 1sm5395468wrb.13.2022.01.09.14.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:17:00 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:16:49 +0100
Message-Id: <20220109221650.777610-3-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109221650.777610-1-nolange79@gmail.com>
References: <20220109221650.777610-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 3/4] support/testsuite: de-duplicate the
 systemd runtime tests
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Of all the systemd init tests, only one does some additional tests, and
for just this lone wolf, we duplicate the test function.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/init/test_systemd.py | 32 ++++++++--------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index f0cc52bac8..80c6776f59 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -21,8 +21,9 @@ class InitSystemSystemdBase(InitSystemBase):
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(infra.filepath("conf/binfmt-misc-kernel-fragment.config"))
 
-    def check_init(self):
-        super(InitSystemSystemdBase, self).check_init("/lib/systemd/systemd")
+    def check_systemd(self, fs):
+        self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
+        self.check_init("/lib/systemd/systemd")
 
         # Test all units are OK
         output, _ = self.emulator.run("systemctl --no-pager --failed --no-legend")
@@ -35,6 +36,9 @@ class InitSystemSystemdBase(InitSystemBase):
         output, _ = self.emulator.run("journalctl --no-pager --lines 1 --quiet")
         self.assertEqual(len(output), 1)
 
+        # Check the network is up
+        self.check_network("eth0")
+
 
 class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
@@ -46,9 +50,7 @@ class TestInitSystemSystemdRoNetworkd(InitSystemSystemdBase):
         """.format(infra.filepath("tests/init/systemd-factory"))
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("squashfs")
 
         # This one must be executed on the target, to check that
         # the factory feature works as expected
@@ -65,9 +67,7 @@ class TestInitSystemSystemdRwNetworkd(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("ext2")
 
 
 class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
@@ -80,9 +80,7 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("squashfs")
 
 
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
@@ -94,9 +92,7 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("ext2")
 
 
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
@@ -125,9 +121,7 @@ class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("squashfs", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("squashfs")
 
 
 class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
@@ -155,6 +149,4 @@ class TestInitSystemSystemdRwFull(InitSystemSystemdBase):
         """
 
     def test_run(self):
-        self.start_emulator("ext2", "zImage", "vexpress-v2p-ca9")
-        self.check_init()
-        self.check_network("eth0")
+        self.check_systemd("ext2")
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
