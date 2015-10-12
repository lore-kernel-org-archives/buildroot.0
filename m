From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 21:19:35 +0200
Subject: [Buildroot] [PATCH v2 2/2] libevdev: disable runtime tests
In-Reply-To: <1444600593-27026-2-git-send-email-ps.report@gmx.net>
References: <1444600593-27026-1-git-send-email-ps.report@gmx.net>
 <1444600593-27026-2-git-send-email-ps.report@gmx.net>
Message-ID: <20151012211935.7c578e1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sun, 11 Oct 2015 23:56:33 +0200, Peter Seiderer wrote:
> Add new configure option '--disable-runtime-tests' and use it do
> disable runtime tests which fail to compile on some uclibc
> configurations.
> 
> Fixes [1], [2]:
>   test-libevdev-init.c: In function 'test_set_clock_id':
>   test-libevdev-init.c:493: error: 'CLOCK_MONOTONIC_RAW' undeclared (first use in this function)
> 
> and compile failure for !BR2_USE_MMU configuration:
>   test-main.c:(.text+0x8): undefined reference to `_fork'
> 
> [1] http://autobuild.buildroot.net/results/0d0/0d0a987471ce8e9f76fc96e0ae8f0bfeadb45028/
> [2] http://autobuild.buildroot.net/results/939/9392033f1b8d2c8e4e8791c90918dabbe28a7067/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - remove silly debug stuff from added patch
> ---
>  ...onfigure-add-disable-runtime-tests-option.patch | 42 ++++++++++++++++++++++
>  package/libevdev/libevdev.mk                       |  5 +++
>  2 files changed, 47 insertions(+)
>  create mode 100644 package/libevdev/0001-configure-add-disable-runtime-tests-option.patch

Applied, but please submit the patch upstream (or ask upstream to
implement a different solution for the problem).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
