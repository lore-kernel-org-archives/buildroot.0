From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Jul 2012 21:45:14 +0200
Subject: [Buildroot] [PATCH 2/6] Rework support for the device tree
In-Reply-To: <1342528042-10038-3-git-send-email-maxime.ripard@free-electrons.com>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
 <1342528042-10038-3-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <5012EFCA.2080809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/17/12 14:27, Maxime Ripard wrote:
> This patch introduces some support for device tree-enabled kernels.
>
> It replaces the former BR2_LINUX_KERNEL_DTS_FILE option that was
> microblaze-only, that was quite limited. This option was quite
> limited, first obviously because it was restricted to microblaze,
> but also because it targetted only external device tree source files,
> and allowed only to build simpleImages using the custom image name
> mechanism.
>
> This patch adds a much more generic one, that can work on basically
> every architecture that supports device tree. It allows to build
> both device tree source file that comes with the kernel source or to
> set the path to the device tree file to use so that one can use a
> custom device tree.
>
> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Really nice!

  The BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT part actually belongs to
patch 4/6, but that's a minor detail.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
