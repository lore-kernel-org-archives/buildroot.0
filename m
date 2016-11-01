From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Nov 2016 09:37:01 +0100
Subject: [Buildroot] [PATCH] package/xen: fix build failure on x86 after
 bump to 47
In-Reply-To: <CAKmqyKNeBjXG+taGpVKBm0cJYE9+V-B+LNTpnk7vZOAtsMFgbQ@mail.gmail.com>
References: <CAKmqyKPsF-MiNFtj3jRaU4cS0usMs0hYitxvj+FKDAQTUDgnaw@mail.gmail.com>
 <1477752207-16549-1-git-send-email-yann.morin.1998@free.fr>
 <20161029182714.GA3490@free.fr>
 <CAKmqyKN-vfzzqwzA6OM3pXco7fE93W0rCGdtRyP0ktmMy=r_bw@mail.gmail.com>
 <CAKmqyKNeBjXG+taGpVKBm0cJYE9+V-B+LNTpnk7vZOAtsMFgbQ@mail.gmail.com>
Message-ID: <20161101083701.GA19336@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alistair, All,

On 2016-10-31 17:42 -0700, Alistair Francis spake thusly:
> On Mon, Oct 31, 2016 at 3:06 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
> > On Sat, Oct 29, 2016 at 11:27 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> Alistair, All,
> >>
> >> On 2016-10-29 16:43 +0200, Yann E. MORIN spake thusly:
> >>> Since the bump to 4.7, Xen fails to build because of a double definition
> >>> of __OBJECT_FILE__. This is due to (who would have guessed) the weirdness
> >>> of their buildsystem.
> >>>
> >>> Fix that with a dirty hack: undefine the macro before defining it.
> >>>
> >>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >>> Cc: Alistair Francis <alistair.francis@xilinx.com>
> >>>
> >>> ---
> >>> Note: totally untested.
> >>
> >> Now build-tested, the double-definition issue is fixed, and the build
> >> succeeds with this defconfig:
> >>
> >>     BR2_aarch64=y
> >>     BR2_TOOLCHAIN_EXTERNAL=y
> >>     BR2_PACKAGE_XEN=y
> >>     BR2_PACKAGE_XEN_HYPERVISOR=y
> >>     BR2_PACKAGE_XEN_TOOLS=y
> >>
> >> Not booted, I don't know Xen enough to test...
> >
> > The patch looks good to me!
> >
> > I just did a build test as well and it works, running a boot test now.
> 
> Tested on ARMv7 (little endian) boot.
> 
> Tested-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

OK, thanks for the testing! I'll resend the patch officially now (it was
not in patchwork).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
