From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 10 Mar 2016 22:58:27 +0100
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk> <56E1D44F.70807@zacarias.com.ar>
Message-ID: <3979rcxl7o.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 10 Mar 2016 17:08:47 -0300 schrieb Gustavo Zacarias:

> On 10/03/16 16:59, Peter Korsgaard wrote:
> 
>> I don't know much about mesa, but I thought the Intel driver didn't use
>> galium? Is this some kind of alternative to the dri driver?
> 
> You've got both, from mesa configure:
> 
> --with-gallium-drivers[=DIRS...]
>     comma delimited Gallium drivers list, e.g.
>     
"i915,ilo,nouveau,r300,r600,radeonsi,freedreno,svga,swrast,vc4,virgl"
>     [default=r300,r600,svga,swrast]
> 
> Enabling it builds /usr/lib/dri/i915_dri.so besides others you may have
> selected (in my case kms_swrast_dri.so and swrast_dri.so).
> Otherwise we can ask Bernd, but i get that additional driver with this
> option, and it's documented.
> Regards.

Hi,

I am using the DRI driver for my Kodi system and never tried the Gallium 
one because my personal Kodi package follows the OpenElec development, 
and they use DRI, too ;)
https://github.com/OpenELEC/OpenELEC.tv/blob/master/config/graphic#L26

Some quotes I found during a quick research:
http://www.mesa3d.org/relnotes/8.0.html (February 9, 2012)
"Removed the dead Gallium i965, cell and failover drivers, which were 
either broken and with nobody in sight to fix the situation or 
deprecated."

https://blogs.igalia.com/itoral/2014/08/08/diving-into-mesa/
"Although there were some efforts to port the Intel driver to Gallium in 
the past, development of the Intel Gallium drivers (i915g and i965g) is 
stalled now as far as I know. Intel is focusing in the classic version of 
the drivers instead."

These days Intel is busy in coding a Vulkan driver for mesa3d:
https://cgit.freedesktop.org/mesa/mesa/tree/README.intel-vulkan.txt?
h=vulkan

To sum up: Yes, it is possible to build a i915 gallium driver in mesa3d, 
but who needs it? That's the reason I never implemented a Config.in 
option for it, but it will not hurt having one ;)

Regards, Bernd
