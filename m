From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 21:04:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: disable examples and
 tests
In-Reply-To: <20200902204310.3909104-1-fontaine.fabrice@gmail.com>
References: <20200902204310.3909104-1-fontaine.fabrice@gmail.com>
Message-ID: <20200903210409.6384c462@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  2 Sep 2020 22:43:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Examples and tests are not needed especially because of them fails on
> some architectures because it wrongly tries to use wc_Sha256FinalRaw:
> 
>   CCLD     tests/unit.test
> /tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/9.2.1/../../../../aarch64-none-linux-gnu/bin/ld: tests/tests_unit_test-api.o: in function `test_wc_Sha256FinalRaw':
> /tmp/instance-0/output-1/build/wolfssl-4.5.0-stable/tests/api.c:6504: undefined reference to `wc_Sha256FinalRaw'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d5b6f97f7510874fe28c675e599be08cb8a78c7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wolfssl/wolfssl.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks. However, this sort of commit log still lacks
one very fundamental information: since when this problem is happening.
Without this information, we have no idea if this patch needs to be
backported to our stable branches. Could you pay attention to this in
your next submission of fixes ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
