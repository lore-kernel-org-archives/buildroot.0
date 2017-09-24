From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Sep 2017 17:23:11 +0200
Subject: [Buildroot] [PATCH] package/lmv2: add missing host-pkgconf
 dependency
In-Reply-To: <e15c1f03-3cc0-2475-c141-f2361c72cde5@mind.be>
References: <20170913201755.9871-1-romain.naour@gmail.com>
 <5428adbe-2619-d942-e239-0597cc4f1a69@mind.be>
 <e15c1f03-3cc0-2475-c141-f2361c72cde5@mind.be>
Message-ID: <bfe5b9bb-1086-551c-a8db-d01806c2eefe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 24/09/2017 ? 15:01, Arnout Vandecappelle a ?crit?:
> 
> 
> On 13-09-17 22:30, Arnout Vandecappelle wrote:
>>
>>
>> On 13-09-17 22:17, Romain Naour wrote:
>>> configure.ac use PKG_CHECK_MODULES macro to find some libraries dependencies.
>>> So add host-pkgconf in LVM2_DEPENDENCIES.
>>>
>>> Fixes:
>>> checking pkg-config is at least version 0.9.0... ./configure: line 9875: [...]/host/bin/pkg-config: No such file or directory
>>
>>  Any idea why the autobuilders didn't hit this failure?
> 
>  Even though you didn't answer :-) I applied to master after all, since
> configure clearly really wants pkg-config. Thanks!

Sorry, I missed your reply :(

The autobuilders didn't hit this issue because when pkg-config is missing the
build doesn't stop.
I noticed it by chance while looking at a build log file.

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
>>>
>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>> ---
>>>  package/lvm2/lvm2.mk | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
>>> index 63ac109..f7f7069 100644
>>> --- a/package/lvm2/lvm2.mk
>>> +++ b/package/lvm2/lvm2.mk
>>> @@ -21,6 +21,8 @@ LVM2_CONF_OPTS += \
>>>  	--enable-dmeventd \
>>>  	--disable-nls
>>>  
>>> +LVM2_DEPENDENCIES += host-pkgconf
>>> +
>>>  # LVM2 uses autoconf, but not automake, and the build system does not
>>>  # take into account the toolchain passed at configure time.
>>>  LVM2_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
>>>
>>
> 
