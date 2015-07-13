From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 22:32:21 +0200
Subject: [Buildroot] [PATCH 1/1] ntfs-3g: fix incorrect comment
 dependency
In-Reply-To: <1436819277-48747-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1436819277-48747-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <20150713223221.0693722c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Mon, 13 Jul 2015 15:27:57 -0500, Ryan Barnett wrote:
> The comment for ntfs-3g displays even when the package has met its
> necessary dependencies.
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
>  package/ntfs-3g/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
> index a860498..054e5b6 100644
> --- a/package/ntfs-3g/Config.in
> +++ b/package/ntfs-3g/Config.in
> @@ -32,4 +32,4 @@ endif
>  
>  comment "ntfs-3g needs a toolchain w/ wchar, threads, dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && BR2_STATIC_LIBS)
> +	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && !BR2_STATIC_LIBS)

I personally prefer:

	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

I think we do that for most packages, and it's somewhat easier to understand.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
