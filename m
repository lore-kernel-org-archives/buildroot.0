From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 25 Feb 2014 21:01:54 +0100
Subject: [Buildroot] [PATCH v2 2/2] manual: add virtual package tutorial.
In-Reply-To: <1393343137-4209-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1393343137-4209-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1393343137-4209-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAHXCMM+zjqV=jtyN64aVnPU+CYn1mkw35i_NVGu5XnRX=jcngg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Tue, Feb 25, 2014 at 4:45 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
[...]
> +
> +Provider +Config.in+ file
> +^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The +Config.in+ file of the package 'some-provider', which provides the
> +functionalities of 'something-virtual', should contain:
> +

No word about the provider's *.mk file which does not need any change?

> +---------------------------
> +01: config BR2_PACKAGE_SOME_PROVIDER
> +02:    bool "some-provider"
> +03:    select BR2_PACKAGE_HAS_SOMETHING_VIRTUAL
> +04:    help
> +05:      This is a comment that explains what some-provider is.
> +06:
> +07:      http://foosoftware.org/some-provider/
> +08:
> +09: if BR2_PACKAGE_SOME_PROVIDER
> +10: config BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL
> +11:    default "some-provider"
> +12: endif
> +---------------------------
> +
> +On line 3, we select +BR2_PACKAGE_HAS_SOMETHING_VIRTUAL+, and on line 11, we
> +set the value of +BR2_PACKAGE_PROVIDES_SOMETHING_VIRTUAL+ to the name of the
> +provider, but only if it is selected.
> +
> +Of course, do not forget to add the proper build and runtime dependencies for
> +this package!
> diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
> index cc86529..f763282 100644
> --- a/docs/manual/adding-packages.txt
> +++ b/docs/manual/adding-packages.txt
> @@ -22,6 +22,8 @@ include::adding-packages-python.txt[]
>
>  include::adding-packages-luarocks.txt[]
>
> +include::adding-packages-virtual.txt[]
> +
>  include::adding-packages-hooks.txt[]
>
>  include::adding-packages-gettext.txt[]
> --

Otherwise, it looks good! :)

Regards,

-- 
Samuel
