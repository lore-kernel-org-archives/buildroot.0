Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB9BC98317
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 13:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2819810BA;
	Thu, 24 Sep 2026 13:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUsSvbHmXbIU; Thu, 24 Sep 2026 13:41:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C146881C46
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790257275;
	b=rLES6W5JCRk9ztBIrObATr0giaQRXC0XbFwL/c2Qp68k1IQBJZAGtEqEQAV1yDNlo3CY
	 kvPbayJVsoGalWkXt4R2inud4Uzon+Y036ug96AO1IwdYdDKEu62KPTmRI30tlH5Nt9hQ
	 pOZBSn8NdET4vev92mspXSK28kPWAh41E5F0C5Hen1EWJ8y4N9cvxHPdhIDCcHghmwsp3
	 10dqoS6IFVE+oMo1xx39Kcn3HyYxRwT2Ma8dJAwVjVCn90w7w5oci2sSf56rpnjumytA2
	 9V0Xx4ZZOkVg8GvnVFK4XIkMEFgqNsytKeaN+jBFp0o5WYb6d7sCwN6Th27yEI9y82Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790257275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=E3lgJqDZsoZCb6jL420W6tsqbHeSG2QxH9oYsolJgbs=;
	b=iLpKL4BbjLwRiTTD23pzxpP+W9GN1YwBK8JH7Zs3TA6GoZqVSBS3BkHB8poC7snDPYwu
	 tiLl0pjHfzxXRCQBR8bz3/SJKv+Wx6vI3BouhdZJ2dSUrniylylkC1O4UI+n08qFYseqI
	 OeTVdO5M8HRBXvvb3eVHDXQG/Jh03Y3q3RUkVVsIcUcF8zN/4NFVm9TpJ3rwnSb4YLqj4
	 ZJU4YxGxvCtflwdvxutCP0Ajuztz3BDtjGhoPQfhRYxe10y14aCQpSeoGq+GBZecMDdLI
	 7J4qOAHBvPRsox3L6zMKve03MO22BneIKg8CGleBynfWKukX/Bx1dqGlZT2q8TWkuAQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790257275;
	bh=E3lgJqDZsoZCb6jL420W6tsqbHeSG2QxH9oYsolJgbs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=C4hyJAkqjnewPou1f71/1ROdhudBd+Vk0IXWRTYOAyp721XaFP02ar1QNffR7L4c6
	 k6QJY7hXfj/1Q2vSabD0yvOJh6wcFbPKptpvIZa1gs1qbUIkyjGJKoF6jwAOvrN3q9
	 fgihb1YVOKrOl7vyLiplgyb8AF75lhsfBEAvQlEClrxtE7UrfgoN41UVIDw288J9xJ
	 Fl6jB7zoaAhJnrRANu2+/IsbEoqgX4jVOe3Vs+H9ERdMXt7QWBI0/UW3RTybgai4XA
	 BOa6Yxo3owEytWtjWot/hpBjtst4dfwEwulQG5nhmFdpekS9sUnLQ77JU/ldzeDjGJ
	 CPzkxQp1Iq3qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C146881C46;
	Thu, 24 Sep 2026 13:41:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94CC22F5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 13:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85F5681C46
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 13:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waPF6z9jEkMt for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 13:41:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2C27681C21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790257273;
 b=enJoBcGooeKvIvLK2bqx9V3FG1vuF+FjbsDoOSZxYlzUcUMHBFrIPr2qc61EhXDTWaLF
 vDnDXWKDUwUhhvJqZCyLvGjVqH0xkJxcH83yYAtqf2YF3xQCHXaPrdy+copcO+/GcQ2pT
 jl+U5RJnfBnGkGxwaEqyxtAvxv+LCQQMhm9GJ+byorJsqbw/efkCy0MIDFY0fxj1iONdW
 tb7L5lMq04UXIIXY0hm7c3ERDcX+O2Ec8mntrcqrFGpDuY31Wy6COwZnGaCoBxUOqrKJe
 iMeKU3YikAjsEYOgs74KVX+3SchVtjhyqFx7GcOOvtFw71lajvltr6eq2J1/rTyT1bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790257273;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=EPDKpigdEOUg1VeDGIhZTFrKo4ChotL+Hj0mV2zTa/4=;
 b=FndXf9hZeOqpRCz+4zLrIHSSZdXb51L96tjd/5+yndR6U6y9XnptuLDJpa4zRErDoScx
 pjxNvHEx9OwikxTVn0HUzhktm9EhvpeR47m/2gBASug5p2laFzF63EBNm0wjzhczcWIDe
 Ciw7U12Gxe+xUw+LZPpAqRYeNKTeYGbrNCpwGpoN0S7o5HZvn+S8q3zYeqWaq+AYXtHjN
 EXXkigQBUajLLXJnj++lVa4w+L887OIoeWx12rdwrPCUi6+TnlCaNuRXMrB9+B+8mvKP8
 kirmtfF/FCRtMeWHJWF9hSl/VlsDMNPqbFwwDSC3JOHspz5LlTXr9o14UEIDHFDGzLg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b="KF/N6YrI"; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C27681C21
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 13:41:12 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a9a2b95b72so3606768a12.2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 06:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790257271; x=1790862071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EPDKpigdEOUg1VeDGIhZTFrKo4ChotL+Hj0mV2zTa/4=;
 b=x+8X1n/xfKDp2IAMtDlAhVWhpafXTAUBM9sLYH6bmZY71MsTrY171y4tukK3Mtsken
 EHhCZwicSBvuRtb55fMQ5rY4ttMxXOAMrWeAX0w/EPqKadv/OEsjrT64oNBgqAmQgGGr
 Z3lokJdU7dY2At5195sP7GU6Fz2BBVAa/+5YwxErnma321SlfA7eleKWLggbDKqoq3Pt
 isxi4JBjf4qwItTIBT+Fru0F18ywpi7uW+ci1j96NM5Nogfcpj3lMEPvJm/0tIeIemy+
 jCkyofI/19qW/GcJdyYDggDUSejbrbrUbbqeiINva7E1ko6h2iyrjpbLm1LiL0AknAGS
 qo7Q==
