Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AD9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 18:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA9A0404A6;
	Fri, 18 Mar 2022 18:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2D7tXBQ3OPsi; Fri, 18 Mar 2022 18:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9499E401D5;
	Fri, 18 Mar 2022 18:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 737531BF3F7
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 18:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 617C8408C5
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 18:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBRu8FdBOqk3 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 18:08:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 697F44089B
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 18:08:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r10so12768198wrp.3
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/QE5STdYBzuNTSoH48detbp9NFqllk8X9SFoqhRqI0=;
 b=YccdtSJT5+1R8eatr8JCc2w2n/LMwojFeBFovA+sjeQx2iVq16mEcVAGiFBxW/38c6
 DD+Fho7cxxXd31ho0UMTkDYlgtHhOXbWtScIqMIENZIs9Iqd6QOZFOATUeiVP2RsbHco
 p2xcQJRYPy2JOoXs5IFDgiOyEofDp2uK3lUclSktipS66qCjnSmuO36uoRpEm8SToPjC
 JBurb1udThEJNywk6MwHJyVIHFhs5jBiPM8811Xa3VS02w1TQAA0VmLSx+A636f9+BP1
 ZFlQqJXkAAgSxpFPbuu3K94v7r8ekv8tyEMByt6FQQIpSmeSYKNOfJLCO+HmARa4xR0Y
 7Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/QE5STdYBzuNTSoH48detbp9NFqllk8X9SFoqhRqI0=;
 b=3xYM+WjgfmtGCuo0sn/OgXXgoVXpiuS/N/3dO76xGzysgeXrqMggq03UflFVPdzCpk
 Fh0SXz1MH7QMuEaInsW5J3aLEqr0y5bZpBgPdk5PQDY0uuL1Rvt9WYRkaPH+/oc6QadY
 b+rUC8BtoDO7dg1nKg2Rr7RS1VPBqe4ipb0M7AEG/Ly4AKlfH9/q/aCaiK49aUjetewq
 K5cMX4eFd00gY/MG0k3Au7iAfQMYaiX5hGyFp5YoFRXsQvaqXbnCOBuF2426imKZH6ma
 yZir1721uukCAguGl1koQtU3rSDWEtsy0P9EznULxoOTEH4RgftLwPQANqT5+7rtGslz
 zTEg==
X-Gm-Message-State: AOAM532/FXa9R6qef7o877NZG6qR8VzivX1oeEwOlASMkBB8/TABDZJ8
 avXF/+2jMeTYL/gSt17+eL1OhlrEpaM=
X-Google-Smtp-Source: ABdhPJyRQMMUZw115hsre2S5ZkfQtnGPC2KFRbj2zs3RAJe11IYIf/P3W0yiwq00zcdncEBeGW+u5Q==
X-Received: by 2002:a05:6000:18ac:b0:203:ecad:a203 with SMTP id
 b12-20020a05600018ac00b00203ecada203mr7148966wri.177.1647626904487; 
 Fri, 18 Mar 2022 11:08:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b0038c85aade4csm2949282wmm.11.2022.03.18.11.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 11:08:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 19:07:13 +0100
Message-Id: <20220318180713.19051-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pango: drop -Werror=empty-body
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

Fix the following build failure raised since bump to version 1.50.5 in
commit 68b0efbae49a42d0e14d6040e5e7e573d382ff75:

../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
     ;
     ^

Fixes:
 - http://autobuild.buildroot.org/results/dee/dee3d631474f83b345f22eb26c59a305c32258f8/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-meson.build-drop-Werror-empty-body.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/pango/0001-meson.build-drop-Werror-empty-body.patch

diff --git a/package/pango/0001-meson.build-drop-Werror-empty-body.patch b/package/pango/0001-meson.build-drop-Werror-empty-body.patch
new file mode 100644
index 0000000000..98b6828a63
--- /dev/null
+++ b/package/pango/0001-meson.build-drop-Werror-empty-body.patch
@@ -0,0 +1,47 @@
+From 1d0f3a8abcb2bb8931d02c136ae957ee2d60094e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 18 Mar 2022 18:55:56 +0100
+Subject: [PATCH] meson.build: drop -Werror=empty-body
+
+Drop -Werror=empty-body to avoid the following build failure raised
+since version 1.50.5 and
+https://gitlab.gnome.org/GNOME/pango/-/commit/cd08fb7402498e6ea542b4628447547477ac212e:
+
+../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
+../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
+     ;
+     ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/pango/-/merge_requests/604]
+---
+ meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 0f79bff7..c48fe01f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -89,7 +89,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+     '-Wunused',
+     '-Werror=address',
+     '-Werror=array-bounds',
+-    '-Werror=empty-body',
+     '-Werror=implicit',
+     '-Werror=implicit-fallthrough',
+     '-Werror=init-self',
+@@ -135,7 +134,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+     '-Werror=write-strings',
+     '-Werror=address',
+     '-Werror=int-to-pointer-cast',
+-    '-Werror=empty-body',
+     '-Werror=write-strings',
+     '-Werror=unused-but-set-variable',
+     '-Wundef', # FIXME: https://bugzilla.gnome.org/show_bug.cgi?id=792481
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
