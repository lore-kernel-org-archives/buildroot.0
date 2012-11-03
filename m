From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 00:45:18 +0100
Subject: [Buildroot] [PATCH 05/18] toolchain-external: improve glibc
 support to test availability of RPC
In-Reply-To: <7d47e559b9e51b8d03614c61f47873302604c744.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <7d47e559b9e51b8d03614c61f47873302604c744.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5095AC8E.7060707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/12 18:47, Thomas Petazzoni wrote:
> Basically, the BR2_TOOLCHAIN_EXTERNAL_GLIBC option no longer
> unconditionally selects BR2_TOOLCHAIN_HAS_NATIVE_RPC since there are
> glibc toolchains that don't have RPC support. All the predefined
> toolchain profiles are updated to take into account this change: for
> the moment, all glibc toolchains that have pre-defined toolchains have
> RPC support, but further patches in the series add pre-defined glibc
> toolchains that don't have RPC support. In the case of custom glibc
> toolchains, a question is asked to the user so that he can say whether
> the external glibc toolchain has RPC support or not. The validity of
> this configuration option is checked by the new
> check_glibc_rpc_feature function in helpers.mk.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (Visual review only)

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
