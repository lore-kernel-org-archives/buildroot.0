From: Carlos Soto <csotoalonso@gmail.com>
Date: Sun, 11 Oct 2015 20:08:27 +0200
Subject: [Buildroot] Change build directory por a package
Message-ID: <CAD7j7Q9cSriOdjNQXxamwCh8W_TCJsQ0iuYDmsEr+FJ_Az_nkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm working on a SDL2 package for buildroot, and I'm having some problems.
Apparently, libtool has trouble finding some object files while linking. It
looks for object files inside the sdl2-2.0.3/build/ dir, but they are
located in sdl2-2.0.3/build/.libs/
As soon as I manually move all object files to sdl2-2.0.3/build/ everything
goes well, but it is something in the middle of the process so I don't
think I can put a hook to make the mv.

I've tried this guide[1] and it works fine, and the only difference seems
to be that the build directory is outside of the src directory, so my
question is: how can I change the build directory in the mk file for a
given package (in this case, SDL2)?

Thanks,
Carlos

[1]https://how-to-build-for-arm.wikispaces.com/sdl2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151011/193afc8e/attachment.html>
