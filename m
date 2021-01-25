From: Filip <fskoneczny@gmail.com>
Date: Mon, 25 Jan 2021 18:51:30 +0100
Subject: [Buildroot] [PATCH 1/1] configs/bananapi_m1_plus_defconfig: new
 defconfig
In-Reply-To: <20210125085131.3829173f@windsurf.home>
References: <20210120172815.3395049-1-fskoneczny@gmail.com>
 <20210123214036.720c3a3f@windsurf.home>
 <4f49c391-6275-cf49-6751-921f7484aa99@gmail.com>
 <20210125085131.3829173f@windsurf.home>
Message-ID: <e5767875-8465-49e9-a6f3-9025fc6750e8@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again Thomas. Corrected patch is now available:

	[v4] configs/bananapi_m1_plus_defconfig: new defconfig 

Let me know in case you've noticed anything else to fix.
Thanks again for guiding me through the first contribution :)

Filip

On 25.01.2021 08:51, Thomas Petazzoni wrote:
> Hello Filip,
> 
> On Sun, 24 Jan 2021 18:50:45 +0100
> Filip <fskoneczny@gmail.com> wrote:
> 
>>>> +BR2_TARGET_GENERIC_HOSTNAME="bananapi"
>>>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pi!"
>>>> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y  
>>>
>>> Is this needed for automatic loading of modules ?  
>>
>> Yes, it was loading brcmfmac automatically, I'm not sure though if this is desired in defconfig.
>> After comparing to other configs I decided to remove it and add "modprobe brcmfmac" to readme.txt in proper section instead.
>> Let me know if it's OK, or better to leave it to load automatically or something else.
> 
> I'd say let's keep mdev then, it's nice if the module gets loaded
> automatically.
> 
> Thanks!
> 
> Thomas
> 
