Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0AAC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8202283F69;
	Sun, 23 Jan 2022 21:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nj2iyN9ms33h; Sun, 23 Jan 2022 21:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB36C83F63;
	Sun, 23 Jan 2022 21:27:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33F311BF3F6
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22FE983F63
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULfT__TeJIHA for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 21:27:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06AC683F60
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 21:27:52 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s18so10095661wrv.7
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 13:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ltXMwGdDlm+6yqeOMuS/TlqnIrGvUH+zGhhqIa8oUsA=;
 b=HRYaYWflLUGBrnL3yLoArihBBvX3P8OVqw31wLbvLn2agkUvrdF1XGxKGB7F0x2A5u
 Mdh9JuBbyjucxqkroluDHJkQh8vY2/5+wzcxgFdTe9RnNh6t63J8fHp5zCjE9DRTxrTA
 YPdGRfQsJDsW7hgGhMnyZCT5lPCIab/QCOQ2gEIecwEYvVwFCMI78ZEj40LwmUZsw/f1
 yVHPShRHtAFFW8z+Aq4Em2Eetjkzc++Hq+EkGcwayyVpg7/TEBLYSkFHY5cfzG92sHQR
 2UbPnTBJBxkjItAm6ypnp3ZP8czwtntffMjXjVa7Ms/wq2OSUYG523Y4WOspoG8I56lL
 8Y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ltXMwGdDlm+6yqeOMuS/TlqnIrGvUH+zGhhqIa8oUsA=;
 b=uPPLkGuzyyVuiR6k5cfNmCx+0xckibwkKb9bM8UyqcozWpwXmaEnTVmuwbnoFsqV/M
 u/xmB6JnznP/pejSSWYpxYdvJd+QmDurY6ukL5h6OCPdKb79X4YB/jM8Zvc60+zzHgLB
 s8kcdX7Mv+/FX71VwW7sKDLX/xltK/8jnuROmdx7eDbwlKhjlPzAw7KrIXrWHkXrmhtK
 LCRHfdOM0lBxFYfFQOvgKk3+4dXsnPCvcnq+incj7DyVHhiktGQ5QIyaNRHIcxro9y2q
 l2NQZThH1FJymMktXd8jzrtrc11GrE6p2c1CyUY/U2hV0kWux1Eqf+kv78qW6LQnIaaQ
 ZQSg==
X-Gm-Message-State: AOAM531WdEOQF5IEW5IprVJHLmuBBwsTUaud1COo/t2jMHBPsVJJMhkX
 Errs1rnB9knica9UjqHLnX4jwvWzr9o=
X-Google-Smtp-Source: ABdhPJxWL3rL2Z1NpMRu9eI/NYroTHq09ao0MKDYO2hngnyzLGf5RqNMSBu7IlnQH+rMHvxPYG4gtg==
X-Received: by 2002:a5d:6642:: with SMTP id f2mr6164926wrw.709.1642973271012; 
 Sun, 23 Jan 2022 13:27:51 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 1sm11172708wmo.37.2022.01.23.13.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 13:27:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 22:26:07 +0100
Message-Id: <20220123212607.781422-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gvfs: fix build with meson >= 0.61
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of meson to version
0.61.0 in commit a8dc871139f83c8b4a0cdcdaf2ded18ee463d65f:

../output-1/build/gvfs-1.48.1/daemon/meson.build:368:7: ERROR: Function does not take positional arguments.

Fixes:
 - http://autobuild.buildroot.org/results/6231649fac82a70b215186c3396b879a28a96f60

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-incorrect-i18n.merge_file-argument.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch

diff --git a/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch b/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch
new file mode 100644
index 0000000000..a85a1a374e
--- /dev/null
+++ b/package/gvfs/0001-build-Remove-incorrect-i18n.merge_file-argument.patch
@@ -0,0 +1,33 @@
+From 17a067b9b823a0d54e061eae45ff8e2c7e4a88d0 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Fri, 21 Jan 2022 08:32:31 +0100
+Subject: [PATCH] build: Remove incorrect i18n.merge_file argument
+
+The positional argument was being silently ignored until meson 0.60.0 where
+it fails with "ERROR: Function does not take positional arguments".
+
+Related: https://github.com/mesonbuild/meson/issues/9441
+Fixes: https://gitlab.gnome.org/GNOME/gvfs/-/issues/599
+
+[Retrieved (and backported) from:
+https://gitlab.gnome.org/GNOME/gvfs/-/commit/17a067b9b823a0d54e061eae45ff8e2c7e4a88d0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ daemon/meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/daemon/meson.build b/daemon/meson.build
+index 5f9559aa..e20ada29 100644
+--- a/daemon/meson.build
++++ b/daemon/meson.build
+@@ -360,7 +360,6 @@ if enable_admin
+   )
+ 
+   i18n.merge_file(
+-    policy,
+     input: policy_in,
+     output: '@BASENAME@',
+     po_dir: po_dir,
+-- 
+GitLab
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
