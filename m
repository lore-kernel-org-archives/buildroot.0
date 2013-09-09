From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 09 Sep 2013 18:26:42 +0200
Subject: [Buildroot] [git commit] uclibc: add upstream 0.9.33 fixes
In-Reply-To: <87ppsl1xjy.fsf@dell.be.48ers.dk>
References: <20130906133535.2BD969A98A@busybox.osuosl.org>
 <20130906163551.571faf5c@skate> <87ppsl1xjy.fsf@dell.be.48ers.dk>
Message-ID: <522DF6C2.90402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/09/13 22:53, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
>   >> Drop uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CMSG_CLOEXE.patch
>   >> as that is a subset of uclibc-0035-socket.h-pull-socket_type.h-from-eglibc.patch
>
>   Thomas> Shouldn't we switch to using the git version of uClibc instead of
>   Thomas> carrying 40+ patches? The uClibc project seems to have issues getting
>   Thomas> releases out, maybe we should just use their git version, and bump it
>   Thomas> from time to time when appropriate?
>
> Yes, Perhaps. When I started this, I only thought I would add 2-3
> patches to fix the eventfd issue - but looking closer, the other patches
> seemed worthwhile as well.
>
> We do carry a few patches that aren't (yet?) part of upstream git on the
> 0.9.33 branch, so it wouldn't get rid of all patches (but most). Another
> potential issue is that git almost becomes a hard buildroot dependency,
> but that's probably not a big problem.
>
> What do others say?

  I don't like the idea of using an unreleased version of something as 
essential as the standard library... It kind of shifts the burden of 
making sure that uclibc actually works to buildroot. If we do that, we 
could just as well use git versions of all packages.

  But of course, carrying such a large patchset is almost the same as 
using an unreleased version anyway.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
