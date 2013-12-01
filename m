From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Dec 2013 21:14:57 +0100
Subject: [Buildroot] [PATCH] crda: fix static build failure
In-Reply-To: <1385925218-640-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 1 Dec 2013 20:13:38 +0100")
References: <1385925218-640-1-git-send-email-s.martin49@gmail.com>
Message-ID: <878uw4uy4e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > libnl-3 uses threads and this isn't accounted for in crda or
 > libnl-3*.pc files since crda doesn't use pkg-config.

 > Since linking order matters for static scenarios also throw in -lnl-3
 > into NLLIBS first since it gets appended to in crda makefiles to add
 > libnl-3.

 > libgcrypt depends on libgpg-error and this isn't accounted for in
 > crda makefile, but it is in libgcrypt-config script (in the correct
 > order for static linking), so set LDLIBS calling this script.

 > Fixes:
 >   http://autobuild.humanoidz.org/results/31c/31c54e16b60f41e2aa9ea6cd43ced694d3ce3ce0/
 >   http://autobuild.humanoidz.org/results/a45/a4548583aa63fbf6db9dbdf7e1556b0d23800de5/

Committed, thanks. It looks like you got inspired by Gustavo for the
commit message ;)


-- 
Bye, Peter Korsgaard
