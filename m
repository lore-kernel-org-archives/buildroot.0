From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 17 Feb 2017 09:34:38 +0100
Subject: [Buildroot] [PATCH] package/opengl: ensure consistency between
	the various providers
In-Reply-To: <681a6c09-1976-193c-a738-ff948ff86567@mind.be>
References: <1487106796-15403-1-git-send-email-yann.morin.1998@free.fr>
 <681a6c09-1976-193c-a738-ff948ff86567@mind.be>
Message-ID: <20684119.X7ZmMtA3r5@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Thursday 16 February 2017 18:46:10 CET Arnout Vandecappelle wrote:
> 
> On 14-02-17 22:13, Yann E. MORIN wrote:
> > Some GL providers will provide libegl and libgles, but not libgl, while
> > other will provide libgl but not libegl not libgles. This can be the
> > case with:
> >   - mesa3d       -> libgl
> >   - rpi-userland -> libegl and libgles

Unfortunately, as far as I remember, this kind of configuration is
necessary to build xdriver_xf86-video-imx-viv. Mesa is necessary to
build GLX support but, EGL/GLes have to be provided by imx-gpu-viv.

However, maybe your idea is correct and xdriver_xf86-video-imx-viv should be 
reworked (but it is not a trivial work).


>  The commit message is missing an explanation of why this is bad... Something
> like "Such a situation leads to conflicting headers and libraries when building
> a package that uses both libgl and libegl."



-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
