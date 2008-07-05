From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 05 Jul 2008 23:59:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <d6cda7730807050855k6554b324v701cf349dd2562fb@mail.gmail.com>
References: <20080705072509.8CEF53C65A@busybox.net>
	<d6cda7730807050855k6554b324v701cf349dd2562fb@mail.gmail.com>
Message-ID: <486FEED2.3060404@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thiago A. Corr?a skrev:
> On Sat, Jul 5, 2008 at 4:25 AM,  <ulf@uclibc.org> wrote:
>> Author: ulf
>> Date: 2008-07-05 00:25:06 -0700 (Sat, 05 Jul 2008)
>> New Revision: 22646
>>
>> Log:
>> Fix bug [1899] Add table entry to allow openssl to build for AVR32, disabled softfloat
>>
>> Added:
>>   trunk/buildroot/package/openssl/openssl-0.9.7m.patch.avr32
>>
>> Modified:
>>   trunk/buildroot/package/openssl/openssl.mk
>>
> (cut)
>> Modified: trunk/buildroot/package/openssl/openssl.mk
>> ===================================================================
>> --- trunk/buildroot/package/openssl/openssl.mk  2008-07-05 06:58:53 UTC (rev 22645)
>> +++ trunk/buildroot/package/openssl/openssl.mk  2008-07-05 07:25:06 UTC (rev 22646)
> (cut)
>> +ifeq ($(BR2_avr32),)
>>        $(SED) 's,/CFLAG=,/CFLAG= $(TARGET_SOFT_FLOAT) ,g' \
>>                $(OPENSSL_DIR)/Configure
>> +endif
> 
> Shouldn't this be usefull to all platforms and not just avr32?

Don't think so, but I am not 100% sure.

This patch will *remove* the TARGET_SOFT_FLOAT switch from openssl
CFLAGS if compiled for the AVR32,
because the AVR32 gcc does not support the
"--with-abi=soft" which gets included as a switch if this is set.

If another architecture is found which does not like the soft-float
then I guess it is easy to take that into account.

BR
Ulf


> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIb+7RAyRRH5cXxqwRAms6AJ0TCzu7R0BRMaXsfG2sZg3S+SEgBQCdHZZZ
GC4ODwDt9x6KO/AIMQ8vKtA=
=rFgy
-----END PGP SIGNATURE-----
