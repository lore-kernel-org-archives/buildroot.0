From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 09:46:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/musl: add an upstream URL to
 Config.in
In-Reply-To: <20191128175842.2633-1-mark@dibsco.co.uk> (Mark Corbin's message
 of "Thu, 28 Nov 2019 17:58:42 +0000")
References: <20191128175842.2633-1-mark@dibsco.co.uk>
Message-ID: <87y2vzdq97.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark@dibsco.co.uk> writes:

 > Add an upstream URL to the help text in Config.in. This
 > addresses the 'Missing' URL status in the package stats
 > web page output.

 > Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
 > ---
 >  package/musl/Config.in | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/musl/Config.in b/package/musl/Config.in
 > index 67e9e78a14..69da615b63 100644
 > --- a/package/musl/Config.in
 > +++ b/package/musl/Config.in
 > @@ -8,3 +8,5 @@ config BR2_PACKAGE_MUSL
 >  		&& !(BR2_i386 || BR2_powerpc)
 >  	# Compatibility headers: cdefs.h, queue.h
 >  	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
 > +	help
 > +	  https://www.musl-libc.org/

It is a bit silly to have a help text for blind option, but OK - I guess
it doesn't harm.

The user visible option is BR2_TOOLCHAIN_BUILDROOT_MUSL, which also
didn't have this URL so I added it there as well and committed, thanks.

-- 
Bye, Peter Korsgaard
