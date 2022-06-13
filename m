Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6140C43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D60460E9D;
	Mon, 13 Jun 2022 20:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXVHCP-ttBCr; Mon, 13 Jun 2022 20:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF6E160E48;
	Mon, 13 Jun 2022 20:31:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9575C1BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8415B60DB2
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLK537S0iFVv for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:31:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75A6060E48
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:31:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id s1so8500564wra.9
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQbNz+X9vWJRWSAL367ElxGdwXKP8fbukvzWKbZpC+A=;
 b=FQbKHmEIeYZL3e4NGEHUQKasQBPIlHMF4FMAYavQvuOEry4hur6gsORBw5Y0WqfsYW
 srj+h6EOCmGie1ts1+1FGGv4fBRqLukabZF2Pd8Z98+qnztLVtaw91Ptdq+I9TWKyjJc
 uXSq8cZveUWIKqjwB6EcNgorSvQx8DP44Srj/hMVhBwZ7yD++WcvaTxfLkjhuAVuv8Lc
 LOQ2Ftd6N5LYeg5HdjZOFlnxDjMjKDPhGdVKGoqZ0h279jIM4x+wjSNFifXD2D0/1ejJ
 szOyu4xpFq6/KciFBcCLtXWyzwY/q6j3gciQcK86kO2r3FE/KN0v6pU1U9SXnONEPBQb
 YbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQbNz+X9vWJRWSAL367ElxGdwXKP8fbukvzWKbZpC+A=;
 b=3mYdF1SblNZsiOZI2G6ZBQjVjylTsVSg4s0usuigM3D9t3naKsXv1fmzMg+uOmiAdA
 VMsyRbjOthHYKOKcEG5BVoQVYP3Ow93MniotIjVenmqYLuuTOMsOQuvpS2du48jZIws4
 AiaQEdPW6EaMwuYAV4dj0FG2N148cuQg+6aCNLvrMSPYRfDUiffIc0JxTel5lpvQzbJl
 Cqbg4/mnvuATElCVu7K6uMt8lX+MuU7/7EonnAqOkGOzlC3uv6qBHtvsK4zf6Zmcmt+F
 AGJBMHHl8nhjahmSz8pfMmOnqpPeX2uF3Uf1rlSDSAw7KDeCN/0obCRXTHTg8VAWA+pt
 qNXQ==
X-Gm-Message-State: AJIora8RfrDuypXWMtP51VVJD087MDJibLr6QEKI5tdj8VrAgwS/0NW3
 /VJXTkm0Roe2AElnE9HhpWgStYsLlTY=
X-Google-Smtp-Source: AGRyM1s+McC/GfzN1LnfSQ3CSfTrLdXQTDmW73gbKxmUgLCj7oERh7Kc2iAq6HTMnMk5p+Ia3RFgJQ==
X-Received: by 2002:a05:6000:108b:b0:213:abed:50fe with SMTP id
 y11-20020a056000108b00b00213abed50femr1418967wrw.425.1655152292437; 
 Mon, 13 Jun 2022 13:31:32 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t63-20020a1c4642000000b003974cb37a94sm14835123wma.22.2022.06.13.13.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 13:31:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 22:28:55 +0200
Message-Id: <20220613202855.293980-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fxload: fix static build
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
Cc: Jeremy Rosen <jeremy.rosen@openwide.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure:

/home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o fxload ezusb.o main.o
/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/buildroot/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/sh4-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/bca28d7a6d2b324fb61fe99b8af4b86caa2350ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fxload/0001-fix-static-build.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/fxload/0001-fix-static-build.patch

diff --git a/package/fxload/0001-fix-static-build.patch b/package/fxload/0001-fix-static-build.patch
new file mode 100644
index 0000000000..9ce49baa6e
--- /dev/null
+++ b/package/fxload/0001-fix-static-build.patch
@@ -0,0 +1,25 @@
+fix static build
+
+Fix the following static build failure:
+
+/home/buildroot/autobuild/instance-3/output-1/host/bin/sh4-buildroot-linux-musl-gcc -o fxload ezusb.o main.o
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/../../../../sh4-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/sh4-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
+/home/buildroot/autobuild/instance-3/output-1/build/host-gcc-final-10.3.0/build/sh4-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bca28d7a6d2b324fb61fe99b8af4b86caa2350ee
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Naur fxload-2008_10_13.orig/Makefile fxload-2008_10_13/Makefile
+--- fxload-2008_10_13.orig/Makefile	2022-06-11 22:11:02.845916977 +0200
++++ fxload-2008_10_13/Makefile	2022-06-11 22:12:25.118006070 +0200
+@@ -39,7 +39,7 @@
+ 
+ # object files
+ $(PROG): $(FILES_OBJ)
+-	$(CC) -o $(PROG) $(FILES_OBJ)
++	$(CC) $(LDFLAGS) -o $(PROG) $(FILES_OBJ)
+ 
+ %.o: %.c
+ 	$(CC) -c $(CFLAGS)  $< -o $@
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
