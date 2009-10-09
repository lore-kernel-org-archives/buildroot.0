From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Oct 2009 13:22:44 +0200
Subject: [Buildroot] [PATCH 03/14] RESEND: handle MMU configuration
In-Reply-To: <20091009115343.0fae0659@surf> (Thomas Petazzoni's message of
	"Fri\, 9 Oct 2009 11\:53\:43 +0200")
References: <87skduj4ut.fsf@macbook.be.48ers.dk>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<20091009115343.0fae0659@surf>
Message-ID: <87r5tchkvv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Wed,  7 Oct 2009 23:27:47 +0200,
 Thomas> Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :

 >> +config BR2_HAVE_NOMMU
 >> +	def_bool n
 >> +	# assume that we have an MMU per default.

 Thomas> Maybe we should use BR2_HAVE_MMU, def_bool y. The
 Thomas> non-not-negative-if-not-options are really hard to understand.

I guess the idea is that the architectures can 'select' this option
behind the user's back. There's afaik nothing in kconfig to disable
another option if you enable something.

You could ofcourse move the logic here instead of in the individual arch
handling (E.G. default y if BR2_ARCH_bfin, or what it now is).

 >> +config BR2_USE_MMU
 >> +	bool "Use MMU"
 >> +	default y
 >> +	depends on !BR2_HAVE_NOMMU
 >> +	help
 >> +	  If your target has an MMU and you want to use it
 >> +	  then say Y here.

 Thomas> What's the usage of these two new options ?

Yes, I would like to know this as well. I would imagine properly
supporting nommu would take quite some more effort than this (E.G. most
packages should get hidden).

-- 
Bye, Peter Korsgaard
