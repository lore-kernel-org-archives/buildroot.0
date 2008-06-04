From: Christopher Taylor <chtaylo3@gmail.com>
Date: Wed, 4 Jun 2008 19:57:53 -0400
Subject: [Buildroot] VFP vs FPA troubles
Message-ID: <2590773a0806041657s5c4eb25axe70c123e106cb38@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I've done a bit more digging around and it looks like the problem
I'm having is that I'm compiling buildroot for little-endian with
softfloats. This defaults to FPA which puts doubles in native endian
byte ordering but big-endian word ordering.  Somehow the previous
developer got this to build using VFP (as evidenced by the ordering of
doubles as they were fwritten to a file).

My questions:

1) Should there be a preference VFP vs FPA?
2) Which is more common?
3) Even though he was using gcc 3.4.6 and I'm now using gcc 4.2.1, I
don't see anything in the old buildroot .config file that specifies
"--with-float=softfp --with-fpu=vfp"  So why on earth is this
happening?

Any help would be GREATLY appreciated!

-Chris
