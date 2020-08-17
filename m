From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 17 Aug 2020 10:09:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/easyframes: new package
In-Reply-To: <20200815142631.1054530-1-horatiu.vultur@microchip.com>
References: <20200815142631.1054530-1-horatiu.vultur@microchip.com>
Message-ID: <CAHpTZwmH+8oW1OEWP5aErmyd=f-_DV=sL=KGupTU0EDq3NO9ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Horatiu,

On Sat, Aug 15, 2020 at 4:27 PM Horatiu Vultur via buildroot <
buildroot@busybox.net> wrote:

> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>
> +++ b/package/easyframes/easyframes.hash
> @@ -0,0 +1 @@
> +sha256 998d260f0e2dd3206201e566af176ebf20298185f040c3c8bf085e054aeed10f
> easyframes-25f3aad30a7d8c7844cb08a95a1048959553a503.tar.gz
> diff --git a/package/easyframes/easyframes.mk b/package/easyframes/
> easyframes.mk


Please add COPYING LICENSE HASH to the hash file and insert a comment at
the beginning of the file to say how the hashes were computed. For example :

# locally calculated
sha256 998d260f0e2dd3206201e566af176ebf20298185f040c3c8bf085e054aeed10f
easyframes-25f3aad30a7d8c7844cb08a95a1048959553a503.tar.gz

sha256 HASH_VALUE_OF_COPYING_FILE  COPYING


> new file mode 100644
> index 0000000000..8b22bac03b
> --- /dev/null
> +++ b/package/easyframes/easyframes.mk
> @@ -0,0 +1,16 @@
>
> +################################################################################
> +#
> +# easyframes
> +#
>
> +################################################################################
> +
> +EASYFRAMES_VERSION = 25f3aad30a7d8c7844cb08a95a1048959553a503
>

I see that you are one of projet's maintainers, It is better if you can
create a tag for a stable release and use it to create your buildroot
package. for example :
EASYFRAMES_VERSION = 25f3aad30a7d8c7844cb08a95a1048959553a503 => should
become EASYFRAMES_VERSION = 1.0.0.


> +EASYFRAMES_SITE_METHOD = git
> +EASYFRAMES_SITE = https://github.com/microchip-ung/easyframes


Please, use github call method to download your package : $(call
github,microchip-ung,easyframes,$(EASYFRAMES_VERSION)).


> +EASYFRAMES_INSTALL_STAGING = YES
> +EASYFRAMES_DEPENDENCIES = zlib libpcap
>

Dependencies should be sorted alphabetically, EASYFRAMES_DEPENDENCIES =
libpcap zlib

+EASYFRAMES_LICENSE = MIT
> +EASYFRAMES_LICENSE_FILES = COPYING
> +
> +$(eval $(cmake-package))
> --
> 2.27.0
>

Best regards,

Jugurtha.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200817/5f462588/attachment.html>
