From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Mar 2017 18:05:02 +0100
Subject: [Buildroot] [PATCH] odroid-mali: mark package as BROKEN
In-Reply-To: <87a88xccuv.fsf@dell.be.48ers.dk>
References: <1488638059-6764-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305213723.021d4678@free-electrons.com>
 <b81cad7b-504e-b927-3f62-844925aba881@mind.be>
 <20170305223726.GM3671@free.fr> <87a88xccuv.fsf@dell.be.48ers.dk>
Message-ID: <bb95fc23-ae23-3f4b-da4c-13bda8aa7e07@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-03-17 16:42, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  >> I'm obviously late with commenting on this, but I think marking things as
>  >> BROKEN is wrong. It bypasses the legacy mechanism so it disappears without
>  >> notice. Also, BROKEN packages languish there for years without ever anyone
>  >> taking a look. Sometimes things do get repaired, but re-adding the package is
>  >> not much more complicated than
>  >> 
>  >> So, I propose to remove all broken packages.
> 
>  > Agreed.
> 
>  >> [I have the feeling we discussed this kind of thing at some BR devel meeting at
>  >> some point, but I can't find it.]
> 
>  > Yes we did. And IIRC we agreed to get rid of BROKEN altogether.
> 
> I think you are mixing it up with BR2_DEPRECATED.

 That's why I couldn't find it :-)


> With that said, if nobody cares about fixing the package, then I'm OK
> with removing it. Lets give it a bit of time and see what happens.

 The problem with BROKEN is the same as with BR2_LEGACY: it doesn't appear in
the legacy menu. You could argue that BROKEN is different because it simply
can't be used at all. However, for the user there is no difference: it used to
work (I hope we can assume that when a package is added, it has worked at least
once on at least one platform...), and after a Buildroot update it suddenly
vanishes.

 So I propose the following: we can still mark things as BROKEN as a way to
motivate people to fix them, but during the RC month we properly remove them and
add a legacy entry.

 Patches for removing the broken stuff are coming.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
