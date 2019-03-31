From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:25:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/scons: remove python from SCONS
In-Reply-To: <20190331121810.28608-1-fontaine.fabrice@gmail.com>
References: <20190331121810.28608-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331142524.71fb464c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 31 Mar 2019 14:18:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/alljoyn-base/alljoyn-base.mk b/package/alljoyn-base/alljoyn-base.mk
> index ad19802823..64ba647ab0 100644
> --- a/package/alljoyn-base/alljoyn-base.mk
> +++ b/package/alljoyn-base/alljoyn-base.mk
> @@ -11,7 +11,7 @@ ALLJOYN_BASE_SITE = \
>  # See https://allseenalliance.org/alliance/ip-policy
>  ALLJOYN_BASE_LICENSE = ISC
>  
> -ALLJOYN_BASE_DEPENDENCIES = host-scons alljoyn openssl
> +ALLJOYN_BASE_DEPENDENCIES = host-python host-scons alljoyn openssl
>  ALLJOYN_BASE_INSTALL_STAGING = YES

Hm, don't we have a problem when BR2_PACKAGE_PYTHON3=y ? In this case,
scons being a host-python-package, it will be installed for
host-python3, i.e in /usr/lib/python3/.../, so how can it then work to
call it using python2 ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
