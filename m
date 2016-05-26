From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 16:48:03 +0200
Subject: [Buildroot] [PATCH] ffmpeg: disable for mips64r2 and mips64r6
In-Reply-To: <21ei1dxhr9.ln2@ID-313208.user.individual.net>
References: <1464192852-53397-1-git-send-email-Vincent.Riera@imgtec.com>
 <21ei1dxhr9.ln2@ID-313208.user.individual.net>
Message-ID: <20160526164803.39a58695@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 07:26:26 +0200, Bernd Kuhls wrote:

> > +	# MIPS architecture detection is not accurate for 64-bit
> > +	# variants. This has been already fixed upstream, so please
> > +	# remove it in the next version bump.
> > +	depends on !BR2_mips_64r2 && !BR2_mips_64r6  
> 
> you need to propagate this exception as reverse dependency to the following packages:
> 
> - gst1-libav
> - kodi
> - minidlna
> - mpd
> - mpv
> - opencv
> - opencv3
> - squeezelite
> - tovid
> 
> Imho this is too much work, we should live with the build error and
> bump ffmpeg to 3.0.2 after the next buildroot release to fix the
> problem. On github you can test my patch series already:

ffmpeg already has an architecture exception for nios2. So we could
also replace that with a BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS option, and
therefore easily add the exception for mips64r2/r6.

We're down to very few build failures per day, so I would really like
to get this issue out of the way, and see what other failures we have.
ffmpeg on mips64r2/r6 is now the #1 failure.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
