From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Sat, 5 Jul 2008 12:55:01 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
In-Reply-To: <20080705072509.8CEF53C65A@busybox.net>
References: <20080705072509.8CEF53C65A@busybox.net>
Message-ID: <d6cda7730807050855k6554b324v701cf349dd2562fb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 5, 2008 at 4:25 AM,  <ulf@uclibc.org> wrote:
> Author: ulf
> Date: 2008-07-05 00:25:06 -0700 (Sat, 05 Jul 2008)
> New Revision: 22646
>
> Log:
> Fix bug [1899] Add table entry to allow openssl to build for AVR32, disabled softfloat
>
> Added:
>   trunk/buildroot/package/openssl/openssl-0.9.7m.patch.avr32
>
> Modified:
>   trunk/buildroot/package/openssl/openssl.mk
>
(cut)
> Modified: trunk/buildroot/package/openssl/openssl.mk
> ===================================================================
> --- trunk/buildroot/package/openssl/openssl.mk  2008-07-05 06:58:53 UTC (rev 22645)
> +++ trunk/buildroot/package/openssl/openssl.mk  2008-07-05 07:25:06 UTC (rev 22646)
(cut)
> +ifeq ($(BR2_avr32),)
>        $(SED) 's,/CFLAG=,/CFLAG= $(TARGET_SOFT_FLOAT) ,g' \
>                $(OPENSSL_DIR)/Configure
> +endif

Shouldn't this be usefull to all platforms and not just avr32?
