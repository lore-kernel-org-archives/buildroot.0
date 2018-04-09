From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 8 Apr 2018 22:04:04 -0500
Subject: [Buildroot] [PATCH] package/xen: Fix qemu-xen memfd build
 failure
In-Reply-To: <1523211915-680-1-git-send-email-alistair@alistair23.me>
References: <1523211915-680-1-git-send-email-alistair@alistair23.me>
Message-ID: <CANQCQpbfKVDL9+5sFjPOPdcZ5_dDOtLLvgtodr=_-sAk65E-NQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alistair,

On Sun, Apr 8, 2018 at 1:25 PM, Alistair Francis <alistair23@gmail.com> wrote:
> Fix the QEMU memfd compile error:
> tools/qemu-xen/util/memfd.c:40:12: error: static declaration of 'memfd_create' follows non-static declaration
>  static int memfd_create(const char *name, unsigned int flags)
>             ^~~~~~~~~~~~
>
> that has been introduced since the Glibc 2.27 upgrade.
>
> This just involves porting the upstream QEMU patch to the Xen QEMU tree.
>
> This fixes:
> http://autobuild.buildroot.net/results/ec7cda00e07b0c98a9a366244b67611e042e0d4b/
>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
