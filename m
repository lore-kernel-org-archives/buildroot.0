From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Oct 2014 00:22:01 +0200
Subject: [Buildroot] [PATCH 09/25 v6] docs/manual: do not hardcode name
 of the generated document
In-Reply-To: <20140929202629.GC6211@free.fr>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <06692733754cdc2bf2b340c5e6b0201f5770740d.1411812968.git.yann.morin.1998@free.fr>
 <CAAXf6LVCKLRLj_CLgVkEpjtET=90rK5v+6sE493cOmFxLgY8ew@mail.gmail.com>
 <20140929200105.GB6211@free.fr>
 <19a2025b-9e6b-458a-9f8a-9b15c42f01cf@email.android.com>
 <20140929202629.GC6211@free.fr>
Message-ID: <54370A89.5070109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/09/14 22:26, Yann E. MORIN wrote:
> Thomas, All,
[snip]

>>> But it does not really matter: we can quote messages, now. Or not.
>>
>> True. I don't understand though why we wouldn't
>>  change all unnecessary quoting in the quest for symmetry and simplicity.
> 
> If at all, we should change to always quote messages.
> 
> The problem is two-fold:
> 
>   - no quoting: we can not have a comma in the message, otherwise make
>     would split on it:  $(call MESSAGE,This, and that, should foo)

 "-quotes are completely transparent for make, so quoting doesn't help for
commas. You need $(call MESSAGE,This$(comma) and that$(comma) should foo).


 Regards,
 Arnout

>   - always quoting: the MESSAGE definition already does the quoting to
>     ensure it does not break on a semi-colon (which you noticed):
>     $(call MESSAGE,"; echo shellshock")
> 
> (He, shellshock is all the hype nowadays. Even superseeds heartbleed!)
> 
> If MESSAGE would not do the quoting, and rely on the caller to do it,
> we'd be vulnerable to: $(call MESSAGE,; echo shellshock)
> 
> So: we want MESSAGE to always quote its arguments (and no, single quotes
> do not cut it either, because a message might have single quotes too),
> while still allowing callers to do the quoting. Or not.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
