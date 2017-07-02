From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:14:49 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: fix plugins videonode egl
 x11 header related compile failure
In-Reply-To: <20170702210127.7090df5b@gmx.net>
References: <20170626211311.10890-1-ps.report@gmx.net>
 <20170702003332.771dd45c@windsurf>
 <20170702210127.7090df5b@gmx.net>
Message-ID: <20170702231449.4a4d1832@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Jul 2017 21:01:27 +0200, Peter Seiderer wrote:

> Same fixing pattern as for qt5base (and for qtbase accepted upstream, see e.g. [1]),

Well, [1] is about adding QT_EGL_NO_X11, which is a QT definition. It
is very different from MESA_EGL_NO_X11_HEADERS, which is an
OpenGL-level definition.

> but in general your are right, honor the given provider provided flags would be
> the better solution...maybe something as suggested on the yocto meta-freescale
> mailing list will work, see [2], [3]: 'egl.prf: Fix build error when egl headers
> need platform definition'?

I'm not sure I fully understand those patches, but apparently they use
more pkg-config flags from OpenGL, which is exactly the approach I
suggest to investigate indeed.

BTW, the same thing should be done for Qt instead of
package/qt/0012-OpenGL-EGL-Avoid-X11-header-collision.patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
