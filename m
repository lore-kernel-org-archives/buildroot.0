Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B84D606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Z95o8FwW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27411810BA;
	Fri, 23 Oct 2026 07:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIHV9QKOGLdW; Fri, 23 Oct 2026 07:37:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0FB4E8117D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792741044;
	b=oIq2yKnstN7JQwX85XIdrKs7oZZECWvoaWrekkM5+WkC1m7JOVtUu24Oh7s5CKAFvIyf
	 H1hPSx0J4IX83907YQBdmz9yMVtKBQP0wUrxJ29ZT+IvPZJlP8ivoHeXW5vz2zIVPetnY
	 23a7hibLKw3Zz+FDdiHocjUq9MlgM+aDVYLP2gx2vb8vfar/fcf9gShIaQG6E6SByyKfN
	 BSCAM9nzq99Q08pW76JnYxfw6O6VrpeTFoPErDMguwfNuhROMrHi27Gp1RNEDgJ2uvnkp
	 FmEwyKiZFA95PvpwyH63ZAxkAfhsb95W2UsyFoDIVCuh798UK2TFw9Pyo+d6nosSaHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792741044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Pe0z5DIuyYNFjTB+utCxPlwN5KZr+rzuEmzU68KwJ1c=;
	b=RlPmazMJXA/TCmFgrQp+9a5buvoOs4BZqS6/67eIbdNOqZsE629YGJ4NM2E6L2xbZdY0
	 nknOi/yZiGhiHXejbFY/hQzfkARBEmnOfYL73lfjwWTz0PpDIg+jDBNOH1kRyaxJExZEp
	 zPh/fJqQ9QwdOIRsM55+VyJ0DcuXwr/d0jXxs+JlmEKMK5vvANBYJA3VVG0HUa2tipQ7J
	 2zW2fkzQw2DCgiDBxvFvdZ1wLMsNCmr4AAS9pGuTQVRfEkbxoSm6FfksHUKo6/8nPTnEv
	 OvAHCPn7I2ESoKsXCBowf+NEktNFrgUlUb4MubSVZol0Ks6wocSFRchi5BMRou5THoA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792741044;
	bh=Pe0z5DIuyYNFjTB+utCxPlwN5KZr+rzuEmzU68KwJ1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z95o8FwWp5zj9w2gyMZv5l8ME3naYqLwOpzNymbjPZCuTj3g2gY4AS4dtoHvH4W+B
	 64338ZxPDsda47rXll0iApCAXGvDansCoegvwpf75QZ1dvCr1e7F923v3pYkj77OoY
	 D2bxA65RzYWhpff/ufgj6Zm+MusewB1R2ObvH59HLwUSearybUr7QIimd3PLNqmF0J
	 RXqZzDb6CBoH2YiIxfSNeB8FgmoeQfH8hamYJ066s1VRhpvfAUVCm1wJ8fMQ1Mtkso
	 ucFfmfWJjCdlnOO9vFwKEPLFWsd4qMxSCe1YcArWp2cIdto+QK2q2UHndaI2yAaM8Z
	 RuUMqn56ic6iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB4E8117D;
	Fri, 23 Oct 2026 07:37:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF726356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5D7F40913
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0a_wcOkkhfVC for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:37:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0330A40828
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792741041;
 b=lPdRlwvOKr0SAVeKqWkG5rm0XiMpGCgTmL1dv3aDN62ImQYCuoWNBvvnsPybuQwfB8/Y
 dHainJuBgqUSgSCtvH4nMCVGWJBVogaf23mabkboxtSUeNINmEtiqwUS/mGRLJmhRl6B1
 gEgVycS8VtEZ/H7KAKr/osFnR3iuplGcVMnRaKV8Ty3rbP6L0U5z7j8c7BvOsztFwjS6+
 2W8LNox5d5MDMhKYgGA70W3CgHO25wz9LC1nTRdf+AtxRWyGbjGg3R3rYOjAvo/VIVYpG
 WPUJXbSzTgpTCLzPmjci2YvQ/yrgrFs6TL4Z0fv+f15AaTMkaZYl2UXVFusx3ZRxk6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792741041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=55B4ZGkt1WEGVaaj4GQ2tqAELbky8s9+Ce3EPvyF0fo=;
 b=RKSxr8kh5ZO1ae712A7fPQyrUPgXqnwgdBMEX+1WfNVWaEH0K++02loth8/I+Esy9Vpk
 pLgBYKMrCaXlByZ4lgf5yhanv3MUBw9Hs4LcmyFj3XvEPmjUHcKWai4bQnkN/QwAdsjQc
 bmsLRx/6iy/EILFn7dsfG7IZULwpqyC+ZJK7iTNzMYtj+VM6ssMa0fu7vDlpiqbfxzR+r
 bjgXp3OLwimXySJhiSPN2qBS0lZObiK1Iv8BcVnK+3TNCr+2Jlusxva1fBRVNg7FOgL0P
 R9lQYTnXL0rhP0UfQB4frCBm0seW4u35MkhDHqXwh5H8ERuRmH70ir71iHupPHiuDhQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0330A40828
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:37:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DA0B9C63F; Fri, 23 Oct 2026 07:35:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 09:36:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 315207aeaaf2fab48384c00a7ae72f32bfee1678
X-Git-Newrev: fb32332ec4d06cf310293c2928d9da0a4a41b13a
X-Patchwork-Hint: ignore
Message-Id: <20261023073556.8DA0B9C63F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools.mk: further refine
 libtool 2.6 patching
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb32332ec4d06cf310293c2928d9da0a4a41b13a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
 .checkpackageignore                                |  3 ++-
 package/pkg-autotools.mk                           |  6 ++++-
 ...l-v2.6.patch => buildroot-libtool-v2.6.0.patch} | 28 +++++++++++-----------
 ...l-v2.6.patch => buildroot-libtool-v2.6.2.patch} |  0
 4 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5fff512d93..c7558ac8c4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -977,7 +977,8 @@ support/libtool/buildroot-libtool-v1.5.patch lib_patch.ApplyOrder lib_patch.Sob
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
