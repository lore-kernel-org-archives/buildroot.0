From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 26 Oct 2019 23:10:29 +0200
Subject: [Buildroot] [PATCH v2 4/4] package/x11r7/xlib_libXvMC: remove
 xlib_libXv dependency
In-Reply-To: <20191026225520.31a9dafa@windsurf.home>
References: <20191005094818.1956334-1-romain.naour@gmail.com>
 <20191005094818.1956334-4-romain.naour@gmail.com>
 <20191026225520.31a9dafa@windsurf.home>
Message-ID: <d7a91f8c-0df4-6a92-2840-fe5a05c94671@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 26/10/2019 ? 22:55, Thomas Petazzoni a ?crit?:
> On Sat,  5 Oct 2019 11:48:18 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Since libXvMC 1.0.12, xv was removed from xvmc.pc [1].
>>
>> [1] https://lists.x.org/archives/xorg-announce/2019-September/003023.html
> 
> Seems like it disagrees:
> 
>   http://autobuild.buildroot.net/results/305/3051f4fbc1ab725de542a550e4f9eeb3cae385b8/build-end.log
> 
> checking for XVMC... no
> configure: error: Package requirements (x11 >= 1.6 xext xv xextproto videoproto) were not met:

It seems configure.ac still list xv in PKG_CHECK_MODULES:

https://gitlab.freedesktop.org/xorg/lib/libxvmc/blob/master/configure.ac#L43

From the commit message removing xv from .pc
"This library does not itself require libXv for anything."

I'll check.

Best regards,
Romain

> 
> Thomas
> 
