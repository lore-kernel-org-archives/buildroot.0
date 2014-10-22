From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Oct 2014 19:38:21 -0300
Subject: [Buildroot] [PATCH 1/3] xtables-addons: new package
In-Reply-To: <5447E6E5.10904@mind.be>
References: <1413925852-12765-1-git-send-email-gustavo@zacarias.com.ar>
 <5447E6E5.10904@mind.be>
Message-ID: <544831DD.70608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/22/2014 02:18 PM, Arnout Vandecappelle wrote:

>> +comment "xtables-addons needs a Linux kernel to be built"
>> +	depends on !BR2_LINUX_KERNEL
>> +
>> +comment "xtables-addons needs a toolchain w/ dynamic library, largefile, threads"
>> +	depends on BR2_LINUX_KERNEL
> 
>  Do we usually do this? I mean, if a user discovers the 'needs a Linux kernel'
> comment and builds a kernel, then he comes back only to discover that he still
> has to enable all this other stuff...

I can move it to linux extensions instead of it being a package, i don't
know if it's worth bloating too much there.
For the comment i didn't want to make it too wide with both, i wouldn't
mind making it a single one since i use terminals wider than 80 normally.

>> +define XTABLES_ADDONS_BUILD_CMDS
>> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
> 
>  Is there a reason why
> 
> XTABLE_ADDONS_MAKE_OPTS = $(LINUX_MAKE_FLAGS)
> 
> doesn't work instead of overriding the build commands?

The build is somewhat fragile since it calls kbuild in the process, i'll
give it another try but i think it had some issues when building for
PowerPC SPE ABI otherwise (configure gets it's stuff from the autotools
vanilla cmds and uses that for userland, however builds vars are use for
kbuild exclusively and something sneaked in in a bad way IIRC).
Regards.
