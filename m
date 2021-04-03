From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 17:33:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: add various options
 to disable optional components
In-Reply-To: <7odmjhxhtj.ln2@ID-313208.user.individual.net>
References: <20210403094958.890489-1-bernd.kuhls@t-online.de>
 <20210403122219.GW24043@scaer>
 <7odmjhxhtj.ln2@ID-313208.user.individual.net>
Message-ID: <20210403153339.GB2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-04-03 17:21 +0200, Bernd Kuhls spake thusly:
> Am Sat, 03 Apr 2021 14:22:19 +0200 schrieb Yann E. MORIN:
> >> +config BR2_PACKAGE_TVHEADEND_IPTV
> >> +	bool "IPTV support"
> >> +	default y
> >> +	select BR2_PACKAGE_FFMPEG_FFMPEG if BR2_PACKAGE_FFMPEG
> > Here, ffmpeg is not mandatory, but see below...
> 
> Technically yes, the ffmpeg binary is not mandatory.
> 
> But practically it is needed because many lists of legal public streams 
> use /usr/bin/ffmpeg to pipe the stream to tvheadend, like
> https://github.com/jnk22/kodinerds-iptv/tree/master/iptv/pipe
> 
> This patch makes sure that, when ffmpeg is enabled, it also provides
> /usr/bin/ffmpeg, this will avoid problems like this:
> https://github.com/LibreELEC/LibreELEC.tv/pull/3163#issuecomment-446242298
> 
> So I would like to keep the select ...

OK, but then, does it make sense to not have ffmpeg at all. I.e. how
valid is it to have BR2_PACKAGE_TVHEADEND_IPTV without the ffmpeg
package?

I think forcing ffmpeg (the package) *and* ffmpeg (the program) is the
best solution, as I suggested previously.

Regards,
Yann E. MORIN.

> >> +TVHEADEND_DEPENDENCIES += ffmpeg
> > 
> > Here, you are making ffmpeg mandatory, but nothing ensures it is
> > enabled...
> 
> but will remove the dependency, which is obviously wrong here.
> 
> Thanks for noticing.
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
