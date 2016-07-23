From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:55:23 +0200
Subject: [Buildroot] [PATCH v2] libarchive: fix build error when linking
 with lzma
In-Reply-To: <1469110226-24349-1-git-send-email-sergio.prado@e-labworks.com>
References: <1469110226-24349-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20160723155523.42f817ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jul 2016 11:10:26 -0300, Sergio Prado wrote:
> Build fails when linking with liblzma compiled without threads support.
> 
> ./.libs/libarchive.so: undefined reference to `lzma_cputhreads'
> ./.libs/libarchive.so: undefined reference to `lzma_stream_encoder_mt'
> 
> So let's enable LZMA only when toolchain has threads support.
> 
> Fixes:
> http://autobuild.buildroot.org/results/2cb7f8a056982d0b894d0e2531ef357e74c8b796
> http://autobuild.buildroot.org/results/d12954fbd460d396f255158fa127f39ff9d2be8d
> http://autobuild.buildroot.org/results/abe10c70f38423a212ab27d7d27e22174eaa5aab
> Many more...
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> 
> ---
> Changes v1 -> v2:
>   - removing extra comma from evaluation
> ---
>  package/libarchive/libarchive.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
