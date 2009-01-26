From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 20:01:02 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package:	multimedia/alsa-lib python
In-Reply-To: <87vds26pot.fsf@macbook.be.48ers.dk>
References: <20090117001907.6679477587@busybox.osuosl.org>
	<87skni2wrd.fsf@macbook.be.48ers.dk>
	<87vds26pot.fsf@macbook.be.48ers.dk>
Message-ID: <1232996462.2298.93.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 16:40 +0100 skrev Peter Korsgaard:
> >>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
> 
>  ulf> http://www.alsa-project.org/
>  ulf> +
>  ulf> +config BR2_PACKAGE_ALSA_LIB_PYTHON
>  ulf> +	bool "Python support for alsa-lib"
>  ulf> +	depends on BR2_PACKAGE_ALSA_LIB
>  ulf> +	select BR2_PACKAGE_PYTHON
> 
>  Peter> It would probably be goodt to add a 'default BR2_PACKAGE_PYTHON' line,
>  Peter> so it defaults to enabled if you have python support, and false
>  Peter> otherwise.
> 
>  Peter> Alternatively it should depend on BR2_PACKAGE_PYTHON and just be
>  Peter> default y, as it's probably pretty unlikely someone wants python
>  Peter> support in alsa without having python enabled in the first place.
> 
>  Peter> The 2nd option seems cleanest to me, what do you think?
> 

I think feedback was that people would like the option to build alsa-lib
WITHOUT python support even if python was on the target.
Adding python to alsa-lib means a fat library is added to the fs.

BR
Ulf Samuelsson
