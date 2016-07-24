From: daggs <daggs@gmx.com>
Date: Sun, 24 Jul 2016 06:54:52 +0200
Subject: [Buildroot] [PATCH 3/3] odroidc2: update boot.ini
In-Reply-To: <20160723232849.61c4fe4a@free-electrons.com>
References: <20160723185501.12148-1-daggs@gmx.com>
 <20160723185501.12148-3-daggs@gmx.com>,
 <20160723232849.61c4fe4a@free-electrons.com>
Message-ID: <trinity-6f6661cd-f250-4e75-b09d-92147f2f08d5-1469336092267@3capp-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hello,
> 
> On Sat, 23 Jul 2016 21:55:01 +0300, Dagg Stompler wrote:
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> 
> This one would benefit from a more detailed commit log.
will do.

> 
> 
> >  # Boot Arguments
> > -setenv bootargs "root=/dev/mmcblk0p2 rootwait ro ${condev} no_console_suspend hdmimode=${m} m_bpp=${m_bpp} vout=${vout} fsck.repair=yes net.ifnames=0 elevator=noop"
> > +setenv bootargs "root=/dev/mmcblk0p2 rootwait ro ${condev} no_console_suspend hdmimode=${m} m_bpp=${m_bpp} vout=${vout} fsck.repair=yes net.ifnames=0 elevator=noop =${hpd}"
> 
> Is =${hpd} really a valid kernel argument? Seems a bit weird, no?
good catch, this is a bug on my part, will fix.

> 
> > +if test "${mesontimer}" = "0"; then fdt rm /meson_timer; fdt rm /cpus/cpu at 0/timer; fdt rm /cpus/cpu at 1/timer; fdt rm /cpus/cpu at 2/timer; fdt rm /cpus/cpu at 3/timer; fi
> > +if test "${mesontimer}" = "1"; then fdt rm /timer; fi
> > +
> > +if test "${nographics}" = "1"; then fdt rm /reserved-memory; fdt rm /aocec; fi
> > +if test "${nographics}" = "1"; then fdt rm /meson-fb; fdt rm /amhdmitx; fdt rm /picdec; fdt rm /ppmgr; fi
> > +if test "${nographics}" = "1"; then fdt rm /meson-vout; fdt rm /mesonstream; fdt rm /meson-fb; fi
> > +if test "${nographics}" = "1"; then fdt rm /deinterlace; fdt rm /codec_mm; fi
> 
> Yerk :-/
I don't write the code, I just relay it to buildroot.

> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
