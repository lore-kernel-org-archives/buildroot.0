From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 27 Oct 2011 15:26:21 +0200
Subject: [Buildroot] Qt program with GUI issue
In-Reply-To: <4EA824F5.7040009@carallon.com>
References: <4EA8042B.2050501@visionsystems.de>
 <4EA820E1.8060403@visionsystems.de> <4EA824F5.7040009@carallon.com>
Message-ID: <4EA95BFD.1080803@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 26.10.2011 17:19, schrieb Will Wagner:
> On 26/10/2011 16:01, Yegor Yefremov wrote:
>> Am 26.10.2011 14:59, schrieb Yegor Yefremov:
>>> I'm trying to get my program integrated into BR. So far I managed to successfully build and install it, but as soon as I run it (with -qws option) I get trouble:
>>>
>>> GUI will be shown, but at the same time background/wallpaper goes green (I made nothing to make this happen). When I move my mouse, the pointer seems to draw over GUI, so that real gray background will show up at the places where mouse pointer went through.
>>>
>>> Is there any simple QT based project I could try to integrate as a reference? I tried CuteCom, but it is fully Qt4 compatible.
>>>
>>> Another issue if I don't supply -qws param, I get following error messages:
>>>
>>> QWSSocket::connectToLocalFile could not connect:: No such file or directory
>>>
>>> My system:
>>> ARM Cortex-A8
>>> WindowsManager: Fluxbox
>>
>
> Hi Yegor,
>
> It sounds like you are trying to run a Qt embedded app with the X window system. This is not possible, Qt embedded works without X using the frame buffer directly. The reason you have to use -qws when running your app is that specifies that the process should act as a window server. It is this window server that is filling the screen green (This is the qws default) and the mouse draw error will be it interfering with X.
>
> You either should remove X from your target or you need to build the X11 version of Qt. Although cross compiling Qt for X11 is not officially supported (in both Qt and buildroot) I have got it working (for x86 at least) and submitted a patch a few weeks back. Got some feedback on it that suggested it need changes for others archs but it should be a good starting point. If you need more help getting the X11 cross compile working I'll try to help.

Thank you for explanations. Now I see the difference. So I got it running in Qt Embedded mode.

As to X11, I tried your patch, but it produces compiler errors for ARM so it really have to be reworked to properly support other platforms. As for now I'll try to finish my testing app first and then we could fix the patch.

Yegor
