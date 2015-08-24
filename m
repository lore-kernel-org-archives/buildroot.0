From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Aug 2015 22:42:01 +0200
Subject: [Buildroot] [PATCH 3/4 v2] packages: ensure linux supports
 modules even when not using kernel-module
In-Reply-To: <445a9cea52e08b8f3d20c717e11e8b397f2f40ff.1440434894.git.yann.morin.1998@free.fr>
References: <cover.1440434894.git.yann.morin.1998@free.fr>
 <445a9cea52e08b8f3d20c717e11e8b397f2f40ff.1440434894.git.yann.morin.1998@free.fr>
Message-ID: <55DB8199.2080903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/2015 06:50 PM, Yann E. MORIN wrote:
> Some packages build kernel modules without using the kernel-module infra
> (because they use custom build systems); they do not automatically get
> the kernel to support modules which is ensured when using the infra.
> 
> It must be done manually for all those packages, whenever they ar
> eenabled.

 are enabled

> 
> Note: the nvidia-driver case does not need the ifeq-block other packages
> use, because it is already enclosed in a more stringent ifeq-block.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: No? Rubinstein <nrubinstein@aldebaran.com>
> Cc: Jan Viktorin <viktorin@rehivetech.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Minor nit:

[snip]
> +# We're building a kernel module without using the kernel-module infra,
> +# so we need to tell we want module support in the kernel:

 The colon at the end of the line is not needed (same for all others).

 Regards,
 Arnout


> +ifeq ($(BR2_PACKAGE_LINUX_FUSION),y)
> +LINUX_NEEDS_MODULES = y
> +endif
> +
>  LINUX_FOR_FUSION = $(LINUX_VERSION_PROBED)
>  LINUX_FUSION_ETC_DIR = $(TARGET_DIR)/etc/udev/rules.d
>  
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
