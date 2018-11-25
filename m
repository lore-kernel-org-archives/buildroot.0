From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:28:18 +0100
Subject: [Buildroot] [PATCH 1/1] attr: Add a patch to fix an
 unconditional infinite recursion.
In-Reply-To: <20181109111050.11260-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Fri, 9 Nov 2018 12:10:50 +0100")
References: <20181109111050.11260-1-nicolas.cavallari@green-communications.fr>
Message-ID: <87sgzo3kzx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > The bump to 2.4.48 introduced a bug that, according to the author,
 > only happen in certain cases on glibc. But under uclibc-ng, it happens
 > every time.

 > The bug essentially cause any program calling any libattr.so function
 > to enter an infinite recursion, because of a symbol conflict between
 > uclibc-ng and libattr wrappers, that causes the libattr wrappers to
 > call themselves.

 > This infinite recursion does not consume the stack, so programs
 > basically behave like they enter an infinite loop.

 > It is easy to reproduce with qemu_arm_versatile_defconfig +
 > BR2_PACKAGE_ATTR: "getfattr ." never returns and takes 100% CPU.

 > Upstream fixed it, but the patch is not part of a release yet,
 > so take the patch.

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

 > --
 > An alternative is to bump the version to this commit in the master
 > branch.  The other changes[1] are mostly related to tests or
 > documentation, except for one patch[2] that tries more aggressively to
 > enable large file support.

 > [1] http://git.savannah.nongnu.org/cgit/attr.git/log/
 > [2] http://git.savannah.nongnu.org/cgit/attr.git/commit/?id=fd1d8ee21df8d11460baa858ae5c5d20e38fb70e

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
