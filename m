From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Thu, 09 May 2019 12:30:24 +0200
Subject: [Buildroot] [PATCH 01/13] new package: openrc-0.41.2
In-Reply-To: <20190509090111.47aac2e7@windsurf.home>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
 <20190509090111.47aac2e7@windsurf.home>
Message-ID: <20190509103024.xxzjilxbujcwi552@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 2019-05-09 09:01:11, Thomas Petazzoni wrote:
> Also, a few questions:
> 
>  - How is the TARGETDIR variable used by the build system ? Why does it
>    need to know the installation location at build time ?

Good catch, it's not needed, it's a leftover from my integration I did in
March, but found better solution so it is not needed anymore. Deleted.

>  - What is the effect of MKPKGCONFIG=no ? What is openrc using
>    pkg-config for ?

openrc does not use pkg-config per se, if MKPKGCONFIG is enabled, it will
just install *.pc files on rootfs for other programs to find librc and
libeinfo. These libs exposes C api to controll openrc (al rc-* functions
uses it). From the looks of it, these libs would be usefull if you wanted
to write your own programs to manager services, and vast majority of people
using openrc won't need it. Also, that's the reason why there is not
INSTALL_STAGING=yes.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190509/8907fb13/attachment.asc>
