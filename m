From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 9 Jun 2019 22:32:36 +0200
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: fix license
 hash
In-Reply-To: <20190609132127.GC13603@scaer>
References: <20190603224039.98733-1-aduskett@gmail.com>
 <629a1777-181a-2947-8326-918258ce35c0@mind.be> <20190609132127.GC13603@scaer>
Message-ID: <b8cbba60-9500-3019-e39e-d3204a4e347d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2019 15:21, Yann E. MORIN wrote:
> Arnout, Adam, All,
> 
> On 2019-06-08 19:03 +0200, Arnout Vandecappelle spake thusly:
>> On 04/06/2019 00:40, aduskett at gmail.com wrote:
>>> From: Adam Duskett <Aduskett@gmail.com>
>>> The new license
>>  However, our default version (v1.4) doesn't have this new license... So with
>> this patch, it will fail when BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION is
>> selected.
>>
>>  This is incredibly annoying :-( We can't add both files, since legal-info
>> requires the license files to exist. So I'm not sure what we can do about it...
>> except maybe set LICENSE_FILES only for the
>> BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION case.
> 
> What else can we do?
> 
>>  Actually, also LICENSE itself only makes sense when we now the exact version.
>> Since it's BSD-licensed, a custom version may just as well be distributed under
>> some more restrictive license...
> 
> Not realy. The original BSD terms would still apply, but additional ones
> might be added. Hence we can't known the exact licensing terms for a
> custom version (or from git, or tarball).

 That's indeed what I meant. Putting BSD-3-Clause in the legal-info while in
reality much more restrictive terms apply would not be good IMO.


>>  At the risk of making life complicated :-), I'm pulling Yann into this discussion.
> 
> Oh so it has come to this? I'm the guy making things complicated? ;-)
> 
> As you said, there is not much we can do about the custom versions. For
> all we know, the developpers may have also completely ripped-off the
> license text and moved it somewhere else (e.g. to suite whatever their
> legal department might have invented).
> 
> So, if it were just for me, I'd move all the licensing information into
> the conditional code:
> 
>     ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
>     ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
>     ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.txt  # Valid for v1.4
>     endif
> 
> And be done with it.

 +1 to that.

 Regards,
 Arnout

[snip]
