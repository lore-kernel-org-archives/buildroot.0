From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 7 Mar 2013 10:29:33 +0100
Subject: [Buildroot] [PATCH] Revert "uClibc: port linuxthreads
	errnopatch to 0.9.33.2"
In-Reply-To: <87li9z617u.fsf@dell.be.48ers.dk>
References: <1361455787-4846-1-git-send-email-gustavo@zacarias.com.ar><877gm1hhsm.fsf@dell.be.48ers.dk><CFB67F3F72BB450DAF0C0E10C27DFC00@JohanW7><51276813.7050604@zacarias.com.ar><9E7C87F7A6274E3EBBC491EE4122270E@JohanW7><87lia39c5g.fsf@dell.be.48ers.dk>
 <5137806E.4020507@mind.be> <87li9z617u.fsf@dell.be.48ers.dk>
Message-ID: <C128438637A54EB3922031EED15D1CAF@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Maybe setting the default uClibc-0.9.33.config to use NTPL would already be something to consider.

Johan

-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: donderdag 7 maart 2013 9:53
Aan: Arnout Vandecappelle
CC: Peter Korsgaard; Sagaert Johan; buildroot at busybox.net
Onderwerp: Re: [PATCH] Revert "uClibc: port linuxthreads errnopatch to 0.9.33.2"

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> The pthreads options are basically just there for legacy reasons (from  >> before NPTL existed) and presumably see very little
testing these  >> days. We should aguable deprecate them.

 Arnout>  That would be a good idea. For who really wants it, there is  Arnout> still the crosstool-NG toolchain.

Yes. Unfortunately NPTL has a number of dependencies:

                depends on !BR2_UCLIBC_VERSION_0_9_31
                depends on !BR2_ARM_OABI
                depends on !BR2_x86_i386
                depends on !BR2_avr32
                depends on !BR2_xtensa

uClibc 0.9.31 and OABI are deprecated, so that's ok - but i386 (and generic, which is the same), avr32 and xtensa aren't.

We could naturally mark pthread as

depends on BR2_DEPRECATED if !(BR2_x86_i386 || BR2_avr32 || !BR2_xtensa)

But that isn't very nice.

--
Bye, Peter Korsgaard
