From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Nov 2013 13:56:55 +0100
Subject: [Buildroot] [pkg-luarocks infra V3 01/10] luainterpreter:
 create virtual package
In-Reply-To: <CAAXf6LXiHD+LHvA4n5vnEsUUgwsfvODC5ERcohz_HWtQU_5JoA@mail.gmail.com>
References: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LXVQ8uFccP2+-TwQOC0iAH=ochrtzUQH-sFN7sZetrpUQ@mail.gmail.com>
 <20131115094423.024e1af8@skate>
 <CAAXf6LUixt-3engtthxiHc3iqZo=nd07NPBhZrG5yoNYvrGH_w@mail.gmail.com>
 <20131115101817.2c63a9ef@skate>
 <CAAXf6LXiHD+LHvA4n5vnEsUUgwsfvODC5ERcohz_HWtQU_5JoA@mail.gmail.com>
Message-ID: <20131115135655.044495e5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 15 Nov 2013 10:49:15 +0100, Thomas De Schampheleire wrote:

> > I don't think so, because those options are hidden options, they are
> > merely here to create a "disconnection" between providers of a feature
> > (i.e an OpenGL implementation) and consumers of a feature (i.e
> > applications or libraries using the OpenGL API). So I believe we can
> > rename them as much as we want.
> 
> Ah, great!
> 
> But you haven't yet said whether you agree with my reasoning that the
> PACKAGE in these names is not nice... What do you think about that?

I don't really have a strong feeling on this. I believe we started
using BR2_PACKAGE_HAS_<foo>, just because we are inside package/ so it
kind of makes sense to also use the BR2_PACKAGE_<something> namespace.

That being said, it is true that the wording BR2_PACKAGE_HAS_<foo>
seems to indicate that it is a specific package that has something, not
that the system has a whole has some given feature.

As I said, I don't feel really strongly about this. I don't think the
current BR2_PACKAGE_HAS_<something> is too bad either.

> >> > for virtual packages. This way instead of showing "unknown" in the ">>>
> >> > blabla unknown extracting" messages, we would have ">>> blabla virtual
> >> > extracting".
> >>
> >> Sounds good to me. This could also be used for the external toolchain then...
> >
> > Of course, all virtual packages would have to be changed.
> 
> Great again, we have a plan!

 :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
