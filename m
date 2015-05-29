From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 29 May 2015 15:34:26 -0400
Subject: [Buildroot] disable-optimization in libgcrypt?
Message-ID: <CANxTyt5C=hBMxALObfjcxTjYBQL8NhkeOoTy4YxN=EPxc4X=Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

We noticed that libgcrypt.mk explicitly disables optimizations:

   LIBGCRYPT_CONF_OPTS = \
    --disable-optimization \
    --with-gpg-error-prefix=$(STAGING_DIR)/usr

Looking through the history, it has been so since 2007, commit
595e070364fa578dcc44bea7256ef635368bad9c by Bernhard Reutner-Fischer.
The commit log does not explain why - "remove duplicate includedir".

I don't see optimization being disabled in OE, Yocto, PTXdist.

Does anyone know why optimization is disabled in libgcrypt?

Danomi -
