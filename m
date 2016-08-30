From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Aug 2016 22:01:13 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
 kconfig snippet
In-Reply-To: <20160830090018.GA5815@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk> <20160829221610.GC5829@free.fr>
 <b560c751-1ce1-f45a-5ab7-2e06ba169530@mind.be>
 <20160830090018.GA5815@free.fr>
Message-ID: <507d3dea-e586-cfbf-1f14-ce9791b7b817@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-08-16 11:00, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-08-30 00:46 +0200, Arnout Vandecappelle spake thusly:
>> On 30-08-16 00:16, Yann E. MORIN wrote:
[snip]
>>> It is entirely imaginable that such users of br2-external have packages
>>> annotated with some documentation for those packages, and want to
>>> include that doc in their manual, so need to generate that list from
>>> Kconfig.
>>
>>  I'm not really enthousiastic about keeping complexity in our Makefiles for
>> imaginary users that may want to have such and such feature :-P
>>
>>  I'm very enthousiastic when people contribute some feature that I'm never going
>> to use myself - but in that case, we know that there is at least one user (the
>> contributor). But here, we really have added a feature with no known users.
> 
> Have you read what I wrote: I *am* using it.
> 
>     http://lists.busybox.net/pipermail/buildroot/2016-August/171055.html

 Er, I haven't read that message because I didn't receive it... Disappearing
mail, that's something that scares the hell out of me... It seems to be the only
one that got lost however. Weird.

> 
>> At
>> the time, it didn't add (much) complexity, but more and more it's starting to
>> weigh down I think.
>>
>>  For sure, the asciidoc support is even more difficult to understand and
>> maintain than the normal package infras.
> 
> And I seem to have a good track-record at looking at it:
> 
>     $ git log --follow --pretty=%an package/doc-asciidoc.mk |sort |uniq -c  |sort -k1nr,2
>          22 Yann E. MORIN
>           8 Samuel Martin
>           7 Thomas De Schampheleire
>           2 Thomas Petazzoni
>           1 Atul Singh
>           1 J?r?me Pouiller
> 
> So, please, please. let's keep this asciidoc infra in place.

 As I wrote, if there is an identified user, let's certainly keep it. Though
honestly I don't think the list of projects is very useful in the brsh manual
either :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
