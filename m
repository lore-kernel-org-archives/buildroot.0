Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE810C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 06:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B8004093E;
	Mon, 29 Nov 2021 06:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guZdwapR1jcp; Mon, 29 Nov 2021 06:19:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79AF040913;
	Mon, 29 Nov 2021 06:19:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E827B1BF405
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4537607FF
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 06:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LsZ9HEKLUw0 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 06:19:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A6806079B
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 06:19:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j3so34284022wrp.1
 for <buildroot@buildroot.org>; Sun, 28 Nov 2021 22:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I7D8Ltss61jO4K8iTuukTnqSL0/VUne3s5as+B7tXGs=;
 b=RaHCh0KhaaJoPFrhCBvHq6LBzTkkomxaH1JpjswerpLft0hyQ+tLj67DCpGWYdpMJe
 JJboJ/vz2bPYNODMEWgWC7I7EKqbpHuwVXxI+iANPX1nNuMOrBbMJv9eVB1J/CGcTfbz
 /Dge89h9xxhmEK9ULMRN7qcH21ou81jIQELPICg+mH6oVBZuxDOrVJmRnK8arwL7BJri
 FkeLdnpq6V7GybhPGTWrU3rY7fKS+3mOWf30fkgysxVxmbWJO739G9glhgWLE8PMQbc1
 14WkpH5h+qIilnwSW8DV3eSCs8Jnxpk4ns5kFuQpbn/7lAmh5wMIlqy8zX2SQ3Nu7RNF
 EapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I7D8Ltss61jO4K8iTuukTnqSL0/VUne3s5as+B7tXGs=;
 b=j38Qm5zwBuxC2Qd/pcmheEWnxDu+OEExcrSrsajJTU24OhJzT3QTNCDrKydgkRP7mb
 7Lcd8LQTNolSjsmWDAdd1VRV83JTL4u43sK7d+SDBgX3b+iILpo3vjwiLMVCQBnOtjCc
 2pLd6Iy4gV3KeHMttY26PTR/r4o/J5+urt0wZSucQpLq+TiuLHtFKeZbOwSORyJ3ihrH
 dPz1B234/mUjd7MCVoYZKxAY8xRlBAFgvjz0IaYA9yGcaZqek7ighHabgYowf9zQSG9S
 HoZKTjKLj+ORHbqCUyFjoOHrsOA1msYxelXZRglGvgBupuVjCfZ6J/0aLm3lkXPXRJ6x
 n4Yw==
X-Gm-Message-State: AOAM532VhkvZxOZgf0rTzz4J669FLKLyWE9IFcBBE8zrumcaW5JH1kjn
 d9dN5lUTg7g1FICEkD6XG1WUXI5g+UI=
X-Google-Smtp-Source: ABdhPJy9f+Ju1w1KG42G1c0RHyfoCl4xRsoJg+G7eQG7wcS7tvaRAl6lGKDoj5hI2XvTTe9TQr6/+w==
X-Received: by 2002:adf:8b96:: with SMTP id o22mr31762655wra.615.1638166770041; 
 Sun, 28 Nov 2021 22:19:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id 38sm13186210wrc.1.2021.11.28.22.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 22:19:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 07:16:47 +0100
Message-Id: <20211129061647.2173322-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next v2,
 1/1] utils/checkpackagelib/lib_mk.py: check typo in define
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Check typo in define to detect SMAKE_LINUX_CONFIG_FIXUPS in smack
(fixed by 41e2132fbe8a8fc237ca4a2cd2eff9bd9ced09a6)

The new expression will catch "SMAKE_CONF_OPTS" as well as
"define SMAKE_LINUX_CONFIG_FIXUPS"

Two modifications were made:
 - add (define\s+)? which will match "define " but also an empty value.
   Thanks to this, the second group will always contain the variable
   name.
 - remove \s*(\+|)= which seems superfluous

Also, add GCC_TARGET in ALLOWED variable to avoid the following
warnings:

arch/arch.mk:12: possible typo: GCC_TARGET_ARCH -> *ARCH*
arch/arch.mk:13: possible typo: GCC_TARGET_ABI -> *ARCH*
arch/arch.mk:14: possible typo: GCC_TARGET_NAN -> *ARCH*
arch/arch.mk:15: possible typo: GCC_TARGET_FP32_MODE -> *ARCH*
arch/arch.mk:16: possible typo: GCC_TARGET_CPU -> *ARCH*
arch/arch.mk:17: possible typo: GCC_TARGET_FPU -> *ARCH*
arch/arch.mk:18: possible typo: GCC_TARGET_FLOAT_ABI -> *ARCH*
arch/arch.mk:19: possible typo: GCC_TARGET_MODE -> *ARCH*

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle and Ricardo
Martincoski):
 - Update commit message
 - Replace " " by "\s+"

 utils/checkpackagelib/lib_mk.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index d09922f724..a304f71fd5 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -236,6 +236,7 @@ class TypoInPackageVariable(_CheckFunction):
         "BR_CCACHE_INITIAL_SETUP",
         "BR_LIBC",
         "BR_NO_CHECK_HASH_FOR",
+        "GCC_TARGET",
         "LINUX_EXTENSIONS",
         "LINUX_POST_PATCH_HOOKS",
         "LINUX_TOOLS",
@@ -248,7 +249,7 @@ class TypoInPackageVariable(_CheckFunction):
         "TARGET_FINALIZE_HOOKS",
         "TARGETS_ROOTFS",
         "XTENSA_CORE_NAME"]))
-    VARIABLE = re.compile(r"^([A-Z0-9_]+_[A-Z0-9_]+)\s*(\+|)=")
+    VARIABLE = re.compile(r"^(define\s+)?([A-Z0-9_]+_[A-Z0-9_]+)")
 
     def before(self):
         package, _ = os.path.splitext(os.path.basename(self.filename))
@@ -258,7 +259,7 @@ class TypoInPackageVariable(_CheckFunction):
         # linux extensions do not use LINUX_EXT_ prefix for variables
         package = package.replace("LINUX_EXT_", "")
         self.package = package
-        self.REGEX = re.compile(r"^(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
+        self.REGEX = re.compile(r"(HOST_|ROOTFS_)?({}_[A-Z0-9_]+)".format(package))
         self.FIND_VIRTUAL = re.compile(
             r"^{}_PROVIDES\s*(\+|)=\s*(.*)".format(package))
         self.virtual = []
@@ -268,7 +269,7 @@ class TypoInPackageVariable(_CheckFunction):
         if m is None:
             return
 
-        variable = m.group(1)
+        variable = m.group(2)
 
         # allow to set variables for virtual package this package provides
         v = self.FIND_VIRTUAL.search(text)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
