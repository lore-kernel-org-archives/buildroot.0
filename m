From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Fri, 24 Jan 2014 17:20:50 -0200
Subject: [Buildroot] [PATCH v9] espeak: new package
Message-ID: <CA+kK6WsfbPVJbZ02tdsOGw6Sag09C5M1JYZaRv9QXPYxz+E=FQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnaud, All,

I tested this patch on BeagleBone Black and works fine but I got the
following warning messages when use "alsa via portaudio"

(snd_pcm_open_noupdate) Unknown PCM cards.pcm.rear
> (snd_pcm_open_noupdate) Unknown PCM cards.pcm.center_lfe
> (snd_pcm_open_noupdate) Unknown PCM cards.pcm.side
>

The solution is:

/usr/share/alsa/alsa.conf

   change the line "pcm.rear cards.pcm.rear"
             to "pcm.rear cards.pcm.default"

   change the line "pcm.center_lfe cards.pcm.center_lfe"
             to "pcm.center_lfe cards.pcm.default"

   change the line "pcm.side cards.pcm.side"
             to "pcm.side cards.pcm.default"

Good job, Arnaud

Tested-by: Marcelo Gutierrez <kuyurix@gmail.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140124/275d1e66/attachment.html>
