From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jul 2010 18:04:47 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.package.in: allow
 packages to override download step
In-Reply-To: <20100701153712.9DCD6821E8@busybox.osuosl.org>
References: <20100701153712.9DCD6821E8@busybox.osuosl.org>
Message-ID: <20100701180447.3477a6fa@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Jul 2010 17:33:29 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 16ce16a..c476de9 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -292,7 +292,7 @@ $(2)_TARGET_BUILD =
> $$($(2)_DIR)/.stamp_built $(2)_TARGET_CONFIGURE =
> $$($(2)_DIR)/.stamp_configured $(2)_TARGET_PATCH =
> $$($(2)_DIR)/.stamp_patched $(2)_TARGET_EXTRACT =
> $$($(2)_DIR)/.stamp_extracted -$(2)_TARGET_SOURCE =
> $$($(2)_DIR)/.stamp_downloaded +$(2)_TARGET_SOURCE ?=
> $$($(2)_DIR)/.stamp_downloaded $(2)_TARGET_UNINSTALL =
> $$($(2)_DIR)/.stamp_uninstalled $(2)_TARGET_CLEAN =
> $$($(2)_DIR)/.stamp_cleaned $(2)_TARGET_DIRCLEAN =
> $$($(2)_DIR)/.stamp_dircleaned

As said on IRC, I'm sorry but I don't think I really like this.

We already have a mechanism to override steps in Makefile.autotools.in.
I'd prefer to see if we can rely on a similar mechanism rather than
doing this.

In the future, is it possible to discuss such infrastructure changes on
the list beforehand ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
