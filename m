From: =?ISO-8859-15?B?Qmr2cm4=?= Kirchner <bjoern@am-soft.de>
Date: Thu, 15 Jan 2015 20:06:34 +0100
Subject: [Buildroot] Fwd:  Qt4 Application - Touch detection
In-Reply-To: <CADKZYYK12mXBKQq=R2k7aAky-2i1FcfAyyaXqLdsnd5cpoQdXg@mail.gmail.com>
References: <CADKZYYLgvvnaur+Rc0J0UVshsQesEWZ2Feenb3WHA0gQztaKKA@mail.gmail.com>
 <20150115181324.48fc51e9@tux.kirchner>
 <CADKZYYKDoizsdEo28Ynwb=ndhJXmHW3Zoqx=aSpP-1BMnDYujw@mail.gmail.com>
 <CADKZYYK12mXBKQq=R2k7aAky-2i1FcfAyyaXqLdsnd5cpoQdXg@mail.gmail.com>
Message-ID: <20150115200634.598a27a3@tux.kirchner>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 15 Jan 2015 11:57:20 -0600
schrieb Santhosh Ramani <srcoolz@gmail.com>:

> Hello Bjorn,
> 
> Thanks for the quick reply.
> 
> 1. Is environment variable TSLIB_TSDEVICE set to the correct input
> >    device found under /dev/input/eventX ?
> > 2. Is environment variable QWS_MOUSE_PROTO set to
> >    "tslib:/dev/input/eventX" ?
> 
> 
> I do have a startup script where I export these variables prior to
> ts_calibrate.  Do you want me to re-export them before running the
> application? I export the following variables:
> 
> export TSLIB_TSDEVICE=/dev/input/event0
> export TSLIB_TSEVENTTYPE=INPUT
> export TSLIB_CONFFILE=/etc/ts.conf
> export TSLIB_CALIBFILE=/etc/pointercal
> export QWS_MOUSE_PROTO="Tslib:/dev/input/event0"
> 

Does the capital 'T' in "Tslib" make any difference? I've only seen
it written as 't', yet. Do you reboot between calibration and starting
of your program? In my case the devices changed occasionally between
reboots, so /dev/input/event0 was not always the correct device.

> I do have a question - when I print the environment variables, these
> do not show up. I use the 'printenv' command, and these are not
> listed. Is that a problem?

I'm not quite sure here. If you start a script which exports environment
variables, I think those exportes variables only exist in this script
and in its child processes. So, if you start ts_calibrate with a start
script and after that your program from a differnt script or directly
from your login shell, I suppose those variables aren't set anymore.
Please try to export them either in a start script for your application
or, as a quick test, in the shell you use to start your program. Just
to make sure...

> 
> 
>  I used Qt 4.8.x on x86 with a touch screen. But I built it with
> > buildroot and didn't copy it from a SDK. With that buildroot built
> > Qt it worked very well.
> 
> 
> I will test this out and reply back to you.
> 
> Thank you once again.
> Regards
> 
> Santhosh
> 
> 
> 
> 
> 
