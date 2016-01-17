From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Jan 2016 21:13:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump to version
 2016.01
In-Reply-To: <20160116224907.GA11783@free.fr>
References: <1452980355-20322-1-git-send-email-joerg.krause@embedded.rocks>
 <569ABB4F.3050905@mind.be> <20160116224907.GA11783@free.fr>
Message-ID: <569BF5F0.9030405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-01-16 23:49, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-01-16 22:51 +0100, Arnout Vandecappelle spake thusly:
>> On 16-01-16 22:39, J?rg Krause wrote:
>>> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
>>
>>  Maybe add
>>
>> Fixes
>> http://autobuild.buildroot.net/results/9ebc5e3a6f1dd3ceb90d6786a1c5455c965f819e
>>
>>
>>> ---
>>>  package/uboot-tools/uboot-tools.hash | 2 +-
>>>  package/uboot-tools/uboot-tools.mk   | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
>>> index 65a5261..31b0db9 100644
>>> --- a/package/uboot-tools/uboot-tools.hash
>>> +++ b/package/uboot-tools/uboot-tools.hash
>>> @@ -1,2 +1,2 @@
>>>  # Locally computed:
>>> -sha256	bdc68d5f9455ad933b059c735d983f2c8b6b552dafb062e5ff1444f623021955  u-boot-2015.10.tar.bz2
>>> +sha256  e5792fba9399d9804aa2ef667f14ff771e2cdece72367d340250265bf095a5d5  u-boot-2016.01.tar.bz2
>>
>>  Don't we normally separate with tabs?
> 
> Well, when I added support for hashes, I intended it to be used with
> spaces, a bit like the output of the corresponding *sum utilities, so
> that it could be esaily copy-pasted to create a .hash file.
> 
> Also, the manual states:
> 
>     The format of this file is one line for each file for which to check
>     the hash, each line being space-separated, with these three fields:
>     [...]
>     The number of spaces does not matter, so one can use spaces (or
>     tabs) to properly align the different fields.
> 
> So, to me, TABs are accepted, but spaces should be the norm.

 Sounds like a plan to me. But then perhaps we should document that, because
right now we have 1051 lines in hash files with tabs, and only 895 with spaces
(and 1815 total so we also have a lot with mixed spaces-tabs...)

 To be compatible with sha256 output, I propose we should prescribe 2 spaces.

> 
> At least, I despise TABs... ;-] They are whatever the user wants them
> to be, and thus break any alignment that was done by the author of the
> code. I believe TABs should be proscribed everywhere it's possible
                                 ^^^^^^^^^^
 It rarely happens that I still learn a new English word... Funny that proscribe
and prescribe are almost opposites.

 Regards,
 Arnout

> (Makefiles being the outstanding offenders^Wexception...).
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
