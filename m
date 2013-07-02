From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 02 Jul 2013 08:07:37 +0200
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <51D155A0.3010205@gmail.com>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
 <20130623161357.136be827bdb312f43bda51a6@lavabit.com>
 <CA+-urNTKwwCtPZkWaxisFbLWiYCRJA1-5COK-rT8NW3QU+kyZw@mail.gmail.com>
 <20130623214133.6249f43e6e2d8bda20aa971a@lavabit.com>
 <CA+-urNTQxDOjPKMAMgTbpp_i5_oD_z0k44hVzL8gRwfz7u3B3A@mail.gmail.com>
 <20130624124933.e7983d6a3730922581985bf4@lavabit.com>
 <51D155A0.3010205@gmail.com>
Message-ID: <51D26E29.6030805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/13 12:10, Zoltan Gyarmati wrote:
> checked the linked config from fhunleth, it seems in the used kernel
> tree (
> http://files.troodon-software.com/br/beagleboard-kernel-b37928553c8de3598d8a259d7ce5c4be713c2908.tar.xz
> ), the usb and the ethernet support is broken (or, as it always
> possible, i failed something).
>   So to get a working kernel, i used the patchset from
> https://github.com/RobertCNelson/linux-dev/tree/am33x-v3.8  ,
> ( which patches are extracted from the Angstrom build tree ), applied
> them manually on the mainline tree, created a tarball, and used that to
> build with Buildroot.
> So far everything works well (UART,USB host/gadget, ethernet, GPIO
> tested). I wondering, would it be possible to apply those subdir-style (
> https://github.com/RobertCNelson/linux-dev/tree/am33x-v3.8/patches  )
> patches automatically in Buildroot on an elegant way? Or better to
> create a git tree with applied patches somewhere online and use that in
> Buildroot?

  I guess you can download the patches as a tarball, right? Then you 
should just be able to use the tarball's URL in BR2_LINUX_KERNEL_PATCH 
and buildroot will extract them from the tarball and apply them all in 
directory order (or according to the series file, if present). Or does 
that not work for some reason?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
