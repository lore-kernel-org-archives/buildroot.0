Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4703EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3AD760B12;
	Wed, 16 Feb 2022 21:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20uZ50RZmr1Q; Wed, 16 Feb 2022 21:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D94EA60B6A;
	Wed, 16 Feb 2022 21:22:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 778E91BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73E24825C7
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghc1u1_7Qun8 for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:22:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01A31824EE
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:22:49 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id p14so2129370ejf.11
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 13:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zk5gybgWQ0F/oKI9XsC6O/aC1qT4CQuziQcgDS/qHwc=;
 b=PTMN6mf3dBFzZuaMlNNQyqyI2Znw8JUL28iJr++Bzcu9d4GBdq9XNJPSfx8IGFEtm2
 DWIizf7UQI3HCBF0LfT5USoYRjMQSe7cSTMwNmmCxpGkdLQQIphKqf9v6aOxi2QWwbNE
 qimvJjzcb/Xzii37qtyq3COCj9LXRkqiZMMkNwQLLdm/w91jbMevz/z864JuF7mnbG99
 aSofA/iCHxoML7jVhiYii++xePa/6YuglUQy4wbEcWysOumHraH6v5XxiJnayqJY+DVs
 0lcG+waMq+DXsHk5dUM7YcXdJxAlYFGLV4vAU9FO2FdG9+vPZ4/BsM7sNL4oOxPf1BNI
 peqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zk5gybgWQ0F/oKI9XsC6O/aC1qT4CQuziQcgDS/qHwc=;
 b=7MLZ2wbmoMh3ZvF6pExkPT1MC87uaCc1IgTxSOjZAQbHLmAtkGZ8Sa+tOvAJ01hRyQ
 0pl7/GMXMrYdCNFaIg0xfaQBVk8jclDq7rr7tWpWc7CbnFTkqB/gUWNToKAm5lqQy+Vs
 MT/cwpWR4QuoMpJqIJ9Bf4m7JWRU4KyHj1o+O2YynZthKl3EY5JLfiu7gb3J9PbRHG6v
 dHyI5uZmFJsQGjT/jTm5nTv0zXAkDjLILX5vHUjGt/4Pk/XuxCq07KY8V8Sgc4SwHGLP
 xc6couX5HD3i9TuiOpOv3nprejbFW15oArGEqcY0kOsmmnaIqp0OzzzMYCZihe5xI2WH
 EO/w==
X-Gm-Message-State: AOAM532+OyKAj5aFua5bbL017LvreL0ZF5XshvoO6ZWU5664huJxF+0S
 7Qq9dVlu11nkASEZHWtv3QqU/Q==
X-Google-Smtp-Source: ABdhPJxpCRiW/lujHSdquLgTQ7JtSv1rN0LYLg2j5jKsLdY2KP58KuLR9PNVbTNL2lK3A45YtOmtvQ==
X-Received: by 2002:a17:906:fca5:b0:6b4:6d25:ac19 with SMTP id
 qw5-20020a170906fca500b006b46d25ac19mr3656207ejb.485.1645046568045; 
 Wed, 16 Feb 2022 13:22:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q7sm2184037edv.93.2022.02.16.13.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:22:47 -0800 (PST)
Message-ID: <65664f13-83f9-a0d5-a67d-f27ed09af323@mind.be>
Date: Wed, 16 Feb 2022 22:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220212113407.1213446-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220212113407.1213446-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/2] package/python-flit-core: new
 package/infrastructure
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi James,

  Both applied to next, but with modifications.

On 12/02/2022 12:34, James Hilliard wrote:
> This adds pep517(needed for flit-core to build itself) and flit python
> package types.
> 
> We need to add an installer script and pass it appropriate options for
> installing pep517 wheels generated by python-pypa-build during the
> build stage. Unfortunately it seems pep517 does not support builds
> without using the wheel format.

  The installer script is not super nice. We could instead use host-python-pip, 
but this works as well, so OK.

> We also need to add a patch fixing the version parser in flit-core.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - rebase on master
> ---
>   package/pkg-python.mk                         | 99 +++++++++++++++++++
>   ...sion-parser-for-multiple-assignments.patch | 80 +++++++++++++++
>   .../python-flit-core/python-flit-core.hash    |  3 +
>   package/python-flit-core/python-flit-core.mk  | 15 +++
>   support/scripts/pyinstaller.py                | 69 +++++++++++++
>   5 files changed, 266 insertions(+)
>   create mode 100644 package/python-flit-core/0001-Fix-ast-version-parser-for-multiple-assignments.patch
>   create mode 100644 package/python-flit-core/python-flit-core.hash
>   create mode 100644 package/python-flit-core/python-flit-core.mk
>   create mode 100755 support/scripts/pyinstaller.py
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index bf0649fc9c..d574bfa2b0 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -94,6 +94,47 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--root=/ \
>   	--single-version-externally-managed
>   
> +# Target pep517-based packages
> +PKG_PYTHON_PEP517_ENV = \
> +	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \

  Indentation is with tab, not spaces. check-package doesn't warn about it 
