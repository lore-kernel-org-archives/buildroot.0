From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Sun, 16 Jun 2013 00:18:53 +0200
Subject: [Buildroot] [PATCHv3 2/3] Add proprietary libraries for Hantro
	x170 HW decoding
In-Reply-To: <87k3lvxeig.fsf@dell.be.48ers.dk>
References: <1370945921-23444-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1370945921-23444-2-git-send-email-alexandre.belloni@free-electrons.com>
 <87k3lvxeig.fsf@dell.be.48ers.dk>
Message-ID: <51BCE84D.9070605@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,


On 15/06/2013 23:14, Peter Korsgaard wrote:
>  Alexandre> diff --git a/package/multimedia/on2-8170-libs/Config.in b/package/multimedia/on2-8170-libs/Config.in
>  Alexandre> new file mode 100644
>  Alexandre> index 0000000..09ed808
>  Alexandre> --- /dev/null
>  Alexandre> +++ b/package/multimedia/on2-8170-libs/Config.in
>  Alexandre> @@ -0,0 +1,12 @@
>  Alexandre> +config BR2_PACKAGE_ON2_8170_LIBS
>  Alexandre> +	#This is a binary only package which has been compiled for glibc
>  Alexandre> +	depends on BR2_arm926t
>  Alexandre> +	depends on (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
>  Alexandre> +		BR2_TOOLCHAIN_CTNG_eglibc || \
>  Alexandre> +		BR2_TOOLCHAIN_CTNG_glibc)
>  Alexandre> +	bool "on2-8170-libs"
>
> Presumably this doesn't do much without the kernel modules, so I changed
> this to select on2-8170-modules.

Hum, Is that really a good idea ? I can imagine people building their
kernel out of buildroot and then not being able to select on2-8170-libs.



-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
