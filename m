From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 17 Jun 2012 13:30:35 +0300
Subject: [Buildroot] [PATCH] libfreefare: add missing openssl dependency
In-Reply-To: <87wr36fdf0.fsf@macbook.be.48ers.dk>
References: <1339924060-4250-1-git-send-email-spdawson@gmail.com>
 <87wr36fdf0.fsf@macbook.be.48ers.dk>
Message-ID: <20120617103034.GA5839@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Jun 17, 2012 at 12:20:03PM +0200, Peter Korsgaard wrote:
> >>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:
> 
>  spdawson> From: Simon Dawson <spdawson@gmail.com>
>  spdawson> If openssl is not selected, configuration fails for the libfreefare package
>  spdawson> as follows.
> 
>  spdawson>   configure: error: Cannot find libcrypto.
> 
>  spdawson> This patch adds the missing dependency on openssl.
> 
>  spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
>  spdawson> ---
>  spdawson>  package/libfreefare/Config.in      |    4 ++++
>  spdawson>  package/libfreefare/libfreefare.mk |    2 +-
>  spdawson>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
>  spdawson> diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
>  spdawson> index 2e11f7e..438bcbf 100644
>  spdawson> --- a/package/libfreefare/Config.in
>  spdawson> +++ b/package/libfreefare/Config.in
>  spdawson> @@ -1,7 +1,11 @@
>  spdawson>  config BR2_PACKAGE_LIBFREEFARE
>  spdawson>  	bool "libfreefare"
>  spdawson> +	depends on BR2_PACKAGE_OPENSSL
> 
> We normally use 'depends on' for library dependencies (like libnfc), so
> I've changed that and committed, thanks.

s/depends on/select/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
