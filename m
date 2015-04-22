From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Apr 2015 21:52:29 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/swupdate: new package
In-Reply-To: <1429689378.3833.19.camel@embedded.rocks>
References: <1429576251-28975-1-git-send-email-joerg.krause@embedded.rocks>	
 <5536C0ED.1080301@mind.be> <1429689378.3833.19.camel@embedded.rocks>
Message-ID: <5537FBFD.4020000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 09:56, J?rg Krause wrote:
> On Di, 2015-04-21 at 23:28 +0200, Arnout Vandecappelle wrote:
>> On 21/04/15 02:30, J?rg Krause wrote:
[snip]
>>> --- /dev/null
>>> +++ b/package/swupdate/Config.in
>>> @@ -0,0 +1,42 @@
>>> +config BR2_PACKAGE_SWUPDATE
>>> +   bool "swupdate"
>>> +   depends on BR2_TOOLCHAIN_HAS_THREADS # OpenSSL
>>> +   depends on BR2_PACKAGE_LUA_5_2
>>
>>  Yikes, now I see this dependency so explicitly, it does look kind 
>> of scary...
>>
>>  Maybe it's a better idea to not support lua at all instead.
>>
>>  How big a difference does it make in rootfs size?
> 
> Enabling lua adds 30KB for Lua 5.2 and 20KB for swupdate to rootfs.tar.
> 
>>  What do you think, Joerg? Romain? Others?
> 
> The additional 50KB are neglectable for me. What I don't like is that 
> I I have to select Lua 5.2 first to be able to select swupdate.
> 
> How about removing lua support from the default config and adding a
> check "ifeq($(BR2_PACKAGE_LUA_5_2),y)" which enables all lua features
> in swupdate.

 OK.

 I think you don't even need to add KCONFIG_ENABLE_OPT calls for lua. If the
user enables lua with swupdate-menuconfig, they'll notice at build time that lua
is missing and they should be smart enough to enable it in buildroot afterwards.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
