From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 29 Apr 2010 23:20:36 +0300
Subject: [Buildroot] [PATCH 07/19] freetype: disable autoreconf
In-Reply-To: <8f7798bec30f2e0fbc7896018a70d8de542cd4f9.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
	<8f7798bec30f2e0fbc7896018a70d8de542cd4f9.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4BD9EA14.20403@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/2010 12:40 AM, Thomas Petazzoni wrote:
> Freetype is unfortunately not a normal autotools-based package. Its
> real configure script is in builds/unix/, but the build cannot be
> started from here. And it doesn't rely on automake.
>
> For absolute perfection, the package should probably be converted to
> the GENTARGETS infrastructure, but it will generate a much, much
> longer .mk file that the one we have today.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   package/freetype/freetype.mk |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index f19b854..e9a270f 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -7,6 +7,7 @@ FREETYPE_VERSION = 2.3.12
>   FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
>   FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
>   FREETYPE_LIBTOOL_PATCH = NO
> +FREETYPE_AUTORECONF = NO

It is disabled by default... Do we need to explicitly specify it?

>   FREETYPE_INSTALL_STAGING = YES
>   FREETYPE_INSTALL_TARGET = YES
>   FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
