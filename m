From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Aug 2016 07:33:15 -0700
Subject: [Buildroot] [PATCH] glibc: add version 2.24
In-Reply-To: <1470387567-64171-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1470387567-64171-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <e6aa4d6c-3325-0f39-96b0-eb25db6a8574@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 8/5/16 1:59 AM, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/glibc/Config.in  | 6 ++++++
>  package/glibc/glibc.hash | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index f86822d..a9a6cc7 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -22,6 +22,11 @@ config BR2_GLIBC_VERSION_2_23
>  	# No support for pthread barriers on < v9 ISA
>  	depends on !BR2_sparc
>  
> +config BR2_GLIBC_VERSION_2_24
> +	bool "2.24"
> +	# No support for pthread barriers on < v9 ISA
> +	depends on !BR2_sparc
> +
>  endchoice
>  
>  endif
> @@ -30,3 +35,4 @@ config BR2_GLIBC_VERSION_STRING
>  	string
>  	default "2.22" if BR2_GLIBC_VERSION_2_22
>  	default "2.23" if BR2_GLIBC_VERSION_2_23
> +	default "2.24" if BR2_GLIBC_VERSION_2_24
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 052f281..3c5c612 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated after checking pgp signature (glibc)
>  sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
>  sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
> +sha256	99d4a3e8efd144d71488e478f62587578c0f4e1fa0b4eed47ee3d4975ebeb5d3	glibc-2.23.tar.xz


typo. It should be 2.24
