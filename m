From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 Jul 2012 16:44:27 -0300
Subject: [Buildroot] [PATCH 1/2] toolchain/mips: kill EABI and fix N32
In-Reply-To: <20120714150329.65ae632c@skate>
References: <1342268918-3235-1-git-send-email-gustavo@zacarias.com.ar>
 <20120714150329.65ae632c@skate>
Message-ID: <5001CC1B.6080608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/12 10:03, Thomas Petazzoni wrote:

> Le Sat, 14 Jul 2012 09:28:37 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
> 
>> MIPS EABI is a bare-metal ABI so remove it.
>> Also fix uClibc to really work with N32 ABI, which used the EABI knob
>> previously.
> 
> There is no support in uClibc for o64. Is this ABI really used? I see
> that gcc has support for it
> (http://gcc.gnu.org/projects/mipso64-abi.html), but is it used in
> practice?
> 
> Also, is the BR2_MIPS_ABI_none knob actually useful?
> 
> Thanks,
> 
> Thomas

The patchset isn't complete, it's just a start to fix the obvious so any
comments/suggestions are welcome.
Other points to fix include:

* External MIPS toolchains (non ct-ng) - neither of them seems to
support 64 bit anything yet it's an option, we should probably filter
them out.

* uClibc 64 bit toolchains seem broken for shared objects in general.
I've been able to get a qemu test running only with static linking.
Aboriginal linux does static too for mips64 as supporting evidence.

The set is just to get thing to build, maybe not properly but not
because of buildroot.
BR2_MIPS_ABI_none is actually useless, so yes it can be removed.
o64 ABI is probably an SGI thing for IRIX, hence the reason gcc supports
it, probably can be removed too.
Regards.
