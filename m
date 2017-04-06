From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 6 Apr 2017 07:01:21 +0300
Subject: [Buildroot] [PATCH 1/1] gnupg: Add options for SHA-256 and
 SHA-512 hashes
In-Reply-To: <20170406010908.95234-1-jack@kumunetworks.com>
References: <20170406010908.95234-1-jack@kumunetworks.com>
Message-ID: <20170406040121.5ptco5esekcyrxlu@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jack,

On Wed, Apr 05, 2017 at 06:09:08PM -0700, Jack Breese wrote:
> Signed-off-by: Jack Breese <jack@kumunetworks.com>
> ---
>  package/gnupg/Config.in | 10 ++++++++++
>  package/gnupg/gnupg.mk  | 12 ++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
> index 30f215fed..87b3afe76 100644
> --- a/package/gnupg/Config.in
> +++ b/package/gnupg/Config.in
> @@ -26,6 +26,16 @@ config BR2_PACKAGE_GNUPG_RSA
>  	help
>  	  Support for RSA public key algorithm
>  
> +config BR2_PACKAGE_GNUPG_SHA256
> +	bool "SHA256 support"
> +	help
> +	  Support for SHA256 hash algorithm
> +
> +config BR2_PACKAGE_GNUPG_SHA512
> +	bool "SHA512 support"
> +	help
> +	  Support for SHA512 hash algorithm

What is the size impact of these options? In case the size increase is 
relatively small just enable them unconditionally. I'd say that, given the 
security implications, we should enable SHA2 even if the size impact is big.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
