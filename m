From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:43:08 +0200
Subject: [Buildroot] [PATCH v3] rtl8188eu: new package
In-Reply-To: <1437991580-31649-1-git-send-email-luca@lucaceresoli.net>
References: <1437991580-31649-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150727234308.77aff941@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 27 Jul 2015 12:06:20 +0200, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---

I've applied, but there were still numerous improvements that could be
made after the conversion to the kernel-module infra:

    [Thomas:
      - remove patches 0001 and 0002, they are not needed since when using
        the kernel-module infrastructure, we directly call the kernel
        build system and bypass the one provided by the external module
      - install the firmware directly in the Buildroot .mk file, which
        allows to also remove patch 0003.
      - remove RTL8188EU_DEPENDENCIES = linux, since this is already
        handled by the kernel-module infrastructure.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
