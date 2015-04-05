From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2015 19:40:47 +0200
Subject: [Buildroot] [PATCH 5/6] package/gnu-efi: fix legal-info
In-Reply-To: <20150405193604.57628c92@free-electrons.com>
References: <cover.1428252467.git.yann.morin.1998@free.fr>
 <41ea946a815b2214044827c73815d8a171a3a939.1428252467.git.yann.morin.1998@free.fr>
 <20150405191745.3497f9a7@free-electrons.com>
 <20150405173134.GE4134@free.fr>
 <20150405193604.57628c92@free-electrons.com>
Message-ID: <20150405174047.GF4134@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-05 19:36 +0200, Thomas Petazzoni spake thusly:
> On Sun, 5 Apr 2015 19:31:34 +0200, Yann E. MORIN wrote:
> > The reasoning for changing that is:
> >   - there are two files with a GPLv2+ header;
> >     - gnuefi/crt0-efi-aarch64.S -> GPLv2+ or something like a BSD-2c
> >     - gnuefi/crt0-efi-arm.S     -> GPLv2+
> >   - all other files are BSD-3c (or have no licensing info)
> >   - we don't build gnuefi for ARM or AArch64, only for x86 or x86_64
> > 
> > However, re-reading README.gnuefi, we can read this:
> > 
> > ---8<---
> >  gnuefi: This directory contains the glue necessary to convert ELF64
> >         binaries to EFI binaries.  Various runtime code bits, such as
> >         a self-relocator are included as well.  This code has been
> >         contributed by the Hewlett-Packard Company and is distributed
> >         under the GNU GPL.
> > ---8<---
> > 
> > This is very confusing.Waht about changing to:
> > 
> > GNU_EFI_LICENSE = BSD-3c and/or GPLv2+ (gnuefi), BSD-3c (efilib)
> 
> I would find this to be a safer value.

OK, I'll respin.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
