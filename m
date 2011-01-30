From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jan 2011 15:23:58 +0100
Subject: [Buildroot] [git commit master 1/1] pkg-config: add
 --with-sysroot option for compiled in default sysroot setting
In-Reply-To: <20110129234038.9CB708E076@busybox.osuosl.org>
References: <20110129234038.9CB708E076@busybox.osuosl.org>
Message-ID: <20110130152358.436fc691@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jan 2011 00:40:13 +0100
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> Similar to the --with-pc-path option. It works just like the existing
> PKG_CONFIG_SYSROOT_DIR environment variable, but compiled in.
> The environment variable overrides this default setting if set.
> 
> This way we don't need to pass PKG_CONFIG_SYSROOT_DIR in the environment
> when building for the target, and it is easier to reuse pkg-config outside
> BR (E.G. for the SDK) without having to setup special environment
> variables.

I am not a big fan of this: we compile a single pkg-config to handle
both target and host packages. So I don't see why this pkg-config
should be specifically configured to handle packages and not for host
packages. I know it was already configured specifically for target
packages with --with-pc-path, but I wasn't a fan of this.

I think I'd prefer if we didn't pass any --with-sysroot nor
--with-pc-path, and instead use the proper environment variables all
the time. Or either build two pkg-config, one for host packages, one
for target packages.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
