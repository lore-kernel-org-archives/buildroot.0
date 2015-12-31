From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 01:17:17 +0100
Subject: [Buildroot] [PATCH 38/84 RFC] docs/manual: add example about
 sub-options
In-Reply-To: <d74a1da746237dff8a24373d5f561853bcc6b175.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <d74a1da746237dff8a24373d5f561853bcc6b175.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <5684740D.3060107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:25, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  docs/manual/adding-packages-directory.txt | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index faf967c..2b9e714 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -54,6 +54,31 @@ examples in other packages. The syntax of the +Config.in+ file is the same
>  as the one for the kernel Kconfig file. The documentation for this syntax is
>  available at http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[]
>  
> +For example:
> +
> +---------------------------
> +config BR2_PACKAGE_LIBFOO
> +	bool "libfoo"
> +	help
> +	  This is a comment that explains what libfoo is.
> +
> +	  http://foosoftware.org/libfoo/
> +
> +if BR2_PACKAGE_LIBFOO
> +
> +config BR2_PACKAGE_LIBFOO_BAR
> +	bool "bar support"
> +	help
> +	  This is a comment that briefly explains what
> +	  bar support is, if it's not obvious.

 This should be indented at 72 columns like we require in the real Config.in.


 Regards,
 Arnout

> +
> +endif # BR2_PACKAGE_LIBFOO
> +---------------------------
> +
> +The sub-options will be cleanly indented below the main symbol when it
> +is enabled, and will be properly hidden when the symbol is disabled.
> +
> +
>  Finally you have to add your new +libfoo/Config.in+ to
>  +package/Config.in+ (or in a category subdirectory if you decided to
>  put your package in one of the existing categories). The files
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