X-Gm-Message-State: AFuF++lm3LKX36IcbqYwuv5xj2k2XsOSTxezzJrTiE1xfNU7yw05Y4tT
 zQOrKtSiy83jU2cJT9b97Ji3/s/u28PaXob4y3KJNG0e7S8NPl4vdAFXuBFY8g==
X-Gm-Gg: AYBFou0u2d3Ohi1ge4ztrgDsQyqI1qCSr7eYcP2WQWtW4Mjll4CEUuGNdMtJWF22tg0
 wjRd6nMWGx5FgU0D9va1JAEsQzpcX7vI6yFGS5gvcy8aCWQe58teAF3Sy6KQ2mqAqhv6Xbj54py
 c5gSw89QT2s37xW1iZEqQBYd6G9u8X/ivBa/VtJpa/WwYBMEfeHuXCkUJhtiDn8bWRFXxabC63A
 tgfgRzl7msVZMwpn7fgmKTqPDkZKI2GrspJW6DZqkKMpHQIuFw718nBe5TGrwdv0IA181l3z23i
 Qezh9nWnZJLtalsTA7lX3IjFb7oFSqPncL1vL94TXxkUvHVcetyV0KxGpHN0eSY37nuGMri48Yo
 vVnqX/PvLGdAbWZDkFdwEAYvEYBFaYNDujS40y+mALqcreLX8eUcBVpjDOkqu5T//ochiQFtweX
 LkkLacH2BdOtRtuqvk3hzu2OmnE/jzOcahlPoi2HNIzkzrvbL+ZWy9fB6eXLMhGf3K1AWO1T3F7
 q5KSrNoki6NoThf6R06zcz0/VqxDqxZskNVJ+ogfQjBFcZi6OLSFw==
X-Received: by 2002:a05:6402:388f:b0:6a1:7825:5230 with SMTP id
 4fb4d7f45d1cf-6aac8f8ab9emr2304983a12.16.1790257270314; 
 Thu, 24 Sep 2026 06:41:10 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aab386e5aasm3764988a12.9.2026.09.24.06.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 06:41:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 24 Sep 2026 15:41:09 +0200
Message-Id: <20260924134109.2415498-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pkg-autotools.mk: LIBTOOL_PATCH_HOOK:
 also handle libtool 2.6.x
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.org/results/e6159cee14f84569c85a61f77824b2b58d68a4bc/

Libtool 2.6.x is starting to be used by upstreams when generating
release tarballs (e.g. cryptsetup-2.8.8). As LIBTOOL_PATCH_HOOK does
not know about it, ltmain.sh is left unpatched, so libtool relinks
libraries at install time and adds -L/usr/lib, which is rejected by
the toolchain wrapper:

