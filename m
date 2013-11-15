From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Nov 2013 10:18:17 +0100
Subject: [Buildroot] [pkg-luarocks infra V3 01/10] luainterpreter:
 create virtual package
In-Reply-To: <CAAXf6LUixt-3engtthxiHc3iqZo=nd07NPBhZrG5yoNYvrGH_w@mail.gmail.com>
References: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LXVQ8uFccP2+-TwQOC0iAH=ochrtzUQH-sFN7sZetrpUQ@mail.gmail.com>
 <20131115094423.024e1af8@skate>
 <CAAXf6LUixt-3engtthxiHc3iqZo=nd07NPBhZrG5yoNYvrGH_w@mail.gmail.com>
Message-ID: <20131115101817.2c63a9ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 15 Nov 2013 10:11:12 +0100, Thomas De Schampheleire wrote:

> > On the other hand, we have:
> >
> >  BR2_PACKAGE_HAS_OPENGL_EGL
> >  BR2_PACKAGE_HAS_OPENGL_ES
> >  BR2_PACKAGE_HAS_OPENVG
> >  BR2_PACKAGE_HAS_OPENMAX
> >  BR2_PACKAGE_HAS_POWERVR
> 
> Hm, I wasn't aware of that.
> These also sound awkward to me, BR2_HAS_OPENGL_EGL etc. seems more logical...
> Changing this would of course mean new legacy options...

I don't think so, because those options are hidden options, they are
merely here to create a "disconnection" between providers of a feature
(i.e an OpenGL implementation) and consumers of a feature (i.e
applications or libraries using the OpenGL API). So I believe we can
rename them as much as we want.


> > for virtual packages. This way instead of showing "unknown" in the ">>>
> > blabla unknown extracting" messages, we would have ">>> blabla virtual
> > extracting".
> 
> Sounds good to me. This could also be used for the external toolchain then...

Of course, all virtual packages would have to be changed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
