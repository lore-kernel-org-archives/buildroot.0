From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 12 Mar 2019 12:42:23 +0100
Subject: [Buildroot] host-gcc-final not reinstalling target libraries (or:
 howto clean target directory)
Message-ID: <CADYdroNev_V7QTEYx53Aq_4tmS4PQXQj5EG0QHJE=6CarEROrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I had some aged buildroot installation with several library versions
in the resulting target images. So now I cam up with the idea just to
recreate the target system with those 2 commands:

rm build/*/.stamp_target*installed target
make

Well, it *almost* worked, the only package that does not reinstall the
target files that way is host-gcc-final, the filesystem is then
lacking critical DSOs like libatomic, libstdc++.

So is there any way to fix this, or any recommendation on how a
"target-clean" would look like (ideally get make to provide a
target-clean).

Norbert
