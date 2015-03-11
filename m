From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Mar 2015 09:11:36 +0100
Subject: [Buildroot] [PATCH v2 1/1] docs/manual: add host package
	documentation
In-Reply-To: <1425921067-4130-1-git-send-email-heyleke@gmail.com>
References: <1425921067-4130-1-git-send-email-heyleke@gmail.com>
Message-ID: <CAAXf6LXEkN+BG4-7am8+ksZ=suCwkQ0p7duqN5VqWD5=xOmnLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

On Mon, Mar 9, 2015 at 6:11 PM, Jan Heylen <heyleke@gmail.com> wrote:
> + rearrange the structure a bit by adding a new paragraph for the Config
> files
>
> Signed-off-by: Jan Heylen <heyleke@gmail.com>
>
> ---
> Changes v1 -> v2:
> * rewritten some sentences (suggested by Thomas)
> * reorganised the Config files paragraphs a bit
> ---
>  docs/manual/adding-packages-directory.txt | 50 ++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 4 deletions(-)
>
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 8a88282..389c763 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -11,12 +11,18 @@ Some packages have been grouped by topic in a sub-directory:
>  one of these categories, then create your package directory in these.
>  New subdirectories are discouraged, however.
>
> +=== Config files
>
> -=== +Config.in+ file
> +For the package to be displayed in the configuration tool, you need to
> +create a Config file in your package directory. There are two types:
> ++Config.in+ and +Config.in.host+.
>
> -Then, create a file named +Config.in+. This file will contain the
> -option descriptions related to our +libfoo+ software that will be used
> -and displayed in the configuration tool. It should basically contain:
> +==== +Config.in+ file
> +
> +For packages used on the target, create a file named +Config.in+. This
> +file will contain the option descriptions related to our +libfoo+ software
> +that will be used and displayed in the configuration tool. It should basically
> +contain:
>
>  ---------------------------
>  config BR2_PACKAGE_LIBFOO
> @@ -49,6 +55,42 @@ supposed to contain anything but the 'bare' name of the package.
>  source "package/libfoo/Config.in"
>  --------------------------
>
> +
> +==== +Config.in.host+ file
> +
> +Some packages also need to be built for the host system. There are two
> +options here:
> +
> +* The host package is only required to satisfy build-time
> +  dependencies of one or more target packages. In this case, add
> +  +host-foo+ to the target package's +BAR_DEPENDENCIES+ variable. No
> +  +Config.in.host+ file should be created.
> +
> +* The host package should be explicitly selectable by the user from
> +  the configuration menu. In this case, create a +Config.in.host+ file
> +  for that host package:
> +
> +---------------------------
> +config BR2_PACKAGE_HOST_FOO
> +       bool "host foo"
> +       help
> +         This is a comment that explains what foo for the host is.
> +
> +         http://foosoftware.org/foo/
> +---------------------------
> +
> +The same coding style and options as for the +Config.in+ file are valid.
> +
> +Finally you have to add your new +libfoo/Config.in.host+ to
> ++package/Config.in.host+. The files included there are 'sorted alphabetically'
> +and are 'NOT' supposed to contain anything but the 'bare' name of the package.
> +
> +--------------------------
> +source "package/foo/Config.in.host"
> +--------------------------
> +
> +The host package will then be available from the +Host utilities+ menu.
> +
>  [[depends-on-vs-select]]
>  ==== Choosing +depends on+ or +select+
>

I just sent a v3 of this patch fixing:
- a trailing tab
- the indentation of the above details under the bullet of the second option.

With this v3 this is good to go for me...

Thanks!
Thomas
