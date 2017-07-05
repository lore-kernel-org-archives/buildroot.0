From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 5 Jul 2017 21:53:19 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: fix plugins videonode egl
 x11 header related compile failure
In-Reply-To: <20170702231449.4a4d1832@windsurf>
References: <20170626211311.10890-1-ps.report@gmx.net>
 <20170702003332.771dd45c@windsurf>
 <20170702210127.7090df5b@gmx.net>
 <20170702231449.4a4d1832@windsurf>
Message-ID: <20170705215319.42939a87@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 2 Jul 2017 23:14:49 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Sun, 2 Jul 2017 21:01:27 +0200, Peter Seiderer wrote:
> 
> > Same fixing pattern as for qt5base (and for qtbase accepted upstream, see e.g. [1]),
> 
> Well, [1] is about adding QT_EGL_NO_X11, which is a QT definition. It
> is very different from MESA_EGL_NO_X11_HEADERS, which is an
> OpenGL-level definition.
> 
> > but in general your are right, honor the given provider provided flags would be
> > the better solution...maybe something as suggested on the yocto meta-freescale
> > mailing list will work, see [2], [3]: 'egl.prf: Fix build error when egl headers
> > need platform definition'?

And two links to the upstream suggestion/discussion:

- QTBUG-61712: qtbase: A build error was occurring due to missing EGL configuration
  https://bugreports.qt.io/browse/QTBUG-61712

- Patch: qtbase: Fix build error when using EGL
  https://codereview.qt-project.org/#/c/198906/

Regards,
Peter

> 
> I'm not sure I fully understand those patches, but apparently they use
> more pkg-config flags from OpenGL, which is exactly the approach I
> suggest to investigate indeed.
> 
> BTW, the same thing should be done for Qt instead of
> package/qt/0012-OpenGL-EGL-Avoid-X11-header-collision.patch.
> 
> Best regards,
> 
> Thomas
