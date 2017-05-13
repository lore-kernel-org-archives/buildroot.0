From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 14:58:24 +0200
Subject: [Buildroot] [PATCH] package/uclibc-ng-test: disable tst-cond22
 with glibc based toolchain
In-Reply-To: <20170513123636.23978-1-romain.naour@gmail.com>
References: <20170513123636.23978-1-romain.naour@gmail.com>
Message-ID: <20170513145824.7373c3c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 May 2017 14:36:36 +0200, Romain Naour wrote:
> uclibc-ng-test is broken with glibc 2.25 due to pthread_cond_t changes
> introduced by [1].
> Waldemar has disabled this test (tst-cond22) with glibc based toolchain
> [2] but the current uclibc-ng-test package doesn't contain this patch.
> 
> So here it is.
> 
> Fixes:
> [nios2] http://autobuild.buildroot.net/results/d61c8d169fc070271114a515159650f7a0f333c0
> [arm] http://autobuild.buildroot.net/results/22295711046c519df44d5d976e0bfcae1f006e5a
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=ed19993b5b0d05d62cc883571519a67dae481a14
> [2] https://gogs.waldemar-brodkorb.de/linux/uclibc-ng-test/commit/787e584f18afc967d91cfe1a8443df2657579ecb
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../uclibc-ng-test/0001-disable-for-glibc.patch    | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/uclibc-ng-test/0001-disable-for-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
