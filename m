From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Dec 2012 09:11:24 +0100
Subject: [Buildroot] [PATCH 02/51] package/qemu: fix host-qemu variable
	names
In-Reply-To: <50C5833C.5070602@mind.be>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-3-git-send-email-yann.morin.1998@free.fr>
 <50C5833C.5070602@mind.be>
Message-ID: <201212100911.24651.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Monday 10 December 2012 07:37:48 Arnout Vandecappelle wrote:
> On 09/12/12 17:34, Yann E. MORIN wrote:
> > With the upcoming introduction of qemu-on-target, we need to properly
> > separate the variables used for the host qemu, from the variables
> > used for the target qemu.
> >
> > Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> > Cc: Francois Perrad<fperrad@gmail.com>
> > ---
> >   package/qemu/qemu.mk |   25 ++++++++++++++-----------
> >   1 files changed, 14 insertions(+), 11 deletions(-)
> >
> > diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> > index 790d34f..81cd79f 100644
> > --- a/package/qemu/qemu.mk
> > +++ b/package/qemu/qemu.mk
> > @@ -13,7 +13,10 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
> >   #       the non-(L)GPL license texts are specified in the affected
> >   #       individual source files.
> >
> > -QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
> > +#-------------------------------------------------------------
> > +# Host-qemu
> > +
> > +HOST_QEMU_DEPENDENCIES = host-pkgconf zlib libglib2
> 
>   I guess this should be host-zlib and host-libglib2?

I think so, too, but I just renamed the variable, I did not change the
content.

I postponed testing this host-qemu for now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
