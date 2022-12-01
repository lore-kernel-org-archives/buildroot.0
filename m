Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D8C4321E
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 00:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B90F860BE9;
	Thu,  1 Dec 2022 00:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B90F860BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuUdj4HEqZQa; Thu,  1 Dec 2022 00:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E953560746;
	Thu,  1 Dec 2022 00:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E953560746
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C61F71BF968
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 00:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE9A04049F
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 00:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE9A04049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iIVuQid7bJ3f for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 00:45:05 +0000 (UTC)
X-Greylist: delayed 11:25:08 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D78C440143
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [20.232.28.96]) by smtp2.osuosl.org (Postfix) with SMTP id D78C440143
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 00:45:04 +0000 (UTC)
Received: from E0005128LT.eswin.cn (unknown [10.12.98.229])
 by app2 (Coremail) with SMTP id EggMCgA3CS4M+YdjFmgUAA--.62444S5;
 Thu, 01 Dec 2022 08:45:01 +0800 (CST)
From: Zikui Zhao <zhaozikui@eswincomputing.com>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 08:44:58 +0800
Message-Id: <20221201004458.673-2-zhaozikui@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20221201004458.673-1-zhaozikui@eswincomputing.com>
References: <20221201004458.673-1-zhaozikui@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: EggMCgA3CS4M+YdjFmgUAA--.62444S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1UAF4UAw1kCr4DAw1kZrb_yoW7WFW3pa
 95Ww13KrZ5J3W5Arn7uw1v9Fyfu3s7ZFW5JryUZ345KF15GF1IvrsFyanIqw15X393ZFya
 vrW8WrW8Ja4qq3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28Icx
 kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
 CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU==
X-CM-SenderInfo: p2kd06plnxxqphvzx0xfrp13pwlqwhhfrp/
Subject: [Buildroot] [PATCH 1/1] BUILDROOT: fixed some spelling mistakes
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Zikui Zhao <zhaozikui@eswincomputing.com>,
 Bilal Wasim <bilalwasim676@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixed some spelling mistakes of countable nouns.

Zikui Zhao <zhaozikui@eswincomputing.com>
---
 board/chromebook/elm/readme.txt               | 2 +-
 board/chromebook/snow/readme.txt              | 2 +-
 docs/manual/customize-directory-structure.txt | 4 ++--
 docs/manual/writing-rules.txt                 | 4 ++--
 support/kconfig/menu.c                        | 2 +-
 support/kconfig/streamline_config.pl          | 2 +-
 support/kconfig/zconf.lex.c_shipped           | 4 ++--
 support/testing/tests/package/test_crudini.py | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/board/chromebook/elm/readme.txt b/board/chromebook/elm/readme.txt
index b63e7e8bcf..3387933ab4 100644
--- a/board/chromebook/elm/readme.txt
+++ b/board/chromebook/elm/readme.txt
@@ -30,7 +30,7 @@ The important files are:
 	rootfs.tar
 	bootsd.img (SD card image containing both kernel and rootfs)
 
-Write the image directly to some SD card.
+Write the image directly to some SD cards.
 WARNING: make sure there is nothing important on that card,
 and double-check the device name!
 
diff --git a/board/chromebook/snow/readme.txt b/board/chromebook/snow/readme.txt
index 1afd949829..9533bf69b0 100644
--- a/board/chromebook/snow/readme.txt
+++ b/board/chromebook/snow/readme.txt
@@ -30,7 +30,7 @@ The important files are:
 	rootfs.tar
 	bootsd.img (SD card image containing both kernel and rootfs)
 
-Write the image directly to some SD card.
+Write the image directly to some SD cards.
 WARNING: make sure there is nothing important on that card,
 and double-check the device name!
 
diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
index a3a7ad4cb9..1249421da2 100644
--- a/docs/manual/customize-directory-structure.txt
+++ b/docs/manual/customize-directory-structure.txt
@@ -27,10 +27,10 @@ to you.
 |           +-- post_image.sh
 |           +-- rootfs_overlay/
 |           |   +-- etc/
-|           |   +-- <some file>
+|           |   +-- <some files>
 |           +-- patches/
 |               +-- foo/
-|               |   +-- <some patch>
+|               |   +-- <some patches>
 |               +-- libbar/
 |                   +-- <some other patches>
 |
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 758965d80a..1b88a411e6 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -6,8 +6,8 @@
 Overall, these coding style rules are here to help you to add new files in
 Buildroot or refactor existing ones.
 
-If you slightly modify some existing file, the important thing is
-to keep the consistency of the whole file, so you can:
+If you slightly modify some existing files, the important thing is
+to keep the consistency of the whole files, so you can:
 
 * either follow the potentially deprecated coding style used in this
 file,
diff --git a/support/kconfig/menu.c b/support/kconfig/menu.c
index 5c5c1374b1..53ed230484 100644
--- a/support/kconfig/menu.c
+++ b/support/kconfig/menu.c
@@ -376,7 +376,7 @@ void menu_finalize(struct menu *parent)
 					 *
 					 * 2. The property belongs to a symbol
 					 *    defined in multiple locations and
-					 *    is from some other location. It
+					 *    is from some other locations. It
 					 *    will be handled there in that
 					 *    case.
 					 *
diff --git a/support/kconfig/streamline_config.pl b/support/kconfig/streamline_config.pl
index a2e83ab17d..c9ded50735 100755
--- a/support/kconfig/streamline_config.pl
+++ b/support/kconfig/streamline_config.pl
@@ -24,7 +24,7 @@
 #  3. Copy the configuraton file to this directory as .config
 #  4. Have all your devices that you need modules for connected and
 #      operational (make sure that their corresponding modules are loaded)
-#  5. Run this script redirecting the output to some other file
+#  5. Run this script redirecting the output to some other files
 #       like config_strip.
 #  6. Back up your old config (if you want too).
 #  7. copy the config_strip file to .config
diff --git a/support/kconfig/zconf.lex.c_shipped b/support/kconfig/zconf.lex.c_shipped
index 33913d43c7..83b4eacd41 100644
--- a/support/kconfig/zconf.lex.c_shipped
+++ b/support/kconfig/zconf.lex.c_shipped
@@ -247,7 +247,7 @@ struct yy_buffer_state
 
 #define YY_BUFFER_NEW 0
 #define YY_BUFFER_NORMAL 1
-	/* When an EOF's been seen but there's still some text to process
+	/* When an EOF's been seen but there's still some texts to process
 	 * then we mark the buffer as YY_EOF_PENDING, to indicate that we
 	 * shouldn't try reading from the input source any more.  We might
 	 * still have a bunch of tokens to match, though, because of
@@ -1549,7 +1549,7 @@ static int yy_get_next_buffer (void)
 
 		else
 			{
-			/* We matched some text prior to the EOB, first
+			/* We matched some texts prior to the EOB, first
 			 * process it.
 			 */
 			return EOB_ACT_LAST_MATCH;
diff --git a/support/testing/tests/package/test_crudini.py b/support/testing/tests/package/test_crudini.py
index 470a714eb6..abb188c1b7 100644
--- a/support/testing/tests/package/test_crudini.py
+++ b/support/testing/tests/package/test_crudini.py
@@ -22,7 +22,7 @@ class TestCrudiniBase(TestPythonPackageBase):
 
         self.emulator.login()
 
-        # 1. Create some sample .ini file
+        # 1. Create some sample .ini files
         cmd = "echo -e '%s' > config.ini" % INI_FILE_CONTENT
         _, ret = self.emulator.run(cmd)
         self.assertEqual(ret, 0)
-- 
2.17.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
