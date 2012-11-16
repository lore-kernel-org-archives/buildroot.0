From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Nov 2012 15:07:16 +0100
Subject: [Buildroot] [PATCH] cpanminus: mark as broken
In-Reply-To: <1353074474-1684-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1353074474-1684-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <50A64894.5000705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/11/12 15:01, Thomas Petazzoni wrote:
> cpanminus is currently responsible for about half of the autobuilder
> failures, due to the missing dependency on host-qemu. However, even
> with the host-qemu proposed by Arnout, cpanminus will still not work
> properly: it will try to execute on the build machine executables
> built for the target. While qemu is here to emulate the instruction
> set, there is still the unsolved problem of kernel headers version
> mismatch between the target and the build environments.
>
> So the whole approach that consists in using host-qemu for building
> simply cannot work properly, and until it is solved, the package
> should be marked as broken.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/cpanminus/Config.in |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/package/cpanminus/Config.in b/package/cpanminus/Config.in
> index b8b39dc..b10d211 100644
> --- a/package/cpanminus/Config.in
> +++ b/package/cpanminus/Config.in
> @@ -1,5 +1,9 @@
>   config BR2_PACKAGE_CPANMINUS
>   	bool "cpanminus"
> +	# Requires host-qemu, which cannot work properly due to kernel
> +	# headers mismatch between the build environment and the
> +	# target.
> +	depends on BR2_BROKEN
>   	help
>   	  cpanminus is a script to get, unpack, build and install Perl modules
>   	  from CPAN.

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
