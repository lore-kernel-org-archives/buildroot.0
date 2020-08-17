From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 15:13:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: bump to v1.6.11
In-Reply-To: <20200817091055.203521-1-titouan.christophe@railnova.eu>
References: <20200817091055.203521-1-titouan.christophe@railnova.eu>
Message-ID: <20200817151345.71c3f757@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Aug 2020 11:10:55 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Mosquitto 1.6.11 is a bugfix release, read the whole announcement on
> http://mosquitto.org/blog/2020/08/version-1-6-11-released/
> 
> From the changelog of the client library:
> mosquitto_loop_start() now sets a thread name on Linux, FreeBSD, NetBSD,
> and OpenBSD. Closes #1777.
> This is done with pthread_setname_np; so mosquitto now requires
> BR2_TOOLCHAIN_HAS_THREADS_NPTL.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/mosquitto/Config.in      | 4 ++++
>  package/mosquitto/mosquitto.hash | 4 ++--
>  package/mosquitto/mosquitto.mk   | 2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
> index b4effa36be..21cd56c492 100644
> --- a/package/mosquitto/Config.in
> +++ b/package/mosquitto/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_MOSQUITTO
>  	bool "mosquitto"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_setname_np

It seems like this new dependency was not propagated to all reverse
dependencies of mosquitto. Could you double check this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
