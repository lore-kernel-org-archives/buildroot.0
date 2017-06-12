From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Jun 2017 10:19:19 +0200
Subject: [Buildroot] [PATCH] package/gdb: add support for gdb 8.0
In-Reply-To: <20170612093640.0b2da648@windsurf.home>
References: <20170605204648.11780-1-romain.naour@gmail.com>
 <20170611181043.0de6329f@windsurf.home>
 <e2edd343-47ed-146f-be62-419a61b52242@mind.be>
 <20170612093640.0b2da648@windsurf.home>
Message-ID: <c1c0d894-7de4-97df-5927-953cef2befff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-06-17 09:36, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 11 Jun 2017 23:17:36 +0200, Arnout Vandecappelle wrote:
> 
>>> Applied to master, thanks. Do you intend to send a patch that updates
>>> the default gdb version to 7.12, and drop support for 7.10 ?  
>>
>>  Since we've been discussing version dropping, perhaps it's time to consider gdb
>> as well.
>>
>>  Is there really any reason to support multiple versions of gdb?
>>
>>  If yes, is there a reason to not use the latest version as default?
>>
>>  And the same questions for binutils.
> 
> All this version selection stuff is very historical. I guess one reason
> for it is to allow people to upgrade Buildroot while keeping the same
> toolchain components, which are often quite sensitive to changes.
> That's the main reasoning.

 But in practice this probably won't work. What I've seen with the +- 10
customers who use Buildroot is that they update Buildroot once every 3 years or
so (or they don't update at all). By that time, whatever toolchain version they
were using is already gone. So offering the last 3 versions is possibly not a
useful service for anybody.


> Now, as we have discussed, while such a concern is very valid for gcc,
> it's probably less true for binutils/gdb.

 Well, they both are a sensitive to regressions (especially on "exotic" arches)
and when they break it's kind of fundamental :-)


 Anyway, if we plan to remove the version choice, the first thing to do (for
about a year I'd say) is to default to the latest. Because that may be an
additional reason to offer a choice: because the latest has a good chance of
breaking packages (this is certainly the case for GCC, not sure about binutils,
probably not true for gdb).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
