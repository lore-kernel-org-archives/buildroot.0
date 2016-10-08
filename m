From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 8 Oct 2016 08:19:59 +0200
Subject: [Buildroot] [PATCH 2/3] binutils: get rid of host-texinfo
 dependency and other documentation tricks
In-Reply-To: <20161007224115.1ef0f76a@free-electrons.com>
References: <1475870958-14790-1-git-send-email-patrickdepinguin@gmail.com>
 <1475870958-14790-2-git-send-email-patrickdepinguin@gmail.com>
 <20161007224115.1ef0f76a@free-electrons.com>
Message-ID: <CAAXf6LX1i8UWVO5BR+7DYUwbxHKqa4=Sb5_fsS8eh9xVbUK8cA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Oct 7, 2016 10:41 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Fri,  7 Oct 2016 22:09:17 +0200, Thomas De Schampheleire wrote:
> > -BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
> > -HOST_BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
> > +BINUTILS_CONF_ENV += MAKEINFO=true
> > +BINUTILS_MAKE_OPTS += MAKEINFO=true
> > +BINUTILS_INSTALL_OPTS += MAKEINFO=true
>
> Same comment as for gdb: BINUTILS_INSTALL_OPTS does not exist, and this
> assignment has no effect.
>
> <foo>_INSTALL_OPTS only exists for host packages. For target packages,
> you have <foo>_INSTALL_TARGET_OPTS and <foo>_INSTALL_STAGING_OPTS.

Yes, I also will update this patch.

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161008/cc5a4a29/attachment.html>
