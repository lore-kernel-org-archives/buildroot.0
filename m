From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 18 Aug 2014 19:39:58 +0200
Subject: [Buildroot] [PATCH v2] bandwidthd: incorporate fixes for
	autobuilders
In-Reply-To: <53F21546.4000406@gmail.com>
References: <1408062429-25594-1-git-send-email-nroach44@gmail.com>
 <53F20353.8020107@openwide.fr> <53F21546.4000406@gmail.com>
Message-ID: <53F23A6E.3060807@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

Le 18/08/2014 17:01, Nathaniel Roach a ?crit :
> 
> In regards to pthreads, can you add
> 
> LIBS="-lpthread $LIBS"
> 
> some where in configure.ac and test if that fixes the issue?
> 
> If it does I'll commit it and then patch buildroot accordingly.
> 
> Thanks, Nathaniel
> 

I tried with 0473a5f2527201d83c5b0ddc581b7c9f21fbdcaf and I added the following
line in bandwidthd.mk:
BANDWIDTHD_CONF_ENV = LIBS="-pthread"

It's ok for me with that :)

I think bandwithd depends on BR2_TOOLCHAIN_HAS_THREADS due to a reverse
dependency on libusb.

Thanks for your support.

Best regards,
Romain
