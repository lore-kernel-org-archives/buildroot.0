From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Date: Wed, 26 Oct 2011 17:17:57 +0200
Subject: [Buildroot] Qt program with GUI issue
In-Reply-To: <4EA8042B.2050501@visionsystems.de>
References: <4EA8042B.2050501@visionsystems.de>
Message-ID: <4EA824A5.1040209@eukrea.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

Le 26/10/2011 14:59, Yegor Yefremov a ?crit :
> I'm trying to get my program integrated into BR. So far I managed to
> successfully build and install it, but as soon as I run it (with -qws
> option) I get trouble:
>
> GUI will be shown, but at the same time background/wallpaper goes green (I
> made nothing to make this happen). When I move my mouse, the pointer seems
> to draw over GUI, so that real gray background will show up at the places
> where mouse pointer went through.
>
> Is there any simple QT based project I could try to integrate as a
> reference? I tried CuteCom, but it is fully Qt4 compatible.
>
> Another issue if I don't supply -qws param, I get following error
> messages:
>
> QWSSocket::connectToLocalFile could not connect:: No such file or
> directory
>
> My system: ARM Cortex-A8 WindowsManager: Fluxbox
>
you are trying to run a qtembedded project (with its own graphic server)
in a windows manager running under X : this means both write to the
framebuffer leading to your problem (qt draws the interface and the green
background and when you move the mouse X refresh the area with it's content
(and thus fluxbox's one)).

The solution is :
- either to kill X and run your application with qws then that will work (you
may need to add some parameters in the environment variable QWS_MOUSE_PROTO 
for the input devices)
- either to compile your application with qt for X and run it under X (but I
think buildroot doesn't support QT for X so you are on your own here)

Eric
