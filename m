From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Oct 2009 12:49:43 +0200
Subject: [Buildroot] [PATCH 03/14] RESEND: handle MMU configuration
In-Reply-To: <20091009115343.0fae0659@surf>
References: <87skduj4ut.fsf@macbook.be.48ers.dk>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<20091009115343.0fae0659@surf>
Message-ID: <20091009104943.GJ2266@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 09, 2009 at 11:53:43AM +0200, Thomas Petazzoni wrote:
>Le Wed,  7 Oct 2009 23:27:47 +0200,
>Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :
>
>> +config BR2_HAVE_NOMMU
>> +	def_bool n
>> +	# assume that we have an MMU per default.
>
>Maybe we should use BR2_HAVE_MMU, def_bool y. The
>non-not-negative-if-not-options are really hard to understand.

This is a hidden symbol that is (and has to be) only used in this spot.
Everything in real packages is wired up to USE_MMU.
That said, I don't mind if you want to change !! to ''.

>> +config BR2_USE_MMU
>> +	bool "Use MMU"
>> +	default y
>> +	depends on !BR2_HAVE_NOMMU
>> +	help
>> +	  If your target has an MMU and you want to use it
>> +	  then say Y here.
>
>What's the usage of these two new options ?

see how it's odd if one has to split out patches into too fine-grained
pieces? See the arch touchup for the user.
And yes, my initial patch contained
- these knobs
- the configury parts
- actual use of the configury parts
