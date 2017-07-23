From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 22:48:00 +0200
Subject: [Buildroot] [PATCH 13/20] package/skeleton: make it a virtual
 package
In-Reply-To: <20170723101317.GC26998@scaer>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <3a434b0c0be62999b357b2ad81ab62bfed9e97d7.1500398733.git.yann.morin.1998@free.fr>
 <b922d29e-33d5-3310-feca-70fbc6ac93a7@mind.be> <20170723101317.GC26998@scaer>
Message-ID: <3d40a4b2-b101-5161-dad7-1dbc54f8f8f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 12:13, Yann E. MORIN wrote:
> On 2017-07-23 01:36 +0200, Arnout Vandecappelle spake thusly:
>>
>>
>> On 18-07-17 19:25, Yann E. MORIN wrote:
[snip]
>>>  config BR2_PACKAGE_SKELETON
>>>  	bool
>>> -	help
>>> -	  The basic skeleton for your rootfs.
>>> +	default y
>>
>>  For most virtual packages, we don't define the Kconfig symbol (e.g. there is no
>> BR2_PACKAGE_EGL). Do we need it for skeleton?
> 
> We have it already for toolchain, another 'speical' package.

 However, why don't we have it for other virtual packages?

 Or maybe I should ask: why do we have a separate BR2_PACKAGE_SKELETON and
BR2_PACKAGE_HAS_SKELETON?

 Indeed for consistency it's better to add all these Kconfig symbols for
skeleton now.

[snip]
>>> +# Note: usually, it is not possible to select a provider of a virtual
>>> +# package.
>>
>>  This is not true cryptodev, jpeg and mysql do exactly that. libressl/openssl
>> will also do it that way. In fact, a choice is in a way the better way to do it,
>> because then you're guaranteed not to have conflicting providers.
> 
> But then you disallow implementations from a br2-external tree, for
> example for jpeg, a provider that has a hardware-accelerated libjpeg.

 There are pros and cons to the choice.

> 
>>  So this entire comment is wrong and can be removed. IMO.
> 
> No, the comment is true, when you look at a virtual package definition
> in the manual. The way we do it for jpeg, cryptodev and mysql is that
> we have a real package and a virtual package both in one, which have a
> choice, and thus lift the limitation.

 Well, IMO skeleton is similar to jpeg, cryptodev and mysql in that respect.

 But let's not discuss about adding or removing a comment :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
