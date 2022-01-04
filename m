Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6A3C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0FD60BE7;
	Tue,  4 Jan 2022 18:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qeGk5pRk0mpC; Tue,  4 Jan 2022 18:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A814160BF4;
	Tue,  4 Jan 2022 18:31:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1C01BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26F008268F
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQiHO-eKtBTw for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:31:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3CF6827C5
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:31:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id n30so39737623eda.13
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=BPb3IfaSzsSWNkJ5zmmxdCwhtWi7z2aPRbq+9TOjAw0=;
 b=BSU8IC1aB0RcwX1+XdmYkLEn+N6CRFNKoFlkp9ECcfvQ8B13Rad2V6db/yGGi3jFoX
 BrHgIKUnPD8ZkDHE/WrzgFXt6v/ZyExkG+u9FHp4j6nunKTfFGlvMCLZwuI80+V6ohpE
 BHq59Ly6VGvWlcLM1EIAN9Vrm3KfV1YMFAARzxSs6ukEfceakNfWSZWZvcXEGP62ZP2T
 6WS93k/kHjjca53ZW/JK9WRkh+mRfMvmmzNo9FBIAXHkJU665cOI/b0qLIAPTAhXTjaO
 Apzawrz4sdZVy1xlSKrfc/lIXfwkkwtC+hgvYupO31LKfUVupBFb5wbdgn5f2YkV1MD6
 tPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BPb3IfaSzsSWNkJ5zmmxdCwhtWi7z2aPRbq+9TOjAw0=;
 b=TT5ba/E1BeAWJI5yW9Lvj61GvwWmsa5CUzD42FdH7N24ChRp6g8OkTIlQxp1AsjvML
 4hNq52H1NBdw41PcNe6YbJiR9ePXftD9N4J2DO9KuZG3zvNwC4DgTBisI6oIMCOqZ1NB
 stXDgjuoyHKSO1OoYKFka7M5yBGKi0o0LoBfVOrMFOc3DIYxEB/IJAss/2pAmqaTvn9/
 gt4cqtGdNlpLT1HV+RkK5ATWCR44ZFBKqv7vep0cWSF2Rl/gB8nfM7MR+KzHaf13C2zS
 M2ffZvlidql5VIaanHFnNCRFdgtvTpF/LE1cpjwUmtU82phnZsiYPVNkgRgjRs87AZdM
 KliQ==
X-Gm-Message-State: AOAM531ocbBwLh2/2kelcnwBJKQ5OdpiHw9iUuuh+aisyRvPOoKe/rxp
 Q1c71E/l6aFHo1V/2BsEu/eThaA2oB3yvw==
X-Google-Smtp-Source: ABdhPJxA5ARpBt4BNlCVsCUFTxYWy2w1+L6X0uaAmiCcXYG1ktRxT0mYyyE6HYsd7Yva72wXI8spHA==
X-Received: by 2002:a17:906:9d01:: with SMTP id
 fn1mr39617082ejc.391.1641321064274; 
 Tue, 04 Jan 2022 10:31:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id di16sm11716793ejc.82.2022.01.04.10.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:31:03 -0800 (PST)
