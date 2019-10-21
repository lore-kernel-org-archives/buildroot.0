From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 21 Oct 2019 14:57:32 -0300
Subject: [Buildroot] [PATCH] package/qemu: move patch 3 to the 3.1.1.1
 subdir
In-Reply-To: <20191021190903.10e62578@windsurf>
References: <20191021124139.28615-1-unixmania@gmail.com>
 <20191021190903.10e62578@windsurf>
Message-ID: <CAJ4jsafJhr4D5BXOgeOeC9xuKR6ktk4sZNmdj4DvkYKTgCfvRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 21, 2019 at 2:09 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Carlos,
>
> On Mon, 21 Oct 2019 09:41:39 -0300
> unixmania at gmail.com wrote:
>
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Required since the bump from 3.1.1.
> >
> > Signed-off-by: Carlos Santos <unixmania@gmail.com>
> > ---
> > Do we really need the subdir? I know that qemu keeps four releases but
> > as far as I know Buildroot always included only one. Are there plans to
> > add a configuration to choose the qemu version?
>
> There is already such a version selection:
>
> ifeq ($(BR2_csky),y)
> QEMU_VERSION = b517e1dc3125a57555d67a8deed9eac7b42288e2
> QEMU_SITE = $(call github,c-sky,qemu,$(QEMU_VERSION))
> else
> QEMU_VERSION = 3.1.1.1
> QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
> QEMU_SITE = http://download.qemu.org
> endif
>
> So we want the patches to only apply when the upstream 3.1.1.1 version
> is used, and not when the C-SKY specific version is used.

Hum, looking at their code I guess the C-SKY specific version also
needs patch #3 to work with uClibc-ng.

-- 
Carlos Santos <unixmania@gmail.com>
