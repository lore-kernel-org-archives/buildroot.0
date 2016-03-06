From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Mar 2016 00:03:07 +0100
Subject: [Buildroot] [v3,
 3/4] barebox: user selection of build output images
In-Reply-To: <20160302214016.GB11826@smipidev>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-4-git-send-email-pieter@boesman.nl>
 <56D0E32C.3050207@mind.be> <20160229083817.GC18059@smipidev>
 <56D62247.8000500@mind.be> <20160302075408.GB10481@smipidev>
 <56D72E6B.1090806@mind.be> <20160302214016.GB11826@smipidev>
Message-ID: <56DCB72B.4020501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/02/16 22:40, Pieter Smith wrote:
> On Wed, Mar 02, 2016 at 07:18:19PM +0100, Arnout Vandecappelle wrote:
>> On 03/02/16 08:54, Pieter Smith wrote:
>>> On Wed, Mar 02, 2016 at 12:14:15AM +0100, Arnout Vandecappelle wrote:
>>>> On 02/29/16 09:38, Pieter Smith wrote:
>>>
>>> [snip]
>>>
>>>>>
>>>>> ACK. Done. I solved this with the above default and help text pointing the user
>>>>> to use 'barebox.bin' for older versions. I'm just waiting for Yegor, and then
>>>>> I'll repost.
>>>>>
>>>>> Right now a user-friendly warning is generated if an old config is used and
>>>>> this config item has not yet been set. 
>>>>
>>>>  If you give it a default value, it _will_ be set for old configs.
>>>
>>> If the user remembers to run defconfig. If he doesn't, the error is quite vague.
>>
>>  When you update buildroot and run 'make', there should be an implicit run of
>> 'make oldconfig', which will update all the automatic symbols and ask for any
>> new ones. TBH I don't completely understand how it works, but it happens like
>> that for me.
> 
> I was troubleshooting with `make barebox-2`, which doesn't perform an
> auto-defconfig. The error was unintelligible because some variables were
> resolving to empty strings. I therefore added a check which offers a similar
> prompt to what is currently done at the end of barebox.mk.
> 
> If nobody has a serious gripe with this, I would prefer to keep the check.

 OK no problem.

 Thanks,

 Regards,
 Arnout


> 
> [snip]
> 
> - Pieter
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
