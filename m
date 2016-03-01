From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Mar 2016 00:14:15 +0100
Subject: [Buildroot] [v3,
 3/4] barebox: user selection of build output images
In-Reply-To: <20160229083817.GC18059@smipidev>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-4-git-send-email-pieter@boesman.nl>
 <56D0E32C.3050207@mind.be> <20160229083817.GC18059@smipidev>
Message-ID: <56D62247.8000500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/29/16 09:38, Pieter Smith wrote:
> On Sat, Feb 27, 2016 at 12:43:40AM +0100, Arnout Vandecappelle wrote:
>> On 01/20/16 23:43, Pieter Smith wrote:
>>> A non-default image can be selected as the barebox build output in the images/
>>> directory. This typically is needed to select the appropriate image generated
>>> by multi-platform support defconfigs (E.g. am335x).
> 
> [snip]
> 
>>  If we deprecate barebox pre-2012.10, then we can simplify this a lot:
>>
>> config BR2_TARGET_BAREBOX_IMAGE_FILE
>> 	string "Image file path"
>> 	default "barebox-flash-image"
>> 	help
>> 	  Name of the built barebox image file in the barebox images directory
>>
>>
>>  Even if we don't want to deprecate barebox pre-2012.10, I'd prefer to keep this
>> simple config and do the handling of legacy barebox.bin in the .mk file. For
>> pre-2012.10, you'd have to explicitly set it to barebox.bin instead (which
>> should be mentioned in the help text then).
> 
> ACK. Done. I solved this with the above default and help text pointing the user
> to use 'barebox.bin' for older versions. I'm just waiting for Yegor, and then
> I'll repost.
> 
> Right now a user-friendly warning is generated if an old config is used and
> this config item has not yet been set. 

 If you give it a default value, it _will_ be set for old configs.

> I can have the makefile also generate a
> hint for older barebox versions if the image filename isn't found:
> - Do you think the additional complexity is warranted?

 Yes, that's worth it.

 Regards,
 Arnout

> 
>>  We should find a good way to deal with the images/ part of the path, however.
>> This could e.g. be done in the .mk file, by checking both the top dir and the
>> images dir.
> 
> ACK. Done. In v4 I first try the build ./ directory, and then ./images.
> 
>>  Regards,
>>  Arnout
> 
> [snip]
> 
> - Pieter
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
