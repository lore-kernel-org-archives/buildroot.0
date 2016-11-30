From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 23:35:37 +0100
Subject: [Buildroot] [PATCH v3 1/2] ti-cgt-pru: add package for PRU Host
 toolchain
In-Reply-To: <1480346294-22771-1-git-send-email-ash.charles@savoirfairelinux.com>
References: <1480346294-22771-1-git-send-email-ash.charles@savoirfairelinux.com>
Message-ID: <20161130233537.66609af5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 10:18:13 -0500, Ash Charles wrote:

> +# Since this is largely prebuilt toolchain and likes to live in its own
> +# directory, put is in $(HOST_DIR)/ti-cgt-pru
> +# Packages wanting to use this toolchain need to use this path as TI's
> +# standard PRU_CGT path e.g. make PRU_CGT=$(TI_CGT_PRU_INSTALLDIR)...
> +
> +TI_CGT_PRU_INSTALLDIR = $(HOST_DIR)/ti-cgt-pru

I think I suggested in a previous iteration that this should be changed
to $(HOST_DIR)/usr/share/ti-cgt-pru, or possibly some other location,
but at least not have this right under $(HOST_DIR).

Is there any reason why this hasn't been taken into account? Maybe
Arnout objected with some good argument?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
