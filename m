From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 14:20:56 +0200
Subject: [Buildroot] [PATCH 01/13] new package: openrc-0.41.2
In-Reply-To: <20190509103024.xxzjilxbujcwi552@c-ml-p3510.redembedded.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
 <20190509090111.47aac2e7@windsurf.home>
 <20190509103024.xxzjilxbujcwi552@c-ml-p3510.redembedded.pl>
Message-ID: <20190509142056.6a3e8065@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michal,

On Thu, 09 May 2019 12:30:24 +0200
michal.lyszczek at bofc.pl wrote:

> >  - What is the effect of MKPKGCONFIG=no ? What is openrc using
> >    pkg-config for ?  
> 
> openrc does not use pkg-config per se, if MKPKGCONFIG is enabled, it will
> just install *.pc files on rootfs for other programs to find librc and
> libeinfo. These libs exposes C api to controll openrc (al rc-* functions
> uses it). From the looks of it, these libs would be usefull if you wanted
> to write your own programs to manager services, and vast majority of people
> using openrc won't need it. Also, that's the reason why there is not
> INSTALL_STAGING=yes.

OK, thanks for the explanation, it makes perfect sense. Could perhaps
be explained in the commit log or in a comment in the .mk file.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
