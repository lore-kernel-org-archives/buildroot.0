From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Dec 2013 16:53:45 +0100
Subject: [Buildroot] [PATCH 0/2] Drop X11 dependency of libpthread-stubs
 and libdrm
In-Reply-To: <1387553624-6780-1-git-send-email-paul@crapouillou.net>
References: <1387553624-6780-1-git-send-email-paul@crapouillou.net>
Message-ID: <20131220165345.7cdfe46b@skate>
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

Just wanted to mention that these patches are very similar to the ones
sent by Spenser quite a long time ago:

  http://patchwork.ozlabs.org/patch/278296/
  http://patchwork.ozlabs.org/patch/278297/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
