From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2016 11:07:32 +0100
Subject: [Buildroot] [PATCH 2/2] package/alsa-lib: fix musl-related
	openal build error
In-Reply-To: <1454144707-26838-2-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 30 Jan 2016 10:05:07 +0100")
References: <1454144707-26838-1-git-send-email-bernd.kuhls@t-online.de>
 <1454144707-26838-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87powjl6sb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > openal will fail to build without this patch when using pcm.h
 > In file included from /home/bernd/buildroot/br3/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/alsa/asoundlib.h:54:0,
 >                  from /home/bernd/buildroot/br3/output/build/openal-1.17.2/Alc/backends/alsa.c:34:
 > /home/bernd/buildroot/br3/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/alsa/pcm.h:1111:1: error: unknown type name ?u_int8_t?
 >  u_int8_t snd_pcm_format_silence(snd_pcm_format_t format);
 >  ^

 > It seems that this problem was not yet caught by the autobuilders.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks. Don't forget to submit the fix upstream.

-- 
Bye, Peter Korsgaard
