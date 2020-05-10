From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 22:46:48 +0200
Subject: [Buildroot] [PATCH v1] package/squashfs: fix host compile
 multiple definitions
In-Reply-To: <20200509214252.23180-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 9 May 2020 23:42:52 +0200")
References: <20200509214252.23180-1-ps.report@gmx.net>
Message-ID: <87sgg7plfr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add upstream patch to fix squashfs-tools build failures because
 > of missing external declaration for fwriter_buffer and
 > bwriter_buffer.

 > Fixes:

 >   - http://autobuild.buildroot.net/results/6789b668898245926e0a3a3e7caf823dff515d71

 >   /usr/bin/ld: read_fs.o:(.bss+0x0): multiple definition of `fwriter_buffer'; mksquashfs.o:(.bss+0x400c90): first defined here
 >   /usr/bin/ld: read_fs.o:(.bss+0x8): multiple definition of `bwriter_buffer'; mksquashfs.o:(.bss+0x400c98): first defined here

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
