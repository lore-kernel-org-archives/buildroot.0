From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Aug 2020 13:54:09 -0700
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: add support for
 aarch64 build
In-Reply-To: <20200818201612.GR24264@scaer>
References: <20200818191130.2888592-1-christian@paral.in>
 <20200818193338.GP24264@scaer>
 <CA+h8R2oRLfVOG4m9_mbg_hHhZNxggQLZt_8JBTOL8poQwaP+DQ@mail.gmail.com>
 <20200818201612.GR24264@scaer>
Message-ID: <CA+h8R2rB+_t02w2YbqBR74_9iEg67EPZB4o_tGUrqSeuz7Ekjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,


On Tue, Aug 18, 2020 at 1:16 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > In the userland commit you link just above, they disable some things
> > when targeting ARM64. We set ARM64 correctly in this patch with
> > -DARM64=ON if BR2_aarch64, so this addresses everything correctly.
>
> So, this would, amongst others, not build:
>
>   - MMAL, so no low-level programming,
>
>   - interface/khronos, so no OpenGL EGL/GLES, no OpenVG,
>
>   - middleware/openmaxil, so no OpenMAX
>
> Unless I'm missing something non-obvious, I do not see how that can be
> irrelevant...

Of course, not having everything is not irrelevant. However, this is
something we expect the rpi-userland developers to address, not the
Buildroot developers, correct?

As far as I can tell, adding this patch will install the tools that
the rpi developers currently have deemed compatible with aarch64. This
is vcgencmd and others. This basically would add early support for
aarch64 to rpi-userland in Buildroot. Although not everything is
there, installing the package with the parts that are compatible with
that arch makes sense, right?

As an example: I was writing a package which adds support for the
argon one fan controller for pi 4. It added a dependency for
rpi-userland for the vcgencmd command. I wrote this patch so that
vcgencmd and the package will be installed correctly, and also so that
my package which depends on RPI_USERLAND, could also build and be
installed. Everything works as expected.

Other packages that depend on the arm-only binaries should already
have BR2_arm dependency anyway, correct?

Best regards,
Christian Stewart
