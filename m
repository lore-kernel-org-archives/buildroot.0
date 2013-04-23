From: Richard Cagley <rcagley@toyon.com>
Date: Tue, 23 Apr 2013 11:51:48 -0700
Subject: [Buildroot] linux/videodev.h missing
In-Reply-To: <517686B2.407@freescale.com>
References: <BA6FC03EA0815D428FB8A3C279ED4992072B8ECF@mx.toyon.corp>
 <5171D9E4.7090904@mind.be>
 <BA6FC03EA0815D428FB8A3C279ED4992072B900D@mx.toyon.corp>
 <5175A1C6.1050106@mind.be>
 <BA6FC03EA0815D428FB8A3C279ED4992072B9210@mx.toyon.corp>
 <517686B2.407@freescale.com>
Message-ID: <BA6FC03EA0815D428FB8A3C279ED4992072B93F7@mx.toyon.corp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's a Karo TX53 board. I've tried their kernel, the buildroot one for
buildroot-2013.02 (imx_v6_v7 defconfig), the freescale git that Arnout
pointed out...none seem to have matching headers.

Yes, I can basically copy videodev2.h to videodev.h but that only fixes
one problem. After that it's sort of a wormhole of missing header files.
Note, this is only for imx-lib configured as mx53...mx6 appears to be
fine.

I'm reading up on how to source different package versions with
buildroot...it appears to be using 12.09.01...maybe I'll try to figure
out how to use 11.09.01

> -----Original Message-----
> From: Daiane Angolini [mailto:daiane.angolini at freescale.com]
> Sent: Tuesday, April 23, 2013 6:04 AM
> To: Richard Cagley
> Cc: Arnout Vandecappelle; buildroot at busybox.net
> Subject: Re: [Buildroot] linux/videodev.h missing
> 
> On 04/22/2013 07:28 PM, Richard Cagley wrote:
> > Sadly, even freescale seems to have dropped videodev.h
> >
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/inclu
> > de
> > /linux
> 
> Which kernel version and imx-lib version are you using?
> 
> When I worked with kernel and imx-lib 11.09.01 I patched imx-lib in
order to
> avoid this videodev.h include.
> 
> I don't remember exactly what I used, it should be something like
> videodev2.h or video2dev.h
> 
> 
> Daiane
> 
> 
