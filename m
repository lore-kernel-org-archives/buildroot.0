From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 11:59:46 +0200
Subject: [Buildroot] [PATCH 0/2] Drop X11 dependency of libpthread-stubs
 and libdrm
In-Reply-To: <1387553624-6780-1-git-send-email-paul@crapouillou.net>
References: <1387553624-6780-1-git-send-email-paul@crapouillou.net>
Message-ID: <20140420115946.780b38a0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Fri, 20 Dec 2013 16:33:42 +0100, Paul Cercueil wrote:
> The 'pthread-stubs' package was recently renamed to 'xlib_libpthread-stubs'.
> This makes sense as libpthread-stubs is part of the X libraries.
> 
> However, this package does not have any real dependency, not even X11.
> This is inconsistent with the current package, which can only be enabled
> when BR2_PACKAGE_XORG7 is selected.
> 
> The first patch renames the 'xlib_libpthread-stubs' package into
> 'libpthread-stubs', and moves it to 'Libraries -> Other' in the config
> menu.
> 
> The second patch applies to libdrm, and removes the dependency towards X11,
> if no X11-specific driver was selected. This permits to build the Mesa3d
> library without X11.

Thanks for these patches! However, in the mean time we've merged other
similar patches, which on IRC you agreed are good replacements for your
patches. Therefore, I've marked these two patches as Superseded in
patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
