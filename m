From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Nov 2013 23:32:42 +0100
Subject: [Buildroot] [PATCH v2 1/2] pcre: add options to enable UTF and
	UCP support
In-Reply-To: <1385157495.14731.30.camel@bender> (Sven Neumann's message of
 "Fri, 22 Nov 2013 22:58:15 +0100")
References: <1385157495.14731.30.camel@bender>
Message-ID: <87iovknk39.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

 > Allow to compile PCRE with UTF-8/16/32 support and with
 > support for Unicode properties.

 > Signed-off-by: Sven Neumann <neumann@teufel.de>
 > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 >  package/pcre/Config.in | 12 ++++++++++++
 >  package/pcre/pcre.mk   |  2 ++
 >  2 files changed, 14 insertions(+)

 > diff --git a/package/pcre/Config.in b/package/pcre/Config.in
 > index dc92274..725cc21 100644
 > --- a/package/pcre/Config.in
 > +++ b/package/pcre/Config.in
 > @@ -19,4 +19,16 @@ config BR2_PACKAGE_PCRE_32
 >  	help
 >  	  This option builds the 32-bits pcre library, i.e 'libpcre32'
 
 > +config BR2_PACKAGE_PCRE_UTF
 > +	bool "UTF-8/16/32 support in pcre"
 > +	help
 > +	  This option builds the pcre library with UTF-8/16/32 support
 > +
 > +config BR2_PACKAGE_PCRE_UCP
 > +	bool "Unicode properties support in pcre"
 > +        select BR2_PACKAGE_PCRE_UTF

Indentation for the select line is wrong.

Committed to next with that fixed, thanks.

-- 
Bye, Peter Korsgaard
