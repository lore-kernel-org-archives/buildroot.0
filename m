From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 10:34:43 +0100
Subject: [Buildroot] [RFC PATCH] package/libcamera: Add libcamera package
In-Reply-To: <824b7b41-dbdd-69f5-9c20-8965c95db69e@ideasonboard.com>
References: <20190319110326.15153-1-kieran.bingham@ideasonboard.com>
 <20190319125040.GA2702@scaer>
 <940dcdca-91e1-9460-35f7-782959a7ad02@ideasonboard.com>
 <100d21c9-da59-239c-29b2-e6d5bb38106d@mind.be>
 <824b7b41-dbdd-69f5-9c20-8965c95db69e@ideasonboard.com>
Message-ID: <6453930e-30ae-9daf-16a2-7cfbb83f446e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/03/2019 10:25, Kieran Bingham wrote:
[snip]
>>>> We usually specify what part of the package they apply to (correct me
>>>> if/where I am wrong):
>>>>
>>>>     LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils, test), CC-By_SA-4.0 (doc)
>>
>>  AFAIU, we only specify licenses of stuff installed on target. Since
>> /usr/share/doc gets removed in target-finalize, the doc license should not be
>> relevant.
> 
> Ok, so should I just remove the CC licence?

 Indeed.

>>  BTW it would be nice if there was a meson option to disable building docs. I
>> don't know how it is for the libcamera doc, but doxygen and sphinx are sometimes
>> a bit slow.
> 
> 
> I agree, - the docs won't build if sphinx /doxygen isn't found - but
> when I built on my laptop in buildroot, it 'discovered' the exectuable
> for sphinx, but without an install inside the buildroot environment so
> it failed at first.
> 
> So a --disable-docs option is certainly going to be useful. I'll try and
> get it added and included for this packaging process.

 --disable-docs? Coming from autotools, are you? :-P

 While you're at it, maybe you can add a disable for the tests as well (then you
don't need to mention them in the licenses either).


>>> That looks accurate to me.
>>>
>>> I've updated the patch.
>>>
>>>>
>>>> Please also specify the files that contain the license texts:
>>>>
>>>>     LIBCAMERA_LICENSE_FILES = \
>>>>         licenses/cc-by-sa-v4.0.txt \
>>>>         licenses/developer-certificate-of-origin.txt \
>>>>         licenses/gnu-gpl-2.0.txt \
>>>>         licenses/gnu-lgpl-2.1.txt
>>
>>  Please also add hashes for these files.
> 
> Ack ...
> 
> Are all of these relevant actually? I wonder if I should drop the
> cc-by-sa-v4.0 if I'm dropping the docs licence above, and the DCO, as
> that's only really about contributing to the project?

 Correct, only the two gpls should be relevant. For complicated license
situations a README that explains what applies to what would also be relevant,
but in this case it's not needed IMO.


 Regards,
 Arnout
