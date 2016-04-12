From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 00:04:38 +0200
Subject: [Buildroot] [PATCH] package/racehound: fix comment
In-Reply-To: <87a8kylc6n.fsf@dell.be.48ers.dk>
References: <1460481650-19136-1-git-send-email-yann.morin.1998@free.fr>
 <87a8kylc6n.fsf@dell.be.48ers.dk>
Message-ID: <570D70F6.3000404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/13/16 00:00, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>   > racehound requires a kernel >= 3.14 to be built and to run.
>   > However, the current conditions on the corresponding comments are wrong:
>   >   - the comment about the kernel has a dependency on the requested
>   >     headers
>   >   - the comment on the toolchain features does not have this condition.
>
>   > Thus, the comments are not shown/hidden under the appropriate
>   > conditions, like in this situation:
>   >   - toolchain with headers < 3.14 (e.g. Sourcery CodeBench x86/x86_64
>   >     2012.09 with headers 3.5)
>   >   - kernel 4.5 enabled
>
>   > this comment is shown:
>   >     racehound needs an Linux kernel >= 3.14 to be built
>
>   > So, this is incorrect, because:
>   >  1- a kernel >= 3.14 is indeed to be built
>   >  2- the headers version mismatch is not reported
>
>   > Fix that by moving the dependency on the kernel headers to the
>   > appropriate comment and enhance it.
>
>   > Since there is no way we can know the kernel version to be built, we can
>   > not add such a condition; still, we leave the kernel message as-is.
>
>   > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Committed, thanks.

  So, you don't agree with my analysis? :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
