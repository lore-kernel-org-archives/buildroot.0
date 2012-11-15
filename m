From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Nov 2012 17:58:48 +0100
Subject: [Buildroot] [PATCH] support/gnuconfig: update config.{guess,
 sub} to a newer version
In-Reply-To: <1352995994-10048-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1352995994-10048-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <50A51F48.7020803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/12 17:13, Thomas Petazzoni wrote:
> We need more recent versions of config.guess and config.sub in order
> to support the aarch64 architecture. Otherwise, all autoconf packages
> fail to build with failures like:
>
>    http://autobuild.buildroot.org/results/abcdbe1aaf1c203c82dc3e4ec8c002b9b9e550e0/build-end.log
>
> We take this opportunity to turn the config.* patches into proper Git
> patches, and note which Git commit of the config.git repository we
> used as the original source.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Rebuilt some random autotools packages with this patches and they didn't seem to fail.

> ---
>   support/gnuconfig/README.buildroot                 |    5 +-
>   support/gnuconfig/config.guess                     |   74 +++++---
>   support/gnuconfig/config.sub                       |  138 ++++++++++-----
>   .../0001-config-add-support-for-uClibc.patch       |  184 ++++++++++++++++++++
>   .../patches/0002-config-add-support-for-ps2.patch  |   60 +++++++
>   .../gnuconfig/patches/config.guess.uclibc.patch    |  149 ----------------
>   support/gnuconfig/patches/config.sub.ps2.patch     |   45 -----
>   7 files changed, 392 insertions(+), 263 deletions(-)
>   create mode 100644 support/gnuconfig/patches/0001-config-add-support-for-uClibc.patch
>   create mode 100644 support/gnuconfig/patches/0002-config-add-support-for-ps2.patch
>   delete mode 100644 support/gnuconfig/patches/config.guess.uclibc.patch
>   delete mode 100644 support/gnuconfig/patches/config.sub.ps2.patch

  Did you forget -M in git send-email?

  Is the ps2 patch still relevant? We certainly don't have mipsEE or ps2 or irx or iop or dvp
in out target tuple, and I can't imagine that anyone tries to build on a ps2...

  Can the uClibc patch be upstreamed?

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
