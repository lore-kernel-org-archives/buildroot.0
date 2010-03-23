From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 23 Mar 2010 20:49:11 +0100
Subject: [Buildroot] understanding and using buildroot
In-Reply-To: <532dd5841003231214t2f52726cge975b399849c87ca@mail.gmail.com>
References: <532dd5841003231053w2b88f147ne655bc7985e65aff@mail.gmail.com>
	<4BA90F26.4020201@gmail.com>
	<532dd5841003231214t2f52726cge975b399849c87ca@mail.gmail.com>
Message-ID: <1269373751.14674.7.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mercredi 24 mars 2010 ? 00:44 +0530, Ravi Kumar Kulkarni a ?crit :
> On Wed, Mar 24, 2010 at 12:27 AM, Paulius Zaleckas
> <paulius.zaleckas@gmail.com> wrote:
> > On 03/23/2010 07:53 PM, Ravi Kumar Kulkarni wrote:
> >>
> >> Hello everybody,
> >> finally after 2 weeks of struggling i managed to build buildroot!
> >>  i have some doubts to clarify on usage of buildroot and regarding some
> >> packages
> >> i have built buildroot jffs2 image from using daily snapshot and
> >> booted onto target.
> >> but
> >> a)when i get login prompt what password should i enter for a user and for
> >> root?
> >
> > Initially password for root is empty. Just press Enter when you get asked
> > for password.
>  i pressed enter but it is again comin back to login only.any idea wat
> might be wrong?

Same problem here ... I do not
Boot your kernel with option init=/bin/sh, then change the root
password.

> 
> >> b)and what should be enabled to so as to login as root?
> >

You can edit the /etc/inittab file to login automatically as root by
default on the console. Like this :

tty0::respawn:/bin/sh # GENERIC_SERIAL

Quite useful for people doing development on your board.

Regards,

-- 
Lionel Landwerlin
