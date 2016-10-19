From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 17:59:29 +0200
Subject: [Buildroot] [PATCH v2] liburcu: needs MMU
In-Reply-To: <8a309fcafc9f624385affeb31aac21249e1feb68.1476869702.git.baruch@tkos.co.il>
References: <8a309fcafc9f624385affeb31aac21249e1feb68.1476869702.git.baruch@tkos.co.il>
Message-ID: <20161019175929.73cde75d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Oct 2016 12:35:02 +0300, Baruch Siach wrote:
> The test_urcu_fork.c test calls fork(). Upstream provides no easy way to
> disable tests build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/9eb/9eb182ab2d0b396eeff3d637a040da5a4d5bdcd7/
> http://autobuild.buildroot.net/results/47a/47aabc219a2fd50105881b1e2715f7eeb1a6a588/
> http://autobuild.buildroot.net/results/566/56631605f76b8623c9674f25c529ac67d0de12a8/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2: move MMU dependency to BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS (ThomasP)
> ---
>  package/liburcu/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. However, it would be good if you could
report the issue upstream. It's indeed rather annoying that only for
their tests we have to disable this package on no-MMU platform. Not
annoying enough to have us spend time on this, but annoying enough to
report it upstream IMO.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
