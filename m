From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Mar 2020 07:35:12 +0100
Subject: [Buildroot] [PATCH] linux: run depmod only if modules are
 enabled
In-Reply-To: <20200325002154.5882-1-unixmania@gmail.com>
References: <20200325002154.5882-1-unixmania@gmail.com>
Message-ID: <20200325073512.75c63b4a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Mar 2020 21:21:54 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> If the kernel configuration CONFIG_MODULES disabled, there's no
> /lib/modules/<version> directory, causing this:
> 
> depmod: ERROR: could not open directory [...]/target/lib/modules/4.19.8: No such file or directory
> depmod: FATAL: could not search modules: No such file or directory
> Makefile:745: recipe for target 'target-finalize' failed
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  linux/linux.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks, applied after adding a number of references to defconfig build
failures that are fixed by this patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
