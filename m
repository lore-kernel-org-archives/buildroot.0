From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Mar 2017 09:31:06 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/physfs: new package
In-Reply-To: <20170306214337.GE3976@free.fr>
References: <20170301225611.11494-1-romain.naour@gmail.com>
 <4328635a-2687-59f6-a192-4af579aafb58@gmail.com>
 <20170305215137.1600833e@free-electrons.com>
 <755ee979-57de-4718-9fa0-5f7de1f05289@gmail.com>
 <20170305223749.3567d0af@free-electrons.com>
 <c341646a-fe08-f349-cb46-aed8d0430639@mind.be>
 <20170306214337.GE3976@free.fr>
Message-ID: <bab70c5e-0704-010c-7ea1-731cd2cd66c4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-03-17 22:43, Yann E. MORIN wrote:
> Arnout, Romain, Thomas, All,
> 
> On 2017-03-05 23:06 +0100, Arnout Vandecappelle spake thusly:
>> On 05-03-17 22:37, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> On Sun, 5 Mar 2017 22:14:02 +0100, Romain Naour wrote:
>>>>> zlib license (physfs), LGPv2.1+ or CPL or special license (lzma)
>>>>>
>>>>>  ?  
>>>>
>>>> It seems some files are under public domain when the special license is used.
>>>>
>>>> SPECIAL EXCEPTION #3: Igor Pavlov, as the author of this code, expressly permits
>>>> you to use code of the following files:
>>>> BranchTypes.h, LzmaTypes.h, LzmaTest.c, LzmaStateTest.c, LzmaAlone.cpp,
>>>> LzmaAlone.cs, LzmaAlone.java
>>>> as public domain code.
>>>>
>>>> Maybe "special license" is enough ?
>>>
>>> My understanding of lzma.txt is that you really have the choice between
>>> those different licensing options, so I believe encoding all of them in
>>> <pkg>_LICENSE is probably better.
>>>
>>> Cc'ing Arnout and Yann to get their insight.
>>
>>  I was just about to reply :-)
>>
>>  First of all, I don't see any 'or later' language, so it's LGPL2.1 (the version
>> mentioned in src/lzma/LGPL.txt).
> 
> That's a little bit more complicated, I think... :-(
> 
> The fact that COPYING contains the text of LGPLv2.1 is a strong
> indication that this would be the only version that should apply.

 No it isn't. The COPYING file always contains a single version of the GPL text
[note 1]. This text always contains a section explaining how you should use it,
and that you can allow "any later version" if you put the appropriate text in
your source code. Obviously, the text explaining what you have to do to make it
LGPLv2.1+ does not by itself make it LGPLv2.1+, you actively have to execute the
instructions in said text.

[note 1]  Since you are not allowed to modify the text itself according to the
license (the license to the text, not the LGPL license), all the COPYING files
*should* be identical.

> 
> However, the lzma.txt file, which contains legal blurbs, does not state
> any version of the LGPL. As such, one may argue that any version may
> apply, as stated in COPYING itself, quoting:
> 
>     If the Library does not specify a license version number, you may
>     choose any version ever published by the Free Software Foundation.

 Oops, you are right, I missed that piece of text.


> So I would just say "LGPL".

 Agreed.


>>  I think the special cases are not interesting enough to warrant mentioning - we
>> should consider the LICENSE as a strong hint, not as a definitive assertion (it
>> is not entirely accurate in most packages). In addition, the CPL.html file which
>> is supposed to be there, is missing. The top-level README also says "It uses the
>> LGPL license, with exceptions for closed-source programs." This leads me to
>> conclude that the physfs authors, when redistributint lzma, have decided to do
>> so under LGPL and to drop the other license options.
>>
>>  So I'd say:
>>
>> PHYSFS_LICENSE = zlib license (physfs), LGPLv2.1 with exceptions (lzma)
> 
> Almost. I'd say:
> 
>     PHYSFS_LICENSE = zlib license (physfs), LGPL with exceptions (lzma)

 Agreed.

 Regards,
 Arnout

> 
>> PHYSFS_LICENSE_FILES = LICENSE.txt src/lzma/lzma.txt src/lzma/LGPL.txt
> 
> Yup.
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
