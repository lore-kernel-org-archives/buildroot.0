From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 17:38:03 +0200
Subject: [Buildroot] [PATCH] package/netsurf: disallow on archs
 requiring ABI specific CFLAGS
In-Reply-To: <20190531214052.14297-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 31 May 2019 23:40:52 +0200")
References: <20190531214052.14297-1-peter@korsgaard.com>
Message-ID: <87a7eug1wk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/67ef520d82ea529a9fe593d83a3aeae5f8b0ee5d/
 > http://autobuild.buildroot.net/results/eafc3e4be571d5ecee549a11530ac4e508f31782/
 > http://autobuild.buildroot.net/results/ba7f30833fef54162a82f4b336a72d6599594526/

 > The netsurf build system mixes up host and target CFLAGS, so it isn't
 > compatible with architectures where we pass ABI specicif compiler flags (in
 > TARGET_ABI).

 > Add a _ARCH_SUPPORTS kconfig variable matching the TARGET_ABI logic we have
 > in package/Makefile.in, and use it to disallow netsurf for those
 > architectures.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
