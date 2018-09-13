From: quentin.aebischer at bodet-timesport.com <quentin.aebischer@bodet-timesport.com>
Date: Thu, 13 Sep 2018 12:26:53 +0000
Subject: [Buildroot] imx8m xorg-server compilation error
In-Reply-To: <20180913074816.GA9384@g751.home>
References: <26608e8a84344967a3b99d53407947fe@bodet-timesport.com>
 <20180913074816.GA9384@g751.home>
Message-ID: <5bb0cb64-aca4-a93b-f4d7-bb7da6a364f6@bodet-timesport.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,


On 13/09/2018 09:48, Gary Bisson wrote:
> Hi Quentin,
>
> On Wed, Sep 12, 2018 at 01:34:42PM +0000, quentin.aebischer at bodet-timesport.com wrote:
>> Hi everyone,
>>
>>
>> At my company, we are trying to integrate a Zulu embedded JVM with graphics support on the imx8m evk board.
>>
>> For graphics support, the JVM needs an X11 backend.
>>
>> I hence tried to compile xorg-server package, but compilation with following error :
>>
>>
>> make[3]: Entering directory '/home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/build/xserver_xorg-server-1.20.1/glamor'
>>   CC       glamor.lo
>>   CC       glamor_copy.lo
>>   CC       glamor_core.lo
>>   CC       glamor_font.lo
>>   CC       glamor_composite_glyphs.lo
>>   CC       glamor_image.lo
>>   CC       glamor_lines.lo
>>   CC       glamor_glx.lo
>>   CC       glamor_dash.lo
>> In file included from /home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglplatform.h:179:0,
>>                  from /home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/epoxy/egl_generated.h:11,
>>                  from /home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/epoxy/egl.h:46,
>>                  from glamor_priv.h:43,
>>                  from glamor.c:37:
>> /home/quentin/SSD_1To_Kingston/imx8_Linux/rootfs/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/EGL/eglvivante.h:267:1: error: conflicting types for ?fbCreateWindow?
>>  fbCreateWindow(
>>
>> This happens when I select imx-gpuv-viv package, which from what I understand provides hardware GPU acceleration ?
> Yes but imx-gpu-viv doesn't provide any X11 backend for i.MX8 platforms,
> only Wayland. So if you want X, you'll need to use XWayland.
>
> This hasn't been tested yet in Buildroot, only pure Wayland with Weston
> compositor is known to work at this point.
>
> However the NXP Yocto BSP seems to have XWayland sorted out so it should
> be possible, just need someone to take the time to test it.
>
> I wouldn't be surprised if imx-gpu-viv needs some tweaking in case of
> Wayland backend + X11 build.
>
> Regards,
> Gary

OK thanks for the info.
I tried the yocto BSP and can confirm XWayland works there.

I don't think I have the time nor the skillset required to port XWayland to imx8 for buildroot, so I guess I'll just wait.

Regards,

Quentin
