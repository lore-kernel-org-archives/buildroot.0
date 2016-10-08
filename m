From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 8 Oct 2016 07:46:35 +0200
Subject: [Buildroot] [PATCH 1/3] gdb: get rid of host-texinfo dependency
In-Reply-To: <20161007224020.251bd375@free-electrons.com>
References: <1475870958-14790-1-git-send-email-patrickdepinguin@gmail.com>
 <20161007224020.251bd375@free-electrons.com>
Message-ID: <CAAXf6LUeNzo-ZsSySjcrYOiQzg7pg2bcjHTq8crEOjcJqEm9qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Oct 7, 2016 10:40 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Fri,  7 Oct 2016 22:09:16 +0200, Thomas De Schampheleire wrote:
> > +# Disable building documentation
> > +GDB_MAKE_OPTS += MAKEINFO=true
> > +GDB_INSTALL_OPTS += MAKEINFO=true
>
> Setting GDB_INSTALL_OPTS doesn't do anything. There is no such variable
> offered by the package infra: for target packages, you have
> GDB_INSTALL_TARGET_OPTS and GDB_INSTALL_STAGING_OPTS.

Right, at some point I realized that but forgot to change it.

>
> So if it works without this, maybe it means that it is useless?

No, I think it will be necessary for some combinations, for target-gdb I
did not test all.
Remember, gdb and host-gdb are essentially built the same, they have the
same makefiles. So I think that the tricks used for host-gdb need to be
symmetrical with target-gdb.

I'll update the patch.

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161008/66f4bb94/attachment.html>
