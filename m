From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 Jun 2018 16:19:28 +0200
Subject: [Buildroot] [PATCHv2] linux: may fail to boot for binutils
 2.29+ even without armv7m
In-Reply-To: <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be> (Arnout
 Vandecappelle's message of "Tue, 5 Jun 2018 00:10:30 +0200")
References: <20180601180157.759-1-yann.morin.1998@free.fr>
 <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
Message-ID: <878t7pcqdr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> comment "Linux kernel may fail to boot with binutils >= 2.29"
 >> -	depends on BR2_ARM_CPU_ARMV7M
 >> +	depends on BR2_arm || BR2_armeb

 >  I have a bit of a problem with this patch. IMO it's rather unlikely that people
 > build the kernel in THUMB mode on non-M CPUs. But now we're always showing this
 > warning. I think it will confuse a number of people, and I don't think it's very
 > likely that it will actually help anyone.

Why is it unlikely? Thumb(2) generates smaller code, so I could
certainly think of use cases where it could be useful (and have used it
myself in the past).

But Ok, maybe the warning should have mentioned thumb.

-- 
Bye, Peter Korsgaard
