Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777A2CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 07:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F291C80AF1;
	Sun, 11 Oct 2026 07:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKMPo-9mUF1v; Sun, 11 Oct 2026 07:47:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 99DA3810AC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791704831;
	b=lXsBm/l5ci8JjOfxz7vvAYCVvvGhth+k6o5BETc++N4+l7LPpZ1Ot6NhQjjIFsamJNxB
	 Utm3RbPg2EDB0RW6yVnk6sEnc9qYtZh//dZiGmuAUxAfQ/3tkBEoAoN/HMNfPBsE7HdFk
	 kDYtDRRiUdgh9w44FT814nAbsIf/OQDtnWJmL/c2p27rVtLnv4YcDmQSP2RYfQeDxtDhh
	 8cH8qeEyJD2LvtS1reMDFRt/i1Km5xzRQ6XgmP665523MMW3w/kpjQocNItfeGfjsusSW
	 EOrKrVm1gFZxRUCvn9RMjqP96Mo4FaOqgCGIDeVVU7ebt0CllsrTpNJy8Ma23j9d+jA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791704831;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jLPevMK5r8CovxwhAhaYtAQE9l8pqtwHco7J0Ob1Dkg=;
	b=VpSl+oxMtsImQcDdCppilQfqFZfLcO+N+0dZZ9YEQNpvx9Xt/QA2UjwHYTh54zXeTtad
	 3f//MYA18ysqrkY29LviHe5tHzkvDU2ZvpzyYlEWifJBk4n7LeF73qI9Gb/HIBhMpo2hM
	 oB5DhQo7vMyRokhHP3PVbxAqroe37azk4t0N5pjwUjCNWfUf9fNaU0WapWQRR7YvJ3sou
	 EZq4kobeibh5DrIaCO4e+GPXAbRGhFOQyu5zGzgaie2ilmods4kvxrko6+XOaO5/lKrEn
	 NsOk5EqOsByYkaRkH+KfrnnJnH0eRQleODNcxo7VNo/4YsXolRenllZP/v8/YWKGaYA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791704831;
	bh=jLPevMK5r8CovxwhAhaYtAQE9l8pqtwHco7J0Ob1Dkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=capouL3kZrkRlk2WAdsJObHMMIXshyDW9kQsXNoh6irA9ZoAhXQTuV+czuUPCRUnp
	 TSCfZm2Ko6cssRg13MWMl7BJC1xJCXS2FPIQQdbo+3H3uRR7I5yWnH/LSW5J9l9aeI
	 JmO/j3OwYXqAkx4kO0l34t9Z3YZOODBXC11hGoG5jrJlJH+O6E+/TUngPicLC+4cn4
	 8KdIRcWSTBuBDbNVhQcfUsFVxfC0EAwuu4oSAHoS5weyc9NOfO+ckHSrXjYbJQfSF7
	 6HtDxjwOqnRPUATUATpYKO3I1ZtIlKHVTG39cYke+B4gLYtgzaasB9a8wfG7F0JkHh
	 vpX37fvCF1nrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99DA3810AC;
	Sun, 11 Oct 2026 07:47:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F12EC9DF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E16C3400D5
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HV2nAoiXYR81 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 07:47:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CE162400D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791704829;
 b=armtbUqGks6hIQDLUIO51O2X/4FceD+vRMDk45w8rUUfVJZGDOYwuptF7YCXigkaLgkN
 98U9tPxdT8aNlCiZJqN7p/5kQoGl77rUVsjNjpf8qWKsU8rEa8cixPJm6wfSZmeiiSQCA
 jrzVICeACHFUKVnzCLN/V8OCenXre1FNJ6gGkVuDexUBIR9oR7UkRACVgltdkh9HGyWzG
 Su76qL9XMsKt6wCkA4pi/rWv0bZCQjkhLO29iNkOS5KoWhTuG7uVDfx1j3G+hTHJwk/SC
 EiEPhnvWqpRm5YKQ8Rx4phv2FJXQxQPHgNpz6Za5pQ3g1a8yUcMwThnQmsLCxHnltEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791704829;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=53YqxYcSO0pVj8+FT81HoFbApUfPqvqzJIc5DTHKkgk=;
 b=YBA3BHwBXiaJU5Tlwuyu4aWf9QBDIXTMcZsEV1NhzDX+4haLFTFzhrhv6pNklqnXZHch
 gXjyHnPW4Gz8P2vQjAtvkr7RtJTC5qnyoWcPEX8o6ATPUtUXWXly3aHlPwESvuH4CVlP3
 mwPhQYHqHIMxxk33G8jRrsNW7UapLGNRgc1JyaTpN68FNEv76RjdFaWj2WY9TFf+H9Si7
 kwTNDdMIiVi/4euDRXdU5WvavmltEz7EqeM7/6lYq7UJTpEQGaMe2wSkVw7laE6huOvQX
 f0uDT89Ob4NtWRctqaksg8gmJ/CBMxc8Z/WmTIhVe/0wsEVmnjQBJflCkh3JjrovxHQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vVexbJLF; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE162400D1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:47:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 29CFF4E411DB
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:47:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B08BA605CC;
 Sun, 11 Oct 2026 07:47:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 185E011D7012D; 
 Sun, 11 Oct 2026 09:47:02 +0200 (CEST)
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 11 Oct 2026 09:46:58 +0200
Message-ID: <20261011074658.1888569-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/pkg-autotools.mk: further refine
 libtool 2.6 patching
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

