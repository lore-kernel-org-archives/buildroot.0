From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:18:30 +0100
Subject: [Buildroot] [PATCH] package/sdl_mixer: disable libmad support
 for static build only
In-Reply-To: <1456073708-19562-1-git-send-email-romain.naour@gmail.com>
References: <1456073708-19562-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160221181830.01215f6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sun, 21 Feb 2016 17:55:08 +0100, Romain Naour wrote:
> Following the discussion on the ML [1], all package using SDL_mixer will
> unlikely forget to link with -lmad.
> 
> [...]sysroot/usr/lib/libSDL_mixer.a(music_mad.o): In function `read_next_frame':
> music_mad.c:(.text+0xbc): undefined reference to `mad_stream_buffer'
> music_mad.c:(.text+0xd0): undefined reference to `mad_frame_decode'
> music_mad.c:(.text+0x134): undefined reference to `mad_timer_add'
> 
> Until SDL_mixer and other package using it are not fixed, disable libmad support
> for static build only.
> 
> Fixes:
> http://autobuild.buildroot.net/results/e09/e09ea3a64d396bbc855acf7c07fcbea28fb2395d
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-February/153442.html

I am not sure whether this sort of patch is the good option. Yes, it
avoids the autobuilder failure, but it doesn't really fix the problem
itself. We could say it's a good temporary solution for 2016.02, but on
the other hand, once this patch gets merged, we will most likely forget
that this problem exists.

So I'm hesitating between:

 1/ Applying your patch, and just forget about this issue, since we
    probably don't care much anyway.

 2/ Applying your patch, and asking you to fill in a bug report in our
    bug tracker so that we don't forget about the issue.

 3/ Not applying your patch, so that we keep the issue in our
    autobuilder failures until someone fixes it.

Peter, what do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
