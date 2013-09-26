From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 26 Sep 2013 11:20:36 -0400
Subject: [Buildroot] libssh2 dependencies
Message-ID: <CANxTyt7r0O5Vtr4EGU+JGi71W-ZJHD4tahLnHi6PQFDxmOK_6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, Peter,

I was just looking at the select in libssh2/Config.in:

  select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL

If you don't already have either openssl or libgcrypt, then when you
enable libssh2, libgcrypt and libgpg-error get selected as if they are
unconditional dependencies - but then unselect themselves if you
enable openssl.  But it's not clear from menuconfig that this is an
option.  Would it be better to do:

  depends on BR2_PACKAGE_LIBGCRYPT || BR2_PACKAGE_OPENSSL

and then comment:

  comment "libssh2 requires libgcrypt or openssl"
    depends on (!BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_OPENSSL)

Just a thought ....

Danomi -
