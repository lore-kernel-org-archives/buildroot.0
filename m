From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Aug 2013 00:32:11 +0200
Subject: [Buildroot] [PATCH 1/1] ola: new package
In-Reply-To: <1376330715-20047-1-git-send-email-blanco.ether@gmail.com>
References: <1376330715-20047-1-git-send-email-blanco.ether@gmail.com>
Message-ID: <20130814003211.0c9bdaa7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dave Skok,

On Mon, 12 Aug 2013 14:05:15 -0400, Dave Skok wrote:
> Signed-off-by: Dave Skok <blanco.ether@gmail.com>
> ---
>  package/Config.in     |   1 +
>  package/ola/Config.in | 144 +++++++++++++++++++++++++++++++++++++++++++++++
>  package/ola/ola.mk    | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 298 insertions(+)
>  create mode 100644 package/ola/Config.in
>  create mode 100644 package/ola/ola.mk

Thanks, it now builds successfully.

However, I've found another issue: even if I keep most plugins
disabled, they are still all built and installed. For example, with a
configuration that has:

# BR2_PACKAGE_OLA_PLUGIN_KARATE is not set

I get the karate plugin built and installed:

$ ls -1 output/target/usr/lib/olad/*karate*
output/target/usr/lib/olad/libolakarate.so
output/target/usr/lib/olad/libolakarate.so.0
output/target/usr/lib/olad/libolakarate.so.0.0.0

Same goes for:

# BR2_PACKAGE_OLA_PLUGIN_SPI is not set

$ ls -1 output/target/usr/lib/olad/*spi*
output/target/usr/lib/olad/libolaspicore.so
output/target/usr/lib/olad/libolaspicore.so.0
output/target/usr/lib/olad/libolaspicore.so.0.0.0
output/target/usr/lib/olad/libolaspi.so
output/target/usr/lib/olad/libolaspi.so.0
output/target/usr/lib/olad/libolaspi.so.0.0.0

Is this expected?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
