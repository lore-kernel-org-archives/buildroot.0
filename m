From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 18 Jun 2017 00:27:29 +0300
Subject: [Buildroot] scsi/scsi.h: No such file or directory
In-Reply-To: <CAM7NYTh3_H6aUTHF+qAyYFQhGWh=vxqGpZ8-thYMMKzXep7n_g@mail.gmail.com>
References: <CAM7NYTg0TK9phO3EEszpmyY+v9F4nn6uCocZ=OuvvSfd6xCOJQ@mail.gmail.com>
 <20170612152332.wmyjhvatvid7ghgd@sapphire.tkos.co.il>
 <5DD81335-B484-44C4-89F6-A8018E31FE3B@free.fr>
 <CAM7NYTjHa0waAPpauLhFL1j60pnmskGcZRUVR9G7iNYnWyCHQg@mail.gmail.com>
 <20170612173345.kqjxqzsoznsgjhkh@tarshish>
 <CAM7NYThRL6ouhnxzg5rEosu4q54qkefdZke+Kz9qvvGg6jYEJA@mail.gmail.com>
 <20170614211321.GA4600@scaer>
 <CAM7NYThb2KbGtTZ909yBcpLAAzA8=8wsWvUr=5W5isTaZtJkGQ@mail.gmail.com>
 <20170615030600.tmpwlvcj5almsgyx@tarshish>
 <CAM7NYTh3_H6aUTHF+qAyYFQhGWh=vxqGpZ8-thYMMKzXep7n_g@mail.gmail.com>
Message-ID: <20170617212729.4t32zrxby4qlfjdr@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tamim,

On Fri, Jun 16, 2017 at 03:24:15PM -0400, MD I. Islam wrote:
> Yeah, /usr/include/scsi/scsi.h was missing. I I updated the kernel of
> my host machine with defconfig in the main kernel source tree. After
> going back to the original ubuntu kernel, I got it working. Any idea
> what kernel config is responsible for this?

I have no idea how a custom kernel install would influence libc provided 
headers, let alone delete them.

> I prefer top-posting over interleaving. Is there a reason I would need
> to use interleaving?

Because this is the convention in this list, as well as in most related 
mailing lists. That advantage of this style is that it makes it easier for the 
reader to see the context of your response.

baruch

> On Wed, Jun 14, 2017 at 11:06 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Wed, Jun 14, 2017 at 05:35:39PM -0400, MD I. Islam wrote:
> >> Thanks for letting me know about the plain-text email!
> >
> > But you are still top posting[1]. Please use reply to emails inline[2], like
> > Yann and I did.
> >
> >> I have build-essential, libc6-dev, cpio and open-iscsi installed. Am I
> >> missing anything?
> >
> > Do you have the file /usr/include/scsi/scsi.h on your host? It should be part
> > of libc6-dev.
> >
> > baruch
> >
> > [1] https://en.wikipedia.org/wiki/Posting_style#Top-posting
> >
> > [2] https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
> >
> >> On Wed, Jun 14, 2017 at 5:13 PM, Yann E. MORIN <yann.morin.1998@free.fr>
> >>   wrote:
> >> > Tamim, All,
> >> >
> >> > Please, do not post HTML mail, and do not top-post; this is considered
> >> > bad practice. Send mails as plain tesxt, and reply below the mail you
> >> > are replying to.
> >> >
> >> > On 2017-06-14 16:42 -0400, MD I. Islam spake thusly:
> >> >> I'm using *arm_foundationv8_defconfig. *I didn't make any change in config.
> >> >> The last 100 lines of build output is as following:
> >> > [--SNIP--]
> >> >> >>> host-util-linux 2.29.2 Building
> >> >> PATH="/home/tamim/buildroot/output/host/bin:/home/tamim/buildroot/output/host/sbin:/home/tamim/buildroot/output/host/usr/bin:/home/tamim/buildroot/output/host/usr/sbin:/home/tamim/bin:/home/tamim/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> >> >>   CC       sys-utils/eject-eject.o
> >> >> sys-utils/eject.c:41:23: fatal error: scsi/scsi.h: No such file or
> >> >> directory
> >> >
> >> > So, this fails while building the host variant of util-linux. So your
> >> > build machine is missing some critical system headers.
> >> >
> >> > It looks like you are using a Ubuntu machine, and this header is
> >> > normally installed by libc6-dev, which you would have installed if you
> >> > install the meta-package build-essential.
> >> >
> >> > Please, check the requirements in the manual:
> >> >
> >> >     https://buildroot.org/downloads/manual/manual.html#requirement

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
