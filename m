From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 18:01:56 +0200
Subject: [Buildroot] [PATCH 3/3] package/imagemagick: add optional SVG
 support to host variant
In-Reply-To: <10113_1550582141_5C6C017D_10113_121_1_7e3ed6b6-813f-4db4-a9e2-21152669dd30@OPEXCLILMA1.corporate.adroot.infra.ftgroup>
References: <20190219131530.16364-1-yann.morin@orange.com>
 <10113_1550582141_5C6C017D_10113_121_1_7e3ed6b6-813f-4db4-a9e2-21152669dd30@OPEXCLILMA1.corporate.adroot.infra.ftgroup>
Message-ID: <20190623180156.199080f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Feb 2019 14:15:30 +0100
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> SVG can be regarded as the "source code" for assets, like logos or other
> graphical elements.
> 
> However, SVG needs to be rendered, which requires an XML parser and an
> SVG "parser/rendered". As such, it has various runtime impacts, like
> bad performance or security. As such, SVG are often pre-rendered to the
> required sizes/depths/resolutions into other format, such as PNG, at
> build time.
> 
> While rsvg-convert (from host-librsvg) would allow the rendering, it
> does not allow more complex tasks taht ImageMagick allows for:
> compositing more than one image, 2D transforamtions (rotation, skew...).
> 
> Yet, SVG support in ImageMagick relies on librsvg, which adds quite a
> feq dependencies, and thus has a noticeable impact on the build time.
> 
> Add an option to allow concerned users to enable/disable SVG suppot in
> ImageMagick.
> 
> Enabling SVG support relies on librsvg, which in turns relies on a few
> additional packages that ImageMagick can also optionally use. So,
> autoamtically enable the corresponding support as well.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> ---
>  package/imagemagick/Config.in.host | 13 +++++++++++++
>  package/imagemagick/imagemagick.mk | 28 +++++++++++++++++++++++-----
>  2 files changed, 36 insertions(+), 5 deletions(-)

Applied to master after fixing the various typos in the commit log,
thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
