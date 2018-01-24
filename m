From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Jan 2018 08:59:54 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-21
In-Reply-To: <20180123152143.GD14919@momiji> (Adrian Perez de Castro's message
 of "Tue, 23 Jan 2018 15:21:43 +0000")
References: <20180122070014.D5074206F0@mail.free-electrons.com>
 <20180123152143.GD14919@momiji>
Message-ID: <87fu6vn0ud.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Hi,
 > On Mon, 22 Jan 2018 08:00:14 +0100 (CET), Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

 >> x86_64 | webkitgtk-2.18.5 | NOK |
 >> http://autobuild.buildroot.net/results/57b77520d3a3fcfa683406e223771d0ccf8733df
 >> |

 > The configuration used for this build has an EGL provider but both OpenGL and
 > OpenGL ES are disabled:

 >  - BR2_PACKAGE_HAS_LIBEGL is chosen.
 >  - Both BR2_PACKAGE_HAS_LIBGL and BR2_PACKAGE_HAS_LIBGLES are undefined.

 > It seems to me that the CMake build files for WebKit should disable all the
 > OpenGL support if EGL is found but a GL/GLES implementation is not found.
 > I have filed a bug upstream to look into that:

 >   https://bugs.webkit.org/show_bug.cgi?id=181986

Sounds sensible, yes.

 > In the meantime, I'll make a patch for checking in the Buildroot package
 > whether an OpenGL(ES) implementation is being built, and if not pass the
 > needed build flags to CMake in order to disable using OpenGL(ES) even if
 > EGL is present.

Thanks!

-- 
Bye, Peter Korsgaard
