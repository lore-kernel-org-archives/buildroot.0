From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 11:08:50 +0200
Subject: [Buildroot] [PATCH 4/9] manual: add information about buildroot
 toolchain not being relocable and put some hints to use it
In-Reply-To: <ef67fc0502d4a0a4cdce65dc850921e08e0cfef0.1381002281.git.s.martin49@gmail.com>
References: <cover.1381002281.git.s.martin49@gmail.com>
 <ef67fc0502d4a0a4cdce65dc850921e08e0cfef0.1381002281.git.s.martin49@gmail.com>
Message-ID: <20131006110850.0f584465@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

This commit is again mixing a number of different things: removing
details about Crosstool-NG, improving details about the Buildroot
backend, and adding informations on re-using a Buildroot built
toolchain as an external toolchain.

We'll need to synchronize on the Crosstool-NG bits, because I have a
patch series that removes the Crosstool-NG backend entirely, and which
includes the corresponding update to the manual.

On Sat,  5 Oct 2013 21:49:09 +0200, Samuel Martin wrote:

> +It is possible to only build the toolchain by running:
> +
> +---------------------------------------
> +make toolchain
> +---------------------------------------
> +
> +To avoid to rebuild the toolchain (when using the 'internal Buildroot toolchain
> +backend') after executing +make clean+, you can build the toolchain in some
> +place, then use this prebuilt toolchain as an 'external toolchain' in another
> +buildroot configuration.
> +
> +1. Configure the toolchain using the 'internal Buildroot toolchain backend'
> +  to meet your needs:
> ++
> +---------------------------------------
> +make O=/path/to/somewhere menuconfig
> +---------------------------------------
> ++
> +1. Build the toolchain:
> ++
> +---------------------------------------
> +make O=/path/to/somewhere toolchain
> +---------------------------------------
> ++
> +1. Configure target configuration using the prebuilt toolchain as an
> +   'external toolchain':
> ++
> +---------------------------------------
> +make O=/path/to/somewhere_else menuconfig
> +---------------------------------------
> ++
> +In the 'Toolchain' menu, set:
> ++
> +* 'Toolchain type': +External toolchain+ (+BR2_TOOLCHAIN_EXTERNAL+)
> +* 'Toolchain': +Custom toolchain+ (+BR2_TOOLCHAIN_EXTERNAL_CUSTOM+)
> +* 'Toolchain origin': +Pre-installed toolchain+
> +  (+BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED+)
> +* 'Toolchain path': +/path/to/somewhere/host/usr+
> +  (+BR2_TOOLCHAIN_EXTERNAL_PATH+)
> +* and set the external toolchain properties accordingly to the ones set for
> +  the prebuilt toolchain.
> ++
> +1. Build the target binaries:
> ++
> +---------------------------------------
> +make O=/path/to/somewhere_else
> +---------------------------------------
> +
> +Note that toolchains built using the 'internal Buildroot toolchain backend' are
> +*not* relocable, so if you plan to share it with other machines, you will
> +*have to* install it in the same location (i.e.: in +/path/to/somewhere+).

I am not sure this part should be in the "Customize toolchain" part.
I'm actually not sure where to put this information in the manual.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
