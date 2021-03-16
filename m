From: Alexander Dahl <post@lespocky.de>
Date: Tue, 16 Mar 2021 08:43:40 +0100
Subject: [Buildroot] [PATCH 2/2] package/siproxd: needs MMU
In-Reply-To: <20210316063821.2310693-2-fontaine.fabrice@gmail.com>
References: <20210316063821.2310693-1-fontaine.fabrice@gmail.com>
 <20210316063821.2310693-2-fontaine.fabrice@gmail.com>
Message-ID: <20210316074339.g5oqz2a5yfriqiq6@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Mar 16, 2021 at 07:38:21AM +0100, Fabrice Fontaine wrote:
> siproxd which has been added with commit
> 3efc5a250c1c98598ba4c91a7d71d11343d937ab unconditionally uses fork
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0c59373ab3778cf7b15e73968295cec8d109f7cb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/siproxd/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/siproxd/Config.in b/package/siproxd/Config.in
> index e73a33bf14..24c710b375 100644
> --- a/package/siproxd/Config.in
> +++ b/package/siproxd/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SIPROXD
>  	bool "siproxd"
> +	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBOSIP2
>  	select BR2_PACKAGE_LIBTOOL
> @@ -18,4 +19,5 @@ config BR2_PACKAGE_SIPROXD
>  	  http://siproxd.sourceforge.net/
>  
>  comment "siproxd needs a toolchain w/ threads"
> +	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS

Acked-by: Alexander Dahl <post@lespocky.de>

Thanks and Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210316/42ab6b2e/attachment.asc>
