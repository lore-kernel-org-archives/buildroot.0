From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Dec 2018 22:03:38 +0100
Subject: [Buildroot] [PATCH] package/cryptopp: purge trailig '/' from
 CRYPTOPP_SITE
In-Reply-To: <20181210184246.12233-1-casantos@datacom.com.br>
References: <20181210184246.12233-1-casantos@datacom.com.br>
Message-ID: <10b92ac0-138d-43ca-f224-f6401cd75b07@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/12/2018 19:42, Carlos Santos wrote:
> <PKG>_SITE cannot have a trailing slash.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

 Committed to master after fixing the type in the commit title and adding an
explanation why this wasn't detected by the check in generic-package, thanks.

 Regards,
 Arnout


> ---
>  package/cryptopp/cryptopp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
> index 08b18f2fbc..bc1f5a87a2 100644
> --- a/package/cryptopp/cryptopp.mk
> +++ b/package/cryptopp/cryptopp.mk
> @@ -6,7 +6,7 @@
>  
>  CRYPTOPP_VERSION = 7.0.0
>  CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
> -CRYPTOPP_SITE = http://cryptopp.com/
> +CRYPTOPP_SITE = http://cryptopp.com
>  CRYPTOPP_LICENSE = BSL-1.0
>  CRYPTOPP_LICENSE_FILES = License.txt
>  CRYPTOPP_INSTALL_STAGING = YES
> 
