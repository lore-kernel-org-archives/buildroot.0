From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 29 May 2015 22:07:30 +0200
Subject: [Buildroot] disable-optimization in libgcrypt?
In-Reply-To: <CANxTyt5C=hBMxALObfjcxTjYBQL8NhkeOoTy4YxN=EPxc4X=Vg@mail.gmail.com>
References: <CANxTyt5C=hBMxALObfjcxTjYBQL8NhkeOoTy4YxN=EPxc4X=Vg@mail.gmail.com>
Message-ID: <A748888D-3084-4353-93C7-F22AC548A0C2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On May 29, 2015 9:34:26 PM GMT+02:00, Danomi Manchego <danomimanchego123@gmail.com> wrote:
>All,
>
>We noticed that libgcrypt.mk explicitly disables optimizations:
>
>   LIBGCRYPT_CONF_OPTS = \
>    --disable-optimization \
>    --with-gpg-error-prefix=$(STAGING_DIR)/usr
>
>Looking through the history, it has been so since 2007, commit
>595e070364fa578dcc44bea7256ef635368bad9c by Bernhard Reutner-Fischer.
>The commit log does not explain why - "remove duplicate includedir".
>
>I don't see optimization being disabled in OE, Yocto, PTXdist.
>
>Does anyone know why optimization is disabled in libgcrypt?

I do not remember if i disabled it on purpose, maybe an ICE?
Or maybe I wanted the buildroot flags to take effect rather than the -O3 (?) the package wanted to, back then. The latter sounds more likely, now that I think of it.

Please drop it if it fits the current buildroot style.

Cheers,
