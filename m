Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C709AC636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 16:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE93606FF;
	Sat, 11 Feb 2023 16:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EE93606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjpcRRfmDjw5; Sat, 11 Feb 2023 16:32:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8864D60AC3;
	Sat, 11 Feb 2023 16:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8864D60AC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 628F71BF2BF
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 16:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D0F140445
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 16:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D0F140445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NS4ywTwXy1rv for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 16:32:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 132BA40176
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 132BA40176
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 16:32:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.210]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MnakR-1ohPZW08Mn-00jaRL for <buildroot@buildroot.org>; Sat, 11 Feb 2023
 17:32:03 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 17:32:02 +0100
Message-Id: <20230211163202.25627-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:N7zOoMAbiYhhS56rkyQxG1XElDGtFnJIae2lyqwT2gsHacHGIAW
 slkF2VDT35xvkXdcMK+n/dULsvJpSeirwN2QVd/btZ2uR93OCSjWwwOQ1Ol3W/lpHHBd/jo
 T/4AD2aOV71SKtTCxrXEjqNvvQsm9xx3UKcRaWtoec2JS6XKCwqIyao7zq8wa4CwyBlIYo8
 AFGbLvw3opwago8P4JuHg==
UI-OutboundReport: notjunk:1;M01:P0:uLV8iARcVMk=;DqVjU1AycSMIzUoVQ4CeANkYTXG
 PjQcMsQ+/FZ9YtbnqfpHhFgRZyhAQhAZXnK2LZNQbzvpmnaeTd7SkRmas3qmcK/AnmKZckQUR
 n1JEvWJh1RVEcXm2n/8R6xag8JUowQqGmY8wXa1+gWvbzYthFySK/5WncjX/h//5e5uhR64dE
 IanEkECl6EwhFIMPxYrYBXDQLRjoriYAkzMX7zNfzXV52XABcHso4LIkTmGUTFbFl0xiGcdGX
 FmtHXfqnhQyecJZ75ljuak6gJIJOIW0fjcmc6D6eqGJ304x1OtZWXeJnDBshWtmvOgKPg0Ouk
 QgnyTHQLaIvRxHdX5ebKKNhofBgVxVMxjndPsJbdrjHGrZC0YB25HG1437sVBNtx+hCORzqMR
 PdRNW3IaVPskFmxnzNQpdZLBNlNQDpEeJDMdmQCDIAr14B5+0JVgiigHuOJcNUcUZOBSm1NOw
 FKSlrnFd0T8NnNyIOwD5tv29l19gehcaIBN0MDK56FiQkYJcy88zbJieu3VLlE43+4pAJYQlb
 wh0sKfbxxZREGJSVrT36EHupucpHpKE6OPvTIbnWgFQSQSCCd0/W3FPvvaqEmvYhDXYGWruWL
 RWAyUY+CPi7uCHYl1tBaEczkGkkNnY816NSZh96YqJ6mlNmftawl+4XFwp1NVv6Aaaawu9kX5
 dSEKGPnwkaDvNSuRKNmShW5wsouGABRlhqX/IjVeNlQlWzSOLRJyhu4byzuoITpcUOrrCvSwv
 gHlYKsjh/8NLdwpHtaN0nnt/g3mm7Bsj88eHtS2o6LOnS5XE2EzX0DypOwsdlBk5yINKKqt/z
 0mzdDfu1p81OwYdxL3Z25lXZ2QrhJ1sh4+f9PrXDzNHGbPMS8w99ZNM7kBIRjJrAMi/k8VPtA
 i5P9d24KZt2r16e5MYPY6SDogm9RaF8RErvcP18kQZPZrMjgFSemQgpotOkkAu9y1OX1fPIq6
 GtkMjwajtopFAtjk9nb5zt4Sro0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1676133123; bh=zCFDgtltkQz8PvG4P0WuXFYYgimfCp468gXAXVQ/37M=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=GiwIcVy8BoXCRL49+knkr8iGhocm1U8cb7Lb7OqNuguknEs+9CBRFDFpbgLbgIZwa
 fucdTf8L1zqHVVgcPVqGi/0BZLyx7g+rlBNM3pVJZN8E1+qA1oV8p4s5qLKJHPCwqV
 dFKlK8yK8KQl0GcGRKcrj0/lzkM4MpSpQ4MOJ609SWK62Lp7g3w92NUR3R1xS0QKDB
 OnIyl95tcfsB1zTkgDiZIAkneWdEFu2RNNH1/YI+Nlg9sbz0WFfwBzkhHtGeKuGdra
 R+0ZtYblP+H0InYb4RjwCljohPjZTOep1l6qWDrvG65z+8RggOQlpvBbGO91/BTAUb
 tntyHvpQMO45w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=GiwIcVy8
Subject: [Buildroot] [PATCH v1] package/ntpsec: fix Stack Smashing
 Protection detection
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

Fix SSP missdetection (compiler supports '-fstack-protector-all' command
line argument but selected libc/toolchain does not support SSP,
e.g. i686-musl.

Fixes:

  - http://autobuild.buildroot.net/results/ded9ad5badbcfa6552443d3ce0866722becfefbd

  [...]
  Checking if C compiler supports -fstack-protector-all : yes
  [...]
  Checking for type struct timex                                  : no
  The configuration failed
  (complete log in .../build/ntpsec-1_2_2/build/config.log)

  And from build/ntpsec-1_2_2/build/config.log:

  err: .../host/lib/gcc/i686-buildroot-linux-musl/12.2.0/../../../../i686-buildroot-linux-musl/bin/ld: test.c.1.o: in function `main':
  test.c:(.text.startup+0x2a): undefined reference to `__stack_chk_fail_local'
  .../host/lib/gcc/i686-buildroot-linux-musl/12.2.0/../../../../i686-buildroot-linux-musl/bin/ld: .../build/ntpsec-1_2_2/build/.conf_check_01f3f794d5b6ffb7add7ce130581ae04/testbuild/main/testprog: hidden symbol `__stack_chk_fail_local' isn't defined
  .../host/lib/gcc/i686-buildroot-linux-musl/12.2.0/../../../../i686-buildroot-linux-musl/bin/ld: final link failed: bad value
  collect2: error: ld returned 1 exit status

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ntpsec/ntpsec.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index c7fa2f85a8..18a8353900 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -30,6 +30,15 @@ NTPSEC_DEPENDENCIES = \
 	libcap \
 	openssl
 
+# prevent '-fstack-protector-all' compiler flag detection without
+# ssp support (e.g. i686-musl)
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+define NTPSEC_FORCE_DISABLE_SSP
+	$(SED) s/fstack-protector-all/fstack-protector-all-disabled/g $(@D)/wscript
+endef
+endif
+NTPSEC_PRE_CONFIGURE_HOOKS += NTPSEC_FORCE_DISABLE_SSP
+
 # CC="$(HOSTCC)" is strange but needed to build some host tools, the
 # cross-compiler will properly be used to build target code thanks to
 # --cross-compiler
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