5dbba2616f287cf6d333a0849ef870b0ce49f24f ("package/pkg-autotools.mk:
also handle libtool 2.6.x") added some patching logic for libtool
2.6.x, in order to fix a build issue in cryptsetup, which uses libtool
2.6.2.

However, the change in this commit applied the newly added libtool
patch to all 2.6.x libtool versions.. which broke libmodbus that uses
libtool 2.6.0, and unfortunately the ltmain.sh in libtool 2.6.0 and
2.6.2 is sufficiently different that the same patch doesn't apply to
both.

So we:

1. Rename buildroot-libtool-v2.6.patch to buildroot-libtool-v2.6.2.patch

2. Introduce a buildroot-libtool-v2.6.0.patch

3. Update the logic in pkg-autotools.mk to apply
   buildroot-libtool-v2.6.0.patch to libtool 2.6.0 and 2.6.1, and
   buildroot-libtool-v2.6.2.patch to libtool 2.6.2 and later. Note that
   we didn't test with libtool 2.6.1 as we didn't identify a package
   using this libtool version: we for now assume that it will be like
   2.6.0, and will fix later if needed.

Fixes: https://autobuild.buildroot.net/results/3faf9e6889cbe33019141450a95023c730a6d03c/
Fixes: 5dbba2616f287cf6d333a0849ef870b0ce49f24f ("package/pkg-autotools.mk: also handle libtool 2.6.x")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  3 +-
 package/pkg-autotools.mk                      |  6 +++-
 ...6.patch => buildroot-libtool-v2.6.0.patch} | 28 +++++++++----------
 ...6.patch => buildroot-libtool-v2.6.2.patch} |  0
 4 files changed, 21 insertions(+), 16 deletions(-)
 copy support/libtool/{buildroot-libtool-v2.6.patch => buildroot-libtool-v2.6.0.patch} (86%)
 rename support/libtool/{buildroot-libtool-v2.6.patch => buildroot-libtool-v2.6.2.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 83c1e0c66a..7ad121d393 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -981,7 +981,8 @@ support/libtool/buildroot-libtool-v1.5.patch lib_patch.ApplyOrder lib_patch.Sob
 support/libtool/buildroot-libtool-v2.2.patch lib_patch.ApplyOrder lib_patch.Sob lib_patch.Upstream
 support/libtool/buildroot-libtool-v2.4.4.patch lib_patch.ApplyOrder lib_patch.Upstream
 support/libtool/buildroot-libtool-v2.4.patch lib_patch.ApplyOrder lib_patch.Sob lib_patch.Upstream
-support/libtool/buildroot-libtool-v2.6.patch lib_patch.ApplyOrder lib_patch.Upstream
+support/libtool/buildroot-libtool-v2.6.0.patch lib_patch.ApplyOrder lib_patch.Upstream
+support/libtool/buildroot-libtool-v2.6.2.patch lib_patch.ApplyOrder lib_patch.Upstream
 support/misc/relocate-sdk.sh Shellcheck
 support/scripts/apply-patches.sh Shellcheck
 support/scripts/check-bin-arch Shellcheck
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index da33909881..bb65d639df 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -77,7 +77,11 @@ define LIBTOOL_PATCH_HOOK
 		elif test $${ltmain_version} = "2.5"; then\
 			patch -i support/libtool/buildroot-libtool-v2.4.4.patch $${i}; \
 		elif test $${ltmain_version} = "2.6"; then\
-			patch -i support/libtool/buildroot-libtool-v2.6.patch $${i}; \
+			if test $${ltmain_patchlevel:-0} -ge 2; then\
+				patch -i support/libtool/buildroot-libtool-v2.6.2.patch $${i}; \
+			else \
+				patch -i support/libtool/buildroot-libtool-v2.6.0.patch $${i}; \
+			fi \
 		fi \
 	done
 endef
diff --git a/support/libtool/buildroot-libtool-v2.6.patch b/support/libtool/buildroot-libtool-v2.6.0.patch
similarity index 86%
copy from support/libtool/buildroot-libtool-v2.6.patch
copy to support/libtool/buildroot-libtool-v2.6.0.patch
index b3968b1289..ece3134ce9 100644
--- a/support/libtool/buildroot-libtool-v2.6.patch
+++ b/support/libtool/buildroot-libtool-v2.6.0.patch
@@ -1,11 +1,11 @@
 Libtool fixes for cross-compilation, many past contributors/authors.
-Update based on libtool-2.6.2.
+Update based on libtool-2.6.0.
 
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -3008,9 +3008,8 @@
+--- a/ltmain.sh	2026-10-11 09:19:50.195676649 +0200
++++ b/ltmain.sh	2026-10-11 09:20:44.054085154 +0200
+@@ -3015,9 +3015,8 @@
  	# was found and let the user know that the "--tag" command
  	# line option must be used.
  	if test -z "$tagname"; then
@@ -17,7 +17,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  #	else
  #	  func_verbose "using $tagname tagged configuration"
  	fi
-@@ -4746,8 +4745,12 @@
+@@ -4753,8 +4752,12 @@
  	  # At present, this check doesn't affect windows .dll's that
  	  # are installed into $libdir/../bin (currently, that works fine)
  	  # but it's something to keep an eye on.
@@ -32,9 +32,9 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  
  	  if test -n "$inst_prefix_dir"; then
  	    # Stick the inst_prefix_dir data into the link command.
-@@ -7063,7 +7066,8 @@
+@@ -7062,7 +7065,8 @@
  	;;
-       -all-static | -static | -static-libtool-libs | --static | -Bstatic)
+       -all-static | -static | -static-libtool-libs)
  	case $arg in
 -	-all-static)
 +	# Make -static behave like -all-static -GZ
