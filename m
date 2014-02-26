From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Feb 2014 22:50:38 +0100
Subject: [Buildroot] [PATCH] package/ti-gfx: do not forcefully remove
 source dir on extract
In-Reply-To: <87bnxtczxi.fsf@dell.be.48ers.dk>
References: <1393440003-29380-1-git-send-email-yann.morin.1998@free.fr>	<530E5DAE.8030609@mind.be>
 <87bnxtczxi.fsf@dell.be.48ers.dk>
Message-ID: <530E61AE.6090707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/02/14 22:43, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 26/02/14 19:40, Yann E. MORIN wrote:
>  >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  >> 
>  >> ti-gfx uses custom extract commands, which first and foremost removes
>  >> the source dir unconditionally.
>  >> 
>  >> Thee side-effect of this is that make will re-extract, re-patch and
>  >> probably re-build ti-gfx at each run.
> 
>  >  There actually was a reason for this - I think the extract fails if you
>  > re-run it. Have you tried
> 
>  > make ti-gfx-extract; make ti-gfx-extract
> 
> That afaik simply says nothing to do, like it should.

 I mean if the stamp file is removed.

 But I realize now that this is something that doesn't necessarily work
anyway, so please ignore my comment.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
