From: Christian Stewart <christian@paral.in>
Date: Wed, 15 Jul 2020 21:20:16 -0700
Subject: [Buildroot] Specifying march extensions for the toolchain
Message-ID: <CA+h8R2qy+s9z_DzYuNMyhfbxKvKQ8cJ5XBRA9w48HDn4eC7T4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

When using the Buildroot toolchain, the toolchain-wrapper is used,
which specifies march=GCC_TARGET_ARCH.

When using armv8, GCC_TARGET_ARCH is as expected, "armv8a."

However, there are optional extensions to the instruction set - for
example, one can specify "armv8a+crypto+crc" would enable the crypto,
crc extensions.

Would the best way to specify extensions be:

BR2_TARGET_OPTIMIZATION="-march=armv8a+crypto+crc"

Or is there a better way to specify the march override, which inherits
the BR2_ARCH value?

Thanks,
Christian Stewart