because there are some remaining spaces for indenting conditions.

> +	PATH=$(BR_PATH) \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \

  With the removal of python2, PYTHON_PATH should no longer be used. And this 
setup type is anyway python3 only.

> +	PYTHONNOUSERSITE=1 \
> +	_python_sysroot=$(STAGING_DIR) \
> +	_python_prefix=/usr \
> +	_python_exec_prefix=/usr
> +
> +PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
> +    --interpreter=/usr/bin/python \
> +    --script-kind=posix \
> +    --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +    --headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> +    --scripts=$(TARGET_DIR)/usr/bin \
> +    --data=$(TARGET_DIR)/usr
> +
> +PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
> +    --interpreter=/usr/bin/python \
> +    --script-kind=posix \
> +    --purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +    --headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> +    --scripts=$(STAGING_DIR)/usr/bin \
> +    --data=$(STAGING_DIR)/usr
> +
> +# Host pep517-based packages
> +HOST_PKG_PYTHON_PEP517_ENV = \
> +	PATH=$(BR_PATH) \
> +	PYTHONNOUSERSITE=1 \
> +	$(HOST_CONFIGURE_OPTS)
> +
> +HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
> +    --interpreter=/usr/bin/python \
> +    --script-kind=posix \
> +    --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +    --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> +    --scripts=$(HOST_DIR)/usr/bin \
> +    --data=$(HOST_DIR)/usr
> +
>   ################################################################################
>   # inner-python-package -- defines how the configuration, compilation
>   # and installation of a Python package should be done, implements a
> @@ -143,6 +184,19 @@ $(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_SETUPTOOLS_ENV)
>   $(2)_BASE_BUILD_TGT   = build
>   $(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS)
>   endif
> +else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
> +ifeq ($(4),target)
> +$(2)_BASE_ENV         = $$(PKG_PYTHON_PEP517_ENV)
> +$(2)_BASE_BUILD_TGT   = -w
> +$(2)_BASE_BUILD_OPTS   =

  No need to define empty variables.

> +$(2)_BASE_INSTALL_TARGET_OPTS  = $$(PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS)
> +$(2)_BASE_INSTALL_STAGING_OPTS = $$(PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS)
> +else
> +$(2)_BASE_ENV         = $$(HOST_PKG_PYTHON_PEP517_ENV)
> +$(2)_BASE_BUILD_TGT   = -w
> +$(2)_BASE_BUILD_OPTS   =
> +$(2)_BASE_INSTALL_OPTS = $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
> +endif
>   else
>   $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils' or 'setuptools'")

  This should be extended with the new types.

>   endif
> @@ -163,6 +217,12 @@ endif # ($(4),target)
>   #
>   ifeq ($$($(2)_SETUP_TYPE),setuptools)
>   $(2)_DEPENDENCIES += $$(if $$(filter host-python-setuptools,$(1)),,host-python-setuptools)
> +else ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
> +$(2)_DEPENDENCIES += $$(if $$(filter host-python-pypa-build,$(1)),,host-python-pypa-build)

  No need for this filtering. It's there for setuptools because setuptools uses 
setup type setuptools itself, so it creates a circular dependency. pypa-build, 
installer and flit-core don't have that issue.

> +$(2)_DEPENDENCIES += $$(if $$(filter host-python-installer,$(1)),,host-python-installer)
> +ifeq ($$($(2)_SETUP_TYPE),flit)
> +$(2)_DEPENDENCIES += $$(if $$(filter host-python-flit-core,$(1)),,host-python-flit-core)
> +endif
>   endif # SETUP_TYPE
>   
>   # Python interpreter to use for building the package.
> @@ -174,6 +234,15 @@ $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/python
>   # file.
>   #
>   ifndef $(2)_BUILD_CMDS
> +ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
> +define $(2)_BUILD_CMDS
> +	(cd $$($$(PKG)_BUILDDIR)/; \
> +		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> +		$$($(2)_PYTHON_INTERPRETER) -m build -n \
> +		$$($$(PKG)_BASE_BUILD_TGT) \
> +		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))

  Repeating the build commands completely defeats the purpose of those 
variables. Therefore, I've added an additional preparatory commit that moves the 
"-m build -n" part into the _BUILD_TGT variable. Check the git history to see 
how it's done.

