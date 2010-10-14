From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Oct 2010 22:17:05 +0200
Subject: [Buildroot] mkfs.jffs2 image is not usable
In-Reply-To: <0D753D10438DA54287A00B02708426976450B0AF44@AUSP01VMBX24.collaborationhost.net>
	(H. Hartley Sweeten's message of "Wed, 13 Oct 2010 14:07:15 -0500")
References: <0D753D10438DA54287A00B02708426976450A64C87@AUSP01VMBX24.collaborationhost.net>
	<4CB5A0BB.2040106@zacarias.com.ar>
	<0D753D10438DA54287A00B02708426976450B0AF44@AUSP01VMBX24.collaborationhost.net>
Message-ID: <8739s8fs1q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

Hi,

 H> The flash geometry settings should be the same as when I made the
 H> jffs2 image that does work.  But, for the record, the flash is a
 H> parallel 4kB pagesize and 128 kB erase size.

 H> sudo modprobe mtd
 H> sudo modprobe jffs2
 H> sudo modprobe mtdram totalsize=32768 erase_size=256

You should use the same erase_size here, E.G. 128KB.

 H> Suggestions?

Not really, do you have an old (working) image? If so, you could compare
the jffs2dump output of those.

-- 
Bye, Peter Korsgaard
