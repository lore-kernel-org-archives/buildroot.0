From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 5 Mar 2017 23:13:01 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/physfs: new package
In-Reply-To: <c341646a-fe08-f349-cb46-aed8d0430639@mind.be>
References: <20170301225611.11494-1-romain.naour@gmail.com>
 <4328635a-2687-59f6-a192-4af579aafb58@gmail.com>
 <20170305215137.1600833e@free-electrons.com>
 <755ee979-57de-4718-9fa0-5f7de1f05289@gmail.com>
 <20170305223749.3567d0af@free-electrons.com>
 <c341646a-fe08-f349-cb46-aed8d0430639@mind.be>
Message-ID: <b370e822-a293-56ec-f151-69882e8b1786@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

Le 05/03/2017 ? 23:06, Arnout Vandecappelle a ?crit :
> 
> 
> On 05-03-17 22:37, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sun, 5 Mar 2017 22:14:02 +0100, Romain Naour wrote:
>>>> zlib license (physfs), LGPv2.1+ or CPL or special license (lzma)
>>>>
>>>>  ?  
>>>
>>> It seems some files are under public domain when the special license is used.
>>>
>>> SPECIAL EXCEPTION #3: Igor Pavlov, as the author of this code, expressly permits
>>> you to use code of the following files:
>>> BranchTypes.h, LzmaTypes.h, LzmaTest.c, LzmaStateTest.c, LzmaAlone.cpp,
>>> LzmaAlone.cs, LzmaAlone.java
>>> as public domain code.
>>>
>>> Maybe "special license" is enough ?
>>
>> My understanding of lzma.txt is that you really have the choice between
>> those different licensing options, so I believe encoding all of them in
>> <pkg>_LICENSE is probably better.
>>
>> Cc'ing Arnout and Yann to get their insight.
> 
>  I was just about to reply :-)
> 
>  First of all, I don't see any 'or later' language, so it's LGPL2.1 (the version
> mentioned in src/lzma/LGPL.txt).

Try with "any later version"

> 
>  I think the special cases are not interesting enough to warrant mentioning - we
> should consider the LICENSE as a strong hint, not as a definitive assertion (it
> is not entirely accurate in most packages). In addition, the CPL.html file which
> is supposed to be there, is missing. The top-level README also says "It uses the
> LGPL license, with exceptions for closed-source programs." This leads me to
> conclude that the physfs authors, when redistributint lzma, have decided to do
> so under LGPL and to drop the other license options.
> 
>  So I'd say:
> 
> PHYSFS_LICENSE = zlib license (physfs), LGPLv2.1 with exceptions (lzma)
> PHYSFS_LICENSE_FILES = LICENSE.txt src/lzma/lzma.txt src/lzma/LGPL.txt

Ok, thanks for the help!

Best regards,
Romain

> 
> 
>  Regards,
>  Arnout
> 
> 
