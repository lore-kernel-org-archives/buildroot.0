From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Oct 2014 22:39:06 +0200
Subject: [Buildroot] [PATCH] freetype: Add config option for bzip2
 compressed font support
In-Reply-To: <3620793.9UjUVpDraY@hyperion>
References: <1413599958-24524-1-git-send-email-maarten@treewalker.org>
 <5442672B.1000500@mind.be> <3620793.9UjUVpDraY@hyperion>
Message-ID: <5444216A.3060103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/14 02:49, Maarten ter Huurne wrote:
> On Saturday 18 October 2014 15:12:11 Arnout Vandecappelle wrote:
>> On 18/10/14 04:39, Maarten ter Huurne wrote:
>>> If bzip2 is available, it might still be preferable to not include
>>> support for bzip2 compressed fonts, for example to reduce the number
>>> of libraries loaded when running a GUI application.
>>
>>  I don't agree with this. The impact will be really small, both for memory
>> size and for load time - especially because any application using
>> freetype will most likely load much larger GUI libraries. If you're
>> working at such details, you'll unavoidably have to do some manual hacks
>> to get it even better. So I don't think it makes sense to add a config
>> option for it - we try to keep the number of config options in check.
>>
>>  So unless you can show me a use case where it makes a real impact, it's a
>> NACK.
> 
> The menu we're using (GMenu2X) uses FreeType via SDL_ttf, not via a large 
> GUI toolkit. Dropping the libbzip2 dependency reduces the number of 
> libraries loaded from 12 to 11. I haven't benchmarked how many milliseconds 
> of a difference that makes in startup time.
> 
> Note that the only place where bzip2 compression is actually supported by 
> FreeType is when opening PCF files. Disabling the feature has no effect on 
> support for other font formats such as TTF.

 Okay, let's leave it up to the Benevolent Dictator to make the call. If it's a
go, and the depends on is changed into a select like Maxime requested, it gets
my Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>



 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
