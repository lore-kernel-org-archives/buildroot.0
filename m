From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 09:15:20 +0200
Subject: [Buildroot] HDMI output on IGEP-v2
In-Reply-To: <CAAvU2=9drSkLDzVZaZ5i6btpgwYQf-EGqihmN0DD=bsBODiXfg@mail.gmail.com>
References: <CAAvU2=9drSkLDzVZaZ5i6btpgwYQf-EGqihmN0DD=bsBODiXfg@mail.gmail.com>
Message-ID: <20140829091520.49903445@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Oscar Abril,

On Thu, 28 Aug 2014 23:30:12 +0200, Oscar Abril wrote:

> I have been working with the IGEP-v2 for some days and I'm stuck, i can't
> make the HDMI output works.
> 
> These are my settings:
> 
> UBoot:
> 
> # cat /proc/cmdline
> console=ttyO2,115200n8 mpurate=auto vram=12M
> omapfb.mode=dvi:1024x768MR-16 at 60 omapfb.debug=y omapdss.def_disp=dvi
> root=/dev/nfs ip=190.160.0.100
> nfsroot=190.160.0.1:/home/oscarin/Downloads/felabs/sysdev/tinysystem/nfsroot
> rw
> 
> Buildroot config -> attached.
> Buildroot_Kernel_config -> attached
> System Initialization -> attached
> 
> The system works as it should be, i have python, networking, console,
> "/class/leds" etc working, but the HDMI is not..
> 
> I can't see in /dev/ any fbx (the kernel was compiled with fb options). How
> could i load it ??
> 
> Would you please guide me to make it works ??

Your question is not really Buildroot related, it's really a kernel
issue on a specific platform.

That being said, I would recommend you to first move from the 3.11
kernel you're using to the 3.16 kernel. I believe between 3.11 and
3.16, a number of improvements have been made in the Device Tree based
support for graphics output in OMAP2 based platforms, especially IGEPv2.

And if 3.16 still doesn't work, you'll anyway be running the latest
stable version of the Linux kernel, which would allow you to report a
bug to the kernel developers about non-working HDMI.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
