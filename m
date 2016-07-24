From: daggs <daggs@gmx.com>
Date: Sun, 24 Jul 2016 09:47:22 +0200
Subject: [Buildroot] [PATCH 3/3] odroidc2: update boot.ini
In-Reply-To: <20160724092502.65792240@free-electrons.com>
References: <20160723185501.12148-1-daggs@gmx.com>
 <20160723185501.12148-3-daggs@gmx.com>
 <20160723232849.61c4fe4a@free-electrons.com>
 <trinity-6f6661cd-f250-4e75-b09d-92147f2f08d5-1469336092267@3capp-mailcom-bs13>,
 <20160724092502.65792240@free-electrons.com>
Message-ID: <trinity-5b63eeb4-1df6-452c-8449-13b459f35a6e-1469346442321@3capp-mailcom-bs08>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> Sent: Sunday, July 24, 2016 at 10:25 AM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: daggs <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 3/3] odroidc2: update boot.ini
>
> Hello,
> 
> On Sun, 24 Jul 2016 06:54:52 +0200, daggs wrote:
> 
> > > > +if test "${mesontimer}" = "0"; then fdt rm /meson_timer; fdt rm /cpus/cpu at 0/timer; fdt rm /cpus/cpu at 1/timer; fdt rm /cpus/cpu at 2/timer; fdt rm /cpus/cpu at 3/timer; fi
> > > > +if test "${mesontimer}" = "1"; then fdt rm /timer; fi
> > > > +
> > > > +if test "${nographics}" = "1"; then fdt rm /reserved-memory; fdt rm /aocec; fi
> > > > +if test "${nographics}" = "1"; then fdt rm /meson-fb; fdt rm /amhdmitx; fdt rm /picdec; fdt rm /ppmgr; fi
> > > > +if test "${nographics}" = "1"; then fdt rm /meson-vout; fdt rm /mesonstream; fdt rm /meson-fb; fi
> > > > +if test "${nographics}" = "1"; then fdt rm /deinterlace; fdt rm /codec_mm; fi  
> > > 
> > > Yerk :-/  
> > I don't write the code, I just relay it to buildroot.
> 
> Where is this code coming from? Any chance we use directly the upstream
> version rather than having a copy in Buildroot?

the code can be found at https://github.com/mdrjr/c2_bootini
odroid-scripts is based on that repo.
the problem with that repo is that it is ubuntu orinted, e.g. addinf uinitrd code to buildroot will render the system unbootable (I've wasted a whole day in doing needless kernel and uboot bisections until I've figure it out).
in addition, the two redirection change will render serial usb unworkable when getting to cli (that is how I work and debug the system for now).

Dagg.
