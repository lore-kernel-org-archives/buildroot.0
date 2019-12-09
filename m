From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Dec 2019 22:23:40 +0100
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2019.11
In-Reply-To: <20191203131539.1407950-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Tue, 3 Dec 2019 14:15:39 +0100")
References: <20191203131539.1407950-1-joerg.krause@embedded.rocks>
Message-ID: <87a781i46b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Add support for:
 >  * mbedTLS as SSL choice
 >  * zstd as compression option
 >  * libgpiod to support microcontroller firmware update
 >  * efibootmgr to support EFI Boot Guard
 >  * libwebsockets and liburiparser to support SWU forwarder

 > Also:
 >  * drop upstream patches
 >  * drop CONFIG_GUNZIP. Setting it because Buxybox provides a binary named gunzip is wrong.
 >    CONFIG_GUNZIP should only be set if zlib is provided, which Buxybox'
 >    gunzip does not.

 > Regenerated the .config file by doing:

 > ```
 > make swupdate-menuconfig
 > make swupdate-update-config
 > ```
 > .. and removing the paths for the build options manually.
 > -	  * Select BR2_PACKAGE_OPENSSL is you want to add encryption
 > -	    support.
 > +	  * Select BR2_PACKAGE_OPENSSL or BR2_PACKAGE_MBEDTLS is you
 > +	    want to add encryption support.

You kept the 'is' typo ;)

Changed to 'if' and committed, thanks.

-- 
Bye, Peter Korsgaard
