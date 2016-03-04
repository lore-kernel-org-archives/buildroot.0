From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Mar 2016 12:13:47 +0100
Subject: [Buildroot] Build failure with Vivante and QT5 w/ eglfs
In-Reply-To: <CAAMH-ytTYQ1Ruiroc+ocjd3Afn=yG1OJ74PG+=2eN60b-wZ0Dw@mail.gmail.com>
References: <20160304095534.GA16799@kwain>
 <CAAMH-ytTYQ1Ruiroc+ocjd3Afn=yG1OJ74PG+=2eN60b-wZ0Dw@mail.gmail.com>
Message-ID: <20160304121347.5f73916e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

On Fri, 4 Mar 2016 12:02:31 +0100, Gary Bisson wrote:

> > I understand this configuration can't work, but as this leads to a
> > build issue we might need to think about a solution. We could disallow
> > such a configuration tuple, or fix the build.
> >
> > Any idea?
> 
> I'm afraid forcing the imx-gpu-viv package output format depending on
> qt5 graphical back end would bring many "recursive dependency" issues.

I don't see why it would create recursive dependency issues.

However, it would violate the principle of virtual packages, since Qt5
is not supposed to have some dependencies that are specific to certain
OpenGL implementations. It should normally just use dependencies on the
OpenGL ES / EGL packages, and nothing else.

However, we could probably add some exceptions to this rule. Or rework
the virtual package logic so that consumers of OpenGL can now whether
the FB or X11 support is available.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
