From: Rory Vieira <rory.vieira@gmail.com>
Date: Fri, 1 Sep 2006 16:24:06 +0200
Subject: [Buildroot] Customize buildroot targets and other stuff
Message-ID: <5e15b0e10609010724t112a2812u211b8547aef4a04@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

After using buildroot for the last few weeks, I'm getting to the
customization bit :)

The first thing I want to handle is an additional target for cpio.
I've tried to 'copy' the tar target as a basis, but I'm stumped on the
actual workings.
Especially the part that calls tar is what I do not understand. Hard
to read if you don't know what's being said :)

The other stuff I wanted is now mostly in my own skeleton file and directory.
The skeleton file contains the basic dir structure, and the skeleton
directory contains eveything else I wanted in there (eg midnight
commander).
And it's with MC I actually run into some minor troubles:
The libglib doesn't install the headers in the target (so MC's
configure was claiming it couldn't find anything working).
I solved the problem (for now) by copyingthe already built libglib
structure in the uclibc env I built, and rebuilt the whole thing
there. I then copied most of the required files to their proper
locations and made pkgconfig tell the proper .
I'm actually looking for some manual to customizing the modules and
buildroot itself.

And yes, I have already customized some of the buildroot (ssh
installing files I don't need, same for named, sysvinit not installing
all the files I need etc).

I hope I'm making some sense to get my question out :)

Cheers and thanks for any reply,
-- 
Rory Vieira
rory dot vieira at gmail dot com
