From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 03 May 2013 18:31:56 +0200
Subject: [Buildroot] [PATCH] toolchain/gcc: Introduce
	BR2_ARCH_HAS_GCC_x_y_PLUS
In-Reply-To: <1367570270-2242-1-git-send-email-mjonker@synopsys.com>
References: <1367570270-2242-1-git-send-email-mjonker@synopsys.com>
Message-ID: <5183E67C.9040202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/13 10:37, Mischa Jonker wrote:
> This patch eliminates the long "depends on" lines in
> toolchain/gcc/Config.in by letting architectures specify
> from which GCC version the architecture is supported.
>
> Architectures that support only one specific version of GCC
> should bypass the GCC version selection mechanism.
>
> Signed-off-by: Mischa Jonker<mjonker@synopsys.com>
> ---
>   arch/Config.in.arm      |    6 ++++
>   arch/Config.in.powerpc  |    7 ++++
>   arch/Config.in.x86      |    1 +
>   toolchain/gcc/Config.in |   73 +++++++++++++++++++++++++++++++++-------------
>   4 files changed, 66 insertions(+), 21 deletions(-)

  Now this looks good! If the 'depends on' statements had been split up 
into one line per architecture, the - would have been bigger than the +! 
So this gets my

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  I'm not very excited about the sparcleon situation. But perhaps that 
architecture can be deprecated? It's not even in our autobuilders AFAIK.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
