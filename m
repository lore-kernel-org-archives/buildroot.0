From: Bryce Schober <bryce.schober@gmail.com>
Date: Tue, 7 Jan 2014 10:40:50 -0800
Subject: [Buildroot] mesa3d autoreconfigure problem
In-Reply-To: <CAJpxd07aYbSX=Lxc48y+3=GvTp5rujcZNPfp+gOaX_6bf5Z-jA@mail.gmail.com>
References: <CAJpxd07aYbSX=Lxc48y+3=GvTp5rujcZNPfp+gOaX_6bf5Z-jA@mail.gmail.com>
Message-ID: <CAJpxd07F14_pk7k+AEqaoUAjv_QgB1uaxnoHHtO5twd3nSKsRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This problem is much, much more generic than I first thought:

The autoreconfigure step of mesa3d will *always* fail if buildroot's make
is ever called with from another directory, using the -C option. It looks
like the mesa3d package's configure.ac is just not meant to handle this
situation, at least not in the context of buildroot's infrastructure.

Their configure.ac uses this faulty dynamic method through
8.0<http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=8.0>.
In 9.x <http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=9.2>,
they switched to a static version number. Then in
10.0<http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac>,
they switched to a different method, including it from elsewhere.

What's the best way forward here? I know next to nothing about autoconf...

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140107/e641f69f/attachment-0001.html>
