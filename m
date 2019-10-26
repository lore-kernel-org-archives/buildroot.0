From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 17:07:06 +0200
Subject: [Buildroot] [PATCH v2 1/2] toolchain/toolchain-wrapper:
 explicitly set Build ID to none if BR2_REPRODUCIBLE
In-Reply-To: <20190831180113.16025-1-itsatharva@gmail.com>
References: <20190831180113.16025-1-itsatharva@gmail.com>
Message-ID: <20191026170706.36474885@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Aug 2019 23:31:12 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> Build ID is added to binaries at link time. Building in different output
> directories causes some packages to have different Build IDs, thus resulting in
> non-reproducibility.
> 
> Adding "-Wl,--build-id=none" fixes this issue by disabling setting of Build ID.
> 
> Diffoscope output for Build ID issue: https://gitlab.com/snippets/1886180/raw
> 
> After this patch, build is reproducible - i.e. diffoscope does not produce any
> output.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
> Changes v1 -> v2:
>   - Handle inside toolchain-wrapper.mk instead of both .mk and .c
> ---
>  toolchain/toolchain-wrapper.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
