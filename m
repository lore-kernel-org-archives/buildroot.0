From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Apr 2013 18:01:04 +0200
Subject: [Buildroot] Plan of libffi support?
In-Reply-To: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130422180104.2fd1513d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Mon, 22 Apr 2013 13:37:24 +0200, Mischa Jonker wrote:

> In the following patch series I've added ARC support to the "master" tree
> of BuildRoot. As ARC support is not yet in all upstream open source packages,
> I've taken the freedom to add an option for an additional download site, from
> which ARC-specific versions of gcc, binutils, etc. can be downloaded.
> 
> ARC will be in Linux 3.9, so that would be the first package that can be
> removed from this ARC-specific download site.
> 
> The below patchset builds the toolchain, and a working root file system. Most
> simple packages build OK, but mplayer for instance does not have ARC support,
> and there are probably others as well.
> 
> Could you please have a look at the patches and let me know what to do to
> make them BuildRoot-worthy?

Do you have plans to get ARC support in libffi
<http://sourceware.org/libffi/> ? This library requires some
architecture-specific bits, and is used as a dependency for the Python
interpreter, but also more importantly for the glib library from the
Gtk world. And this glib library is used as a dependency in gazillions
of packages: Gtk+, GStreamer, Bluez-utils, Connman, and many, many more
things. For this reason, having an architecture supported in Buildroot
that doesn't have libffi support is a big pain, because we have to add
the "depends on !BR2_arc && !BR2_arceb" on all the packages that have
Glib as a dependency in their dependency chain.

So, we can live for a while without libffi support, but it would be
good to know if libffi support is somewhere in your plans in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
