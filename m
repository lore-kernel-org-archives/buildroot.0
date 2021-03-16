From: Alexander Dahl <post@lespocky.de>
Date: Tue, 16 Mar 2021 08:42:56 +0100
Subject: [Buildroot] [PATCH 1/2] package/siproxd: needs threads
In-Reply-To: <20210316063821.2310693-1-fontaine.fabrice@gmail.com>
References: <20210316063821.2310693-1-fontaine.fabrice@gmail.com>
Message-ID: <20210316074255.o7a6j322inws24i6@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Mar 16, 2021 at 07:38:20AM +0100, Fabrice Fontaine wrote:
> siproxd which has been added with commit
> 3efc5a250c1c98598ba4c91a7d71d11343d937ab unconditionally uses pthread
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/828448fff87772e1c34b3696284a44eb9fc692fb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/siproxd/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/siproxd/Config.in b/package/siproxd/Config.in
> index 0a471553e4..e73a33bf14 100644
> --- a/package/siproxd/Config.in
> +++ b/package/siproxd/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SIPROXD
>  	bool "siproxd"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_LIBOSIP2
>  	select BR2_PACKAGE_LIBTOOL
>  	select BR2_PACKAGE_SQLITE
> @@ -15,3 +16,6 @@ config BR2_PACKAGE_SIPROXD
>  	  masquerading firewall or NAT router.
>  
>  	  http://siproxd.sourceforge.net/
> +
> +comment "siproxd needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

Acked-by: Alexander Dahl <post@lespocky.de>

Greets
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210316/d98695c3/attachment.asc>
