Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEA1606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BHoTC3AB
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9BF240B9A;
	Fri, 30 Oct 2026 14:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irit5jr0Jdpa; Fri, 30 Oct 2026 14:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 939C640B9E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369265;
	b=S1dkSermiznbm4lifxIONlRWyYiGXaMdzLDGHBVg8yaM22CJ6CVlwEr7dXiSHQxoogwl
	 1fh5DEsgmhzU6YN6a/kPlOAeX9a/3QP9K7jG1B/KLL7vmKxPp7OaBbv8o8/oCKa2RQLkM
	 MSiVX4qdxO+6R4iG0dHUYjrgJzaBLtVe9lOZam1/MRvY8mBNug/veldDT/x8+4dDdjfjQ
	 dNS4cmz8J3rSRtl3s/mCU26qsVihX4wN89kEHiYvT/xqRvcvNi6mjUyPizmSOOMLW4LG9
	 lRzaLZscKlpJcbo3vr2Mp2jbhiHqZT+VRMBlVXvgqoL8kal6fhvbl5ii8a+GAz5ONww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369265;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+CdR18VMzt/AGyJVQ0aPmpXfAFPFRp2X1N7eoa3KKWI=;
	b=sM2n3AckKN4dsJS+2cn+jnCFbMk5WM9NyK+zBRmm/6zehp25eGNi6+fzKMh83yiBDRdh
	 QMm0qhwYKveW3FyfmtHyHsnZukIeLz6sFfs2txCHfNyv0anh2qPaPcOWjRXqCJtjtlrd8
	 mxOROT6n5Ydn7/jjSNNcis7/x+5vgoBqeyKIKaxY/yb7b1r6Dy9txYc4ZcpfqCVB4PzkB
	 AiwkzBCmXiGSlLRoCptoG/kjSlz/2WC+6cO2tyKXvbnJ2U8Rz4OA540+j17FeSiExUAV5
	 AtEVjOEnss6LJnckpzS3n2ZgGivQOgtB2vCsXkOk7fwxI4DXSTNaK4sVniu20evF/EA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369265;
	bh=+CdR18VMzt/AGyJVQ0aPmpXfAFPFRp2X1N7eoa3KKWI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BHoTC3ABn+1qXd0ddLTXe4+u0rK9/gQutj1udAjjCVTuYku9or5nTIFQR4ZEfnQVv
	 jnyT1o5+PpvpL1mxfAccNePNr/9CKxg+ZiCl3XMeSnqio62QxWcm8fGBjhnI3tLW7/
	 cWzyRGcK89Mvxnz6Wyu0I4qplKOk2pjq86QawzbGbiGSuGU7fVPGgsscAQMO757NHg
	 it7IMFuu8I+WiflTXZyHCRUnjpFZHfPOreGAkXkvC4KaFxI9PulqiJ3McnaBXeHj7P
	 frwxOAwVTYI8CnTpwPUBQd4Qp3kEnFAOU/Y5ZX83RkSq8ESZr3JOAb4tLDRTB+PYH6
	 ZhhzqILtG0h8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 939C640B9E;
	Fri, 30 Oct 2026 14:07:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA0BD49
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81C3781193
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_Vxb0I4ce6O for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6CBCE8116F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=Ev4v+rvC4SeiItTS3R9U6/a+r6YEuoiMY3xWNicL0jbD6Uc2whHS07V2kmq1mg4HtcKi
 2bo2/gVAzLpBCN8Yg5O55n0ycF+gI9UkpREtNt2cwh94dv3fumxcdUbs0A3pqDIZgJN66
 GTf25Zzlj4WNP3HEu7in1Veaow1Yh2Q+1lCaRJKfRJjSeUT9jMHTwLM0u8gt8hXXzUKD8
 mNgvMyDm9wNqEYc5PYBNBvS6+Fq3Y0cr/y1eGiJ02dSVmPvhR7hx1o5kH4UN+JAzaUl18
 nj3DbmDgpiD+LRsk58G9uohKxHw0R9O4aQT1xcEBjO9Q8s9mXykqeIF97sNfFuBxj7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Xj7DiFe1zhWqZASy2Y7afXJ1o0E5NXR03tR5x9M6WyQ=;
 b=hMJRFcx2KldKrTvJZiP4jUrlgM+3RdrqzyS8qjuNsDvLbMOfqlYiCkdKuzhZ9XuYwSXa
 uxfTdvKoEzfZn9lULkTy3nGMyqgKlxyPROiHJcwl6IH3qRFX/3UURxJAYccvXjGlwqRND
 RS+6+DtLjTicfnScKiXkyhhuR3h4qvvQclu8BbFuSbDf29T9NqbnKVi9LKrG4QIps3aNc
 Mu3LJF9S6612chy1TZQg4vVLp9rSfPh35Bdq+l+awmK6ilS22TunAlrYMPOWKcG3SKki7
 imRFRDbN40T8/0q9nRXS4G9LaC6M1eQfKD5L5aqPPwfjLHoclX6P0PfFb4eYRyEjv7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CBCE8116F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69ABE9D388; Fri, 30 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fcec79d24dddeac6fd1b5d30082c13a0ef9fa41e
X-Git-Newrev: c85d1f66a8ba0eb9836a9f4a91ae4cc3b517b1ac
X-Patchwork-Hint: ignore
Message-Id: <20261030140437.69ABE9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-autotools.mk:
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
Content-Type: multipart/mixed; boundary="===============1643426180317313103=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1643426180317313103==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c85d1f66a8ba0eb9836a9f4a91ae4cc3b517b1ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 129fc4feba..c0b4a12c6f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1213,7 +1213,8 @@ support/libtool/buildroot-libtool-v1.5.patch lib_patch.ApplyOrder lib_patch.Sob
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

--===============1643426180317313103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1643426180317313103==--
