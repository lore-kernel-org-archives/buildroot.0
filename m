From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:53:38 +0100
Subject: [Buildroot] [PATCH v2 1/1] sane-backends: disable static
 configuration
In-Reply-To: <1480513819-10094-1-git-send-email-fhunleth@troodon-software.com>
References: <1480513819-10094-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20161130225338.7632d98a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Nov 2016 08:50:19 -0500, Frank Hunleth wrote:
> While sane-backends can be compiled statically, it requires
> selection of a subset of scanner backends. Without this, all backends
> are compiled and link errors such as the following are generated:
> 
> ../backend/.libs/libsane.a(libepsonds_la-epsonds.o):(.bss+0xc): multiple definition of `source_list'
> ../backend/.libs/libsane.a(libepson2_la-epson2.o):(.data+0x40): first defined here
> ../backend/.libs/libsane.a(libepsonds_la-epsonds.o):(.data+0x10): multiple definition of `mode_params'
> ../backend/.libs/libsane.a(libepson2_la-epson2.o):(.data+0x0): first defined here
> collect2: error: ld returned 1 exit status
> 
> Buildroot currently doesn't allow fine grained selection of backends, so
> this disables static builds.
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/89c/89c6e4ec1596def74e72eb071ef4bf0f1a7cc9f8/
> http://autobuild.buildroot.net/results/92a/92a54c99a9ba918ece4c56d7beb985729bee700b/
> http://autobuild.buildroot.net/results/1b9/1b9eac5303dfed638063f3b18dfff5571a2c4231/
> http://autobuild.buildroot.net/results/366/366979d0bd21dc2bf7f0336b9653ef3fd4e11123/
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1 -> v2:
>   - Fixed missing "depends BR2_USE_MMU" for comment. Thanks to Baruch
>     Siach for catching it.

I also agree that sane-backends in statically linked configurations is
not very useful, so I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
