From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 22:21:12 +0200
Subject: [Buildroot] [PATCH v2] package/kvazaar: disable on PowerPC
In-Reply-To: <20170705094230.21439-1-romain.naour@smile.fr>
References: <20170705094230.21439-1-romain.naour@smile.fr>
Message-ID: <20170705222112.5bddb57b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 11:42:30 +0200, Romain Naour wrote:
> There is actually three build issues with kvazaar on PowerPC:
> 
> The first one due to deprecated vec_lvsl() function:
> 
> strategies/altivec/picture-altivec.c: In function ?reg_sad_altivec?:
> strategies/altivec/picture-altivec.c:43:5: error: vec_lvsl is deprecated for little endian; use assignment for unaligned loads and stores [-Werror=deprecated]
> perm1 = vec_lvsl(0, &data1[y * stride1]);
> ^~~~~
> 
> Reported upstream:
> https://github.com/ultravideo/kvazaar/issues/172
> 
> The second one due to mixing AltiVec and E500 instructions:
> 
> strategies/altivec/picture-altivec.c:1:0: error: AltiVec and E500 instructions cannot coexist
> 
> Reported upstream:
> https://github.com/ultravideo/kvazaar/issues/173
> 
> The last one due to enabling AltiVec on unsupported target:
> 
> strategies/altivec/picture-altivec.c:1:0: error: AltiVec not supported in this target
> 
> Reported upstream:
> https://github.com/ultravideo/kvazaar/issues/174
> 
> Fixes:
> [1] http://autobuild.buildroot.net/results/486/486757f04bc73736b64d18c3298216280be897b1
> [2] http://autobuild.buildroot.net/results/45d/45d22c9f2f5b593bed286319105c82cbc3396835
> [3] http://autobuild.buildroot.net/results/76c/76c76191f84748326d76fe0cc89456a72738a06b
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> v2: rework the commit log and add upstream bug report (ThomasP)
> ---
>  package/kvazaar/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master after slightly improving the commit log. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
