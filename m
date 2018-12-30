From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 16:11:17 +0100
Subject: [Buildroot] [PATCH 2/4] arch/arm: restrict more armv8a cores to
 aarch64
In-Reply-To: <891faf01bce122d52613f7fc831f32526beaa1a3.1546179362.git.yann.morin.1998@free.fr>
References: <cover.1546179362.git.yann.morin.1998@free.fr>
 <891faf01bce122d52613f7fc831f32526beaa1a3.1546179362.git.yann.morin.1998@free.fr>
Message-ID: <20181230161117.35538f05@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Dec 2018 15:16:11 +0100, Yann E. MORIN wrote:
> Since gcc-8, falkor and qdf24xx have been available only as AArch64.
> 
> Although we could support building in 32-bit for older gcc versions, we
> decided not to, in the sake of simplicity.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/Config.in.arm | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Applied to master after reworking the commit log to mention the exact
gcc commit that dropped falkor and qdf24xx availability for ARM32.
Since it was due to the released HW never supporting AArch32, it does
not make sense to support these cores in AArch32 with older gcc
versions.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
