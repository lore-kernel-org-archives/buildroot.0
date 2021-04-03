From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 03 Apr 2021 18:02:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: add various options
 to disable optional components
References: <20210403094958.890489-1-bernd.kuhls@t-online.de>
 <20210403122219.GW24043@scaer>
 <7odmjhxhtj.ln2@ID-313208.user.individual.net> <20210403153339.GB2252@scaer>
Message-ID: <25gmjhxhtj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 03 Apr 2021 17:33:39 +0200 schrieb Yann E. MORIN:

>> This patch makes sure that, when ffmpeg is enabled, it also provides
>> /usr/bin/ffmpeg, this will avoid problems like this:
>> https://github.com/LibreELEC/LibreELEC.tv/pull/
3163#issuecomment-446242298
> 
> OK, but then, does it make sense to not have ffmpeg at all. I.e. how
> valid is it to have BR2_PACKAGE_TVHEADEND_IPTV without the ffmpeg
> package?

Hi Yann,

other streamlists work without piping through ffmpeg, like
https://github.com/Free-IPTV/Countries

Most tvheadend users already have ffmpeg on their systems, mostly because 
of transcoding, others because of other packages depending on ffmpeg.
In this case I want to make sure that /usr/bin/ffmpeg is present out-of-
the-box when users start to play around with iptv and hit streamlists 
which use the pipe function, like I did last week ;) My system was indeed 
missing /usr/bin/ffmpeg...

But I do not want to force building ffmpeg just for iptv support in 
tvheadend when technically it is an optional runtime dependency.

Regards, Bernd
