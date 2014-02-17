From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Feb 2014 00:09:27 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain: introduce a toolchain knob
 for NPTL
In-Reply-To: <20140217235706.3be4e482@skate>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1392297727-17627-2-git-send-email-thomas.petazzoni@free-electrons.com>	<5302884F.9020402@mind.be>
 <20140217235706.3be4e482@skate>
Message-ID: <530296A7.9050500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/14 23:57, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Mon, 17 Feb 2014 23:08:15 +0100, Arnout Vandecappelle wrote:
>> On 13/02/14 14:22, Thomas Petazzoni wrote:
>>> +config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL
>>> +	bool "Toolchain has NPTL threads support?"
>>> +	depends on BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
>>> +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>> +	default y
>>> +	help
>>> +	  Select this option if your external toolchain uses the NPTL
>>> +	  (Native Posix Thread Library) implementation of Posix
>>> +	  threads. If you don't know, leave the default value,
>>> +	  Buildroot will tell you if it's correct or not.
>>
>>  Where exactly does buildroot check if the external toolchain has NPTL?
> 
> In the patch you're replying to, look at the chunk that modifies
> toolchain/helpers.mk:
> 
> +	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS_NATIVE__,BR2_TOOLCHAIN_HAS_THREADS_NPTL,$${UCLIBC_CONFIG_FILE},NPTL thread support) ;\

 Damn, I looked for it three times and couldn't find it... Better get my
eyes checked!


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
