Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B7B606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iFth9pgt
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25C7B40D6D;
	Fri, 30 Oct 2026 14:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzK04Mgsqxdg; Fri, 30 Oct 2026 14:19:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 01FDD40DAB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369999;
	b=K7OckCdVOEBGFL0H7gesQwkaXQ1Xqy6dN7gDfzisfBTab9Jhvd2zxauotzo+XGpMLwd9
	 mh88WFzfsNUylI4BW1m8/wOpPPsdtdyTyZD2yPHpcZwHQqHvz8muFonwrBekBzjQKFj9L
	 ZZqxZ4lkKDvvL9V9HEw8rCi/tvzx4uZhuntvV4fQ03TRAJXoAFvE/VD9dBuCbYedAHNyp
	 AA+q721fDf2N1JVLU1lVJeQwSplkjAoZDYIVXfpi4xXYEspA02trviiHOyKOxYLNX4myj
	 aHvwO8s7LSsPoiizNJEFI7mSRT/RG0eVMBXOulC4Exf0zNa5fjinuJ5sNVXD6V0XCBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369999;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=hT7ieBZFuiGNbzE6A/f7Ztcu/k37qJxanRGzZQiGj3U=;
	b=MgYu/7vRonXP5XEv0UgLnLajpBn+vY33gF5aVJNHUYPgnuicTydBvWndSPPTbM2hFKPG
	 TOAKaJYfYczXuQwRbYG25qsT53tRXmROmCcFpwtjVGCxWFDTbpwlD3FIHCJO0NpQUvSYV
	 enoj3FBwKWgv41AIFyXNegvlzulvSsbXFZ/xuWLoBrDp3I6m4hadgeEfbmAr75C4KSl+w
	 gvhSNrQibeJ2Q5XxtatA5Tpz8Gh65VEeVYrTYGgSiMu9GVPqoDiA0gPJwMGVYM4ElEuRQ
	 0qJLvr77l8j2OnWhLdM35Nvnrhk5BTDRbIbJLfmLF0wynJmHczlV5vzQBk2XdJZ1bmw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369999;
	bh=hT7ieBZFuiGNbzE6A/f7Ztcu/k37qJxanRGzZQiGj3U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iFth9pgtz3HK9YJBkgxCvNZPHocMJhhWciJoy7kEZHGK/RM0eeON2Yts08+kUDqIm
	 yGq0yKdRj5iR/VUM9L9R43I2nHEXAsyZYMcvPeCwcciuLoywDtrcSq4R89VFd6sjeO
	 z1yoHmw8lCArweJdzzlvbD561JOiMQzGeTZVHZ/NYdGIzIP+G5VWSI1cC3oGhUdZDO
	 5WNrap/4ogbVEZ0WLO9F6z8Un0TrzaUbnAG9vY566abW0FZ6keQMzgAIWb2plVHadQ
	 1Mfe+NpSbcFBztyAepJcw5hsqDQUL0Df6sMm+78LGQghguK9Nlt+ZeQ3KCVKt/1xz8
	 I5UAWlnNP0lmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01FDD40DAB;
	Fri, 30 Oct 2026 14:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31780362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DAFA81300
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWQ-YdB_O1pr for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C0C0E812CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369893;
 b=Y4J0DvIBPqg+RjZd8xVtX7OmX/vLDiar2CgRbHMhkWuayrZO0R1PmEpKXuKSNVBuDXbb
 zhvsaFRcmtkUdpIBwk75x5EywrXcznVIZIcpau2Upx7gkS6Hsu2PeGwCIvlu2xvop7jfT
 GhKXCZFpRIAzEAprL9kvleijHFwYsZ43r+d31PJRFWMqPqgYy0GQJT53q0KYlznrR0PEB
 uhG8b/eVyrjHas7alQQLPqAE35wGrwpZv6Ih35iJ0c+MLsOJAhfvP7f0ECBy8WUNxuBsv
 SI5/aDSdhQ/ps5LAHTRS916IlnswCfecKYJ5E7N5SD2oifpHVVEYaci4floFIvbGGGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369893;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WrPue7wcXzCndeh9LJBeytzsdF9izH5n7xGIaujkpvI=;
 b=WW/HlKPLkBAuhBcDeFagCum6V3ahvD+3CVRF+9nCfs3038pH122uCjQnAMJfZEJobMST
 JadIpGLPIIjg/cKvWyoHRlpidsOkkoqa16OGd0deC1pba/xq3TaB5ryl1mBYGnEQU+npC
 utzpi7iZLFEKUfw5lwvq4N/DIxnE6LHExngtitDo7sl0HXVT2sHK9ln70MU/7enF373/c
 Qmt+LsN3ehfG2Nwu052+z1ibTEcm6cLudRNvmqHpcs33rfqLWld047+l41zgnRUHRieSe
 /4ot0WEWb6Sut9E2EYrBn0k3PiCCmmJ260Jcl3mvLzLP8rMf0fmFufC2u0UHJZnEsMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0C0E812CA
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E00DE9D388; Fri, 30 Oct 2026 14:16:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:08 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f00633f3d9655f0fcfab5a70c55ac47d33a03423
X-Git-Newrev: 45d25787543a53360dcfd8ee19b4054942631c07
X-Patchwork-Hint: ignore
Message-Id: <20261030141645.E00DE9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pkg-autotools.mk:
 further refine libtool 2.6 patching
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7995028303307320763=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7995028303307320763==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45d25787543a53360dcfd8ee19b4054942631c07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit fb32332ec4d06cf310293c2928d9da0a4a41b13a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore                                |  3 ++-
 package/pkg-autotools.mk                           |  6 ++++-
 ...l-v2.6.patch => buildroot-libtool-v2.6.0.patch} | 28 +++++++++++-----------
 ...l-v2.6.patch => buildroot-libtool-v2.6.2.patch} |  0
 4 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 03877605a4..60b3f676ad 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -985,7 +985,8 @@ support/libtool/buildroot-libtool-v1.5.patch lib_patch.ApplyOrder lib_patch.Sob
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

--===============7995028303307320763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7995028303307320763==--
