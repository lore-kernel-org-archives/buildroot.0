From: Bryce Schober <bryce.schober@gmail.com>
Date: Mon, 6 Jan 2014 10:39:34 -0800
Subject: [Buildroot] Why is sysroot under i686-buildroot-linux-gnu?
In-Reply-To: <20140104222832.7a8dab5b@skate>
References: <CAJpxd07vs10v6uhOe3=_a=Rj-40x+Q8yWh0cK+YbTnP1HdzLTw@mail.gmail.com>
 <20140104222832.7a8dab5b@skate>
Message-ID: <CAJpxd06=L5uMVHm2ZH2u5iRvB1CbRYQiJcaNfEheeNk-pqWc+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 4, 2014 at 1:28 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> > Why does buildroot end up installing the toolchain sysroot under
> > output/host/usr/i686-buildroot-linux-gnu instead of under
> > output/host/usr/i686-unknown-linux-gnu?
>
> Just because we set the vendor part of the tuple to "Buildroot" to
> distinguish the Buildroot compiler/sysroot from the one of the original
> toolchain. There is no strong need for this, it's just a bit nicer.
>

Where is this done? In some brief probing of the toolchain makefiles, I
didn't see it. Also it would be nice if it was an optional behavior, maybe
I'll submit a patch when I find it...


> > This is causing some problems in some of my external makefiles I have
> > that expect the sysroot dir to match the toolchain tuple...
>
> They do: in host/usr/bin/, you have a compiler whose tuple matches the
> sysroot directory name.
>

Yeah, my complaint is that the tuple in the path for the sysroot is
different than that of the compiler, which makes any external reference to
the buildroot toolchain more complicated. I have external makefiles that
use the buildroot toolchain, and now I'll have to keep a $TOOLCHAIN_NAME
separate from a $SYSROOT_NAME.

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140106/3e3b9ce0/attachment.html>
