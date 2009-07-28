From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2009 10:03:33 +0200
Subject: [Buildroot] xlib libXt build problem
In-Reply-To: <f8955f9e0907271636p26bea750s1f3e6be1782badac@mail.gmail.com>
References: <8109ECD0-3E25-4BAD-B4D7-DE97BEEBE007@earthlink.net>
	<f8955f9e0907271636p26bea750s1f3e6be1782badac@mail.gmail.com>
Message-ID: <20090728100333.16e1cbc4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 27 Jul 2009 16:36:27 -0700,
Dan Lykowski <lykowdk@gmail.com> a ?crit :

> Steve,
>  Try to replace the xlib_libXt-1.0.5-makestrs-nocc.patch with this
> one.
> 
> I grabbed it from upstream a while back and haven't had time to
> submit it. It fixed the problem for me, but I don't know if it 'does
> the right thing(tm)'.

This patch has been included in 1.0.6 of libXt. Therefore, I will bump
the libXt package to 1.0.6.

However, note that in the current development version of Buildroot, the
compilation of libXt and libXaw is no longer required to compile the
X.org server. These old (and ugly) toolkits are probably never used on
embedded systems, so having them as a hard dependency of the X.org
server was a bit too strong. It also ~1 Mb of space on the target
filesystem, since these libraries were quite big.

See
http://git.buildroot.net/buildroot/commit/?id=ae8bbdf891c8343313cd2d3be2df079214576a4a

If you don't want to use a development version of Buildroot, these
improvements will be part of the 2009.08, that should be released neext
month.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
