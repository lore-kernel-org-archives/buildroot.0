From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Dec 2015 23:36:29 +0100
Subject: [Buildroot] [PATCH v2] bdwgc: fix compile for sparc
In-Reply-To: <20151205182951.GO19876@waldemar-brodkorb.de>
References: <20151204053311.GA15667@waldemar-brodkorb.de>
 <5662FAE6.2000407@mind.be> <20151205182951.GO19876@waldemar-brodkorb.de>
Message-ID: <566366ED.6020903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05-12-15 19:29, Waldemar Brodkorb wrote:
> Hi Arnout,
> Arnout Vandecappelle wrote,
> 
>> On 04-12-15 06:33, Waldemar Brodkorb wrote:
>>> We need to use a patch from master git.
>>> https://github.com/ivmai/bdwgc/commit/e2bf29b7801357c1ad28c2948a3f88c655dd722a
>>>
>>> Fixes following autobuilder failures:
>>> http://autobuild.buildroot.net/results/220b3d49b8ad891e5dd3aae759319100a1500701/
>>> http://autobuild.buildroot.net/results/b7465d175f03c9461693a92885028723772c7814/
>>>
>>
>>  gauche uses a private copy of bdwgc, does that one also need this patch?
> 
> May be. But gauche is disabled for architectures without
> BR2_ARCH_HAS_ATOMICS. Should this be removed and sparc tested?

 Ah, no gauche has bundled atomics so it indeed won't work on sparc.


 Regards,
 Arnout

> 
> best regards
>  Waldemar
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
