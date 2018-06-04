From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jun 2018 21:49:58 +0200
Subject: [Buildroot] [PATCH v2,1/1] php-amqp: selects openssl
In-Reply-To: <20180604170329.32233-1-fontaine.fabrice@gmail.com>
References: <20180604170329.32233-1-fontaine.fabrice@gmail.com>
Message-ID: <20180604214958.1e2d6f42@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jun 2018 19:03:29 +0200, Fabrice Fontaine wrote:
> Since version 1.8.0, php-amqp needs a rabbitmq-c with openssl support:
> https://github.com/pdezwart/php-amqp/issues/310
> 
> SSL support is disabled in rabbitmq-c if BR2_STATIC_LIBS is set however
> don't add an unneeded !BR2_STATIC_LIBS dependency in Config.in as all
> PHP External Extensions depends on !BR2_STATIC_LIBS
> (see package/Config.in)
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/b7c89bbbd0ca1df08dd7cbfc90c7b45dcf1fad05
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Baruch Siach and Thomas Petazzoni):
>  - Remove unneeded !BR2_STATIC_LIBS in Config.in as all PHP External
>    Extensions depends on !BR2_STATIC_LIBS (see package/Config.in)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
