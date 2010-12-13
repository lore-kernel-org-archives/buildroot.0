From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 13 Dec 2010 17:08:30 -0500
Subject: [Buildroot] [PATCH] toolchain-external: improve sysroot lookup
	with multilib
In-Reply-To: <20101213222903.2232b63f@surf>
References: <1292171125-32589-1-git-send-email-vapier@gentoo.org>
	<20101213222903.2232b63f@surf>
Message-ID: <201012131708.30797.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 13, 2010 16:29:03 Thomas Petazzoni wrote:
> On Sun, 12 Dec 2010 11:25:25 -0500 Mike Frysinger wrote:
> > If the external toolchain we're using starts in a path other than
> > /usr/lib, the sysroot detection fails as it has /usr/lib hardcoded. 
> > Improve the code to strip out any lib suffixes to handle the most common
> > behavior.
> 
> Could you point me to a specific toolchain for which the problem is
> occuring ? Just to make it clear: I do believe that the problem exists
> and that the patch is useful in that case, I just want to be sure to
> understand it completely, and potentially add a new test case to my
> testing stuff.

Gentoo defaults x86_64 to lib64
$ gcc -print-file-name=libc.a
/usr/lib/gcc/x86_64-pc-linux-gnu/4.4.4/../../../../lib64/libc.a
$ gcc -print-multi-os-directory
../lib64
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101213/fd51ed46/attachment.pgp>
