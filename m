Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4008DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E67DF40439;
	Sun,  9 Jan 2022 22:17:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NESi_b-z_H3W; Sun,  9 Jan 2022 22:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4FA84045E;
	Sun,  9 Jan 2022 22:17:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D18181BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFE5F81403
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHk_bUmFIl2S for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:17:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1C75813F8
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:17:03 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o3so23298058wrh.10
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bqa7YCIQE2uBk8hRK/USSwuC4SYA+a9tVvZesxLcsF4=;
 b=qnQTqPo3bjBj7439Sf72A1JNSQZuSYe1b83U4cdbYmEaYLPI8w4TRrqmUZiw4i8p4w
 cUe9iuBPSzugJLvCWy9rHZgYMQF7lPHZqLE8qeaTc2TD33PA1lGg3Rv1uT/DeNn/381W
 EUElfUzhYR0zRmrbA6iwmUZbyya+JZtipP/eICoHcm6dTGZNKIluj6uY5S/Skk2qt+16
 hpVKzeXCKB1ml+aB3M35N95X8pDqkPDPBB8JFUcpyoFLNH/hOBNamZmUvT5Lw9kY5u76
 T23BakBvFDaqgN5H96nKNExxtqxAehInosCZstRWjnnQpIBBAE6hW2Q/bg8q84tqox4E
 3r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bqa7YCIQE2uBk8hRK/USSwuC4SYA+a9tVvZesxLcsF4=;
 b=WzUHO16yVxc6vLGtwgIYp+fllQgU8RdZKo5FFlk1HdK/GrJa9BCf2o5/Nu8r23k8jR
 VHp/7Xutx1G9MnI53bUqoUC51hn7dyt458pbq1IACJINgKl/IzYkLVyi9sEyAnJ4xyrp
 YgbqtCKXVrtpW6BsTa5x71tzKjj0uHXvnRlc0Cp4UKGnMpoaSM1jF2Y7vF3uxtIunkv5
 bxMLyV9bRu8+R5Q8LDk+moro6Ywuaps7CVO7WalrTnYRcneGxz5Go3i4sxyYiaz7UTe9
 HZfcmjd6L4RlVOk1XT5quRtiuXUbXj1RINz92Plx2ChNQx5YEmocpBciwsdDgHprETKw
 +Zlw==
X-Gm-Message-State: AOAM530nT125XmVzHrgK29NkNC0YZLo900zQOVf+dY9TndmtdwQVl1vH
 KDTV3ZEdHHCF5iBhs2rTDcyFQUsRgjI=
X-Google-Smtp-Source: ABdhPJxaRQJ3mlb1BkqFKuVAFdRJatHZbZja54yF5ETqMiOrm/ixn0QOnDhHFroeyWRryJM3FN7Ztw==
X-Received: by 2002:adf:edcf:: with SMTP id v15mr502207wro.501.1641766622223; 
 Sun, 09 Jan 2022 14:17:02 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id 1sm5395468wrb.13.2022.01.09.14.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:17:01 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:16:50 +0100
Message-Id: <20220109221650.777610-4-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109221650.777610-1-nolange79@gmail.com>
References: <20220109221650.777610-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 4/4] support/run-test: add test for systemd
 using dbus-broker
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Add four new tests for systemd (rw and ro in each case):
  - use dbus-broker instead of the original dbus
  - use the original dbus, with dbus-broker installed

The first two extend the existing IfUpDown test cases by just enabling
dbus-broker; the second ones extend this further, by explicitly enabling
the original dbus.

For one of the tests, we overload the test_run() function to test that
the dbus-broker daemon is indeed running as root. We need not replicate
that check in the other dbus-broker-only test, and it does not make
sense to test that in tests that have the original dbus enabled.

Presence of the original dbus and dbus-broker on the same system is
valid: the original dbus is used as the default system bus daemon. We do
not test switching between the two at runtime, though as this is really
too corner-case specific. We just test to ensure the original dbus
system bus daemon is not impacted by the presence of dbus-broker.

Note: the 'full' test-case enables all systemd options, and some of them
do pull the original dbus package, so we can't use that to test the
integration of dbus-broker; instead, we extend the ifupdown case, which
does not enable the original dbus.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
---
 support/testing/tests/init/test_systemd.py | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 80c6776f59..80d172e5e2 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -83,6 +83,29 @@ class TestInitSystemSystemdRoIfupdown(InitSystemSystemdBase):
         self.check_systemd("squashfs")
 
 
+class TestInitSystemSystemdRoIfupdownDbusbroker(TestInitSystemSystemdRoIfupdown):
+    config = TestInitSystemSystemdRoIfupdown.config + \
+        """
+        BR2_PACKAGE_DBUS_BROKER=y
+        """
+
+    def test_run(self):
+        # Parent class' test_run() method does exactly that, no more:
+        self.check_systemd("squashfs")
+
+        # Check that the dbus-broker daemon is running as non-root
+        cmd = "find /proc/$(pidof dbus-broker) -maxdepth 1 -name exe -user dbus"
+        out, _ = self.emulator.run(cmd)
+        self.assertEqual(len(out), 1)
+
+
+class TestInitSystemSystemdRoIfupdownDbusbrokerDbus(TestInitSystemSystemdRoIfupdownDbusbroker):
+    config = TestInitSystemSystemdRoIfupdownDbusbroker.config + \
+        """
+        BR2_PACKAGE_DBUS=y
+        """
+
+
 class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
@@ -95,6 +118,20 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         self.check_systemd("ext2")
 
 
+class TestInitSystemSystemdRwIfupdownDbusbroker(TestInitSystemSystemdRwIfupdown):
+    config = TestInitSystemSystemdRwIfupdown.config + \
+        """
+        BR2_PACKAGE_DBUS_BROKER=y
+        """
+
+
+class TestInitSystemSystemdRwIfupdownDbusbrokerDbus(TestInitSystemSystemdRwIfupdownDbusbroker):
+    config = TestInitSystemSystemdRwIfupdownDbusbroker.config + \
+        """
+        BR2_PACKAGE_DBUS=y
+        """
+
+
 class TestInitSystemSystemdRoFull(InitSystemSystemdBase):
     config = InitSystemSystemdBase.config + \
         """
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
