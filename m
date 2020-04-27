From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:19:45 +0200
Subject: [Buildroot] [PATCH] package/cegui: disable ogre support
In-Reply-To: <20200427200909.6753-1-b.bilas@grinn-global.com>
References: <20200427200909.6753-1-b.bilas@grinn-global.com>
Message-ID: <20200427221945.5528d702@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 27 Apr 2020 22:09:09 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Buildroot's ogre version isn't compatible with current (v0-8-7) cegui
> therefore disable support for that. It will be restored when upstream will
> switch to the new version.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/8ee717ac4d596fc0af274037841ac4ed6862ddaa/
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/cegui/cegui.mk | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Applied, thanks.

To be honest, I think it was a mistake to support all those optional
features without testing them. Xerces, then minizip, now ogre. I would
have very much preferred to disable all these features unconditionally,
and then people who need them can add the necessary conditions.

BTW, are you using cegui in some projects ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
