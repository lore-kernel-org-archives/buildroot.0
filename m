From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Apr 2016 21:34:32 +0200
Subject: [Buildroot] [PATCH] weston: egl requires gles as well
In-Reply-To: <1459794841-3736-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 4 Apr 2016 15:34:01 -0300")
References: <1459794841-3736-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k2kbsvcn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 >> From configure.ac lines 83-89:
 > AC_ARG_ENABLE(egl, [  --disable-egl],,
 > 	enable_egl=yes)
 > AM_CONDITIONAL(ENABLE_EGL, test x$enable_egl = xyes)
 > if test x$enable_egl = xyes; then
 > 	AC_DEFINE([ENABLE_EGL], [1], [Build Weston with
 > 	EGL support])
 > 	PKG_CHECK_MODULES(EGL, [egl glesv2])
 > 	PKG_CHECK_MODULES([EGL_TESTS], [egl glesv2 wayland-client
 > 	wayland-egl])

 > It also requires wayland-egl which is only provided by mesa3d for now,
 > hence make it conditional on mesa3d egl+gles.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
