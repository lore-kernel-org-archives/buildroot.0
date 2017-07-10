From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jul 2017 21:56:15 +0200
Subject: [Buildroot] [PATCH 2/4 v3] package/kvm-unit-tests: introduce
 _ARCH_SUPPORTS
In-Reply-To: <20170710162056.GB3014@scaer>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <996d1d52c27da1a7725ed425ac895c3a7b5b7301.1499592591.git.yann.morin.1998@free.fr>
 <20170710180949.764a0fdb@windsurf.lan> <20170710162056.GB3014@scaer>
Message-ID: <a891c4f7-746f-0a6f-94dc-4981ea5d9c06@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-07-17 18:20, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2017-07-10 18:09 +0200, Thomas Petazzoni spake thusly:
>> On Sun,  9 Jul 2017 11:29:59 +0200, Yann E. MORIN wrote:
>>
>>> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
>>> index 7eab0c25d6..3db10fc820 100644
>>> --- a/package/kvm-unit-tests/Config.in
>>> +++ b/package/kvm-unit-tests/Config.in
> [--SNIP--]
>>> @@ -28,3 +32,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
>>>  	  features are submitted with accompanying unit tests.
>>>  
>>>  	  http://www.linux-kvm.org/page/KVM-unit-tests
>>> +
>>> +comment "kvm-unit-tests needs a toolchain w/ gcc >= 4.5"
>>> +	depends on BR2_i386
>>> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>> What about the x86_64 dependency on a host compiler >= 4.5 ?
> In the manual, it is said that one should not add a comment about a
> dependency on the host toolchain...

 I *think* Thomas didn't mean to say "host compiler". I think he meant:

Shouldn't this be:
	depends on BR2_i386 || BR2_x86_64
	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
