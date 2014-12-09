From: Thierry Bultel <tbultel@free.fr>
Date: Tue, 09 Dec 2014 15:38:49 +0100
Subject: [Buildroot] questions about xdriver_xf86-video-imx-viv
In-Reply-To: <1981204.idyJZvJsiF@aquila>
References: <mailman.17.1417521604.17695.buildroot@busybox.net>
 <5486C8A5.3060006@free.fr> <1981204.idyJZvJsiF@aquila>
Message-ID: <54870979.5060509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 09/12/2014 14:28, J?r?me Pouiller a ?crit :
> On Tuesday 09 December 2014 11:02:13 Thierry Bultel wrote:
>> Jerome,
>>
>> I was also currently attempting to bring the work from yocto to
>> buildroot. I do not have a working board, yet, since we are migrating
>> our BSP from 3.0.35 to 3.10.17. Thus I am only preparing the
>> integration, but cannot test at the moment.
>>
>> There is something I do not understand.
>> With the previous version of xdriver_xf86-video-imx-viv ,
>> the build in the DRI directory was producing a libdri.so, which
>> was loaded by xserver.
>>
>> For what I see, only $(@D)/EXA/src is built now.
>>
>> libdri.so is not needed anymore ?
> DRI directory provided by Vivante is used to provide OpenGL API. At the
> beginning I tried to make it works.
>
> Finally, comparing with Yocto, I found Yocto did not compile nor use DRI
> provided by Vivante[1].
>
> I remember I finally saw somewhere[2] OpenGL support was broken. It convinces
> me to not work any more on this topic.
>
>> Also, when you say: " This driver should
>> +	  also be able to provide Desktop OpenGL implementation but, this
>> +	  feature seems broken for a while."
>>
>> does that mean that windowed 3D does not work, but that only full screen
>> does ?
>

Thanks, we use OpenGLES so that should make it.
I looking forward to seeing your patches accepted.

Regards
Thierry

> Windowed 3D works if you use OpenGLES API. You can also use software
> rendering (swrast) provided by mesa3d (this is solution provided by
> Yocto), but I don't think we can consider this is a solution.
>
>
> [1] See
> meta-fsl-arm/recipes-graphics/xorg-driver/xf86-video-imxfb-vivante_3.10.17-1.0.1.bb
>
> [2] maybe there:
> http://permalink.gmane.org/gmane.linux.embedded.yocto.meta-freescale/8260
>
