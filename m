From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:31:18 +0200
Subject: [Buildroot] [PATCH] ffmpeg: disable MIPS DSP options by default
In-Reply-To: <1444838302-13785-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444838302-13785-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151014223118.281525fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 14 Oct 2015 16:58:22 +0100, Vicente Olivert Riera wrote:
> DSP support depends on the core implementation, not on the ISA, so
> enabling it for mips64r2 is not correct since you can build a mips64r2
> core without DSP support.
> 
> Disable mipsdspr1 and mipsdspr2 options by default and let the user
> enable them via the BR2_PACKAGE_FFMPEG_EXTRACONF kconfig option, which
> will take preference and override the default values.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/ffmpeg/ffmpeg.mk |   12 ++----------
>  1 files changed, 2 insertions(+), 10 deletions(-)

Applied, thanks. As Gustavo suggested, it might be worth adding a
Config.in option in arch/Config.in.mips to allow the usage of the DSP
instructions (of course, if such instructions are in practice used by
ffmpeg, and available on a useful selection of MIPS SoCs).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
