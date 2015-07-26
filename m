From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 26 Jul 2015 20:53:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/scons: fix missing dependency
In-Reply-To: <20150726213943.3d3ebbe9@free-electrons.com>
References: <1437932577-874-1-git-send-email-brendanheading@gmail.com>
 <20150726213943.3d3ebbe9@free-electrons.com>
Message-ID: <CA+BsyQ7ixc8YzGzEpNF5OvEMjrTRtS7fLNyNZZYxBU3qqFM03Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 July 2015 at 20:39, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

>
> > +HOST_SCONS_DEPENDENCIES = host-python
> >  HOST_SCONS_NEEDS_HOST_PYTHON = python2
> >
> >  HOST_SCONS_INSTALL_OPTS = \
>
> This does not make sense: scons uses host-python-package, and the
> python package infrastructure automatically adds host-python as a
> dependency for host python packages.


My apologies Thomas.

While I was fixing the exfat problem I ran into an issue where scons would
not run because python wasn't present. I just tried to reproduce it again
from scratch and it's no longer happening. I see from your explanation that
it should work fine.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150726/4323dc14/attachment.html>
