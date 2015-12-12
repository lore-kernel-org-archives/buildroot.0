From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 14:49:27 +0100
Subject: [Buildroot] [PATCH v9 05/32] package/efl/libefl: new
 host-package
In-Reply-To: <1449927215-3452-6-git-send-email-romain.naour@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-6-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151212144927.046810aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, 12 Dec 2015 14:33:08 +0100, Romain Naour wrote:

> +################################################################################
> +#
> +# host-libefl
> +#
> +################################################################################

I am not a big fan of this, because we don't have this in any other
Buildroot package. It should be removed IMO.

> +# Configure options:
> +# --disable-audio, --disable-multisense remove libsndfile dependency.
> +# --disable-cxx-bindings: disable C++11 bindings.
> +# --disable-fontconfig: remove dependency on fontconfig.
> +# --disable-fribidi: remove dependency on libfribidi.
> +# --disable-gstreamer1: remove dependency on gtreamer 1.0.
> +# --disable-libeeze: remove libudev dependency.
> +# --disable-libmount: remove dependency on host-util-linux libmount.
> +# --disable-physics: remove Bullet dependency.
> +# --enable-image-loader-gif=no: disable Gif dependency.
> +# --enable-image-loader-tiff=no: disable Tiff dependency.
> +# --enable-lua-old: disable Elua and remove luajit dependency.
> +# --with-crypto=none: remove dependencies on openssl or gnutls.
> +# --with-x11=none: remove dependency on X.org.
> +#   Yes I really know what I am doing.

I think it is good to document the options, but only when there is
actually a reason to do so. For example, in the list above, documenting
--disable-fontconf, --disable-fridibi, --disable-gstreamer1,
--disable-mount, --enable-image-loader-gif=no,
--enable-image-loader-tiff=no, --with-crypto=none and --with-x11=none
is useless, since your explanation does not add any value compared to
the name of the option.

For the other ones, it is less obvious, so it is useful. So I think it
is better to document the ones for which an additional comment is
needed, and for the others, just don't add any comment.

I've applied your patch despite those comments, as they can be
addressed later on.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
