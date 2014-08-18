From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 18 Aug 2014 20:05:06 +0200
Subject: [Buildroot] [PATCH v2] bandwidthd: incorporate fixes for
	autobuilders
In-Reply-To: <53F23A6E.3060807@openwide.fr>
References: <1408062429-25594-1-git-send-email-nroach44@gmail.com>
 <53F20353.8020107@openwide.fr> <53F21546.4000406@gmail.com>
 <53F23A6E.3060807@openwide.fr>
Message-ID: <53F24052.8050601@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

> 
> I think bandwithd depends on BR2_TOOLCHAIN_HAS_THREADS due to a reverse
> dependency on libusb.
> 
Please forget that. libusb is an optional dependency of libpcap.

I have disabled libusb and now the build error out:

checking for libusb_init in -lusb-1.0... no
configure: error:

libusb and libpthread need to be handled as optional dependencies in bandwidthd.

-pthread need to be added only if the libusb (which depends on
BR2_TOOLCHAIN_HAS_THREADS) is detected

So add BANDWIDTHD_CONF_ENV = LIBS="-pthread" in bandwidthd.mk is not a good idea...

Best regards,
Romain
