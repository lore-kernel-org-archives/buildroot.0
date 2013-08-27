From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 09:24:49 +0200
Subject: [Buildroot] [PATCH 1/3] neon: replace 'choice' for XML library
 with two options
In-Reply-To: <521C447D.4020207@mind.be>
References: <1377342463-17543-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377342463-17543-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <521C447D.4020207@mind.be>
Message-ID: <20130827092449.45fe7340@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 27 Aug 2013 08:17:33 +0200, Arnout Vandecappelle wrote:

> >   config BR2_PACKAGE_NEON_EXPAT
> > -	bool "expat"
> > +	bool "XML support with expat"
> >   	select BR2_PACKAGE_EXPAT
> > +	depends on BR2_PACKAGE_NEON
> 
>   Can you use "if ... endif" instead of depends on?

See PATCH 2/3 in the series :)

> >   config BR2_PACKAGE_RPM
> >   	bool "rpm"
> >   	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
> >   	select BR2_PACKAGE_BEECRYPT
> >   	select BR2_PACKAGE_POPT
> >   	select BR2_PACKAGE_OPENSSL
> > -	depends on BR2_PACKAGE_NEON
> > -	depends on !BR2_PACKAGE_NEON_NOXML
> > +	select BR2_PACKAGE_NEON
> > +	select BR2_PACKAGE_NEON_EXPAT if !BR2_PACKAGE_NEON_LIBXML2
> 
>   Maybe it's cleaner to add a hidden symbol to neon:
> 
> config BR2_PACKAGE_NEON_XML
> 	bool
> 	select BR2_PACKAGE_NEON_EXPAT if !BR2_PACKAGE_NEON_LIBXML2
> 
>   Then in rpm, you only need to select BR2_PACKAGE_NEON_XML

Right, seems like a good idea, I'll try that.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