i686-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'

The v2.4.4 patch no longer applies cleanly, so add a v2.6 variant,
rebased on libtool 2.6.2, and use it for 2.6.x versions.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/pkg-autotools.mk                     |  2 +
 support/libtool/buildroot-libtool-v2.6.patch | 96 ++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 support/libtool/buildroot-libtool-v2.6.patch

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 16b21acb6d..da33909881 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -76,6 +76,8 @@ define LIBTOOL_PATCH_HOOK
 			fi \
 		elif test $${ltmain_version} = "2.5"; then\
 			patch -i support/libtool/buildroot-libtool-v2.4.4.patch $${i}; \
+		elif test $${ltmain_version} = "2.6"; then\
+			patch -i support/libtool/buildroot-libtool-v2.6.patch $${i}; \
 		fi \
 	done
 endef
diff --git a/support/libtool/buildroot-libtool-v2.6.patch b/support/libtool/buildroot-libtool-v2.6.patch
new file mode 100644
index 0000000000..b3968b1289
--- /dev/null
+++ b/support/libtool/buildroot-libtool-v2.6.patch
@@ -0,0 +1,96 @@
+Libtool fixes for cross-compilation, many past contributors/authors.
+Update based on libtool-2.6.2.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -3008,9 +3008,8 @@
+ 	# was found and let the user know that the "--tag" command
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+-	  func_echo "unable to infer tagged configuration with compiler."
+-	  func_echo "Possible use of unsupported compiler."
+-	  func_fatal_error "specify a tag with '--tag'. For more information, try '$progname --help'."
++	  func_echo "defaulting to \`CC'"
++	  func_echo "if this is not correct, specify a tag with \`--tag'"
+ #	else
+ #	  func_verbose "using $tagname tagged configuration"
+ 	fi
+@@ -4746,8 +4745,12 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  test "$inst_prefix_dir" = "$destdir" && \
+-	    func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
++
++	  #
++	  # This breaks install into our staging area.  -PB
++	  #
++	  #test "$inst_prefix_dir" = "$destdir" && \
++	  #  func_fatal_error "error: cannot install '$file' to a directory not ending in $libdir"
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
+@@ -7063,7 +7066,8 @@
+ 	;;
+       -all-static | -static | -static-libtool-libs | --static | -Bstatic)
+ 	case $arg in
+-	-all-static)
++	# Make -static behave like -all-static -GZ
++	-all-static | -static)
+ 	  if test yes = "$build_libtool_libs" && test -z "$link_static_flag"; then
+ 	    func_warning "complete static linking is impossible in this configuration"
+ 	  fi
+@@ -7072,12 +7076,6 @@
+ 	  fi
+ 	  prefer_static_libs=yes
+ 	  ;;
+-	-static)
+-	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+-	    dlopen_self=$dlopen_self_static
+-	  fi
+-	  prefer_static_libs=built
+-	  ;;
+ 	-static-libtool-libs | --static | -Bstatic)
+ 	  if test -z "$pic_flag" && test -n "$link_static_flag"; then
+ 	    dlopen_self=$dlopen_self_static
+@@ -7393,7 +7391,8 @@
+       prevarg=$arg
+ 
+       case $arg in
+-      -all-static)
++      # Make -static behave like -all-static -GZ
++      -all-static | -static)
+ 	if test -n "$link_static_flag"; then
+ 	  # See comment for -static flag below, for more details.
+ 	  func_append compile_command " $link_static_flag"
+@@ -7695,7 +7694,7 @@
+ 	continue
+ 	;;
+ 
+-      -static | -static-libtool-libs)
++      -static-libtool-libs)
+ 	# The effects of -static are defined in a previous loop.
+ 	# We used to do the same as -all-static on platforms that
+ 	# didn't have a PIC flag, but the assumption that the effects
+@@ -8755,7 +8754,7 @@
+ 	  *)
+ 	    if test no = "$installed"; then
+ 	      func_append notinst_deplibs " $lib"
+-	      need_relink=yes
++	      need_relink=no
+ 	    fi
+ 	    ;;
+ 	  esac
+@@ -11296,6 +11295,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++	      # Replacing uninstalled with installed can easily break crosscompilation,
++	      # since the installed path is generally the wrong architecture.  -CL
++	      newdependency_libs="$newdependency_libs $deplib"
++	      continue
+ 	      case $deplib in
+ 	      *.la)
+ 		func_basename "$deplib"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
