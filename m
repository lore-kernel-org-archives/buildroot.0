From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 12 Mar 2015 22:47:54 +0100
Subject: [Buildroot] [PATCH] openpgm: Blacklist Blackfin ADI 2014R1
	toolchain
In-Reply-To: <20150308183023.06960971@free-electrons.com>
References: <1425754315-524-1-git-send-email-romain.naour@openwide.fr>	<20150308085356.11aae236@free-electrons.com>	<54FC7C44.1040707@openwide.fr>
 <20150308183023.06960971@free-electrons.com>
Message-ID: <5502098A.6030909@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 08/03/2015 18:30, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sun, 08 Mar 2015 17:43:48 +0100, Romain Naour wrote:
> 
>>> Also, at some point, we will need to really on the ARCH_HAS_ATOMICS
>>> stuff for this.
>> really -> rely
> 
> Right. But it's not a commit log, so do we care about typos ? :-)

:)

> 
>> You mean BR2_ARCH_HAS_ATOMICS ?
>> But it's set by default for bfin configs.
> 
> Yes. Back when we introduced BR2_ARCH_HAS_ATOMICS, but wondered whether
> it should be BR2_ARCH_HAS_ATOMICS or BR2_TOOLCHAIN_HAS_ATOMICS, i.e
> whether we would have the case of an architecture that does support
> atomic intrinsics, but has certain toolchain versions for this
> architecture that do not.

I remember to have read something about that on the ml.

Yann said in the commit log:
"The fact that atomic operations are available is not really a
specificity of the toolchain, but rather of the architecture."

> 
> I don't remember if we carefully check whether Blackfin has atomic
> intrinsics or not.

I don't know, the commit enabling BR2_ARCH_HAS_ATOMICS on bfin said nothing
about that. Yann do you remember ?

> 
>> config BR2_ARCH_HAS_ATOMICS
>>   	# The following toolchains lack required compiler intrinsics
>> 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
>>   	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
>>   	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
>> 	default y
> 
> Nope. We first need to find out whether the Blackfin architecture has
> what's needed to provide atomic intrinsics. Depending on that, we'll
> now if it's a toolchain limitation or not.

I'm not sure but blackfin seems to have some (one?) atomic instruction(s):

http://www.analog.com/media/en/dsp-documentation/processor-manuals/ADSP-BF539_HRM_rev03.pdf
"The processor provides a single atomic operation: TESTSET"

http://blackfin.uclinux.org/doku.php?id=toolchain:application_binary_interface
"The Blackfin does not have an atomic 64 bit load/store instruction"

Best regards,
Romain
> 
> Best regards,
> 
> Thomas
> 
