From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 26 May 2016 10:36:38 +0100
Subject: [Buildroot] [PATCH] ffmpeg: disable for mips64r2 and mips64r6
In-Reply-To: <21ei1dxhr9.ln2@ID-313208.user.individual.net>
References: <1464192852-53397-1-git-send-email-Vincent.Riera@imgtec.com>
 <21ei1dxhr9.ln2@ID-313208.user.individual.net>
Message-ID: <5746C3A6.2030501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On 26/05/16 06:26, Bernd Kuhls wrote:
> Hi,
> 
> Am Wed, 25 May 2016 17:14:12 +0100 schrieb Vicente Olivert Riera:
> 
>> This commit can be reverted in the next ffmpeg's version bump.
> 
> [...]
>> +	# MIPS architecture detection is not accurate for 64-bit
>> +	# variants. This has been already fixed upstream, so please
>> +	# remove it in the next version bump.
>> +	depends on !BR2_mips_64r2 && !BR2_mips_64r6
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
> 
> https://github.com/bkuhls/buildroot/tree/ffmpeg3

I can mark this patch as rejected and live with the build error by now.

> The main problem is that vlc 2.2.x is incompatible with ffmpeg3, only
> vlc master branch works, this branch will be released as vlc 3.0
> sometime in the future. We would carry a pre-released version of vlc
> in buildroot, which is something we want to avoid if possible.
> 
> Before the ffmpeg 3 vs. vlc problem arose I thought we could remove
> the vlc warning in its Config.in:
> https://git.busybox.net/buildroot/tree/package/vlc/Config.in#n2
> 
> When bumping to a pre-release version we should keep it ;)

I was wondering why you marked as superseded your patches to bump ffmpeg.

Ok, then let's wait.

Regards,

Vincent.

> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
