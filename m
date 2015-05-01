From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 00:14:37 +0200
Subject: [Buildroot] Libtool problem building mesa3d-demos
In-Reply-To: <CAD7j7Q96pGF1qedawQw4-FHSyC15EyXH1DBu=MNkvFQg_Ys-dg@mail.gmail.com>
References: <CAD7j7Q96pGF1qedawQw4-FHSyC15EyXH1DBu=MNkvFQg_Ys-dg@mail.gmail.com>
Message-ID: <5543FACD.4010307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 22:41, Carlos Soto wrote:
> Hi,
> I'm using buildroot to create a rootfs for iMX6-quad. I'm using an external
> toolchain created with crosstool-ng (arm-cortexa9_neon-linux-gnueabihf).
> When building mesa3d-demos, there is an error creating libutil.la
> <http://libutil.la>:
> 
> libtool:   error:
> '/home/starsl/iMX6/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/local/xtools/arm-cortexa9_neon-linux-gnueabihf/lib/gcc/arm-cortexa9_neon-linux-gnueabihf/4.9.1/../../../../arm-cortexa9_neon-linux-gnueabihf/lib/libstdc++.la'
> is not a valid libtool archive
> 
> Of corse, this path is not right, it seems to be joining two different paths.
> 
> I've tracked the source of the problem, and it seems to be related with the
> libtool used by buildroot. I've modified the resulting Makefiles to use the host
> libtool, and the problem disappears:

 You have to use buildroot's libtool, otherwise you may get other problems with
cross-compilation.

> 
> LIBTOOL = $(SHELL) $(top_builddir)/libtool to
> LIBTOOL = $(SHELL) /usr/bin/libtool
> 
> Any thoughts about what it's going wrong?

 Can you tell us which options are given to libtool, and perhaps run it with -v
to see what it does?

 Regards,
 Arnout

> 
> Regards,
> Carlos
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
