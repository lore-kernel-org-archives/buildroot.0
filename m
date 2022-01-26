Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFD0C5DF62
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EDBE84D7B;
	Wed, 26 Jan 2022 20:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66UcZ9G1_zoT; Wed, 26 Jan 2022 20:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5788D84D76;
	Wed, 26 Jan 2022 20:31:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC3C91BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA38084D76
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DL2WLdiYM6Td for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:31:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A876B84D74
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:31:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id n8so454279wmk.3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r/QmFC6mCCQ9zvqEwp2Om+cCZsArIrtqAINsj3LSVuY=;
 b=hvtQITZXX53G9oJuqBByjEuuRWfpldzKPSTTCfzSI07dWvSnTTSAB9qxN6RgjzZekg
 9cpOhck9r6+EyDlsr2/CYx+t+y3cXmuaur/IoiYxEXbaXzI50CeOWLZt4gyFc93ioi/D
 g8Hj3FjxJ3Pxziz7hO2CFdVuBcMIO6GoufjXiY35EI2CDj3Vl3MGK/J/T8Zrm5scMpFI
 1CjzmRmXknRvGx844ik3ePhAc/Y0z/qyCmeO8MEmf3uZ23TPH8IrBP0v2Cgs7ouuZSgE
 uZuKKEIVaHlpr3RdD9Jz0Xns7NJLRjyEWTHrjddiGYe5Ze2kwWLiFXKXlohX8uciF5WQ
 moEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r/QmFC6mCCQ9zvqEwp2Om+cCZsArIrtqAINsj3LSVuY=;
 b=QNjZ4GcXNY09PJxu53W3t3AqwIfACOqF9udMSBIQYH1f4qAbcIZVQFQKzKrxkdBFk0
 Z7lu7o+ZF14zT1Snaish0pHmtiO3oardzX4fKkJAeOEBerstPrQeJExBjjko3lQ+kY6q
 Jj67p4rjM5D5t3JoMpo/Gc/P4FXAK4CMq4VyoBZqt9dMcdSQ9yd5uJ54dT7TjWuh/pG/
 HntBb+FwE+5STK89jRts0ySGRIXs5YkRYdRrFkjTad6Ov9jY0I0Sh+lpRbBqT3zwxvEj
 DvCgRJzrWIbW3MWM3e0Xh6Ay1GXQR+qEi2DUS6cbYlBcUWme3pwLg+ro4R9Xygc8p4Ed
 o+iw==
X-Gm-Message-State: AOAM531szA930kfi48hWrEWcmx+4C2xbZ4/A7y1EJZp2D//PFIFOVw+X
 K/s4U9glcgLigA0QTmWvq4QEicPtUis=
X-Google-Smtp-Source: ABdhPJyCPmLEhXILUzV9R33cZKXPk+zNCNkgD+cCVYFN4B0MnuKNKPVko6HPS0mRfJTbeDN33elpsA==
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr8726643wml.181.1643229090616; 
 Wed, 26 Jan 2022 12:31:30 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id h8sm4503185wmq.26.2022.01.26.12.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 12:31:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:29:42 +0100
Message-Id: <20220126202942.1495636-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: link examples with
 -latomic
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link examples with -latomic to avoid the following build failure raised
since commit 3edc1cc44c7bd2deed31d28fa9534e67f32334e8:

FAILED: spa/examples/adapter-control
/home/buildroot/autobuild/instance-0/output-1/host/bin/sparc-linux-gcc  -o spa/examples/adapter-control spa/examples/adapter-control.p/adapter-control.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group -lintl -ldl -pthread -lm -Wl,--end-group
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: spa/examples/adapter-control.p/adapter-control.c.o: in function `spa_graph_node_trigger':
adapter-control.c:(.text+0xdf4): undefined reference to `__atomic_fetch_sub_4'

Fixes:
 - http://autobuild.buildroot.org/results/192f40a5c6e05fc11507494e19db52a47082fc35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eson.build-add-atomic_dep-dependency.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch

diff --git a/package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch b/package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch
new file mode 100644
index 0000000000..b91adbe7e4
--- /dev/null
+++ b/package/pipewire/0001-spa-meson.build-add-atomic_dep-dependency.patch
@@ -0,0 +1,40 @@
+From 8d9dc023ac12cf305c28786891d5b15e13f29a3d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 25 Jan 2022 17:22:02 +0100
+Subject: [PATCH] spa/meson.build: add atomic_dep dependency
+
+Commit fa64d93e64592d5edd8767f722cf4ea093641052 moved the atomic_dep
+from pipewire-jack to pipewire_dep however atomic_dep should also be
+added to spa_dev to avoid the following build failure when building
+examples (which don't depend on pipewire_dep):
+
+FAILED: spa/examples/adapter-control
+/home/buildroot/autobuild/instance-0/output-1/host/bin/sparc-linux-gcc  -o spa/examples/adapter-control spa/examples/adapter-control.p/adapter-control.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group -lintl -ldl -pthread -lm -Wl,--end-group
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: spa/examples/adapter-control.p/adapter-control.c.o: in function `spa_graph_node_trigger':
+adapter-control.c:(.text+0xdf4): undefined reference to `__atomic_fetch_sub_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/192f40a5c6e05fc11507494e19db52a47082fc35
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/8d9dc023ac12cf305c28786891d5b15e13f29a3d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ spa/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/spa/meson.build b/spa/meson.build
+index 4ad37cdb4..2404748df 100644
+--- a/spa/meson.build
++++ b/spa/meson.build
+@@ -9,6 +9,7 @@ spa_dep = declare_dependency(
+   include_directories : [
+     include_directories('include'),
+   ],
++  dependencies : [atomic_dep],
+   version : spaversion,
+   variables : {
+     'plugindir' : meson.current_build_dir() / 'plugins',
+-- 
+GitLab
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