@@ -42,7 +42,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  	  if test yes = "$build_libtool_libs" && test -z "$link_static_flag"; then
  	    func_warning "complete static linking is impossible in this configuration"
  	  fi
-@@ -7072,12 +7076,6 @@
+@@ -7071,12 +7075,6 @@
  	  fi
  	  prefer_static_libs=yes
  	  ;;
@@ -52,10 +52,10 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 -	  fi
 -	  prefer_static_libs=built
 -	  ;;
- 	-static-libtool-libs | --static | -Bstatic)
+ 	-static-libtool-libs)
  	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
  	    dlopen_self=$dlopen_self_static
-@@ -7393,7 +7391,8 @@
+@@ -7382,7 +7380,8 @@
        prevarg=$arg
  
        case $arg in
@@ -65,7 +65,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  	if test -n "$link_static_flag"; then
  	  # See comment for -static flag below, for more details.
  	  func_append compile_command " $link_static_flag"
-@@ -7695,7 +7694,7 @@
+@@ -7684,7 +7683,7 @@
  	continue
  	;;
  
@@ -74,7 +74,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  	# The effects of -static are defined in a previous loop.
  	# We used to do the same as -all-static on platforms that
  	# didn't have a PIC flag, but the assumption that the effects
-@@ -8755,7 +8754,7 @@
+@@ -8718,7 +8717,7 @@
  	  *)
  	    if test no = "$installed"; then
  	      func_append notinst_deplibs " $lib"
@@ -83,7 +83,7 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  	    fi
  	    ;;
  	  esac
-@@ -11296,6 +11295,10 @@
+@@ -11247,6 +11246,10 @@
  	    # Replace all uninstalled libtool libraries with the installed ones
  	    newdependency_libs=
  	    for deplib in $dependency_libs; do
diff --git a/support/libtool/buildroot-libtool-v2.6.patch b/support/libtool/buildroot-libtool-v2.6.2.patch
similarity index 100%
rename from support/libtool/buildroot-libtool-v2.6.patch
rename to support/libtool/buildroot-libtool-v2.6.2.patch
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
