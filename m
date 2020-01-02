From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 14:31:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/avro-c: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20200102110341.149419-1-titouan.christophe@railnova.eu>
References: <20200102110341.149419-1-titouan.christophe@railnova.eu>
Message-ID: <20200102143127.0977eab0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  2 Jan 2020 12:03:41 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> Fixes: http://autobuild.buildroot.net/results/989/989b4e8aaeff51bb5236c4b31e3783a0e07e4a82
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/avro-c/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/avro-c/Config.in b/package/avro-c/Config.in
> index fe962e1e3c..03922612df 100644
> --- a/package/avro-c/Config.in
> +++ b/package/avro-c/Config.in
> @@ -4,6 +4,7 @@ comment "avro-c needs a toolchain w/ dynamic library"
>  config BR2_PACKAGE_AVRO_C
>  	bool "avro-c"
>  	depends on !BR2_STATIC_LIBS  # Avro unconditionally compiles shared libs
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

You need to add this dependency in the Config.in comment as well:

comment "avro-c needs a toolchain w/ dynamic library"
	depends on BR2_TOOLCHAIN_HAS_SYNC_4
        depends on BR2_STATIC_LIBS

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
