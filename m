From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 12:45:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build with cairo
In-Reply-To: <20190623075907.13362-1-fontaine.fabrice@gmail.com>
References: <20190623075907.13362-1-fontaine.fabrice@gmail.com>
Message-ID: <20190623124542.11681720@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Jun 2019 09:59:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> harfbuzz needs svg support on cairo
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f6c0b85fa476e0f52cc06f0133d2e4f9920f7556
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/harfbuzz/harfbuzz.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I hesitated a bit between the solution you're proposing and another
solution like this:

	select BR2_PACKAGE_CAIRO_SVG if BR2_PACKAGE_CAIRO

But OK, it's very subjective what is the best solution between the two,
so I just applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
