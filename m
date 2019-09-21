From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 21:21:25 +0200
Subject: [Buildroot] [PATCH v14 3/8] package/mesa3d: switch build system
 to meson
In-Reply-To: <7n8i5gxlqg.ln2@ID-313208.user.individual.net>
References: <20190921181053.8999-1-bernd.kuhls@t-online.de>
 <20190921181053.8999-4-bernd.kuhls@t-online.de>
 <20274cb4-9aeb-3fa8-cd80-dc71a11e4a36@mind.be>
 <7n8i5gxlqg.ln2@ID-313208.user.individual.net>
Message-ID: <0a5160df-0329-48af-12ea-2869a10020b0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 21:02, Bernd Kuhls wrote:
> Am Sat, 21 Sep 2019 20:48:47 +0200 schrieb Arnout Vandecappelle:
> 
>>  I can't say I understand this bit... It sounds like -Dglx=dri will 
> only work if
>> at least one DRI driver is selected (and then also the question is, 
> will it work
>> at runtime if you use a non-DRI driver?). But we can enable OPENGL_GLX 
> if only
>> Gallium drivers are selected.
> 
> Hi Arnout,
> 
> you are right, until mesa3d 19.1.3 glx support needed a dri driver, this 
> limitation was removed with this commit
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?
> h=19.1&id=e9a284e8d0dc3287b24522f070e75eda437a584d which I came across a 
> few minutes ago. I noticed this commit however in mesa3d 19.2.
> 
> For now I would like to suppose that you commit the series as-is to keep 
> things moving, mostly kodi 18.x ;)

 Yes, I've done that :-)

> 
> I will remove the need for a dri driver to enable glx

 Note that in Config.in this is *not* the case now: GLX depends on
BR2_PACKAGE_MESA3D_DRIVER, not on DRI. So it is currently possible to configure
mesa3d with a gallium driver and enable GLX, and this will pass -Dglx=dri to
meson. I don't know what kind of fireworks that that will give...

 Regards,
 Arnout


> when bumping mesa3d 
> to 19.2, currently available as -rc4, by doing so I will also revert 
> 
> https://git.buildroot.net/buildroot/commit/?
> id=c16f3e4758c0fef46cad53a6f8a7eb439439cafb
> 
> due to
> 
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?
> h=19.2&id=b816edcbf40abca1e3d68b1a706f5670b3fcf4d7
> 
> Kind regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
