From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 17:02:17 +0200
Subject: [Buildroot] [PACH v3] efivar: disable for some incompatible
 Sourcery CodeBench toolchains
In-Reply-To: <1467555636-17085-1-git-send-email-romain.naour@gmail.com>
References: <1467555636-17085-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160703170217.7be8143d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 16:20:36 +0200, Romain Naour wrote:
> From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> linux/nvme.h has been renamed to linux/nvme_ioctl.h since 4.4, and we
> have a patch to handle that situation. However, some Sourcery CodeBench
> toolchains use 4.4 kernel headers but don't have that header file
> renamed, and that is causing build failures. So, prevent this package
> to be built using those toolchains.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/66c/66cf68261fa73c2366610f8d14bd02180ba7cd2d/
>   http://autobuild.buildroot.net/results/54c/54cc7d4e3b284b35931e08f9c7f0f902df96a989/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> [Romain:
>   - add back slash on line breaks
>   - propagate efivar dependencies to efibootmgr
>   - add comments dependencies]
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efibootmgr/Config.in |  4 ++++
>  package/efivar/Config.in     | 10 ++++++++++
>  2 files changed, 14 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
