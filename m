From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 22:23:56 +0100
Subject: [Buildroot] [PATCH v4 1/2] ti-cgt-pru: add package for PRU Host
 toolchain
In-Reply-To: <1480652561-8491-1-git-send-email-ash.charles@savoirfairelinux.com>
References: <1480652561-8491-1-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <20161204222356.61a62a14@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Dec 2016 23:22:40 -0500, Ash Charles wrote:
> TI provides a binary code generation toolchain to develop firmware for
> the programmable real-time unit/co-processor found in some SOCs such as
> some models in the AM335x line. This toolchain includes C/C++ support
> (clpru) rather than just assembler (pasm) supported by the pre-existing
> am335x-pru-package [1].  Following the lead of the Yocto meta-ti
> layer [2], this package provides a host toolchain suitable for an x86
> (or x86_64) Linux targeting an ARM-based PRU core.
> 
> [1] http://processors.wiki.ti.com/index.php/PRU_Assembly_Instructions#pasm_vs._clpru
> [2] http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
> 
> Signed-off-by: Ash Charles <ash.charles@savoirfairelinux.com>
> ---
> Changes v1 --> v2
>  * extract source to $(@D) cleanly (suggested by Thomas)
>  * be more explicit about licensing (suggested by Arnout)
>  * switch to buildroot-suitable name: PRU_CGT --> TI_CGT_PRU_DIR
>  * sundry clarifications

Applied to master, after doing the following change:

    [Thomas: add BR2_PACKAGE_HOST_TI_CGT_PRU_ARCH_SUPPORTS boolean option,
    so that packages selecting host-ti-cgt-pru can easily inherit its
    architecture dependencies.]

Also, could you send a patch that adds yourself to the DEVELOPERS file
for both the ti-cgt-pru and the pru-software-support packages?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
