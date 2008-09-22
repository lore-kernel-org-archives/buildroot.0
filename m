From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 22 Sep 2008 13:47:07 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libconfuse
In-Reply-To: <87wsh4v20e.fsf@macbook.be.48ers.dk>
References: <20080922081105.960D6F8008@busybox.net>	<48D77844.3040602@atmel.com>
	<87wsh4v20e.fsf@macbook.be.48ers.dk>
Message-ID: <48D785BB.6040906@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> 
>  >> +LIBCONFUSE_VERSION:=2.6
>  >> +LIBCONFUSE_SOURCE:=confuse-$(LIBCONFUSE_VERSION).tar.gz
>  >> +LIBCONFUSE_SITE:=http://bzero.se/confuse/
>  >> +LIBCONFUSE_AUTORECONF:=NO
>  >> +LIBCONFUSE_INSTALL_STAGING:=YES
>  >> +LIBCONFUSE_INSTALL_TARGET:=YES
> 
>  Hans-Christian> Can be dropped, this is default.
> 
> True. I left it in purely for documentation purposes (E.G. you then
> don't need to go lookup what the defaults are).
> 
> I can remove it if you feel strongly about it.
> 

It is more what the norm is for Buildroot. Should we keep the 
DEPENDENCIES in even if it is just uClibc? There is nothing specific 
about this in the Makefile.autotools.in, so perhaps we can have a short 
discussion here to settle it once and for all?

IMHO it is fine to keep it in, but the makefile looks more tidy the less 
there is in it. Perhaps better to add some documentation to 
Makefile.autotools.in about _DEPENDENCIES that uclibc is default.

-- 
HC
