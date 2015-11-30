From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Nov 2015 23:22:18 +0100
Subject: [Buildroot] [PATCH 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <1691926.UbH5yYOTKg@sagittea>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
 <20151129202650.GI3630@free.fr> <1691926.UbH5yYOTKg@sagittea>
Message-ID: <565CCC1A.5010209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-11-15 13:04, J?r?me Pouiller wrote:
> Hello Yann,
> 
> On Sunday 29 November 2015 21:26:50 Yann E. MORIN wrote:
>> J?r?me, All,
>>
>> On 2015-11-18 15:37 +0100, J?r?me Pouiller spake thusly:
[snip]
>> Well, for help from extenal.mk (or local.mk, but I'd arue that would
>> be a bad idea, given that local.mk is supposedly short-lived), there
>> is in my opinion a much better solution.
>>
>> Change the 'help' rule to a double-colon make rule, like so:
>>
>>     help::
>>         echo Current Buildroot help
>>
>> Then you can add as many such rules in as many places you want,
>> especially in external.mk, and the will be appended one after the
>> others.
>
> Nice trick.

 IMHO tricks (nice or not) are no good because they make things more difficult
to understand. Also, we don't currently use the :: construct so I'd prefer to
avoid introducing it.


>> We just have to ensure that our help comes before the external ones,
>> so maybe you'll have to move our help block before inclusion of
>> external.mk...
> 
> I have a slight preference for my proposal since I think it allows a 
> finer control of the way extra help is handled. However, I have no 
> problem to send a new patch using your trick.

 Because of what I wrote above, I also prefer your proposal.


 Regards,
 Arnout

> 
> Regards,
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
