From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Feb 2017 07:28:46 +0200
Subject: [Buildroot] [PATCH 4/4] bctoolbox: disable rpath
In-Reply-To: <20170214224402.8785-4-joerg.krause@embedded.rocks>
References: <20170214224402.8785-1-joerg.krause@embedded.rocks>
 <20170214224402.8785-4-joerg.krause@embedded.rocks>
Message-ID: <20170215052846.yxjzvhmsgdc3hy57@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Tue, Feb 14, 2017 at 11:44:02PM +0100, J?rg Krause wrote:
> By default, bctoolbox adds the rpath to the shared library. Prevent this
> by setting `CMAKE_SKIP_RPATH` [1] to a true value.
> 
> [1] https://cmake.org/cmake/help/latest/variable/CMAKE_SKIP_RPATH.html
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/bctoolbox/bctoolbox.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
> index 5eea0575f..76737aa3c 100644
> --- a/package/bctoolbox/bctoolbox.mk
> +++ b/package/bctoolbox/bctoolbox.mk
> @@ -11,11 +11,14 @@ BCTOOLBOX_LICENSE_FILES = COPYING
>  BCTOOLBOX_DEPENDENCIES = mbedtls
>  BCTOOLBOX_INSTALL_STAGING = YES
>  
> +# Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
> +# shared library.
>  BCTOOLBOX_CONF_OPTS = \
>  	-DENABLE_STRICT=OFF \
>  	-DENABLE_TESTS_COMPONENT=OFF \
>  	-DENABLE_TESTS=OFF \
> -	-DGIT_EXECUTABLE=OFF
> +	-DGIT_EXECUTABLE=OFF \
> +	-DCMAKE_SKIP_RPATH=ON

Shouldn't we have this in package/pkg-cmake.mk? Samuel?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
