From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 17 Feb 2016 18:23:11 +0100
Subject: [Buildroot] Issue with toolchain wrapper changes
In-Reply-To: <20160217125658.7776ac38@free-electrons.com>
References: <20160213163116.745e4507@free-electrons.com>
 <87lh6j1ttt.fsf@dell.be.48ers.dk>
 <20160217125658.7776ac38@free-electrons.com>
Message-ID: <CAAXf6LXc4FvFMcZOKBa-X0Krr+TvEL=pkfzKO1VHuaUthoLqEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Feb 17, 2016 13:00, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Wed, 17 Feb 2016 12:04:30 +0100, Peter Korsgaard wrote:
> > >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
writes:
> >
> >  > Hello Arnout,
> >  > I am facing some issues with the toolchain wrapper, which I believe
> >  > were introduced by the changes done to use the toolchain wrapper also
> >  > for the internal toolchain backend.
> >
> >  > As you know, Buildroot installs all its host stuff in
$(HOST_DIR)/usr,
> >  > and not directly under $(HOST_DIR). For the autobuilders, I build a
> >  > number of toolchains with Buildroot, which are then used as pre-built
> >  > external toolchains by the autobuilders. In order for those
toolchains
> >  > to look like conventional toolchains, at the end of their build, I
do:
> >
> >  >    mv /path/to/host/usr/* /path/to/host/
> >  >    rmdir /path/to/host/usr/
> >
> >  > Which moves everything outside of the usr/ subdirectory, and removes
> >  > the usr/ subdirectory itself. This used to work perfectly fine, but
> >  > now, it fails to find the .br_real equivalent of the command being
> >  > executed. Example:
> >
> > Is the extra /usr really such a problem? I've built a bunch of
> > toolchains, and just refer to them as /opt/br/<whatever>/usr.
>
> Yes, for my purpose it's annoying. I want to produce pre-built
> toolchains that everyone can use, in Buildroot or something else, so I
> want them to look like normal toolchains. And normal toolchains don't
> have this useless usr/ top-level directory.

I may be misunderstanding something, but what is the problem with creating
the archive from the usr directory? This is what I did at the time I was
using a buildroot toolchain.

/Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160217/734dfd5e/attachment.html>
