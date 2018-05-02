From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 2 May 2018 14:20:53 -0300
Subject: [Buildroot] [PATCH 1/1] libgdiplus: bump to version 5.6
In-Reply-To: <20180501214047.1d9f818c@windsurf.home>
References: <20180430190840.11455-1-fontaine.fabrice@gmail.com>
 <20180501214047.1d9f818c@windsurf.home>
Message-ID: <CANu7NGvp9ZFropp5ckpT5B59AVzv=xCM0_ctovdAQ4eU=7W_Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> On Mon, 30 Apr 2018 21:08:40 +0200, Fabrice Fontaine wrote:
>
> >  # Although there is a LICENSE file thas specifies LGPL or MPL-1.1,
> >  # looks like it is incorrect. The actual source files specify that
> > -# they're licensed under MIT, and so does the COPYING file (and they
> > -# all predate the addition of the LICENSE file).
> > +# they're licensed under MIT, and so does the original (before its
> > +# removal/update) COPYING file (and they all predate the addition of
> > +# the LICENSE file).
> >  LIBGDIPLUS_LICENSE = MIT
> > -LIBGDIPLUS_LICENSE_FILES = COPYING src/carbon-private.h
> > +LIBGDIPLUS_LICENSE_FILES = src/carbon-private.h
> >
> >  LIBGDIPLUS_INSTALL_STAGING = YES
>
> Hum, this feels weird. They have re-added a COPYING file pointing to
> the LICENSE file, which itself that says LGPL or MPL, so perhaps this
> isn't wrong after all ?
>
> carbon-private.h might be MIT licensed, but the whole work may still be
> released under LGPL or MPL.
>
> See https://github.com/mono/libgdiplus/blob/master/LICENSE
>
> So I believe our assessment that the LICENSE file was wrong when it was
> saying LGPL or MPL-1.1 is not correct, and we should change the license
> details of libgdiplus to LGPL-2.1 or MPL-1.1.
>
> Sergio, you originally contributed libgdiplus, what do you think ?

I agree.

From the git commit logs, initially there was no LICENSE file and the
license was MIT, as described in COPYING. Eight months later the LICENSE
file was added with the message "Add new license", so we might assume the
license changed to LGPL-2.1 or MPL-1.1, but they forgot to remove COPYING.
In 2015 COPYING was removed and added later just because of autotools
(based on the commit logs), but now pointing to LICENSE. So looks like
our assessment of the license was wrong, and we should change to LGPL-2.1
or MPL-1.1.

Best regards,

Sergio Prado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180502/45feab23/attachment.html>
