From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 03 Apr 2021 17:21:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: add various options
 to disable optional components
References: <20210403094958.890489-1-bernd.kuhls@t-online.de>
 <20210403122219.GW24043@scaer>
Message-ID: <7odmjhxhtj.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Sat, 03 Apr 2021 14:22:19 +0200 schrieb Yann E. MORIN:

>> +config BR2_PACKAGE_TVHEADEND_IPTV
>> +	bool "IPTV support"
>> +	default y
>> +	select BR2_PACKAGE_FFMPEG_FFMPEG if BR2_PACKAGE_FFMPEG
> 
> Here, ffmpeg is not mandatory, but see below...

Technically yes, the ffmpeg binary is not mandatory.

But practically it is needed because many lists of legal public streams 
use /usr/bin/ffmpeg to pipe the stream to tvheadend, like
https://github.com/jnk22/kodinerds-iptv/tree/master/iptv/pipe

This patch makes sure that, when ffmpeg is enabled, it also provides
/usr/bin/ffmpeg, this will avoid problems like this:
https://github.com/LibreELEC/LibreELEC.tv/pull/3163#issuecomment-446242298

So I would like to keep the select ...

>> +TVHEADEND_DEPENDENCIES += ffmpeg
> 
> Here, you are making ffmpeg mandatory, but nothing ensures it is
> enabled...

but will remove the dependency, which is obviously wrong here.

Thanks for noticing.

Regards, Bernd
