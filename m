From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 11 Apr 2018 20:08:30 +0200
Subject: [Buildroot] Direct rendering with XORG and AMDGPU
In-Reply-To: <CAGbXN6J-oX8y07doUA1qjag7WN9kcai7V+nRGycY+rD7PAR2eA@mail.gmail.com>
References: <162E260C-3293-4AEE-9519-0D0E030168C6@gamecodehq.com>
 <9b4d6bf4-0b92-f277-df89-bb841e35c501@smile.fr>
 <CAGbXN6J-oX8y07doUA1qjag7WN9kcai7V+nRGycY+rD7PAR2eA@mail.gmail.com>
Message-ID: <57bd5934-82c0-20a6-0b3c-19a4d1f47008@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michal,

Le 11/04/2018 ? 18:36, Micha? Kalbarczyk a ?crit?:
> Hi Romain,

Please, keep the mailing list in Cc.

> 
> You're right, the mea3d?radeonsi drivers missing.
> 
> Is there any way to try make it work at this time? Some kind of master branch?
> Any patches?

As far I know, there is no patch pending adding radeonsi support in Buildroot.
But this should be easy:
- add a new BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI option in Config.in
- add a new MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI)
   += radeonsi in mesa3d.mk

If you're able to test radeonsi support it would be great to add this change in
Buildroot.

Best regards,
Romain

> 
> thanks for your help.
> best reards,
> Micha?
> 
> On Tue, Apr 10, 2018 at 4:50 PM, Romain Naour <romain.naour@smile.fr
> <mailto:romain.naour@smile.fr>> wrote:
> 
>     Hi Michal,
> 
>     Le 10/04/2018 ? 16:31, Micha? Kalbarczyk a ?crit?:
>     > Hi,
>     >
>     > I?m trying to build a firmware that support xorg and amdgpu with hardware acceleration. The build is made within nerves. I can?t get software rendering work.
>     >
>     > Figured out that xorg driver reports empty list of supported cards.
>     >
>     > If you want to look at configs please check GitHub repo:
>     https://github.com/fazibear/nerves_system_xorg_x86_64
>     <https://github.com/fazibear/nerves_system_xorg_x86_64>
>     <https://github.com/fazibear/nerves_system_xorg_x86_64
>     <https://github.com/fazibear/nerves_system_xorg_x86_64>>
>     >
>     > There is some dependencies that I missing?
> 
>     Are you sure that your graphic card support is enabled in mesa3d package ?
>     Maybe you need radeonsi gallium driver which is not available currently.
> 
>     Best regards,
>     Romain
> 
>     >
>     > Thanks for your help.
>     > Micha?.
>     >
>     >
>     >
>     > _______________________________________________
>     > buildroot mailing list
>     > buildroot at busybox.net <mailto:buildroot@busybox.net>
>     > http://lists.busybox.net/mailman/listinfo/buildroot
>     <http://lists.busybox.net/mailman/listinfo/buildroot>
>     >
> 
> 
