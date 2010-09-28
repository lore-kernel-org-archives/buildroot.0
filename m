From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Sep 2010 19:28:28 +0200
Subject: [Buildroot] [PATCH 2/4] Enable terminal type configuration for
 /etc/inittab
In-Reply-To: <4C9C553E.8040105@visionsystems.de>
References: <4C9C54A9.20803@visionsystems.de>
	<4C9C54FC.4040609@visionsystems.de>
	<4C9C553E.8040105@visionsystems.de>
Message-ID: <20100928192828.2fb6ac19@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Sep 2010 09:37:34 +0200
Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:

> diff --git a/target/generic/Config.in b/target/generic/Config.in
> index 286b0a3..e7b2c9f 100644
> --- a/target/generic/Config.in
> +++ b/target/generic/Config.in
> @@ -164,6 +164,12 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
>  	bool "115200"
>  endchoice
>  
> +config BR2_TARGET_GENERIC_GETTY_TERMINAL_TYPE
> +	string "Terminal type"
> +	default "vt100"
> +	help
> +		Specify a terminal type like vt100, linux etc.

Need only one tab + 2 spaces for the indentation of the help text.

Just out of curiosity, in what cases isn't vt100 an appropriate value ?

Once the minor tab+spaces issue is fixed:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I can merge this patch (and the other patches in this patch set into my
boards-cleanup work, as it is somewhat related to board-level
configuration options).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
