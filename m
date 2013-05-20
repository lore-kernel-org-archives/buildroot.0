From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 May 2013 05:55:26 +0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.8.7
In-Reply-To: <1369007247-27993-1-git-send-email-gustavo@zacarias.com.ar>
References: <1369007247-27993-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130520025525.GC7188@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Sun, May 19, 2013 at 08:47:27PM -0300, Gustavo Zacarias wrote:
> Fixes CVE-2013-2486, CVE-2013-2487 and several wnpa-sec (wireshark)
> advisories.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wireshark/Config.in                        |  1 +
>  .../wireshark/wireshark-dont-include-prefix.patch  | 41 ----------------------
>  package/wireshark/wireshark.mk                     |  2 +-
>  3 files changed, 2 insertions(+), 42 deletions(-)
>  delete mode 100644 package/wireshark/wireshark-dont-include-prefix.patch
> 
> diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
> index e6d4e72..d4c8b43 100644
> --- a/package/wireshark/Config.in
> +++ b/package/wireshark/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_WIRESHARK
>  	select BR2_PACKAGE_LIBPCAP
>  	select BR2_PACKAGE_LIBGCRYPT
>  	select BR2_PACKAGE_LIBGLIB2
> +	depends on BR2_USE_MMU # fork()

Have you seen an actual build failure caused by this missing dependency?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