> +endef
> +else
>   define $(2)_BUILD_CMDS
>   	(cd $$($$(PKG)_BUILDDIR)/; \
>   		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> @@ -182,12 +251,21 @@ define $(2)_BUILD_CMDS
>   		$$($$(PKG)_BASE_BUILD_OPTS) $$($$(PKG)_BUILD_OPTS))
>   endef
>   endif
> +endif
>   
>   #
>   # Host installation step. Only define it if not already defined by the
>   # package .mk file.
>   #
>   ifndef $(2)_INSTALL_CMDS
> +ifneq ($$(filter flit pep517,$$($(2)_SETUP_TYPE)),)
> +define $(2)_INSTALL_CMDS
> +	(cd $$($$(PKG)_BUILDDIR)/; \
> +		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
> +		$$($(2)_PYTHON_INTERPRETER) $(TOPDIR)/support/scripts/pyinstaller.py dist/* \

  I haven't changed this, but shouldn't this be dist/*.whl just to be safe?

> +		$$($$(PKG)_BASE_INSTALL_OPTS) $$($$(PKG)_INSTALL_OPTS))
> +endef
> +else
>   define $(2)_INSTALL_CMDS
>   	(cd $$($$(PKG)_BUILDDIR)/; \
>   		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \

[snip]
> diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
> new file mode 100644
> index 0000000000..539a6c99fe
> --- /dev/null
> +++ b/package/python-flit-core/python-flit-core.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-flit-core
> +#
> +################################################################################
> +
> +PYTHON_FLIT_CORE_VERSION = 3.6.0
> +PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
> +PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/08/e9/0653f7783ba2ec2f954f19442878427f1d5bfccb01842d354453c2809b22
> +PYTHON_FLIT_CORE_SETUP_TYPE = pep517
> +PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
> +HOST_PYTHON_FLIT_CORE_NEEDS_HOST_PYTHON = python3

  No longer exists.

> +HOST_PYTHON_FLIT_CORE_DEPENDENCIES = host-python-pypa-build

  This is now added automatically by the infra.


  Regards,
  Arnout

> +
> +$(eval $(host-python-package))
> diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
> new file mode 100755
> index 0000000000..6dd9242327
> --- /dev/null
> +++ b/support/scripts/pyinstaller.py
> @@ -0,0 +1,69 @@
> +#!/usr/bin/env python3
> +
> +import argparse
> +import glob
> +
> +from installer import install
> +from installer.destinations import SchemeDictionaryDestination
> +from installer.sources import WheelFile
> +
> +
> +def main():
> +    """Entry point for CLI."""
> +    ap = argparse.ArgumentParser("python pyinstaller.py")
> +    ap.add_argument("wheel_file", help="Path to a .whl file to install")
> +
> +    ap.add_argument(
> +        "--interpreter", required=True, help="Interpreter path to be used in scripts"
> +    )
> +    ap.add_argument(
> +        "--script-kind",
> +        required=True,
> +        choices=["posix", "win-ia32", "win-amd64", "win-arm", "win-arm64"],
> +        help="Kind of launcher to create for each script",
> +    )

  This is a bit more generic than what we need, which makes me think you copied 
it from somewhere. If that is the case, you should include a copyright notice at 
the beginning of the file, including (very important) and SPDX license header. 
If you created it completely yourself, it's OK.

  Regards,
  Arnout

> +
> +    dest_args = ap.add_argument_group("Destination directories")
> +    dest_args.add_argument(
> +        "--purelib",
> +        required=True,
> +        help="Directory for platform-independent Python modules",
> +    )
> +    dest_args.add_argument(
> +        "--platlib",
> +        help="Directory for platform-dependent Python modules (same as purelib "
> +        "if not specified)",
> +    )
> +    dest_args.add_argument(
> +        "--headers", required=True, help="Directory for C header files"
> +    )
> +    dest_args.add_argument(
> +        "--scripts", required=True, help="Directory for executable scripts"
> +    )
> +    dest_args.add_argument(
> +        "--data", required=True, help="Directory for external data files"
> +    )
> +    args = ap.parse_args()
> +
> +    destination = SchemeDictionaryDestination(
> +        {
> +            "purelib": args.purelib,
> +            "platlib": args.platlib if args.platlib is not None else args.purelib,
> +            "headers": args.headers,
> +            "scripts": args.scripts,
> +            "data": args.data,
> +        },
> +        interpreter=args.interpreter,
> +        script_kind=args.script_kind,
> +    )
> +
> +    with WheelFile.open(glob.glob(args.wheel_file)[0]) as source:
> +        install(
> +            source=source,
> +            destination=destination,
> +            additional_metadata={},
> +        )
> +
> +
> +if __name__ == "__main__":
> +    main()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
