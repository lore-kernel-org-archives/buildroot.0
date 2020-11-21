From: Christian Stewart <christian@paral.in>
Date: Sat, 21 Nov 2020 13:12:46 -0800
Subject: [Buildroot] [PATCH v4 4/5] board: add nvidia jetson tx2 support
In-Reply-To: <f48b6a5d-9d98-7d5e-cb17-66e846b7508f@smile.fr>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-4-christian@paral.in>
 <bcfb1b77-8962-674f-1c08-fa7e60ec208e@smile.fr>
 <f48b6a5d-9d98-7d5e-cb17-66e846b7508f@smile.fr>
Message-ID: <CA+h8R2p7m1ej43si0mENKBbRvo0gQ5_h+-pL4nd4sp0hW8hWCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi Romain,


On Sat, Nov 21, 2020 at 2:06 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> Actually I would suggest to use the Linaro aarch64 2018.05
> (BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64) because it's the toolchain recommended
> and used by Nvidia.
>
> See: https://developer.nvidia.com/gcc-linaro-731-201805-sources

When using this EXTERNAL_LINARO_AARCH64 I'm getting the build error -

libnvidia-container-1.2.0/src/drivera-container-1.2.0/src/nvc_ldcache.lo]
Error 1
   10 | #include <rpc/rpc.h>

Even with libtirpc in the dependencies. So I guess two things:

 - rpc.h is coming from the toolchain
 - linaro toolchain doesn't have it (?)
 - libtirpc is probably unnecessary since it's not actually being used

How to fix?

Best,
Christian
