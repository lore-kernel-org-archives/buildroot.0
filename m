Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF06DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6864360FC4;
	Tue, 15 Mar 2022 13:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qyctxkq4qNDa; Tue, 15 Mar 2022 13:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B6D660FBE;
	Tue, 15 Mar 2022 13:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C93331BF2FB
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 13:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3CD260FBE
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 13:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_v-hN5mORG2 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 13:07:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3C2760FBC
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 13:07:55 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id t5so19582172pfg.4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 06:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3klhkwKr60c7dsbIaKLSxgApoF54E+7opfeRM6logw=;
 b=CU4LpSFE5AHKLLLmE2Qloo07TmXPpubUh47skXBrvCtwnP3iEpJkUnTi3BCg28u5P6
 TdkhERT7W9/gxbChXd+oo+N4BMlFtMK9Tf6CdmAKEE4bPYlYspk7EE/WzhSKR7dkU9tO
 IR/jPx6kdLOrLaybME25gJwRXOLyKIn5o93JUW/7mVL3a9P43EPC/Sh2uyTxavG23HU6
 mlFQ3smrmaFwzc8fl81SuUZjiJqYy1iXbfwJSIgtOUTkk6qZX+mhne8J3y6aiynAkIPO
 +rTxHfz00a1IXhazG2bqRvnJaOAjkrkSEDIYiEklXppYdedC4VvQ0m4G9XhMRPVWVfi3
 iIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=j3klhkwKr60c7dsbIaKLSxgApoF54E+7opfeRM6logw=;
 b=ggv6XcKVmMwowrV6CY+ZWGOkg/5Fs+nh6hdRpeLOHEJzhFJFA54nseDC0r4lfwKYoA
 51vUz3odxproGnxg0p9kzi8PrFiC5HocA0QI0PAc8rl1w+v54+fNMh/do5jRvQc0KfhC
 NSDUfXAcLQkkI4Vc+CStvDdJCfQwOQYasXJrHaYFIJy5uZT5ohClWyp6wY1zQRf2HKHh
 mpIJTagVBYsAyRMCfzqQobkPHmJC7wFc1fFbeN8hpo8PhUHIPuzDGzof3b1jSg3jjzUa
 egdt3UK2E3qeKUexJgJwf0KTcchZ9jfmtjyc2mO8U8X7Y+E8/o1D8oXinLVxjFhW3nu1
 bsTw==
X-Gm-Message-State: AOAM530I5VFcDYrT2+W2mmYHycPODtKQKwV2ZgULInocMskXmrrS/6a7
 WSeQ97IMPb4WN/8GdfIl/99MBlZeE878dw==
X-Google-Smtp-Source: ABdhPJxb4yiW74PURSWPmPYEJFgWbwadfID52Th9vQ6eiKY19U5pwVpr/qwtStxURTTerLqAqHG7RA==
X-Received: by 2002:a63:b06:0:b0:374:5e1a:150a with SMTP id
 6-20020a630b06000000b003745e1a150amr23788686pgl.137.1647349674145; 
 Tue, 15 Mar 2022 06:07:54 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 oc3-20020a17090b1c0300b001bf8c88a8c4sm3277668pjb.35.2022.03.15.06.07.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 06:07:53 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 23:37:37 +1030
Message-Id: <20220315130737.428449-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] fakeroot: Fix segfault on ppc64le
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When generating a filesystem image on a power10 build machine running
Ubuntu, we see a segfault when fakeroot is running chmod.

This has been reported and fixed upstream in Debian in version 1.26-1.2:

 https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=995393#53

Add the samae patch to resolve the segfault.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
This isn't a commit in the fakeroot tree, rather a patch from the Debian
packaging.

I would appreciate if this was added to the 2022.02 stable tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../fakeroot/fix-prototype-generation.patch   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/fakeroot/fix-prototype-generation.patch

diff --git a/package/fakeroot/fix-prototype-generation.patch b/package/fakeroot/fix-prototype-generation.patch
new file mode 100644
index 000000000000..38d32ff3b22c
--- /dev/null
+++ b/package/fakeroot/fix-prototype-generation.patch
@@ -0,0 +1,59 @@
+Subject: Fix prototype generation for openat
+Author: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
+Date: 2021-12-30
+Bug-Debian: https://bugs.debian.org/995393
+Forwarded: Yes (implicitely)
+
+    As jrtc27 pointed out in IRC, ppc64el is more strict than other
+    architectures when it comes to va_arg handling:
+
+        it's that ppc64le uses the elfv2 abi, and for variadic calls you
+        must reserve space for a parameter save area
+
+    So enhance wrapawk to create a proper prototype and argument
+    handling although it's specific to the openat call. Also add the
+    missing documentation for the sixth column to wrapfunc.inp.
+
+--- a/wrapawk
++++ b/wrapawk
+@@ -37,7 +37,25 @@
+   argtype=$3;
+   argname=$4;
+   MACRO=$5;
+-  if(MACRO){
++  openat_extra=$6;
++  if(openat_extra){
++    print "  {(void(*))&next_" name ", \"" name "\"},"  > structfile;
++    print "extern " ret " (*next_" name ")" openat_extra ";" > headerfile;
++    print ret " (*next_" name ")" openat_extra "=tmp_" name ";"> deffile;
++
++    print ret " tmp_" name,  openat_extra "{"           > tmpffile;
++    print "  mode_t mode = 0;"                          > tmpffile;
++    print "  if (flags & O_CREAT) {"                    > tmpffile;
++    print "    va_list args;"                           > tmpffile;
++    print "    va_start(args, flags);"                  > tmpffile;
++    print "    mode = va_arg(args, int);"               > tmpffile;
++    print "    va_end(args);"                           > tmpffile;
++    print "  }"                                         > tmpffile;
++    print "  load_library_symbols();"                   > tmpffile;
++    print "  return  next_" name,  argname ";"          > tmpffile;
++    print "}"                                           > tmpffile;
++    print ""                                            > tmpffile;
++  } else if(MACRO){
+     print "  {(void(*))&NEXT_" MACRO "_NOARG, " name "_QUOTE},"  > structfile;
+     print "extern " ret " (*NEXT_" MACRO "_NOARG)" argtype ";" > headerfile;
+     print ret " (*NEXT_" MACRO "_NOARG)" argtype "=TMP_" MACRO ";"> deffile;
+--- a/wrapfunc.inp
++++ b/wrapfunc.inp
+@@ -9,8 +9,10 @@
+ /**/									  */
+ /* each line of this file lists 4 fields, seperated by a ";".		  */
+ /* The first field is the name of the wrapped function, then it's return  */
+-/* value. After that come the function arguments with types, and the last */
++/* value. After that come the function arguments with types, and the fifth */
+ /* field contains the function arguments without types.                   */
++/* A sixth field is a special needed when wrapping the openat syscall.    */
++/* Otherwise it's like the third (function arguments with types).         */
+ /**/
+ 
+ /* __*xstat are used on glibc systems instead of just *xstat. */
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
