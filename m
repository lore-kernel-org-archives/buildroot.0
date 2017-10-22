From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Oct 2017 12:40:50 +0200
Subject: [Buildroot] [PATCH] .gitignore: ignore output*
In-Reply-To: <20171021224012.wohkvesqielavotp@archlinux>
References: <20171021140108.24066-1-gael.portay@savoirfairelinux.com>
 <20171021160404.579c29af@windsurf>
 <20171021224012.wohkvesqielavotp@archlinux>
Message-ID: <0c075a80-02f6-9f2a-2ade-9c061ed42f7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-10-17 00:40, Ga?l PORTAY wrote:
> Hi Thomas,
> 
> On Sat, Oct 21, 2017 at 04:04:04PM +0200, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sat, 21 Oct 2017 10:01:08 -0400, Ga?l PORTAY wrote:
>>> During development, it is often practical to have many output
>>> directories.  The output directory is easily specified with O=<output>
>>> though is it useful to have a convention of 'output...' e.g.
>>> "output-rpi", "output-rpi2", and "output-rpi3-64".
>>>
>>> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
>>> ---
>>>  .gitignore | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/.gitignore b/.gitignore
>>> index bb02d9f572..ec5768d053 100644
>>> --- a/.gitignore
>>> +++ b/.gitignore
>>> @@ -1,4 +1,4 @@
>>> -/output
>>> +/output*
>>
>> Not sure this is a good idea, it kind of makes an assumption on how
>> people would name their output directories.
>>
> 
> Yes, that is why I mentionned that it should be "useful to have a convention of
> 'output...'"; and I think that 'output*' is not too intrusive.
>  
>> If you're annoyed by your output directories, use make O=../output-rpi2
>> instead of make O=output-rpi2, and that's it :-)
>>
> 
> It is a good suggestion by the way; but I have many buildroot working copies in
> the same directory, and to avoid collision I prefer having the output directory
> directly under the working copy.
> 
> I will look to the suggestion of Arnout.

 Actually, what I do is I have an out/ directory with all the build things and I
do builds with O=out/arm-glibc or O=out/rpi0, and I have /out in
.git/info/exclude. output is too long :-)

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
