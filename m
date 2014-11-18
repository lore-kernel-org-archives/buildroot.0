From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 18 Nov 2014 07:56:41 -0600
Subject: [Buildroot] [PATCH 1/2] arch/powerpc: add fsl e5500 and e6500
	support
In-Reply-To: <1416266092-6465-2-git-send-email-gustavo@zacarias.com.ar>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
 <1416266092-6465-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CANQCQpbtbch9q-HKXFhQRkKxYpr1FD9nhebwpiaj=65O_Pm+xQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Mon, Nov 17, 2014 at 5:14 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Add Freescale E5500 and E6500 core support.
> These can go in 32 or 64-bit mode.
> I'm not aware of these being able to boot in LE mode so filter that out
> until we get some feedback on it.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  arch/Config.in.powerpc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index f7f3ab1..c1142f2 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -109,6 +109,13 @@ config BR2_powerpc_e300c3
>  config BR2_powerpc_e500mc
>         bool "e500mc"
>         depends on !BR2_ARCH_IS_64
> +config BR2_powerpc_e5500
> +       bool "e5500"
> +       depends on !BR2_powerpc64le
> +config BR2_powerpc_e6500
> +       bool "e6500"
> +       depends on !BR2_powerpc64le
> +       select BR2_POWERPC_CPU_HAS_ALTIVEC

Reviewed-by: "Matt Weber" <matthew.weber@rockwellcollins.com>

I'll try to give this a test when I get a chance, we currently have a
e5500 target that we're building binaries for but with a e500mc
toolchain (using arch compatibility mode on the processor).  Will the
buildroot toolchain do multilib so that it's possible to build uboot
32/36bit and a kernel 64bit?  So far that's why we stuck with the
e500mc (just 32/36bit) keeping us using a single toolchain.

>  config BR2_powerpc_power4
>         bool "power4"
>  config BR2_powerpc_power5
> --
> 2.0.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
