From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Feb 2013 11:43:44 +0100
Subject: [Buildroot] makedevs and symbolic links
In-Reply-To: <CAJkQPO=A+_7t-dbSP8VutAsen+MvG9J44qx3D6uxKt7C2mBQUg@mail.gmail.com>
References: <CAJkQPOn=Pi+NhbRvVG_gk9ccQDaUoUuPH3aEsos032kAv6Y23A@mail.gmail.com>
 <20130206172641.4c042f87@skate>
 <CAJkQPOmpY_aT1DhDpxe2rw_endLzFkhmOWAkrbt1CzeG+7c=0Q@mail.gmail.com>
 <20130206175711.51603415@skate>
 <CAJkQPO=A+_7t-dbSP8VutAsen+MvG9J44qx3D6uxKt7C2mBQUg@mail.gmail.com>
Message-ID: <20130207114344.6dfe478e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Aras Vaichas,

On Thu, 7 Feb 2013 10:14:18 +0000, Aras Vaichas wrote:

> Aaah, I don't have that version of Buildroot. I'm using 2012.11. I can see
> from the mailing lists now that patches were added for the "rootfs-overlay".

This new "rootfs-overlay" thing is really just a little sugar. You can
already do this "rootfs-overlay" by copying
board/<company>/<project>/rootfs-overlay/* to $(TARGET_DIR) in your
custom post-build script. I've been doing that for 2+ years.

> I might have to leave that until it's in the stable release. I'm currently
> documenting how to use Buildroot for my employer (a company with almost
> zero Linux knowledge) on their hardware, so I'd rather stick to official
> release versions for now. I can update my documentation later.
> 
> My current employer wants me to put my Buildroot configuration into their
> version control system (MKS). So I am looking at ways that I can avoid
> using empty directories and symbolic links to make it diff and MKS
> friendly. I guess there's no getting around using multiple files and
> scripts to achieve this.
> 
> Crazy idea: If only patch/diff handled empty directories, symlinks,
> devices, permissions and ownerships. Then it could be done entirely in a
> single file that would be 100% friendly in all cases on all operating
> systems.

It is not possible: you can't create device files without being root,
and you can't change ownership without being root.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
