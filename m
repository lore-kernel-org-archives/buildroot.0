From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Apr 2011 22:37:59 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: correctly copy the
	dynamic linker
In-Reply-To: <1303575514-22656-2-git-send-email-yann.morin.1998@anciens.enib.fr>
	(Yann E. MORIN's message of "Sat, 23 Apr 2011 18:18:34 +0200")
References: <1303575514-22656-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1303575514-22656-2-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87y62z8jx4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Depending on some setting (which? Arch? Others?), the dynamic linker
 Yann> can get different names. Some times, it is named ld-linux.something.so,
 Yann> other times, it is ld.so.1, and maybe other variants as well...

 Yann> The fix is to always copy ls*.so, even if it is a symlink: we create
 Yann> the destination file by its SONAME, and if ld*.so matches more than
 Yann> one file, that's no issue, as they would all get the same SONAME (being
 Yann> symlinks ones to the others).

Committed, thanks.

-- 
Bye, Peter Korsgaard
