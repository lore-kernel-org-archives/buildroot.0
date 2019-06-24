From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 24 Jun 2019 09:50:49 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/harfbuzz: fix build without
 cairo-svg
In-Reply-To: <87zhm78ovv.fsf@dell.be.48ers.dk>
References: <20190623190309.61714-1-james.hilliard1@gmail.com>
 <20190624061305.62a4e523@windsurf>
 <87zhm78ovv.fsf@dell.be.48ers.dk>
Message-ID: <20190624065049.absi6hqkc73cskzt@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Jun 24, 2019 at 08:43:16AM +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
>  > On Sun, 23 Jun 2019 13:03:09 -0600
>  > James Hilliard <james.hilliard1@gmail.com> wrote:
> 
>  >> Fixes:
>  >> http://autobuild.buildroot.org/results/f6c0b85fa476e0f52cc06f0133d2e4f9920f7556
>  >> test-ot-color.cc:40:10: fatal error: cairo-svg.h: No such file or directory
>  >> 40 | #include <cairo-svg.h>
>  >> |          ^~~~~~~~~~~~~
>  >> 
>  >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>  >> ---
>  >> ...airo-svg-dependency-to-test-ot-color.patch | 38 +++++++++++++++++++
>  >> package/harfbuzz/harfbuzz.mk                  |  2 +-
>  >> 2 files changed, 39 insertions(+), 1 deletion(-)
>  >> create mode 100644 package/harfbuzz/0001-Add-missing-cairo-svg-dependency-to-test-ot-color.patch
> 
>  > Applied to master, thanks.
> 
> This confuses me. We recently changed harfbuzz to only enable cairo
> support if cairo-svg is enabled, and now this patch adds an
> unconditional include of <cairo.h>?

As I understand cairo has already been an optional dependency of harfbuzz, so 
the unconditional cairo.h include should not be a problem. This patch makes 
cairo-svg.h include depend on '!defined(HB_NO_COLOR) && 
defined(CAIRO_HAS_SVG_SURFACE)'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
