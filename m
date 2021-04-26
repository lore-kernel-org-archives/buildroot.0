From: Sam Voss <sam.voss@collins.com>
Date: Mon, 26 Apr 2021 10:12:49 -0500
Subject: [Buildroot] [PATCH v3 1/1] linux: allow firmware to be included
 in kernel
In-Reply-To: <20210425203800.GG298901@scaer>
References: <20210423185842.50143-1-sam.voss@rockwellcollins.com>
 <20210424080959.GP298901@scaer> <20210425203800.GG298901@scaer>
Message-ID: <CAH=K+6nWr7mfqe_fJiE3kaN90LNnv5CjGX9jE39Fard6dbfT+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Apr 25, 2021 at 3:38 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Sam, All,
>
> On 2021-04-24 10:09 +0200, Yann E. MORIN spake thusly:
> > On 2021-04-23 13:58 -0500, Sam Voss spake thusly:
> > > Add functionality to use the kernel's built-in options to allow binary
> > > blobs to be included with the kernel. This is equivalent to the blobs
> > > existing in /lib/firmware, however are available earlier in the boot
> > > process. This may be useful in situations where a device probes before
> > > the rootfs is fully available (such as a squashfs not being loaded
> > > before a usb device probing).
> [--SNIP--]
> > These two are just copies of the kernel config options. We can't
> > reasonably have a Buildroot option for each of the kernel option.
>
> After reviewing this with other maintainers, and seeing that this is
> already pretty trivial to carry those options directly in the kernel's
> configuration, we've concluded that we do not need to have those two
> options in the Buildroot configuration.

Honestly, BR_BINARIES_DIR is exactly what was missing that drove me to
add this in the first place, because it didn't make sense having to
have a buildroot-specific relative path in the kernel configuration
for these items. Now that I know this exists, I'm fine with using that
instead.

-- 

Sam Voss | Sr. Software Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
Tel: +1 319 263 4039
sam.voss at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
