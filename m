From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 09 Oct 2012 12:42:09 +0200
Subject: [Buildroot] Webkit compilation broken without X11
In-Reply-To: <20121009111701.42bb68af@skate>
References: <5073DF9C.5030505@relinux.de> <20121009111701.42bb68af@skate>
Message-ID: <5073FF81.3080200@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 09.10.2012 11:17, schrieb Thomas Petazzoni:
> Dear Stephan Hoffmann,
>
> On Tue, 09 Oct 2012 10:26:04 +0200, Stephan Hoffmann wrote:
>
>> I am currently trying to compile webkit for my beaglebone using
>> directfb (without X11). Unfortunatelly, compilation stops because of
>> missing X11 headers. This also happens with the qemu_arm_versatile
>> defconfig.
>>
>>> In file included from ./WebCore/bridge/npruntime_internal.h:28:0,
>>>                  from ./WebCore/plugins/PluginStream.h:40,
>>>                  from ./WebCore/plugins/PluginView.h:36,
>>>                  from
>>> WebCore/bindings/js/ScriptControllerGtk.cpp:35: ./WebCore/bridge/npapi.h:105:26:
>>> fatal error: X11/Xlib.h: No such file or directory
>>> compilation terminated.
>>> make[2]: ***
>>> [WebCore/bindings/js/libwebkit_1_0_la-ScriptControllerGtk.lo]
>>> Fehler 1
>> In 2012.05 Webkit compiles o.k.
>>
>> Attached you find the modified defconfig to reproduce this failure.
> Yes, the problem is well-known, and someone who cares about Webkit on
> DirectFB needs to dig into it. Can you investigate? Maybe it's just a
> header inclusion lacking the proper #ifdef, or maybe it's more
> problematic (DirectFB support in Webkit not being well-maintained, for
> example).
>
> Best regards,
>
> Thomas
Hi Thomas,

I'd like to search the autobuild results to find out when webkit
compiled and when not. Is it possible to get them all? Simply "wget -r
http://autobuild.buildroot.net/results" does not work.

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
