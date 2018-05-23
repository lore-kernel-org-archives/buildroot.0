From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 23 May 2018 22:23:49 +0200
Subject: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
In-Reply-To: <20180523102907.40ae9992@windsurf>
References: <20180505105844.5278-1-romain.naour@gmail.com>
 <20180520124507.23c2a29b@windsurf>
 <71945c16-5343-400c-01fe-44f1d5cb31c2@gmail.com>
 <20180523102907.40ae9992@windsurf>
Message-ID: <8400d17a-1994-397c-ccde-9ac757e617e0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 23/05/2018 ? 10:29, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Mon, 21 May 2018 17:45:02 +0200, Romain Naour wrote:
> 
>>> Could you split up this patch in several patches:
>>>
>>>  - One adding the toolchain/Config.in contents for gcc 8.x
>>>
>>>  - One adding support for gcc 8.x in package/gcc
>>>
>>>  - One adding support for gcc 8.x in toolchain/toolchain-external  
>>
>> Previous gcc bump was done in one patch:
>>
>> (gcc 7)
>> https://git.buildroot.net/buildroot/commit/?id=4314161159ce1556e8c14d1d2e22aaf2a8618b82
>> (gcc 6)
>> https://git.buildroot.net/buildroot/commit/?id=519d83bfa0442439026db4e71e605a5c1347e566
>>
>> I wanted to use the same method but ok I'll split this patch if you want.
> 
> I think it makes sense to split it up.

OK

> 
>>> It would be good if you could also add a patch to update our default
>>> gcc version to 7.x.  
>>
>> Ok, this can be done in a followup patch.
> 
> Yes it _should_ be done in a separate patch.

OK, I'll add this patch in v2.
> 
>>> Maybe it's also time to remove gcc 4.9 and gcc 5.x ? I know when gcc
>>> 7.x was added and we changed to gcc 6.x as the default, we should have
>>> removed gcc 4.9, but there was some opposition to this. Hopefully we
>>> can do this removal now ?  
>>
>> See the reply from Arnout and Dagg for gcc 4.9:
>> http://patchwork.ozlabs.org/patch/767087
>>
>> I'm not sure that the odroidc2 defconfig is able to build with gcc >= 4.9 since
>> it's stuck at kernel odroidc2-3.14.y and uboot odroidc2-v2015.01.
>> Dagg, what do we do for this board?
> 
> So the conclusion from Arnout is to keep 4.9, but to remove gcc 5.
> I'm fine with this, so let's do this.

OK.

Also, what do we do for gcc patches we have since a long time ?
see http://lists.busybox.net/pipermail/buildroot/2018-May/221966.html

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
