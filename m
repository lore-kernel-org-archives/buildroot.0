From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 16:52:03 +0200
Subject: [Buildroot] [PATCH 01/10] arch: deprecate the AVR32 architecture
In-Reply-To: <20140710145547.7ec1ddcf@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 10 Jul 2014 14:55:47 +0200")
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1404237789-15563-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87egxtqtp6.fsf@dell.be.48ers.dk>
 <20140710145547.7ec1ddcf@free-electrons.com>
Message-ID: <87sim9nu5o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> >  config BR2_avr32
 >> >  	bool "AVR32"
 >> >  	select BR2_SOFT_FLOAT
 >> > +	# This architecture is obsolete and complicated to maintain to
 >> > +	# do the lack of upstream support in the major toolchain
 >> > +	# components. If you're interested by AVR32, contact the
 >> > +	# Buildroot community. Otherwise, its support will be removed
 >> > +	# in 2014.11.
 >> > +	depends on BR2_DEPRECATED_SINCE_2014_08
 >> 
 >> I agree that we should get rid of avr32, but I can also follow Thomas'
 >> input about the normal deprecation cycle.
 >> 
 >> With summer holidays coming up, chances are that people might miss it
 >> from the 2014.08 relase notes - Perhaps a compromise would be to only
 >> remove it by 2015.02?

 > Sure, that's fine with me.

Ok, committed with the comment adjusted for 2015.02, thanks.

-- 
Bye, Peter Korsgaard
