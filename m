From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Apr 2013 08:14:53 +0200
Subject: [Buildroot] [PATCH 2/2] arch: remove support for SuperH 2 and
 SuperH 3
In-Reply-To: <1365362725-30251-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365362725-30251-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365362725-30251-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5163B1DD.3030401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/13 21:25, Thomas Petazzoni wrote:
> The SuperH 2 architecture is a noMMU architecture from Renesas, and
> its Linux support is really poor. A number of packages fail to build,
> the kernel support is almost inexistant, we have never heard of any
> user of it.
>
> I was originally the one who introduced support for SuperH 2, but the
> project switched to a different architecture due to the poor Linux
> support for SuperH 2.
>
> Regarding SuperH 3, I've never heard of Linux support for it that is
> used in practice.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   arch/Config.in.sh                        |   18 ++------------
>   package/flashbench/flashbench.mk         |    4 +--
>   package/kexec/Config.in                  |    2 +-
>   package/multimedia/mplayer/Config.in     |    3 +--
>   toolchain/toolchain-external/Config.in   |   40 ------------------------------
>   toolchain/toolchain-external/ext-tool.mk |    6 -----
>   toolchain/uClibc/uclibc.mk               |   20 ---------------
>   7 files changed, 6 insertions(+), 87 deletions(-)

  git grep 'sh[23]' tells me:

- some comments in qemu.mk can be removed;
- package/binutils/binutils-*/120-sh-conf.patch can probably be removed 
(I think the target name is always sh-x-y for sh4).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
