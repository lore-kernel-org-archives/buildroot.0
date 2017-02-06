From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Feb 2017 22:21:03 +0100
Subject: [Buildroot] [PATCH] package/mbedtls: make compression support a
	config option
In-Reply-To: <20170206200123.25375-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 6 Feb 2017 21:01:23 +0100")
References: <20170206200123.25375-1-joerg.krause@embedded.rocks>
Message-ID: <87vasnuibk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Enabling TLS compression may make mbedTLS vulnerable to the
 > CRIME attack [1]. It should not be enabled unless is is sure CRIME and
 > similar attacks are not applicable to the particulare situation.

 > As zlib is probably enabled in most systems, the user might end up with
 > a vulnerable system without knowing. So, instead of enabling compression
 > support if the zlib package is available, we make the compression support
 > a config option. This way, the user has to explicitly enable compression
 > support and is warned by the help text about the risk.

 > [1] https://tls.mbed.org/kb/how-to/deflate-compression-in-ssl-tls

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
 > ---
 >  package/mbedtls/Config.in  | 12 ++++++++++++
 >  package/mbedtls/mbedtls.mk |  2 +-
 >  2 files changed, 13 insertions(+), 1 deletion(-)

 > diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
 > index 24f0f489d..42bdcc4d1 100644
 > --- a/package/mbedtls/Config.in
 > +++ b/package/mbedtls/Config.in
 > @@ -17,4 +17,16 @@ config BR2_PACKAGE_MBEDTLS_PROGRAMS
 >  	  This option enables the installation and the build of
 >  	  mbed TLS companion programs.
 
 > +config BR2_PACKAGE_MBEDTLS_COMPRESSION
 > +	bool "enable compression support"
 > +	select BR2_PACKAGE_ZLIB
 > +	help
 > +	  Enable support for compression of the content data before it
 > +	  enters the secure channel as described in RFC 3749.
 > +	  
 > +	  Warning: TLS compression may make you vulnerable to the CRIME
 > +	  attack. You shoud not enable it unless you know for sure CRIME

s/shoud/should/

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
