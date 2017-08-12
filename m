From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Aug 2017 13:50:13 +0200
Subject: [Buildroot] [PATCH 1/2] alsa-lib: add patch to fix incorrect
 code dependency
In-Reply-To: <20170812100046.GB3021@scaer>
References: <20170811212103.24433-1-thomas.petazzoni@free-electrons.com>
 <20170812100046.GB3021@scaer>
Message-ID: <20170812135013.14446155@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Aug 2017 12:00:46 +0200, Yann E. MORIN wrote:

> > +/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(pcm_dmix.o): In function `snd_pcm_dmix_sync_ptr':
> > +pcm_dmix.c:(.text+0x83c): warning:
> > +/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data+0x4): undefined reference to `_snd_module_rawmidi_virt'
> > +collect2: error: ld returned 1 exit status
> > +
> > +To fix this, we make sure that rawmidi_symbols.c only uses
> > +_snd_module_rawmidi_virt when available.
> > +
> > +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> 
> Upstream status?

I submitted it upstream after sending the Buildroot patch, so I didn't
had the link. But it's submitted upstream, see
https://www.spinics.net/lists/alsa-devel/msg65902.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
