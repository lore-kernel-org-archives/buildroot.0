From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 09 Aug 2018 07:08:01 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-07
In-Reply-To: <20180808060047.9CC13209AD@mail.bootlin.com>
References: <20180808060047.9CC13209AD@mail.bootlin.com>
Message-ID: <87mutwb2se.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann, Romain, Richard,

Thomas Petazzoni writes:
> Results for branch '2018.05.x'
> ==============================
>
> Classification of failures by reason
> ------------------------------------
>
>           host-libglib2-2.56.1 | 1 
>
> Detail of failures
> ------------------
>
>          arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/ba24c2754923580bac4c1d9e6ecf8251735ae65f |     

Backport of bb3f944d6669dbf from master would fix this one.

> Results for branch 'master'
> ===========================
>
>       xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/55b271cceb5b749f911266ed96998c4ee730fb86 |     
>          sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/f8ff8c24d940113d7eb9729ae0b1b8e454cb4523 |     
>     mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/c1829952aec2356905a2d5559d77b3e79739ea21 |     

I could not reproduce this one here. The autobuilder indicates that it
only happens on the autobuilders of Yann, Romain and Richard:

  http://autobuild.buildroot.net/?reason=brltty-5.5

It looks like ATSPI2_INCLUDES and GLIB2_INCLUDES evaluate to empty
strings in Drivers/Screen/AtSpi2/Makefile.in on these
builders. config.log looks normal though.

Maybe one of you can take a look?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
