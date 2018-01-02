From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 21:45:20 +0100
Subject: [Buildroot] [PATCH v2] libdrm: fix libatomic_ops linking
In-Reply-To: <20171218185531.31686-1-ps.report@gmx.net>
References: <20171218185531.31686-1-ps.report@gmx.net>
Message-ID: <20180102214520.53169c7b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Dec 2017 19:55:31 +0100, Peter Seiderer wrote:
> Add patch 0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch
> provided by Thomas Petazzoni handling libatomic_ops linking when needed.
> 
> Fixes [1]:
> 
>     CCLD     etnaviv_cmd_stream_test
>   ../../etnaviv/.libs/libdrm_etnaviv.so: undefined reference to `AO_store_full_emulation'
>   ../../etnaviv/.libs/libdrm_etnaviv.so: undefined reference to `AO_fetch_compare_and_swap_emulation'
>   collect2: error: ld returned 1 exit status
> 
> [1] http://autobuild.buildroot.net/results/92e074c49417261843eef95872ff935a56077c98
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - use patch provided by Thomas Petazzoni instead of forced
>     libatomic_ops linking.
> ---
>  ...akefile.am-use-pkg-config-to-discover-lib.patch | 160 +++++++++++++++++++++
>  package/libdrm/libdrm.mk                           |   8 +-
>  2 files changed, 167 insertions(+), 1 deletion(-)
>  create mode 100644 package/libdrm/0003-configure-Makefile.am-use-pkg-config-to-discover-lib.patch

Applied to master, thanks. Could you submit the patch upstream to the
libdrm project ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