Message-ID: <db8257b7-e02c-333d-b70f-850cf1a4e815@mind.be>
Date: Tue, 4 Jan 2022 19:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220103225450.14459-1-romain.naour@gmail.com>
 <20220103225450.14459-2-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220103225450.14459-2-romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/zfs: fix python3 version check
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/01/2022 23:54, Romain Naour wrote:
> Backport a patch to fix the python 3 version check that
> broke the build since the python 3.10 version bump.
> 
> Add host-python-packaging dependency since the backport
> add "from packaging import version" while checking the
> python version.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1935414730
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1935415049
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...law-in-the-Python-3-version-checking.patch | 106 ++++++++++++++++++
>   package/zfs/zfs.mk                            |   5 +-
>   2 files changed, 109 insertions(+), 2 deletions(-)
>   create mode 100644 package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
> 
> diff --git a/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch b/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
> new file mode 100644
> index 0000000000..70978f9f4d
> --- /dev/null
> +++ b/package/zfs/0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
> @@ -0,0 +1,106 @@
> +From 4dc82e9d503518a00e54972be7c0cb5f342f985e Mon Sep 17 00:00:00 2001
> +From: Rich Ercolani <214141+rincebrain@users.noreply.github.com>
> +Date: Tue, 8 Jun 2021 20:20:16 -0400
> +Subject: [PATCH] Correct a flaw in the Python 3 version checking
> +
> +It turns out the ax_python_devel.m4 version check assumes that
> +("3.X+1.0" >= "3.X.0") is True in Python, which is not when X+1
> +is 10 or above and X is not. (Also presumably X+1=100 and ...)
> +
> +So let's remake the check to behave consistently, using the
> +"packaging" or (if absent) the "distlib" modules.
> +
> +(Also, update the Github workflows to use the new packages.)
> +
> +Reviewed-by: Brian Behlendorf <behlendorf1@llnl.gov>
> +Reviewed-by: John Kennedy <john.kennedy@delphix.com>
> +Signed-off-by: Rich Ercolani <rincebrain@gmail.com>
> +Closes: #12073
> +(cherry picked from commit 08cd0717359b1a18693e3c8e6d6e5a2819b35a48)
> +[Romain: drop rpm spec and github workflows changes]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + config/always-pyzfs.m4    | 15 +++++++++++++++
> + config/ax_python_devel.m4 | 33 +++++++++++++++++++++++++++------
> + 2 files changed, 42 insertions(+), 6 deletions(-)
> +
> +diff --git a/config/always-pyzfs.m4 b/config/always-pyzfs.m4
> +index 76e07b593..fa39fd885 100644
> +--- a/config/always-pyzfs.m4
> ++++ b/config/always-pyzfs.m4
> +@@ -46,6 +46,21 @@ AC_DEFUN([ZFS_AC_CONFIG_ALWAYS_PYZFS], [
> + 	])
> + 	AC_SUBST(DEFINE_PYZFS)
> +
> ++	dnl #
> ++	dnl # Python "packaging" (or, failing that, "distlib") module is required to build and install pyzfs
> ++	dnl #
> ++	AS_IF([test "x$enable_pyzfs" = xcheck -o "x$enable_pyzfs" = xyes], [
> ++		ZFS_AC_PYTHON_MODULE([packaging], [], [
> ++			ZFS_AC_PYTHON_MODULE([distlib], [], [
> ++				AS_IF([test "x$enable_pyzfs" = xyes], [
> ++					AC_MSG_ERROR("Python $PYTHON_VERSION packaging and distlib modules are not installed")
> ++				], [test "x$enable_pyzfs" != xno], [
> ++					enable_pyzfs=no
> ++				])
> ++			])
> ++		])
> ++	])
> ++
> + 	dnl #
> + 	dnl # Require python-devel libraries
> + 	dnl #
> +diff --git a/config/ax_python_devel.m4 b/config/ax_python_devel.m4
> +index c51b45b7d..cdfbbf81f 100644
> +--- a/config/ax_python_devel.m4
> ++++ b/config/ax_python_devel.m4
> +@@ -97,9 +97,18 @@ AC_DEFUN([AX_PYTHON_DEVEL],[
> + 	# Check for a version of Python >= 2.1.0
> + 	#
> + 	AC_MSG_CHECKING([for a version of Python >= '2.1.0'])
> +-	ac_supports_python_ver=`$PYTHON -c "import sys; \
> +-		ver = sys.version.split ()[[0]]; \
> +-		print (ver >= '2.1.0')"`
> ++	ac_supports_python_ver=`cat<<EOD | $PYTHON -
> ++from __future__ import print_function;
> ++import sys;
> ++try:
> ++	from packaging import version;
> ++except ImportError:
> ++	from distlib import version;
> ++ver = sys.version.split ()[[0]];
> ++(tst_cmp, tst_ver) = ">= '2.1.0'".split ();
> ++tst_ver = tst_ver.strip ("'");
> ++eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
> ++EOD`
> + 	if test "$ac_supports_python_ver" != "True"; then
> + 		if test -z "$PYTHON_NOVERSIONCHECK"; then
> + 			AC_MSG_RESULT([no])
> +@@ -126,9 +135,21 @@ to something else than an empty string.
> + 	#
> + 	if test -n "$1"; then
> + 		AC_MSG_CHECKING([for a version of Python $1])
> +-		ac_supports_python_ver=`$PYTHON -c "import sys; \
> +-			ver = sys.version.split ()[[0]]; \
> +-			print (ver $1)"`
> ++		# Why the strip ()?  Because if we don't, version.parse
> ++		# will, for example, report 3.10.0 >= '3.11.0'
> ++		ac_supports_python_ver=`cat<<EOD | $PYTHON -
> ++
> ++from __future__ import print_function;
> ++import sys;
> ++try:
> ++	from packaging import version;
> ++except ImportError:
> ++	from distlib import version;
> ++ver = sys.version.split ()[[0]];
> ++(tst_cmp, tst_ver) = "$1".split ();
> ++tst_ver = tst_ver.strip ("'");
> ++eval ("print (version.LegacyVersion (ver)"+ tst_cmp +"version.LegacyVersion (tst_ver))")
> ++EOD`
> + 		if test "$ac_supports_python_ver" = "True"; then
> + 		   AC_MSG_RESULT([yes])
> + 		else
> +--
> +2.31.1
> +
> diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> index 3b1afb419a..0e7e3e4e74 100644
> --- a/package/zfs/zfs.mk
> +++ b/package/zfs/zfs.mk
> @@ -11,6 +11,7 @@ ZFS_LICENSE_FILES = LICENSE COPYRIGHT
>   ZFS_CPE_ID_VENDOR = openzfs
>   ZFS_CPE_ID_PRODUCT = openzfs
>   
> +# 0001-Correct-a-flaw-in-the-Python-3-version-checking.patch
>   ZFS_AUTORECONF = YES
>   
>   ZFS_DEPENDENCIES = libaio openssl udev util-linux zlib
> @@ -39,7 +40,7 @@ endif
>   # The optional PyZFS uses different scripts depending on the python
>   # version (ex: arc_summary2 or arc_summary3).
>   ifeq ($(BR2_PACKAGE_PYTHON),y)
> -ZFS_DEPENDENCIES += python python-setuptools host-python-cffi
> +ZFS_DEPENDENCIES += python python-setuptools host-python-cffi host-python-packaging
>   ZFS_CONF_ENV += \
>   	PYTHON=$(HOST_DIR)/usr/bin/python2 \
>   	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python2-config --includes`" \
> @@ -47,7 +48,7 @@ ZFS_CONF_ENV += \
>   	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
>   ZFS_CONF_OPTS += --enable-pyzfs
>   else ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -ZFS_DEPENDENCIES += python3 python-setuptools host-python-cffi
> +ZFS_DEPENDENCIES += python3 python-setuptools host-python-cffi host-python-packaging
>   ZFS_CONF_ENV += \
>   	PYTHON=$(HOST_DIR)/usr/bin/python3 \
>   	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
