From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Nov 2013 19:26:26 +0100
Subject: [Buildroot] [PATCH 2/2] busybox: ensure $(BUSYBOX_BUILD_CONFIG)
 is writable
In-Reply-To: <CANxTyt5iuzB_FvM_KPJoQU549STpqbSaTmUF+BUBE_1iu2pAhA@mail.gmail.com>
References: <cover.1384191560.git.yann.morin.1998@free.fr>
 <0b4acecdd3e9fb7d9510c206338ebbdfa483ca9e.1384191560.git.yann.morin.1998@free.fr>
 <CANxTyt5qCLXrOCnp5hrxwTkzfoH3DORs6uoDiBr5Jr1w3+0R2A@mail.gmail.com>
 <20131112174247.GA3434@free.fr>
 <CANxTyt5iuzB_FvM_KPJoQU549STpqbSaTmUF+BUBE_1iu2pAhA@mail.gmail.com>
Message-ID: <20131112182626.GB3434@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2013-11-12 12:54 -0500, Danomi Manchego spake thusly:
> On Tue, Nov 12, 2013 at 12:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Danomi, All,
> >
> > On 2013-11-11 15:22 -0500, Danomi Manchego spake thusly:
> >> On Mon, Nov 11, 2013 at 12:45 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> > From: Nathan Lynch <ntl@pobox.com>
> >> >
> >> > If $(BUSYBOX_CONFIG_FILE) is read-only (eg. because Buildroot's
> >> > source dir is), the sed fixups to $(BUSYBOX_BUILD_CONFIG) fail.
> >>
> >> These share the same issue:
> >>
> >> - linux.mk:  $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
> >> - uclibc,mk:  $(UCLIBC_DIR)/.oldconfig
> >
> > Indeed, I'll add them to the series. Thanks! :-)
> 
> I was going to say that the TARGET_DIR_WARNING_FILE copy in Makefile
> and fs/common.mk might need the same treatment as well, but I think we
> only ran into that issue once, when a coworker did something silly
> like deleting output/build to force a rebuild rather than doing a
> "make clean" or deleting all of output.  So that's probably not a real
> problem.

Well, the problem seems to exist today, since that file is copied with a
plain 'cp' and removed with 'rm -f'.

I don't know how it currently work if the skeletton is R/O. But since
this series ensures target/ is R/W, the 'rm -f' will succeed.

But for good measure, I'll fix that as well. Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
