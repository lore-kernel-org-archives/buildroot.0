From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 11 Feb 2016 11:06:06 -0300
Subject: [Buildroot] Setting RGB
In-Reply-To: <1455126039107-125494.post@n4.nabble.com>
References: <CAKvcKqdfjtx96fk=cjMze7sOeY59OfWy1NZ2c_LY8TsuZ29DMA@mail.gmail.com>
 <20160204205505.5a842de4@gmx.net>
 <1455126039107-125494.post@n4.nabble.com>
Message-ID: <CAAEAJfBS36gKR3P_-MZ888yMi4y=piVN=x77F07z0-+=Bpxv0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Gabriel,

On 10 February 2016 at 14:40, GabrielCastillo
<gcastillo@controlnet.com.ar> wrote:
> I'm using:
> - SAMA5D3x
> -Atmel
> - The Display is a Multiino MI0500PT-7
>
> I don't know if on QT4 works, but i need to make an App on QT5.
>

I really don't think this has anything to do with Qt. See below.

> I have configure a panel-simple.c with:
>
> static const struct drm_display_mode multiinno_mi0500pt_mode = {
>   ????.clock = 30000,
>   ????.hdisplay = 800,
>   ????.hsync_start = 800 + 2,
>   ????.hsync_end = 800 + 2 + 41,
>   ????.htotal = 800 + 2 + 41 + 2,
>   ????.vdisplay = 480,
>   ????.vsync_start = 480 + 2,
>   ????.vsync_end = 480 + 2 + 41,
>   ????.vtotal = 480 + 2 + 41 + 2,
>   ????.vrefresh = 60,
>   ????.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>   };
>
>   static const struct panel_desc multiinno_mi0500pt = {
>   ????.modes = &multiinno_mi0500pt_mode,
>   ????.num_modes = 1,
>   ????.bpc = 8,
>   ????.size = {
>   ????????.width = 108,
>   ????????.height = 65,
>   ????},
>   ????.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> };
>

So I presume you have a framebuffer device at /dev/fb0. In that case,
you can enable the Buildroot package for the framebuffer tests
(BR2_PACKAGE_FB_TEST_APP) and the run "fb-test".

You should get this:

https://wiki.chiliboard.org/images/7/78/Fb-test.png

See how blue matches blue, red matches red, etc.

Can you do this and let us know?
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
