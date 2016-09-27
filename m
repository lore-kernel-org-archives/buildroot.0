From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Sep 2016 00:18:20 +0200
Subject: [Buildroot] [PATCH] pkg-infra: allow dumping reverse
 dependencies of a package
In-Reply-To: <20160927221042.GA32628@free.fr>
References: <1474808171-5652-1-git-send-email-yann.morin.1998@free.fr>
 <7c4e9a67-c2f1-11fc-eeb9-9be2e391b94a@mind.be>
 <20160927213249.GA8646@free.fr>
 <677833f6-0e01-a1f0-be5d-50d3508c54c2@mind.be>
 <20160927221042.GA32628@free.fr>
Message-ID: <a1917e3f-01c6-87b0-c1ca-45e4a1e5dffa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-09-16 00:10, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-09-28 00:02 +0200, Arnout Vandecappelle spake thusly:
>> > On 27-09-16 23:32, Yann E. MORIN wrote:
>>> > > On 2016-09-27 22:40 +0200, Arnout Vandecappelle spake thusly:
>>>>> > >> > 
>>>>> > >> > 
>>>>> > >> > On 25-09-16 14:56, Yann E. MORIN wrote:
>>>>>>> > >>> > > Finding the packages that select another one in a specific configuration
>>>>>>> > >>> > > is not very trivial:
>>>>>>> > >>> > > 
>>>>>>> > >>> > >   - when optional, the dependency is not expressed in Kconfig
>>>>>>> > >>> > > 
>>>>>>> > >>> > >   - looking at the .mk files is not very nice.
>>>>> > >> > 
>>>>> > >> >  If I understand correctly, the idea is to answer the question "why is package
>>>>> > >> > foo built?", right?
>>> > > Right. In my use-case, that was "what do I need to disable so I can
>>> > > disable that broken package?".
>>> > > 
>>>>> > >> >  It would make sense to also add a foo-graph-rdepends, because often you'll want
>>>>> > >> > the transitive dependencies as well and it's always nice to have it in a graph.
>>> > > Yup, planned. But not trivial...
>> > 
>> >  No? Isn't it just calling foo-show-rdepends from graph-depends?
> It would seem it would be that easy, but not really.
> 
> I don;t recall the details, but one thing is that we can't easily do an
> rdepends graph for 'all' in the current state: we'd need to be able to
> extract all packages that have no dependencies (i.e. leaf packages) so
> that we could construct the 'all' node for rdepends.

 graph-rdepends would be exactly the same as graph-depends. Only
foo-graph-rdepends is relevant.


 Regards,
 Arnout


> 
> Hmm.. Or do we have to? We could construct that list... Lemme think...
> 
> Of course, we could limit the feature to just graphing the rdeps of a
> single package. That would not be overly complex, as you said.
> 
> But I was trying to mimick graph-depends into graph-rdepends, so they
> would be symetrical...
> 
> Well, anyway, it's not at the top of my TODO list... ;-)

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
