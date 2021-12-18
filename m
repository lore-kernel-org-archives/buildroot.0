Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DCDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 10:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBFF242273;
	Sat, 18 Dec 2021 10:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3M6YSP6iYrs4; Sat, 18 Dec 2021 10:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0287242207;
	Sat, 18 Dec 2021 10:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A90E61BF5EA
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 10:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4C3340145
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 10:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqzDfizT29FM for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 10:13:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F8FF401D6
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 10:13:12 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so5750520wmb.0
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 02:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XLgAEJvwE03pUciJoyQrqiPf7IPhPtJ/LlOBJ1DM/JE=;
 b=j9NWG7LcXSKW8KstQJ4ilKXWMGbJj1s59mIyaD+YbeA9LZOmM8znnKpis4KxruHJtB
 xSvoEympwT0VthIzOtjoAqAu/auoY5G86X/4dQAKAdx+NEwbbINSU6bZFUKKTUTpFh+f
 SWDz5f6rXNTUrw9M15l2ebB4y8FNlYffQ9JeFnR1MFtN/Va/RJhIsrnKiSN/JS7IlM00
 0OV2JBo4NKZLzZTusr2bSfZvA366mT7RZkAU3FAdprNXTgUtQXg25bvMqyWEdftRrbvS
 WBAsEFk7aUsLPIcvNopLiNHGrZWpSacQQv1fxSBSkaiL+snDkWQT2v+Yei412SO6zSlp
 /yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XLgAEJvwE03pUciJoyQrqiPf7IPhPtJ/LlOBJ1DM/JE=;
 b=gIFnKsLphdPM6hZnYb92z3Bfuh6MmAEdsU9RlBAIuVbIswiBnqTwQ7MwQ8F58JyA4d
 GWoMTuZJIkN7MJayKmyCNCQpzSS6D3ixDOl9WSp41PKx49wJtJwY62J3OvO88nVI0Wze
 tGXcO2G0Wvk0oL+XBNObC3JQLCJPrFKTNpTr4BpKZFWOQUZyfW8Pr7KGSNZwita/X81Q
 7MtfhsQNKSwaI1AxqT2Cf3nMneue47rL0SOcMwBGQdGsnDjL7KEEjbJ+Dv0ylP5tv7lv
 6bDoraqeoF7lBnTIPO/JsZM2ncQUksD1zm89uy8CSFuM6fpHorNU7vVOT67pT/4SsUoW
 Ytqw==
X-Gm-Message-State: AOAM53254edNRmYJY+ckjGP8VKg7ES6/sGhyZm2MCQZCJwDJhZbQx/hm
 rp7TkLY1RiEfwvAflWGhYzJjE4EsYZShrg==
X-Google-Smtp-Source: ABdhPJw4hWq2T1lqWFp55LfCKFkQrsxQjP3iSUnQw6UK6Y6Jiser//dQbiYibWY0l67jTI234+AWNA==
X-Received: by 2002:a05:600c:35d2:: with SMTP id
 r18mr13085363wmq.166.1639822390170; 
 Sat, 18 Dec 2021 02:13:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id e12sm12260125wrq.20.2021.12.18.02.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 02:13:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 11:12:38 +0100
Message-Id: <20211218101238.565215-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/grep: fix build with microblazeel
 and or1k
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with microblazeel and or1k raised since
bump to version 3.7 in commit f1f0b633eb1c4bc006b95daad8f299028e89d19d:

sigsegv.c: In function 'sigsegv_handler':
sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
  979 |                       : vma.is_near_this (addr, &vma))
      |

Fixes:
 - http://autobuild.buildroot.org/results/78142463ba8cc5f6c1bf15295095a271422294f4
 - http://autobuild.buildroot.org/results/f300b1b5e958f096a9d58197a44dcf0c2abd3585

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-sigsegv-fix-build-on-microblazeel.patch | 32 +++++++++++++++++++
 .../grep/0002-sigsegv-fix-build-on-or1k.patch | 32 +++++++++++++++++++
 package/grep/grep.mk                          |  2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
 create mode 100644 package/grep/0002-sigsegv-fix-build-on-or1k.patch

diff --git a/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch b/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
new file mode 100644
index 0000000000..4afeb47971
--- /dev/null
+++ b/package/grep/0001-sigsegv-fix-build-on-microblazeel.patch
@@ -0,0 +1,32 @@
+From 3079cea1b18fe72aa1da6b04e561abfb36f4f443 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Nov 2021 09:57:23 +0100
+Subject: sigsegv: fix build on microblazeel
+
+Fix the following build failure on microblazeel with diffutils 3.8:
+sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
+http://autobuild.buildroot.org/results/5ecd55b7c72f9630a7acc72341ccb60e94ddb574
+
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/gnulib.git/patch/?id=3079cea1b18fe72aa1da6b04e561abfb36f4f443]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ m4/stack-direction.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index c90d69733..70286c8f5 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -37,7 +37,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       m68* | \
+       m88k | \
+       mcore | \
+-      microblaze | \
++      microblaze* | \
+       mips* | \
+       mmix | \
+       mn10200 | \
+-- 
+cgit v1.2.1
+
diff --git a/package/grep/0002-sigsegv-fix-build-on-or1k.patch b/package/grep/0002-sigsegv-fix-build-on-or1k.patch
new file mode 100644
index 0000000000..73385fe9f7
--- /dev/null
+++ b/package/grep/0002-sigsegv-fix-build-on-or1k.patch
@@ -0,0 +1,32 @@
+From 496c1740e5475be85b65fdb2b143771f09ed27cb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Nov 2021 10:06:31 +0100
+Subject: sigsegv: fix build on or1k
+
+Fix the following build failure on or1k with diffutils 3.8
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
+sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
+http://autobuild.buildroot.org/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9
+
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=496c1740e5475be85b65fdb2b143771f09ed27cb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 70286c8f5..29e398d77 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -45,6 +45,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       nios2 | \
+       nds32* | \
+       ns32k | \
++      or1k | \
+       pdp11 | \
+       pj* | \
+       powerpc* | rs6000 | \
+-- 
+cgit v1.2.1
+
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 233f5fe633..a485f23dc7 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -10,6 +10,8 @@ GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
 GREP_LICENSE_FILES = COPYING
 GREP_CPE_ID_VENDOR = gnu
+# We're patching m4/stack-direction.m4
+GREP_AUTORECONF = YES
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # install into /bin like busybox grep
 GREP_CONF_OPTS = --exec-prefix=/
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
