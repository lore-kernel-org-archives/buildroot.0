From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 22:49:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/glmark2: rework selection of
 flavours
In-Reply-To: <20191013190539.31816-1-bernd.kuhls@t-online.de>
References: <20191013190539.31816-1-bernd.kuhls@t-online.de>
Message-ID: <20191016224911.708e63a2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Oct 2019 21:05:39 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> https://git.buildroot.net/buildroot/commit/?id=cf66a67112cd706d2e71665e45e8f6453fd53963
> was not enough to fix building glmark2 because it was possible to
> configure buildroot in a way that no flavour would be active:
> http://lists.busybox.net/pipermail/buildroot/2019-October/261943.html
> http://lists.busybox.net/pipermail/buildroot/2019-October/261944.html
> 
> The broken defconfig was fixed
> https://git.buildroot.net/buildroot/commit/?id=ca6f9504dd3825fe4fbd0b4a4b3eea4261032d03
> 
> but we need to fix the selection of flavours to ensure that at least
> on flavour is available:
> http://lists.busybox.net/pipermail/buildroot/2019-October/262022.html
> 
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied, after doing one change, see below.

>  comment "glmark2 needs an OpenGL or an openGL ES and EGL backend provided by mesa3d"

We no longer have any mesa3d related dependency, so I dropped the
"provided by mesa3d" part of this Config.in comment.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
