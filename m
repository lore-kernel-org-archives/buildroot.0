From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 03 Nov 2012 19:28:35 +0100
Subject: [Buildroot] [PATCH 2/3] Split target/Config.in.arch into
 multiple Config.in.* in arch/
In-Reply-To: <082538b6f5188dba251aac377ebf29560b1c5606.1348468443.git.thomas.petazzoni@free-electrons.com>
References: <cover.1348468443.git.thomas.petazzoni@free-electrons.com>
 <082538b6f5188dba251aac377ebf29560b1c5606.1348468443.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50956253.9040800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/24/12 08:34, Thomas Petazzoni wrote:
> target/Config.in.arch had become too long, and we want to remove the
> target/ directory. So let's move it to arch/ and split it this way:
>
>   * An initial Config.in that lists the top-level architecture, and
>     sources the arch-specific Config.in.<arch>  files, as well as
>     Config.in.common (see below)
>
>   * One Config.in.<arch>  per architecture, listing the CPU families,
>     ABI choices, etc.
>
>   * One Config.in.common that defines the gcc mtune, march, mcpu values
>     and other hidden options.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

  Checked by sorting everything and taking the diff with the original, which
brings me to:

[snip]
> +config BR2_mips64el
> +       bool "MIPS64 (little endian)"
> +       select BR2_ARCH_IS_64
> +       help
> +         MIPS is a RISC microprocessor from MIPS Technologies. Big endian.

  Not Big endian... But it was like that already in the original.

  Also you're using spaces here I think.

[snip]
> +config BR2_mips_3
> +	bool "mips III"
> +	depends on !BR2_ARCH_IS_64

  This 'depends on !BR2_ARCH_IS_64' wasn't present in the original...

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
