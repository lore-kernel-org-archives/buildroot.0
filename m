From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 21 May 2014 09:39:33 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
 <20140518162900.GA3631@free.fr>
 <le5n4bxjvb.ln2@ID-313208.user.individual.net>
 <20140518172928.GD3631@free.fr> <537B83C6.6080403@mind.be>
 <20140520164924.GA3506@free.fr> <537BE23F.602@mind.be>
Message-ID: <lq1u4bxgbc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Arnout Vandecappelle <arnout@mind.be> wrote in
news:537BE23F.602 at mind.be: 

> On 20/05/14 18:49, Yann E. MORIN wrote:
>> Arnout, All,

>> And as Bernd said, full openGL support in XBMC is not possible on ARM,
>> so it is missing a dependency on !BR2_arm. But the basis are here,
>> granted.
> 
>  Agreed if there is a specific ARM dependency in XBMC itself. I don't
>  agree if this is just because only mesa3d on x86 implements libgl.

xbmc needs GLES on ARM:
https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L695
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/84408

>  Well, if we get another libgl provider that doesn't require X, then the
> _HAS_LIBGL condition will be incorrect...

I think it is safe to remove

depends on BR2_PACKAGE_XORG7

from BR2_PACKAGE_XBMC_GL because BR2_PACKAGE_HAS_LIBGL is currently only 
provided, when a DRI drivers was activated in mesa3d, which is only possible 
with activated xorg, v10 will contain the updated patch.

Regards, Bernd
