From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:44:19 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-typepy: bump to version
 0.6.0
In-Reply-To: <20191014222641.6e77d6ab@windsurf.home>
References: <20191014191228.13432-1-asafka7@gmail.com>
 <20191014191228.13432-10-asafka7@gmail.com>
 <20191014222641.6e77d6ab@windsurf.home>
Message-ID: <CALFsTFVKnO_72qT5t2QrvKLhuw+mw_M9jtQBGqd6wOxqx1fw4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 14, 2019 at 11:26 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 14 Oct 2019 22:12:25 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > * Update dependency list.
> > * Add hash for license file.
> > * Add patch to avoid creation of wheel file (which breaks the build).
> >   The patch is taken from an upstream commit which doesn't apply since
> >   Makefile isn't provided in the tarball.
>
> Please use the upstream patch anyway, simply remove the hunk that
> modifies the Makefile. It's better to keep upstream's authorship, and
> the reference to the upstream commit.
>

When I tried to take the original commit and remove the redundant hunk,
I noticed it won't apply since setup.cfg from the tarball contains
additional egg-info related
entries (which doesn't appear on the repository).

So it seems like we can't take the upstream commit...
Do you think this patch with an improved commit message will do?

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Asaf.
