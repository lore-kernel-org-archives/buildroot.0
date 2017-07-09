From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 15:45:11 +0200
Subject: [Buildroot] [PATCH v2 1/7] arch/xtensa: get rid of an
 intermediate blind kconfig option
In-Reply-To: <1499602921-25097-2-git-send-email-jcmvbkbc@gmail.com>
References: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
 <1499602921-25097-2-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170709154511.23d76b59@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Jul 2017 05:21:55 -0700, Max Filippov wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> It is not needed to have an intermediate blind option, we can just
> hide the prompt behind the same dependency as the non-blind symbol.
> 
> Update our qemu-xtensa defconfig acordingly (note: it was using
> different values for both options, which is not possible; the blind
> option was just set to the non-blind one in the .config).
> 
> Also remove an unneeded empty default for the BR2_XTENSA_OVERLAY_DIR
> string option (strings are empty by default).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  Config.in.legacy                         | 11 +++++++++++
>  arch/Config.in.xtensa                    | 16 ++++++----------
>  configs/qemu_xtensa_lx60_defconfig       |  3 +--
>  configs/qemu_xtensa_lx60_nommu_defconfig |  3 +--
>  4 files changed, 19 insertions(+), 14 deletions(-)

Applied to master, thanks. I've fixed a small typo in the
Config.in.legacy help text.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
