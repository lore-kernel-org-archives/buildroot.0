From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Aug 2016 00:46:37 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
 kconfig snippet
In-Reply-To: <20160829221610.GC5829@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk> <20160829221610.GC5829@free.fr>
Message-ID: <b560c751-1ce1-f45a-5ab7-2e06ba169530@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-08-16 00:16, Yann E. MORIN wrote:
> Peter, Thomas, All,
> 
> On 2016-08-28 22:50 +0200, Peter Korsgaard spake thusly:
>>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>>  > On Sun, 17 Jul 2016 12:34:26 +0200, Yann E. MORIN wrote:
>>  >> +# Ensure the kconfig snippet is generated (for MANUAL_GEN_LISTS, below):
>>  >> +MANUAL_DEPENDENCIES += prepare-kconfig
>>
>>  > It's a bit crazy the complexity that we have just to allow our manual
>>  > to have the list of all packages in Buildroot. I'm not even sure this
>>  > section of the manual is that useful, to be honest. But oh well, that's
>>  > supported today, so we have to continue support it.
>>
>> Why do we _HAVE_ to continue to support it?
>>
>> If we don't find the complexity worth the added value (I personally
>> don't, I think we could just ask people to look under package/ for the
>> list of packages), then we should just remove it.
> 
> I'm not entirely against removing the list of out packages from our
> manual.
> 
> Yet, for some users of br2-external trees, they may still want to have
> the list of their packages in their manuals, build with the asciidoc
> infrastructure.
> 
> It is entirely imaginable that such users of br2-external have packages
> annotated with some documentation for those packages, and want to
> include that doc in their manual, so need to generate that list from
> Kconfig.

 I'm not really enthousiastic about keeping complexity in our Makefiles for
imaginary users that may want to have such and such feature :-P

 I'm very enthousiastic when people contribute some feature that I'm never going
to use myself - but in that case, we know that there is at least one user (the
contributor). But here, we really have added a feature with no known users. At
the time, it didn't add (much) complexity, but more and more it's starting to
weigh down I think.

 For sure, the asciidoc support is even more difficult to understand and
maintain than the normal package infras.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
