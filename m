From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Apr 2017 21:30:26 +0200
Subject: [Buildroot] [PATCH] libmpeg2: fix sparc32 build
In-Reply-To: <20170427112243.2b5693c0@free-electrons.com>
References: <20170427053609.GA20301@waldemar-brodkorb.de>
 <20170427102645.523f96c1@free-electrons.com>
 <87o9viky89.fsf@dell.be.48ers.dk>
 <20170427112243.2b5693c0@free-electrons.com>
Message-ID: <2a47da42-569d-129c-3a24-3154b1c335da@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-04-17 11:22, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 27 Apr 2017 11:15:34 +0200, Peter Korsgaard wrote:
> 
>>  > I am not sure this is the completely correct solution, and Arnout
>>  > proposed another solution, see:  
>>
>>  >   https://patchwork.ozlabs.org/patch/749138/
>>  >   https://patchwork.ozlabs.org/patch/749137/  
>>
>>  > The second patch has the explanation why Waldemar patch is not really
>>  > correct.  
>>
>> Ok. Can I take this as an acked-by for the check-bin-arch / pkg-generic
>> changes then? ;)
> 
> I haven't reviewed the implementation details, but on the general
> principles, yes, I'm OK. It's a bit annoying to extend the package
> infrastructure for such a specific case, but I don't really see a
> better solution here, except hacking libmpeg2 to remove the runtime
> detection logic.
> 
> On the other hand, do we care enough about libmpeg2 on SPARC to extend
> the package infrastructure just for this purpose? In the end, even if
> Waldemar's solution is not "correct", it avoids the need to extend the
> package infrastructure just for a purpose of a single package that will
> most likely never ever be used on SPARC.
> 
> Arnout, what do you think?

 When I spun that patch, I expected there would be more use cases than just
libmpeg2. But the autobuilders don't point to anything obvious, so perhaps not.

 I've marked as Rejected in patchwork. We can pick it up again if something else
turns up.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
