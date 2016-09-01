From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2016 23:30:47 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
 kconfig snippet
In-Reply-To: <87k2evwiqd.fsf@dell.be.48ers.dk>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk> <20160901175221.GA5841@free.fr>
 <87k2evwiqd.fsf@dell.be.48ers.dk>
Message-ID: <7188ad8d-469c-f4f8-9411-46761b05bddf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-09-16 20:57, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
>  >> Why do we _HAVE_ to continue to support it?
> 
>  > I was going to prepare a patchset to remove the list of packages from
>  > the manual, when I stumbled on *one* reason parts of it is interesting
>  > to have in the manual: the list of virtual packages, their symboles and
>  > their providers.
> 
>  > I think this is worth having in the manual, if at least for packagers of
>  > new packages that would need or provide such a virtual package.
> 
> Perhaps.

 If it's just for a list of virtual packages, isn't sorting
http://autobuild.buildroot.org/stats/ by package type easier?

> 
>  > However, I think the normal and deperacted packages should be removed,
>  > and our script made much simpler (if at all possible).
> 
>  > So, what's the idea:
>  >   - remove all packages (easy)
>  >   - keep as-is  (even easier)
>  >   - only keep virtual packages (not easy at all)
> 
> Personally I would go for 1, but if 3 is doable without too much work /
> complexity (and you feel up for it), then that is also OK with me.

 Well, option 2 is not the end of the world either. The reason we consider it
now is that some complexity (1 line!) has to be added in the manual.mk to
continue supporting it. It is starting to violate the KISS principle, but not
overly so.

 It's not like the BR2_EXTERNAL backward compatibility stuff which was *really*
complicating things.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
