From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 13:02:57 +0200
Subject: [Buildroot] [PATCH 08/11] toolchain-external: bump musl
 external toolchains to 1.1.1
In-Reply-To: <20140601105859.GD4280@tarshish>
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401619668-28062-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140601105859.GD4280@tarshish>
Message-ID: <20140601130257.17e8b2b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 1 Jun 2014 13:58:59 +0300, Baruch Siach wrote:

> > diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> > index a6c4061..47273d3 100644
> > --- a/toolchain/toolchain-external/toolchain-external.mk
> > +++ b/toolchain/toolchain-external/toolchain-external.mk
> > @@ -355,31 +355,32 @@ TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.05/components/toolchain/
> >  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.05_linux.tar.xz
> >  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
> >  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
> > -TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-1.0.0/
> > +TOOLCHAIN_EXTERNAL_VERSION = 1.1.1
> 
> This name sounds too generic. Other external toolchains are unlikely to use 
> the same version string. Maybe MUSL_TOOLCHAIN_EXTERNAL_VERSION?

I believe it's OK: other toolchains could also define
TOOLCHAIN_EXTERNAL_VERSION (I'm actually thinking of sending patches to
do this). It's exactly like the choice between gcc versions in the gcc
package: we assign a different GCC_VERSION value in each case. That's
the same thing here: we have the choice between multiple toolchains and
toolchain versions, so it makes sense to have
TOOLCHAIN_EXTERNAL_VERSION defined to whatever the version of the
currently selected toolchain is.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
