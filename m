From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  1 Apr 2014 18:16:10 +0200
Subject: [Buildroot] qt5, eglfs and xcb
In-Reply-To: <533A8F6C.1010606@gmail.com>
References: <533A8F6C.1010606@gmail.com>
Message-ID: <1396368972-8690-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marco,

On Tuesday 01 April 2014 12:05:32 Marco Trapanese wrote:
> Il 30/03/2014 17:21, Thomas Petazzoni ha scritto:
> > As explained above, this requires more than just XCB, contrary to what
> > the company you requested support from is claiming. You need an OpenGL
> > implementation that works under X.org, and this implementation is
> > usually Mesa. And the support for making Mesa recognized as a proper
> > OpenGL implementation has only been merged since yesterday, and is not
> > yet completely ready. It would certainly be interesting to fix this in
> > Buildroot and allow Qt5 to build for X.org with OpenGL support.
> 
> Ok, as far as I understand it means nobody has successfully compiled Qt5
> + webkit + xcb + mesa yet.
> Perhaps, people use only the framebuffer with buildroot.
You may want to test following patches:

  [PATCH 1/2] qt5declarative: Reduce dependencies to GLes2 only
  [PATCH 2/2] Add supporit for Vivante xdriver

They are not yet ready for mainlining, but they should work with imx6 
and Qt5 (I have quickly tested them with applications without OpenGL).
