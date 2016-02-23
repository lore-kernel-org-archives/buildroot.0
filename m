From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 22:35:30 +0100
Subject: [Buildroot] [PATCH] procrank_linux: new package
In-Reply-To: <56CCC2BE.6060901@free-electrons.com>
References: <1456242888-23322-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <56CCC087.9060506@mind.be> <56CCC2BE.6060901@free-electrons.com>
Message-ID: <56CCD0A2.9080402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/16 21:36, Gustavo Zacarias wrote:
> On 23/02/16 17:26, Arnout Vandecappelle wrote:
> 
>>   You forgot to add a hash file.
> 
> Are github pull hashes stable? (i.e. not tagged)

 Looks like it. git has been updated a while ago to generate stable archives,
and github seems to have caught on. We've slowly been introducing hashes for
github packages and up to now no autobuilder complaints.

> 
>>   Check. There's a Makefile licensed GPLv2+ but I guess that's not relevant.
> 
> I've used the same logic, in the end it's the code that matters.
> 
>>   What a horrible Makefile... There is no way to pass CFLAGS and LDFLAGS.
>> Fortunately, with the toolchain wrapper, this shouldn't be a problem anymore.
>> Well, except for LDFLAGS. This _is_ going to be a problem on e.g. Blackfin FLAT.
>> I guess a patch adding CFLAGS and LDFLAGS to the Makefiles would be upstreamable?
> 
> Actually bfin flat builds fine, it's on my testing rotation for static builds
> when there's no need for mmu since it uses an old gcc and it's quick to catch
> "newer version required" scenarios (everything quite old and funky).
> That being said i had a previous version that i wasn't quick enough to submit
> that had a patch which was removed since upstream was quick enough accepting the
> pull (musl build fix).

 Well, it _builds_ file, but are you sure it's still generating a
flat/sep/shared binary?


 Regards,
 Arnout

> Regards.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
