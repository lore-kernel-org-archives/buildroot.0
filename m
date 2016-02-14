From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 14 Feb 2016 21:19:25 -0200
Subject: [Buildroot] [PATCH v8 1/1] package/dhcp: bump version to
	4.3.3-P1
References: <1455467044-25072-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <56c10b7daa3f5_133b16d91c8414fb@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, Arnout,

On Sun, Feb 14, 2016 at 02:24 PM, Doug Kehn <rdkehn@yahoo.com> wrote:
> +# bind configure is called via dhcp make instead of dhcp configure. The make env
> +# needs extra values for bind configure.
> +DHCP_MAKE_ENV = \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	BUILD_CC="$(HOSTCC)" \
> +	BUILD_CFLAGS="$(HOST_CFLAGS)" \
> +	BUILD_CPPFLAGS="$(HOST_CXXFLAGS)" \

It is conceptually wrong. Probably a typo.

https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
CXXFLAGS  Extra flags to give to the C++ compiler.
CPPFLAGS  Extra flags to give to the C preprocessor and programs that
          use it (the C and Fortran compilers).

> +	BUILD_LDFLAGS="$(HOST_LDFLAGS)"
> +


Arnout,
Can you confirm this is what you suggested?

DHCP_MAKE_ENV = \
	$(TARGET_CONFIGURE_OPTS) \
	BUILD_CC="$(HOSTCC)" \
	BUILD_CFLAGS="$(HOST_CFLAGS)" \
	BUILD_CPPFLAGS="$(HOST_CPPFLAGS)" \
	BUILD_LDFLAGS="$(HOST_LDFLAGS)"

See original reply to [PATCH v7]:
>On Wed, Feb 10, 2016 at 08:51 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  For consistency, we should also pass HOST_CFLAGS, HOST_CPPFLAGS and
>> HOST_LDFLAGS, but they're actually not so useful. Oh, wait, the HOST_LDFLAGS
>> are, in case it links with anything in HOST_DIR (which it doesn't, of course).
>> Still, just to be safe...


Doug,
With the typo fixed, you can add my:
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
