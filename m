From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:12:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/spice: depend on libglib2
In-Reply-To: <1456076407-20364-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076407-20364-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221211249.723daeb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 18:40:07 +0100, Bernd Kuhls wrote:
> The package selects BR2_PACKAGE_LIBGLIB2 but did not depend on it.
> 
> The buildsystem treats libglib2 as a hard-dependency:
> https://cgit.freedesktop.org/spice/spice/tree/configure.ac?h=0.12#n117
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I am not sure in fact. The part of configure.ac you're pointing to
simply adds libglib2 to SPICE_REQUIRES, which is *only* used in the
spice build system to fill in the Requires.private field of
spice-server.pc. I.e, it seems like libglib2 is only an indirect
dependency of spice, and a reference to libglib2 only needed when
static linking.

This clearly needs more investigation, as other dependencies of spice
are handled in the same way.

Yann, you originally added the spice package, maybe you can have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
