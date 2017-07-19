From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 12:01:13 +0200
Subject: [Buildroot] How to build the qt plugin in gst1-plugins-bad ?
In-Reply-To: <CADujc4o_1XZLQymNx3fQk5n9FOhg=9xNKw5U2GPSsGBCxHyhSA@mail.gmail.com>
References: <CADujc4q8d1AMFmvoD_62qnOkNSntuCCGCe4+Pkatp4P382srfg@mail.gmail.com>
 <20170719113553.6669def3@windsurf>
 <CADujc4o_1XZLQymNx3fQk5n9FOhg=9xNKw5U2GPSsGBCxHyhSA@mail.gmail.com>
Message-ID: <20170719120113.62df8762@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 17:55:54 +0800, Glenn Coombs wrote:

> Thanks for the debug.  Is that section with HAVE_WINDOW_VIV_FB from the
> build/gst1-plugins-bad-1.10.4/configure.ac file?  I have this section in
> that file at line 1059:
> 
>       if test "x$NEED_EGL" != "xno"; then
>         if test "x$HAVE_WINDOW_WAYLAND" = "xyes" -o "x$HAVE_WINDOW_X11" =
> "xyes" -o "x$HAVE_WINDOW_DISPMANX" = "xyes"; then
>           GL_LIBS="$GL_LIBS -lEGL $EGL_LIBS"
>           GL_CFLAGS="$GL_CFLAGS $EGL_CFLAGS"
>           USE_EGL=yes
>         fi
>       fi
> 
> As you can see I am missing the HAVE_WINDOW_VIV_FB bit.  Looking at the
> output of dmesg on my target system I can see this version: Buildroot
> 2017.05-00055-g338f004.  Presumably I need an even newer version of
> buildroot than I already have ?

gst1-plugins-bad has been upgraded in commit
38e95aa170360850d68459516965b98cc15f3f49, which is *after* the commit
you're currently based on. Your commit is 55 commits after 2017.05,
while the gst1-plugins-bad has been done 807 commits after 2017.05.

So yes: update your Buildroot to the latest master! :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
