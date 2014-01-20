From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Jan 2014 22:37:49 +0100
Subject: [Buildroot] [PATCH v2 3/3] Revert "e2fsprogs: fix
	posix_fadvise() signature mismatch"
In-Reply-To: <10f996cb2545050f65e8a108573e9ee7bfd9e41c.1389594195.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 13 Jan 2014 08:26:14 +0200")
References: <cover.1389594195.git.baruch@tkos.co.il>
 <10f996cb2545050f65e8a108573e9ee7bfd9e41c.1389594195.git.baruch@tkos.co.il>
Message-ID: <8761pejpw2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > This reverts commit c3d690166c4533bc83500a22a43783193fbc27f9.
 > The real cause of problem is missing posix_fadvise() implementation in uClibc
 > for xtensa. This has now been fixed with the uclibc version bump. The internal
 > e2fsprogs posix_fadvise() implementation is broken on 32bit systems anyway, and
 > upstream has removed it.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
