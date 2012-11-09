From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Nov 2012 09:14:35 +0100
Subject: [Buildroot] [PATCH 0/2] add support for xtensa back to buildroot
In-Reply-To: <509C8B4F.6000308@zankel.net>
References: <509b2928.67dc440a.70c6.6325@mx.google.com>
 <20121108082247.55eac2b2@skate> <509C8B4F.6000308@zankel.net>
Message-ID: <20121109091435.0603a98c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Thu, 08 Nov 2012 20:49:19 -0800, Chris Zankel wrote:

> I understand your concern, and I guess it won't help that I had patches
> to clean up Buildroot for Xtensa laying around for over a year :-[ So,
> my promise would be to actually submit patches when I have them.
> 
> Part of the problem was that it wasn't just Buildroot, but other parts
> (uClibc, kernel, etc.) were also missing or having outdated changes, so
> it would have required to push a lot of patches. I have been working to
> get those patches in the corresponding trees first, and Buildroot
> actually now builds and runs out of the box on Xtensa with just those
> two patches and a generic patch for uClibc-snapshot. So, maintainability
> and detecting breakage will be much easier, and I intend to verify it on
> a more regular basis.
> 
> I'll send an updated version of the two patches where Crosstool-NG is
> disabled for Xtensa.

Excellent, sounds good.

I've also seen that Qemu has an Xtensa support. It would be nice if you
could create a qemu_xtensa_<somemachine>_defconfig with the necessary
kernel configuration and al (see other qemu_<foo>_defconfig that we
have in configs/) so that other people could build a Xtensa userspace
and run it inside qemu. At the moment, the qemu-system-xtensa supports
the following machines:

$ qemu-system-xtensa -M ?
Supported machines are:
none                 empty machine
lx60                 lx60 EVB (dc232b)
lx200                lx200 EVB (dc232b)
sim                  sim machine (dc232b) (default)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
