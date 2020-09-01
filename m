From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2020 21:05:18 +0200
Subject: [Buildroot] [PATCH] package/gobject-introspection: disable for
 riscv32
In-Reply-To: <20200901141249.23158-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 1 Sep 2020 16:12:49 +0200")
References: <20200901141249.23158-1-peter@korsgaard.com>
Message-ID: <87o8mp8gi9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/e32/e323f43952b3863cedfdae765b3fb10ec6b8d889/
 > http://autobuild.buildroot.net/results/53e/53e7b82baa9edb342cd110717d6b8ac82d5d933c/

 > And many more.

 > qemu-user 5.0.0 for riscv32 segfaults when running the g-i qemu wrapper, so
 > disable gobject-introspection.  There are no autobuilder failures for next,
 > so it looks to be fixed in qemu 5.1.0.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Ups, I forgot to take care of the reverse dependencies (python-gobject /
gst1-python) - I'll send a v2.

-- 
Bye, Peter Korsgaard
