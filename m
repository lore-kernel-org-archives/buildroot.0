From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 20 Jul 2017 18:50:41 +0200
Subject: [Buildroot] [PATCH v7 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <fae9da71-f806-a64f-042a-dbf3e9c0d068@mind.be>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-3-git-send-email-wg@grandegger.com>
 <b381421f-9595-ad2d-defb-f94b7d325c09@mind.be>
 <16f616fc-173d-a201-8342-cda48dc102fe@grandegger.com>
 <a8c548d5-d6d0-53bf-2c6b-17e5a5f3101b@mind.be>
 <75ca9a71-aaf5-dd21-f71f-4bcfc2880faa@grandegger.com>
 <6994b7c9-7714-4941-8efc-ffb31f1adbb1@mind.be>
 <ee017453-259f-5e1c-0028-9d3b51b21376@grandegger.com>
 <fae9da71-f806-a64f-042a-dbf3e9c0d068@mind.be>
Message-ID: <72b10dae-a067-66dc-4e7e-cc43193d2527@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 20.07.2017 um 16:19 schrieb Arnout Vandecappelle:
> 
> 
> On 20-07-17 16:08, Wolfgang Grandegger wrote:
>> Hello Arnout,
>>
>> Am 20.07.2017 um 15:45 schrieb Arnout Vandecappelle:
>>>
>>>
>>> On 20-07-17 11:03, Wolfgang Grandegger wrote:
>>>>       case "${tree}" in
>>>>           host)
>>>>               ...
>>>>               # we always want $ORIGIN-based rpaths to make it relocatable.
>>>
>>>    Perfect. Just please start the sentence with a capital (it ends with a .)
>>
>> Well, I followed the style of the original script... just to be consistent...
>> otherwise we will have an ugly mix.
> 
>   There is no original script, only an original author :-)

I have no problem to adapt the style of the original author(s) ;). It 
should just be consistent.

>   So indeed, fix it script-wide please.
> 
> [snip]
>>>> As I said, the execution time comes form scanning for ELF files. The rest
>>>> doesn't
>>>> matter a lot.
>>>
>>>    Instead of the patch you attached, it might actually make more sense to create
>>> a tiny C file that does this, and execute that as part of the find command. Or
>>> you could just create support/scripts/elfmagic with those 4 bytes and use "cmp
>>> -n 4 {} ${0%/*}/elfmagic".
>>
>> Yes, I had that idea as well and I have already hacked something. The problem is
>> that it does not check if it does have an rpath.
> 
>   Well, you could do that particular check in the find -exec and keep the
> --print-rpath check in the while loop.
> 
> 
>> "cmp" is not faster, I already
>> tried!
> 
>   OK good. Might be a good idea to keep track of the things you already tried in
> the cover letter.

Well, it's already a few month ago that I tried finding a good and fast 
solution. I tried a lot of things, be can't remember the details. My 
time working on this topic is limited! When I have more free time I will 
take care.

Wolfgang.
