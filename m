From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 4 Oct 2015 20:14:31 +0200
Subject: [Buildroot] [PATCH 2/3] vsftpd: Add ftp user creation
In-Reply-To: <20151004150816.GC7334@free.fr>
References: <1443965495-12774-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1443965495-12774-2-git-send-email-maxime.hadjinlian@gmail.com>
 <20151004154452.16eee409@free-electrons.com> <20151004150816.GC7334@free.fr>
Message-ID: <CAGduivzjbp3rDRFdT_K143PtjExZb=4iZmkMchH=+w41Mc_k0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all

On Sun, Oct 4, 2015 at 5:08 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Maxime, All,
>
> On 2015-10-04 15:44 +0100, Thomas Petazzoni spake thusly:
> > On Sun,  4 Oct 2015 15:31:34 +0200, Maxime Hadjinlian wrote:
> > > +#
> > > +# VSFTPD won't work if the jail directory is writable, it has to be
> readable
> > > +# only
> > > +# Otherwise you get the following error:
> > > +# 500 OOPS: vsftpd: refusing to run with writable root inside chroot()
> > > +# That's why we have to chmod /home/ftp
> > > +define VSFTPD_FIX_HOME_PERMISSIONS
> > > +   $(INSTALL) -d -m 555 $(TARGET_DIR)/home/ftp
> > > +endef
> >
> > Can we use VSFTPD_PERMISSIONS instead ? The only drawback is that you
> > will have to set a fixed UID/GID for ftp:ftp in VSFTPD_USERS.
>
> Canyoucheck if it is possible to:
>   - check if it is possible to create a premission table with no UID or
>     GID, only a mode,
>   - if so:
>     - move the mkuser script call before th makedev call in fs/common.mk
>     - use a permission table as suggested by Thomas.
>
> If it's not possible to not specify UID/GID in a permission table, then
> we'll have to do with your solution.
>
> Unfortunately, it doesn't seem to work, I get the following error:
makedevs: unknown group name: -


> Thanks.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151004/2e7a1def/attachment.html>
